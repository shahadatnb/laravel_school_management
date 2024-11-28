<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\Student;
use App\Models\Student\StudentMark;
use Illuminate\Http\Request;
use App\Traits\StudentTrait;
use App\Traits\CommonTrait;
use CustomHelper;
//use PDF;
use Barryvdh\DomPDF\Facade\Pdf;

class MarksController extends Controller
{
    use CommonTrait,StudentTrait;
    public function index(Request $request)
    {
        $data = [
            'department_id'=>'',
            'semester_id'=>''
        ];
        $students = [];
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();

        if(!empty($request->department_id) && !empty($request->semester_id)){
            $data['department_id'] = $request->department_id;
            $data['semester_id'] = $request->semester_id;
            $students = StudentMark::whereHas('student', function($q) use($request, $data){
                $q->where('department_id', $request->department_id)->where('semester_id', $request->semester_id);
            })->with('student')->where('semester_id', $request->semester_id)->get();
        }

        return view('admin.student.marks.index', compact('students','departments','semesters','data'));
    }

    public function studentPromotion(Request $request)
    {
        $data = [
            'department_id'=>'',
            'semester_id'=>''
        ];
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();
        $students = [];
        
        if(!empty($request->department_id && !empty($request->semester_id))){
            $students = Student::with('marks')->latest();
            $data['department_id'] = $request->department_id;
            $students = $students->where('department_id', $request->department_id);
            $data['semester_id'] = $request->semester_id;
            $students = $students->where('semester_id', $request->semester_id);
            $students = $students->get();
        }
               

        return view('admin.student.student.promotion', compact('students','departments','semesters','data'));
    }

    public function studentPromotionSubmit(Request $request)
    {
        $this->validate($request, array(
            'department_id'=>'required',
            'semester_id'=>'required',
            'student_list'=>'required',
        ));
        
        //return $request->student_list;
        foreach($request->student_list as $student_id){
            $student = Student::where('id',$student_id)->where('semester_id',$request->semester_id)->first();
            if($student){
                $message[$student_id]['status'] = 'success';
                if($student->semester_id < $student->department->durationYear){
                    $student->increment('semester_id',1);
                    StudentMark::create(['semester_id'=>$student->semester_id,'student_id'=>$student_id]);
                }else{
                    $student->semester_id = 10;
                    $student->final_result_date = date('Y-m-d');
                    $student->save();
                }
                /*
                $result = CustomHelper::checkResult($student_id, $request);
                $payment = CustomHelper::checkPayment($student_id, $request);
                $message[$student_id]['reg_no'] = $student->reg_no;
                $message[$student_id]['result'] = $result;
                $message[$student_id]['payment'] = $payment;
                if($result == 'pass' && $payment == 'paid'){
                    $message[$student_id]['status'] = 'success';
                    if($student->semester_id < $student->department->durationYear){
                        $student->increment('semester_id',1);
                        StudentMark::create(['semester_id'=>$student->semester_id,'student_id'=>$student_id]);
                    }else{
                        $student->semester_id = 10;
                        $student->final_result_date = date('Y-m-d');
                        $student->save();
                    }
                }else{
                    $message[$student_id]['status'] = 'failure';
                }
                */
            }
        }
        //return Response::json( $sen );
        return ['status' => 'success', 'message' => $message];
    }


    public function studentMarksheet(Request $request)
    {
        $data = [
            'department_id'=>'',
            'session'=>'',
            'class_roll'=>''
        ];
        $departments = $this->departmentArray();
        $academicYear = $this->academicYear();
        $students = [];
        
        if(!empty($request->department_id)){
            $students = Student::latest();
            $data['department_id'] = $request->department_id;
            $students = $students->where('department_id', $request->department_id)->where('semester_id',10);

            if(!empty($request->session)){
                $data['session'] = $request->session;
                $students = $students->where('session', $request->session);
            }

            $students = $students->paginate(100);
        }

        if(!empty($request->class_roll)){
            $data['class_roll'] = $request->class_roll;
            $students = $students->where('class_roll', $request->class_roll);
            $students = $students->paginate(100);
        }

        return view('admin.student.student.marksheetList', compact('students','departments','academicYear','data'));
    }

    
    public function studentMarksheetDownload(Student $student)
    {
        $result = CustomHelper::getResult($student->id);
        $marks = StudentMark::where('student_id',$student->id)->get();
        /*
        $pdf = PDF::loadView('admin.student.student.marksheet', compact('student','result','marks'), [], [
            'watermark_image_path' => public_path('/upload/site_file/'.config('settings.siteLogo','')),
            'show_watermark_image' => true,
            //'watermark' => 'true',
            //'show_watermark' => true
          ]);
        return $pdf->stream($student->reg_no.'-Marksheet.pdf');
        */
        $pdf = Pdf::setOption(['dpi' => 96, 'default_paper_size' => 'a4'])->loadView('admin.student.student.marksheet', compact('student','result','marks'));
        return $pdf->download($student->reg_no.'-Marksheet.pdf');
    }

    
    public function studentCertificateDownload(Student $student)
    {
        $result = CustomHelper::getResult($student->id);
        //return $result;
        /*
        $pdf = PDF::loadView('admin.student.student.certificate', array('student'=>$student,'result'=>$result), [], [
            'watermark_image_path' => public_path('/upload/site_file/'.config('settings.siteLogo','')),
            'show_watermark_image' => true,
            'format' => 'letter',
            'orientation' => 'p',//l
            'default_font_size' => 15
          ]);
        return $pdf->stream($student->reg_no.'-Certificate.pdf');
        */
        $pdf = Pdf::loadView('admin.student.student.certificate', compact('student','result'));
        return $pdf->download($student->reg_no.'-Certificate.pdf');
    }
    
    public function studentTestomonialDownload(Student $student)
    {
        $pdf = Pdf::loadView('admin.student.student.testomonial', compact('student'));
        return $pdf->download($student->class_roll.'-Testomonial.pdf');
    }
    
    public function studentAppearedDownload(Student $student)
    {
        $pdf = Pdf::loadView('admin.student.student.appeared', compact('student'));
        return $pdf->download($student->class_roll.'-Appeared.pdf');
    }


    public function edit(StudentMark $studentMark)
    {
        //
    }

    public function update(Request $request, StudentMark $studentMark)
    {
        $name = $request->name;
        $studentMark->$name = $request->mark;
        $studentMark->mark_entry_by = auth()->user()->id;
        $studentMark->save();
        return \Response::json($studentMark);
    }

    public function destroy(StudentMark $studentMark)
    {
        //
    }
}
