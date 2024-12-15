<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\sAccounts\StudentAcSubHeadConfig;
use App\Models\sAccounts\StudentAcHead;
use App\Models\sAccounts\StudentAcSubHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentAcSubHeadConfigController extends Controller
{
    public function index()
    {
        $heads = StudentAcHead::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $subHeads = StudentAcSubHead::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $subHeadConfigs = StudentAcSubHeadConfig::where('branch_id', session('branch')['id'])->get();
        return view('admin.student_accounts.config.sub_head_config.index', compact('subHeadConfigs', 'heads', 'subHeads'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'head_id' => 'required',
            'sub_head_ids' => 'required',
        ]);

        //return $request->all();

        foreach ($request->sub_head_ids as $key => $value) {
            $subHeadConfig = new StudentAcSubHeadConfig;
            $subHeadConfig->branch_id = session('branch')['id'];
            $subHeadConfig->head_id = $request->head_id;
            $subHeadConfig->sub_head_id = $value;
            $subHeadConfig->save();
        }

        session()->flash('success', 'Sub Head Config Created Successfully');
        return redirect()->route('sac.config.subHeadConfig.index');
    }

    public function edit(StudentAcSubHeadConfig $subHeadConfig)
    {
        //
    }

    public function update(Request $request, StudentAcSubHeadConfig $subHeadConfig)
    {
        //
    }

    public function destroy(StudentAcSubHeadConfig $subHeadConfig)
    {
        $subHeadConfig->delete();
        session()->flash('success', 'Sub Head Config Deleted Successfully');
        return redirect()->route('sac.config.subHeadConfig.index');
    }
}
