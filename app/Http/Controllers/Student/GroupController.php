<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Group;
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
}
