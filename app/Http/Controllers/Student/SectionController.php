<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Section;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SectionController extends Controller
{
    public function index()
    {
        $sections = Section::where('branch_id',session('branch')['id'])->get();
        return view('admin.student.setup.section.index',compact('sections'));
    }

    public function create()
    {
        return view('admin.student.setup.section.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $section = new Section;
        $section->name = $request->name;
        $section->branch_id = session('branch')['id'];
        $section->status = $request->status;
        $section->serial = $request->serial;
        $section->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.section.index');
    }

    public function show(Section $section)
    {
        //
    }

    public function edit(Section $section)
    {
        return view('admin.student.setup.section.createOrEdit',compact('section'));
    }

    public function update(Request $request, Section $section)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $section->name = $request->name;
        $section->branch_id = session('branch')['id'];
        $section->status = $request->status;
        $section->serial = $request->serial;
        $section->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.section.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Section $section)
    {
        //
    }
}
