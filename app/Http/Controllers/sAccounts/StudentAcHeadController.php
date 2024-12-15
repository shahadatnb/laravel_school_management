<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\sAccounts\StudentAcHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentAcHeadController extends Controller
{
    public function index()
    {
        $heads = StudentAcHead::where('branch_id', session('branch')['id'])->get();
        return view('admin.student_accounts.setup.ac_head.index', compact('heads'));
    }

    public function create()
    {
        return view('admin.student_accounts.setup.ac_head.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_heads,name',
            'serial' => 'required',
            'status' => 'required',
        ]);

        $head = new StudentAcHead();
        $head->name = $request->name;
        $head->serial = $request->serial;
        $head->status = $request->status;
        $head->branch_id = session('branch')['id'];
        $head->save();

        session()->flash('success', 'Head Created Successfully');
        return redirect()->route('sac.setup.head.index');
    }

    public function edit(StudentAcHead $head)
    {
        return view('admin.student_accounts.setup.ac_head.createOrEdit', compact('head'));
    }

    public function update(Request $request, StudentAcHead $head)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_heads,name,'.$head->id,
            'serial' => 'required',
            'status' => 'required',
        ]);

        $head->name = $request->name;
        $head->serial = $request->serial;
        $head->status = $request->status;
        $head->save();

        session()->flash('success', 'Head Updated Successfully');
        return redirect()->route('sac.setup.head.index');
    }

    public function destroy(StudentAcHead $head)
    {
        //
    }
}
