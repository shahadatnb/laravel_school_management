<?php

namespace App\Http\Controllers\Exam;

use App\Models\Student\Student;
use App\Models\Exam\ExamResult;
use App\Models\Exam\ExamResultTabulation;
use App\Models\Student\AcademicYear;
use App\Models\Student\ClassConfig;
use App\Models\Exam\ExamSubjectConfig;
use App\Models\Exam\MarkConfig;
use App\Models\Exam\ExamMark;
use App\Models\Exam\ExamGrade;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamResultController extends Controller
{
    public function general_process(Request $request)
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.result_process.general_process',compact('academic_years','class_configs'));
    }

    private function grade_calc($grades,$marks){
        //dd($grades);
        foreach($grades as $grade){
            if($marks >= $grade['grade_range']){
                return ['grade' => $grade['grade'], 'grade_point' => $grade['grade_point']];
                break;
            }
        }
    }

    public function general_process_save(Request $request)
    {
        ExamResult::where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id)
        ->where('exam_id', $request->exam_id)->where('section_id', $request->section_id)->delete();

        $students = Student::where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id)
        ->where('section_id', $request->section_id)->get();
        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id',session('branch')['id'])->first();
        $gradeData  = ExamGrade::where('branch_id', session('branch')['id'])->where('class_id', $class_config->class_id)->get();
        if($gradeData->count()==0){
            return response()->json(['status'=>false, 'message'=>'Grade Not Found']);
        }
        $grades = [];
        foreach($gradeData as $key=>$grade){
            $grades[$key]['grade'] = $grade->grade;
            $grades[$key]['grade_point'] = $grade->grade_point;
            $grades[$key]['grade_range'] = explode("-",$grade->grade_range)[0];
        }

        foreach($students as $student){
            $result = ExamResult::create([
                'branch_id' => session('branch')['id'],
                'academic_year_id' => $request->academic_year_id,
                'section_id' => $request->section_id,
                'exam_id' => $request->exam_id,
                'student_id' => $student->id,
                //'total_marks' => $request->student_id,
                //'grand_total_marks' => $request->student_id,
                //'grade' => $request->student_id,
                //'grade_point' => $request->student_id,
            ]);

            $subjects = ExamSubjectConfig::where('class_id',$class_config->class_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
            
            foreach($subjects as $subject){
                $mark_config = MarkConfig::where('class_id',$class_config->class_id)->where('branch_id',session('branch')['id'])
                ->where('exam_id',$request->exam_id)->where('subject_id',$subject->subject_id)->get()->first();
                $marks = ExamMark::where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id)
                ->where('student_id', $student->id)->with('mark_config')->whereHas('mark_config',function($q) use($subject){
                    $q->where('subject_id',$subject->subject_id);
                })->get();
                
                $mark = 0;
                //dd($marks);
                foreach($marks as $m){
                    $mark += $m->mark_config->acceptance * $m->marks;
                }
                
                $grade_calc = $this->grade_calc($grades,$mark);
                //dd($grade_calc);
                ExamResultTabulation::create([
                    'exam_result_id'=>$result->id,
                    'subject_id'=>$subject->subject_id,
                    'full_marks'=>$mark_config->total_marks,
                    'marks'=>$mark,
                    'grade'=>$grade_calc['grade'],
                    'grade_point'=>$grade_calc['grade_point'],
                ]);

            }
            $tabulation = ExamResultTabulation::where('exam_result_id', $result->id)->get();
            if($tabulation->where('grade_point',0)->count() > 0){
                $grade_point = 0;
                $grade = 'F';
            }else{
                $grade_point = $tabulation->sum('grade_point')/$tabulation->count();
                //dd(array_reverse($grades));
                foreach(array_reverse($grades) as $g){
                    if($grade_point >= $g['grade_point']){
                        $grade = $g['grade'];
                    }
                }
            }
            
            $result->total_marks = $tabulation->sum('marks');            
            $result->grade_point = $grade_point;
            $result->grade = $grade;
            $result->save();

        }
        return response()->json(['status'=>true, 'message'=>'Result Processed Successfully']);
    }

    public function merit_process(Request $request)
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.result_process.merit_process',compact('academic_years','class_configs'));
    }

    public function merit_process_save(Request $request)
    {
        //
    }

    public function merit_class_wise(Request $request)
    {
        //
    }

    public function merit_section_wise(Request $request)
    {
        //
    }

    public function marksheet(Request $request)
    {
        //
    }

    public function tabulation_sheet(Request $request)
    {
        //
    }
}
