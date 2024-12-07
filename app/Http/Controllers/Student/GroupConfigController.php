<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\GroupConfig;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;
use App\Models\Student\Group;

class GroupConfigController extends Controller
{
    public function index()
    {
        $group_configs = GroupConfig::where('branch_id',session('branch')['id'])->get();
        return view('admin.student.setup.group_config.index',compact('group_configs'));
    }

    public function create()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->pluck('name','id');
        $groups = Group::where('branch_id',session('branch')['id'])->pluck('name','id');
        return view('admin.student.setup.group_config.createOrEdit',compact('semesters','groups'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'group_id' => 'required',
            'class_id' => 'required',
            'serial' => 'required|numeric',
        ]);

        $groupConfig = new GroupConfig;
        $groupConfig->group_id = $request->group_id;
        $groupConfig->class_id = $request->class_id;
        $groupConfig->serial = $request->serial;
        $groupConfig->branch_id = session('branch')['id'];
        $groupConfig->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.group_config.index');
    }

    public function show(GroupConfig $groupConfig)
    {
        //
    }

    public function edit(GroupConfig $groupConfig)
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->pluck('name','id');
        $groups = Group::where('branch_id',session('branch')['id'])->pluck('name','id');
        return view('admin.student.setup.group_config.createOrEdit',compact('groupConfig','semesters','groups'));
    }

    public function update(Request $request, GroupConfig $groupConfig)
    {
        $request->validate([
            'group_id' => 'required',
            'class_id' => 'required',
            'serial' => 'required|numeric',
        ]);

        $groupConfig->group_id = $request->group_id;
        $groupConfig->class_id = $request->class_id;
        $groupConfig->serial = $request->serial;
        $groupConfig->branch_id = session('branch')['id'];
        $groupConfig->save();
    }

    public function destroy(GroupConfig $groupConfig)
    {
        //
    }
}
