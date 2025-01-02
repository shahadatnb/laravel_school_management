<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student\Semester;

class SemesterController extends Controller
{
    public function index()
    {
        $years = Semester::where('branch_id', session('branch')['id'])->get();
        return view('admin.student.setup.semester.index', compact('years'));
    }

    public function create()
    {
        return view('admin.student.setup.semester.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:semesters,name',
            'status' => 'required',
        ]);

        $semester = new Semester;
        $semester->name = $request->name;
        $semester->code = $request->code;
        $semester->name_bn = $request->name_bn;
        $semester->branch_id = session('branch')['id'];
        $semester->status = $request->status;
        $semester->serial = $request->serial;
        $semester->save();

        session()->flash('success', "Saved.");
        return redirect()->route('student.setup.semester.index');
    }

    public function show(Semester $Semester)
    {
        
    }

    public function edit(Semester $semester)
    {
        return view('admin.student.setup.semester.createOrEdit', compact('semester'));
    }

    public function update(Request $request, Semester $semester)
    {
        $request->validate([
            'name' => 'required|unique_with:semesters,name,'.$semester->id,
            'status' => 'required',
        ]); 

        $semester->name = $request->name;
        $semester->code = $request->code;
        $semester->name_bn = $request->name_bn;
        $semester->branch_id = session('branch')['id'];
        $semester->status = $request->status;
        $semester->serial = $request->serial;
        $semester->save();

        session()->flash('success', "Saved.");
        return redirect()->route('student.setup.semester.index');
    }

    public function destroy(Semester $semester)
    {
        //
    }
}
