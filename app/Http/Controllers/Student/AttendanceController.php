<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Attendance;
use App\Models\Student\Student;
use App\Models\Student\Group;
use App\Models\Student\Category;
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
            'section_id'=>'',
            'category_id'=>'',
            'group_id'=>'',
            'date'=>'',
        ];
        $sections = $this->sectionArray();
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $catetories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $attendances = [];
        $students = [];
        if(!empty($request->section_id)){
            $data['section_id'] = $request->section_id;
            $data['date'] = $request->date;
            $students = Student::where('branch_id', session('branch')['id'] )->where('section_id', $request->section_id)->orderBy('class_roll', 'asc');
        
            if(!empty($request->category_id)){
                $data['category_id'] = $request->category_id;
                $students = $students->where('category_id', $request->category_id);
            }
            if(!empty($request->group_id)){
                $data['group_id'] = $request->group_id;
                $students = $students->where('group_id', $request->group_id);
            }
            if(!empty($request->reg_no)){
                $data['reg_no'] = $request->reg_no;
                $students = $students->where('reg_no', $request->reg_no);
            }
            if(!empty($request->class_roll)){
                $data['class_roll'] = $request->class_roll;
                $students = $students->where('class_roll', $request->class_roll);
            }
            $students = $students->get();
            $attendances = Attendance::where('date', $request->date)->whereIn('student_id', $students->pluck('id')->toArray())->pluck('student_id')->toArray();
        }

        return view('admin.student.attendance.index', compact('students','attendances','sections','groups','catetories','data'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        Attendance::where('date', $request->date)->whereIn('student_id', $request->student_id)->delete();
        foreach($request->student_list as $student_id){
            Attendance::create([
                'student_id' => $student_id,
                'date' => $request->date,
            ]);
        }

        session()->flash('success', 'Successfully Save');
        return redirect()->back();
    }

    public function attendanceReport(Request $request)
    {
        $data = [
            'category_id'=>'',
            'group_id'=>'',
            'section_id'=>'',
            'start_date'=>'', 'end_date'=>'',
        ];
        $sections = $this->sectionArray();
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $catetories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $attendances = [];
        $students = [];
        if(!empty($request->section_id)){
            $data['section_id'] = $request->section_id;
            $data['category_id'] = $request->category_id;
            $data['group_id'] = $request->group_id;
            $data['start_date'] = $request->start_date;
            $data['end_date'] = $request->end_date;
            $students = Student::where('branch_id', session('branch')['id'] )
            ->where('section_id', $request->section_id)
            ->where('category_id', $request->category_id)
            ->where('group_id', $request->group_id)
            ->orderBy('class_roll', 'asc')->get();        

            $students = $students->where('section_id', $request->section_id)
            ->where('category_id', $request->category_id)
            ->where('group_id', $request->group_id);
            
            $attendances = Attendance::whereBetween('date', [$data['start_date'], $data['end_date']])->whereIn('student_id', $students->pluck('id')->toArray())->get();
        }
        //dd($attendances);
        return view('admin.student.attendance.report', compact('students','attendances','departments','semesters','data'));
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
