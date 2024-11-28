<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\Course;
use Illuminate\Http\Request;
use App\Traits\StudentTrait;
use App\Traits\CommonTrait;

class CourseController extends Controller
{
    use CommonTrait,StudentTrait;

    public function index()
    {
        $data = [
            'department_id'=>'',
            'semester_id'=>''
        ];
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();
        $courses = Course::latest();
        if(!empty($request->department_id)){
            $data['department_id'] = $request->department_id;
            $courses = $courses->where('department_id', $request->department_id);
        }
        if(!empty($request->semester_id)){
            $data['semester_id'] = $request->semester_id;
            $courses = $courses->where('semester_id', $request->semester_id);
        }        
        $courses = $courses->paginate(100);

        return view('admin.student.course.index', compact('courses','departments','semesters','data'));
    }

    public function create()
    {
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();
        $mode = 'create';
        return view('admin.student.course.createOrEdit', compact('mode','departments','semesters'));
    }

    public function store(Request $request)
    {   
        $this->validate($request, array(
            'code'=>'nullable',
            'title'=>'required|unique:courses',
            'writenMarks'=>'required',
            'practicalMarks'=>'required',
        ));

        $course = new Course;
        $course->code = $request->code;
        $course->title = $request->title;
        $course->fullMarks = $request->writenMarks + $request->practicalMarks;
        $course->writenMarks = $request->writenMarks;
        $course->practicalMarks = $request->practicalMarks;
        $course->save();

        session()->flash('success', "Course Saved");
        return redirect()->route('course.index');
    }

    public function show(Course $course)
    {
        //
    }

    public function edit(Course $course)
    {
        //
    }

    public function update(Request $request, Course $course)
    {
        //
    }

    public function destroy(Course $course)
    {
        //
    }
}
