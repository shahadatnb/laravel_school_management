<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Group;
use App\Models\Student\ClassConfig;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GroupController extends Controller
{

    public function index()
    {
        $groups = Group::where('branch_id',session('branch')['id'])->get();
        return view('admin.student.setup.group.index',compact('groups'));
    }

    public function create()
    {
        return view('admin.student.setup.group.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $group = new Group;
        $group->name = $request->name;
        $group->branch_id = session('branch')['id'];
        $group->status = $request->status;
        $group->serial = $request->serial;
        $group->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.group.index');
    }

    public function show(Group $group)
    {
        
    }

    public function edit(Group $group)
    {
        return view('admin.student.setup.group.createOrEdit',compact('group'));
    }

    public function update(Request $request, Group $group)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $group->name = $request->name;
        $group->branch_id = session('branch')['id'];
        $group->status = $request->status;
        $group->serial = $request->serial;
        $group->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.group.index');
    }

    public function destroy(Group $group)
    {
        //
    }

    public function get_group_by_section(Request $request)
    {
        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id', session('branch')['id'])->first();
        if(!$class_config){
            return response()->json(['status' => false]);
        }

        $groups = Group::where('branch_id',session('branch')['id'])->whereHas('groupConfig', function ($query) use ($class_config) { 
            $query->where('class_id', $class_config->class_id); 
        } )->select('id','name')->get()->toArray();


        return response()->json(['status' => true,'groups' => $groups]);
    }
}
