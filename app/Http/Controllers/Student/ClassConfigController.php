<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\ClassConfig;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;
use App\Models\Student\Shift;
use App\Models\Student\Section;

class ClassConfigController extends Controller
{
    public function index()
    {
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->get();
        return view('admin.student.setup.class_config.index', compact('class_config'));
    }

    public function create()
    {
        $semesters = Semester::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $shifts = Shift::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $sections = Section::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        return view('admin.student.setup.class_config.createOrEdit', compact('semesters', 'shifts', 'sections'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'class_id' => 'required',
            'section_id' => 'required',
            'shift_id' => 'required',
        ]);

        $classConfig = new ClassConfig;
        $classConfig->class_id = $request->class_id;
        $classConfig->section_id = $request->section_id;
        $classConfig->shift_id = $request->shift_id;
        $classConfig->branch_id = session('branch')['id'];
        $classConfig->serial = $request->serial;
        $classConfig->status = $request->status;
        $classConfig->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.class_config.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(ClassConfig $classConfig)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ClassConfig $classConfig)
    {
        $semesters = Semester::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $shifts = Shift::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $sections = Section::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        return view('admin.student.setup.class_config.createOrEdit', compact('classConfig', 'semesters', 'shifts', 'sections'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ClassConfig $classConfig)
    {
        $request->validate([
            'class_id' => 'required',
            'section_id' => 'required',
            'shift_id' => 'required',
        ]);

        $classConfig->class_id = $request->class_id;
        $classConfig->section_id = $request->section_id;
        $classConfig->shift_id = $request->shift_id;
        $classConfig->branch_id = session('branch')['id'];
        $classConfig->serial = $request->serial;
        $classConfig->status = $request->status;
        $classConfig->save();

        session()->flash('success', "Updated");
        return redirect()->route('student.setup.class_config.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ClassConfig $classConfig)
    {
        //
    }
}
