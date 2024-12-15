<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\sAccounts\StudentAcSubHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentAcSubHeadController extends Controller
{

    public function index()
    {
        $subHeads = StudentAcSubHead::where('branch_id', session('branch')['id'])->get();
        return view('admin.student_accounts.setup.ac_sub_head.index', compact('subHeads'));
    }

    public function create()
    {
        return view('admin.student_accounts.setup.ac_sub_head.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_sub_heads,name',
            'serial' => 'required',
            'status' => 'required',
        ]);

        $subHead = new StudentAcSubHead();
        $subHead->name = $request->name;
        $subHead->serial = $request->serial;
        $subHead->status = $request->status;
        $subHead->branch_id = session('branch')['id'];
        $subHead->save();

        session()->flash('success', 'Sub Head Created Successfully');
        return redirect()->route('sac.setup.subHead.index');
    }

    public function edit(StudentAcSubHead $subHead)
    {
        return view('admin.student_accounts.setup.ac_sub_head.createOrEdit', compact('subHead'));
    }

    public function update(Request $request, StudentAcSubHead $subHead)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_sub_heads,name,'.$subHead->id,
            'serial' => 'required',
            'status' => 'required',
        ]); 

        $subHead->name = $request->name;
        $subHead->serial = $request->serial;
        $subHead->status = $request->status;
        $subHead->save();

        session()->flash('success', 'Sub Head Updated Successfully');
        return redirect()->route('sac.setup.subHead.index');
    }

    public function destroy(StudentAcSubHead $subHead)
    {
        //
    }
}
