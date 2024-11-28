<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\ExamStudent;
use App\Models\Student\ExamList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ExamStudentsImport;

class ExamStudentController extends Controller
{

    public function index(Request $request)
    {
        $data = [
            'department'=>'',
            'semester'=>'',
            'session'=>'',
            'reg_no'=>'',
            'shift'=>'',
            'student_group'=>'',
            'probidhan'=>'',
            'class_roll'=>'',
            'reg_no'=>'',
            'institute'=>'',
            'ref_subject'=>'',
            'remark'=>'',
        ];

        $shifts = [];
        $departments = ExamStudent::pluck('technology','technology')->unique();
        $semesters = ExamStudent::pluck('semester','semester')->unique();
        $sessions = ExamStudent::pluck('session','session')->unique();
        $institutes = ExamStudent::pluck('institute','institute')->unique();
        $probidhans = ExamStudent::pluck('probidhan','probidhan')->unique();
        $groups = ExamStudent::pluck('student_group','student_group')->unique();

        //$exams = ExamList::pluck('exam_title','id');
        $students = ExamStudent::latest();

        if(!empty($request->technology)){
            $data['technology'] = $request->technology;
            $students = $students->where('technology', $request->technology);
        }

        if(!empty($request->semester)){
            $data['semester'] = $request->semester;
            $students = $students->where('semester', $request->semester);
        }

        if(!empty($request->session)){
            $data['session'] = $request->session;
            $students = $students->where('session', $request->session);
        }

        if(!empty($request->shift)){
            $data['shift'] = $request->shift;
            $students = $students->where('shift', $request->shift);
        }

        if(!empty($request->institute)){
            $data['institute'] = $request->institute;
            $students = $students->where('institute', $request->institute);
        }

        if(!empty($request->reg_no)){
            $data['reg_no'] = $request->reg_no;
            $students = $students->where('reg_no', $request->reg_no);
        }

        if(!empty($request->class_roll)){
            $data['class_roll'] = $request->class_roll;
            $students = $students->where('class_roll', $request->class_roll);
        }

        if(!empty($request->ref_subject)){
            $data['ref_subject'] = $request->ref_subject;
            $students = $students->where('ref_subject','like', '%'.$request->ref_subject.'%');
        }

        if(!empty($request->remark)){
            $data['remark'] = $request->remark;
            $students = $students->where('remark','like', '%'.$request->remark.'%');
        }

        $students = $students->paginate(100);
        return view('admin.student.exams.students.index',compact('students','data','institutes','sessions','semesters','departments','shifts','probidhans','groups'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(ExamStudent $examStudent)
    {
        //
    }

    public function edit(ExamStudent $examStudent)
    {
        //
    }

    public function update(Request $request, ExamStudent $examStudent)
    {
        //
    }

    public function destroy(ExamStudent $examStudent)
    {
        $examStudent->delete();
        session()->flash('success', 'Deleted Successfully!');
        return redirect()->back();
    }

    public function import(Request $request){
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);

        //dd($request->file('file')); exit;
        Excel::import(new ExamStudentsImport, $request->file('file'));

        session()->flash('success', 'Imported Successfully!');
        return redirect()->back();
    }

    public function examineeCount(){
        $students = ExamStudent::where('status','!=','Irregular')->orderBy('semester','asc')->get();
        $studentsIrregular = ExamStudent::where('status','Irregular')->get();
        $institutions = ExamStudent::pluck('institute')->unique();
        return view('admin.student.exams.examineeCount',compact('students','studentsIrregular','institutions'));
    }
}
