<?php

namespace App\Http\Controllers;

use App\Models\AdmissionQuota;
use Illuminate\Http\Request;

class AdmissionQuotaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $quotas = AdmissionQuota::all();
        return view('admin.admission.quota.index', compact('quotas'));
    }

    public function create()
    {
        return view('admin.admission.quota.createOrEdit');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'quota_percentage' => 'required|numeric',
            'priority' => 'required|numeric',
        ]);

        $admissionQuota = new AdmissionQuota();
        $admissionQuota->name = $request->name;
        $admissionQuota->quota_percentage = $request->quota_percentage;
        $admissionQuota->priority = $request->priority;
        $admissionQuota->is_active = $request->is_active ?? 1;
        $admissionQuota->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_quota.index');
    }

    public function show(AdmissionQuota $admissionQuota)
    {
        //
    }

    public function edit(AdmissionQuota $admissionQuotum)
    { 
        return view('admin.admission.quota.createOrEdit', compact('admissionQuotum'));
    }

    public function update(Request $request, AdmissionQuota $admissionQuotum)
    {
        $this->validate($request, [
            'name' => 'required',
            'quota_percentage' => 'required|numeric',
            'priority' => 'required|numeric',
        ]);

        $admissionQuotum->name = $request->name;
        $admissionQuotum->quota_percentage = $request->quota_percentage;
        $admissionQuotum->priority = $request->priority;
        $admissionQuotum->is_active = $request->is_active ?? 0;
        $admissionQuotum->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_quota.index');
    }

    public function destroy(AdmissionQuota $admissionQuotum)
    {
        //
    }
}
