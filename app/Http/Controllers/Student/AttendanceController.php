<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Attendance;
use App\Models\Student\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Traits\StudentTrait;

class AttendanceController extends Controller
{
    use StudentTrait;
    public function __construct()
    {
        $this->middleware('branch');
    }
    
    public function index(Request $request)
    {
        $data = [
            'department_id'=>'',
            'semester_id'=>'',
            'reg_no'=>'',
            'shift'=>'',
            'student_group'=>'',
            'probidhan'=>'',
            'class_roll'=>'',
            'reg_no'=>''
        ];
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();
        $students = [];
        if(!empty($request->semester_id)){
            $data['semester_id'] = $request->semester_id;
            $students = Student::where('branch_id', session('branch')['id'] )->where('semester_id', $request->semester_id)->orderBy('class_roll', 'asc');
        
            if(!empty($request->department_id)){
                $data['department_id'] = $request->department_id;
                $students = $students->where('department_id', $request->department_id);
            }
            if(!empty($request->session)){
                $data['session'] = $request->session;
                $students = $students->where('session', $request->session);
            }
            if(!empty($request->reg_no)){
                $data['reg_no'] = $request->reg_no;
                $students = $students->where('reg_no', $request->reg_no);
            }
            if(!empty($request->shift)){
                $data['shift'] = $request->shift;
                $students = $students->where('shift','like', '%'.$request->shift.'%');
            }
            if(!empty($request->student_group)){
                $data['student_group'] = $request->student_group;
                $students = $students->where('student_group', $request->student_group);
            }
            if(!empty($request->probidhan)){
                $data['probidhan'] = $request->probidhan;
                $students = $students->where('probidhan', $request->probidhan);
            }
            if(!empty($request->class_roll)){
                $data['class_roll'] = $request->class_roll;
                $students = $students->where('class_roll', $request->class_roll);
            }
            $students = $students->get();
        }

        return view('admin.student.attendance.index', compact('students','departments','semesters','data'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Attendance $attendance)
    {
        //
    }

    public function edit(Attendance $attendance)
    {
        //
    }

    public function update(Request $request, Attendance $attendance)
    {
        //
    }

    public function destroy(Attendance $attendance)
    {
        //
    }
}
