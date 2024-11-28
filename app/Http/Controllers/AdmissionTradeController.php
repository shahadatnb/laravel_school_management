<?php

namespace App\Http\Controllers;

use App\Models\AdmissionTrade;
use App\Models\AdmissionClass;
use Illuminate\Http\Request;

class AdmissionTradeController extends Controller
{

    public function index()
    {
        $admission_trades = AdmissionTrade::all();
        return view('admin.admission.trade.index', compact('admission_trades'));
    }

    public function create()
    {
        $admission_class = AdmissionClass::where('is_active',1)->pluck('name','id');
        return view('admin.admission.trade.createOrEdit',compact('admission_class'));
    }


    public function store(Request $request)
    {
        
        $this->validate($request, [
            'name' => 'required',
            'code' => 'required|numeric',
            'class_id' => 'required|numeric',
            'total_seat' => 'required|numeric',
            'vacant_seat' => 'required|numeric',
            'waiting_list' => 'required|numeric',
        ]);

        $admissionTrade = new AdmissionTrade();
        $admissionTrade->name = $request->name;
        $admissionTrade->code = $request->code;
        $admissionTrade->class_id = $request->class_id;
        $admissionTrade->total_seat = $request->total_seat;
        $admissionTrade->vacant_seat = $request->vacant_seat;
        $admissionTrade->waiting_list = $request->waiting_list;
        $admissionTrade->is_active = 1;
        $admissionTrade->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_trade.index');
    }

    public function trades(Request $request){
        if(empty($request->class_id)){
            return response()->json(['status'=>false]);
        }
        $trades = AdmissionTrade::where('class_id',$request->class_id)->get(['id','name','code']);
        if($trades->count()>0){
            return response()->json(['status'=>true,'trades'=>$trades]);
        }else{
            return response()->json(['status'=>false]);
        }
    }

    public function show(AdmissionTrade $admissionTrade)
    {
        
    }

    public function edit(AdmissionTrade $admissionTrade)
    {
        $admission_class = AdmissionClass::where('is_active',1)->pluck('name','id');
        return view('admin.admission.trade.createOrEdit', compact('admissionTrade','admission_class'));
    }

    public function update(Request $request, AdmissionTrade $admissionTrade)
    {
        $this->validate($request, [
            'name' => 'required',
            'code' => 'required|numeric',
            'class_id' => 'required|numeric',
            'total_seat' => 'required|numeric',
            'vacant_seat' => 'required|numeric',
            'waiting_list' => 'required|numeric',
        ]);

        $admissionTrade->name = $request->name;
        $admissionTrade->code = $request->code;
        $admissionTrade->class_id = $request->class_id;
        $admissionTrade->total_seat = $request->total_seat;
        $admissionTrade->vacant_seat = $request->vacant_seat;
        $admissionTrade->waiting_list = $request->waiting_list;
        $admissionTrade->is_active = 1;
        $admissionTrade->save();
        session()->flash('success', 'created successfully');
        return redirect()->route('admission_trade.index');
    }

    public function destroy(AdmissionTrade $admissionTrade)
    {
        if($admissionTrade->students->count() > 0){
            session()->flash('error', 'Department cannot be deleted because it has students');
            return redirect()->back();
        }
        $admissionTrade->delete();
        session()->flash('success', 'Department deleted successfully');
        return redirect()->back();
    }
}
