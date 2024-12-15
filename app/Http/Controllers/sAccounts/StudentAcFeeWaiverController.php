<?php

namespace App\Http\Controllers\sAccounts; 

use App\Models\sAccounts\StudentAcFeeWaiver;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentAcFeeWaiverController extends Controller
{
    public function index()
    {
        $feeWaivers = StudentAcFeeWaiver::where('branch_id', session('branch')['id'])->get();
        return view('admin.student_accounts.setup.fee_waiver.index', compact('feeWaivers'));
    }

    public function create()
    {
        return view('admin.student_accounts.setup.fee_waiver.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_fee_waivers,name',
            'serial' => 'required',
            'status' => 'required',
        ]);

        $feeWaiver = new StudentAcFeeWaiver();
        $feeWaiver->name = $request->name;
        $feeWaiver->serial = $request->serial;
        $feeWaiver->status = $request->status;
        $feeWaiver->branch_id = session('branch')['id'];
        $feeWaiver->save();

        session()->flash('success', 'Fee Waiver Created Successfully');
        return redirect()->route('sac.setup.feeWaiver.index');

    }


    public function edit(StudentAcFeeWaiver $feeWaiver)
    {
        return view('admin.student_accounts.setup.fee_waiver.createOrEdit', compact('feeWaiver'));
    }

    public function update(Request $request, StudentAcFeeWaiver $feeWaiver)
    {
        $request->validate([
            'name' => 'required|unique_with:student_ac_fee_waivers,name,'.$feeWaiver->id,
            'serial' => 'required',
            'status' => 'required',
        ]);

        $feeWaiver->name = $request->name;
        $feeWaiver->serial = $request->serial;
        $feeWaiver->status = $request->status;
        $feeWaiver->save();

        session()->flash('success', 'Fee Waiver Updated Successfully');
        return redirect()->route('sac.setup.feeWaiver.index');
    }

    public function destroy(StudentAcFeeWaiver $feeWaiver)
    {
        //
    }
}
