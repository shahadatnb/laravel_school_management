<?php

namespace App\Http\Controllers\Student;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Department;

class DepartmentController extends Controller
{
    public function index(){
        $departments = Department::all();
        return view('admin.student.department.index', compact('departments'));
    }

    public function create(){
        return view('admin.student.department.createOrEdit');
    }

    public function store(Request $request){
        $this->validate($request, [
            'title' => 'required',
            'durationYear' => 'required|numeric',
        ]);

        $department = new Department();
        $department->title = $request->title;
        $department->durationYear = $request->durationYear;
        $department->status = 1;
        $department->save();
        session()->flash('success', 'Department created successfully');
        return redirect()->route('department.index');
    }

    public function edit(Department $department){
        return view('admin.student.department.createOrEdit', compact('department'));
    }

    public function update(Request $request, Department $department){
        $this->validate($request, [
            'title' => 'required',
            'durationYear' => 'required|numeric',
        ]);

        $department->title = $request->title;
        $department->durationYear = $request->durationYear;
        $department->status = 1;
        $department->save();
        session()->flash('success', 'Department updated successfully');
        return redirect()->back();
    }

    public function destroy(Department $department){
        if($department->students->count() > 0){
            session()->flash('error', 'Department cannot be deleted because it has students');
            return redirect()->back();
        }
        $department->delete();
        session()->flash('success', 'Department deleted successfully');
        return redirect()->back();
    }
}
