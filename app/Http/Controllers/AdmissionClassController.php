<?php

namespace App\Http\Controllers;

use App\Models\AdmissionClass;
use Illuminate\Http\Request;

class AdmissionClassController extends Controller
{

    public function index()
    {
        $admission_classes = AdmissionClass::all();
        return view('admin.admission.class.index', compact('admission_classes'));
    }

    public function create()
    {
        return view('admin.admission.class.createOrEdit');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'total_seat' => 'required|numeric',
            'vacant_seat' => 'required|numeric',
            'application_fee' => 'required|numeric',
        ]);

        $admissionClass = new AdmissionClass();
        $admissionClass->name = $request->name;
        $admissionClass->total_seat = $request->total_seat;
        $admissionClass->vacant_seat = $request->vacant_seat;
        $admissionClass->vacant_seat2 = $request->vacant_seat2;
        $admissionClass->waiting_list = $request->waiting_list;
        $admissionClass->application_fee = $request->application_fee;
        $admissionClass->is_active = 1;
        $admissionClass->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_class.index');
    }

    public function show(AdmissionClass $admissionClass)
    {
        
    }

    public function edit(AdmissionClass $admissionClass)
    {
        return view('admin.admission.class.createOrEdit', compact('admissionClass'));
    }


    public function update(Request $request, AdmissionClass $admissionClass)
    {
        $this->validate($request, [
            'name' => 'required',
            'total_seat' => 'required|numeric',
            'vacant_seat' => 'required|numeric',
        ]);

        $admissionClass->name = $request->name;
        $admissionClass->total_seat = $request->total_seat;
        $admissionClass->vacant_seat = $request->vacant_seat;
        $admissionClass->vacant_seat2 = $request->vacant_seat2;
        $admissionClass->waiting_list = $request->waiting_list;
        $admissionClass->application_fee = $request->application_fee;
        $admissionClass->is_active = $request->is_active ?? 0;
        $admissionClass->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_class.index');
    }

    public function destroy(AdmissionClass $admissionClass)
    {
        if($admissionClass->students->count() > 0){
            session()->flash('error', 'Department cannot be deleted because it has students');
            return redirect()->back();
        }
        $admissionClass->delete();
        session()->flash('success', 'Department deleted successfully');
        return redirect()->back();
    }
}
