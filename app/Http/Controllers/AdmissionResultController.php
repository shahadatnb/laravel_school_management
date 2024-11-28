<?php

namespace App\Http\Controllers;

use App\Models\AdmissionResult;
use App\Models\AdmissionClass;
use App\Models\AdmissionTrade;
use App\Models\AdmissionQuota;
use App\Models\Admission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdmissionResultController extends Controller
{

    public function index(Request $request)
    {
        $data=['form_filup'];
        $data['trade_id'] = '';
        $data['priority'] = '';
        $admission_trades = [];
        $admission_class = AdmissionClass::pluck('name','id');
        $quotas = AdmissionQuota::where('is_active',1)->pluck('name','id');
        $students = [];
        if(!empty($request->class_id)){
            $data['class_id'] = $request->class_id;
            $data['shift'] = $request->shift;
            $data['result_type'] = $request->result_type;
            $data['quota_id'] = $request->quota_id;
            $admission_trades = AdmissionTrade::where('is_active',1)->where('class_id',$data['class_id'])->pluck('name','id');
            if($admission_trades->count()==0){
                $admission_trades = [];
            }

            $students = Admission::with('result')->where('shift', $request->shift);
            //$students = $students->has('result');
            $students = $students->whereHas('result', function($q) use($request){
                $q->where('position', $request->result_type);
            });
            $students = $students->where('class_id', $request->class_id);
            if(!empty($request->trade_id)){ //&& $request->priority
                $data['trade_id'] = $request->trade_id;
                $students = $students->where('trade_id', $request->trade_id);
                //$data['priority'] = $request->priority;
                // $students = $students->whereHas('selectedTrade', function($q) use($request, $data){
                //     $q->where('trade_id', $data['trade_id']);//->where('priority', $request->priority);
                // });
            }
            if(!empty($request->quota_id)){
                $data['quota_id'] = $request->quota_id;
                $students = $students->where('select_quota_id', $request->quota_id);
            }
            $students = $students->paginate(100);
        }
        //dd($students);
        return view('admin.admission.result.index', compact('admission_class','students','data','admission_trades','quotas'));
    }


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id'=>'required',
            'shift'=>'required',
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
            }else{
                return back()->withErrors($validator)->withInput();
            }
        }

        if($request->ajax()){
            // $students = Admission::where('shift', $request->shift)->where('class_id', $request->class_id);
            // $students = $students->has('result');
            // if(!empty($request->trade_id) && $request->priority){
            //     $students = $students->whereHas('selectedTrade', function($q) use($request){
            //         $q->where('trade_id', $request->trade_id)->where('priority', $request->priority);
            //     });
            // }
            // if($students->count()>0){
            //     return response()->json(['status'=>false,'message'=>'Already generated']);
            // }else{

            $class_name = AdmissionClass::find($request->class_id);
            if($request->shift == '1st Shift'){                
                $vacant_seat = $class_name->vacant_seat - $class_name->admited;
                $total_seat = $class_name->vacant_seat;
                if(!empty($request->trade_id) && $request->priority){
                    $trade = AdmissionTrade::find($request->trade_id);
                    $total_seat = $trade->vacant_seat;
                    $vacant_seat = $trade->vacant_seat - $trade->admited;
                    //return response()->json(['status'=>false,'message'=>$trade]);
                }
            }else{
                $total_seat = $class_name->vacant_seat2;
                $vacant_seat = $class_name->vacant_seat2 - $class_name->admited2;
                if(!empty($request->trade_id) && !empty($request->priority)){
                    $trade = AdmissionTrade::find($request->trade_id);
                    $total_seat = $trade->vacant_seat2;
                    $vacant_seat = $trade->vacant_seat2 - $trade->admited2;
                }
            }
            if($vacant_seat > 0){
                $take_seat = 0;
                $selected_student = Admission::where('class_id', $request->class_id)->where('final_submit', 1)
                ->where('shift', $request->shift)->where('selected','!=', 1);
                if(!empty($request->quota_id)){
                    $quota = AdmissionQuota::find($request->quota_id);
                    if($quota->is_female == 1){
                        $selected_student = $selected_student->where('sex', 'Female')->inRandomOrder();
                    }elseif($quota->is_self == 1){
                        $selected_student = $selected_student->where('is_self', 1)->orderBy('id','asc');
                    }else{
                        $selected_student = $selected_student->where('quota_id', $request->quota_id)->inRandomOrder();
                    }
                    $quota_seat = round($total_seat * ($quota->quota_percentage / 100));
                    $take_seat = min($quota_seat, $vacant_seat);
                }else{
                    $take_seat = $vacant_seat;
                }

                if(!empty($request->trade_id) && !empty($request->priority)){
                    $selected_student = $selected_student->whereHas('selectedTrade', function($q) use($request){
                        $q->where('trade_id', $request->trade_id)->where('priority', $request->priority);
                    });
                }
               $selected_student = $selected_student->take($take_seat)->get();
                if($selected_student->count() > 0){
                    if(!empty($request->trade_id) && !empty($request->priority)){
                        if($request->shift == '1st Shift'){
                            $trade->increment('admited', $selected_student->count());
                        }else{
                            $trade->increment('admited2', $selected_student->count());
                        }                        
                    }else{
                        if($request->shift == '1st Shift'){
                            $class_name->increment('admited', $selected_student->count());
                        }else{
                            $class_name->increment('admited2', $selected_student->count());
                        }
                    }
                    //$count = $total_seat - $vacant_seat;
                    foreach($selected_student as $key=>$ss){
                        AdmissionResult::create(['admission_id'=>$ss->id,'sl'=>++$key,'position'=>'Merit']);
                        $rdata = [];
                        $rdata['selected'] = 1;
                        if(!empty($request->quota_id)){
                            $rdata['select_quota_id'] = $request->quota_id;
                        }
                        if(!empty($request->trade_id)){
                            $rdata['trade_id'] = $request->trade_id;
                        }
                        $ss->update($rdata);
                    }
                }
                         
                return response()->json(['status'=>true,'message'=>'Success']); 
            }else{
                return response()->json(['status'=>false,'message'=>'Vacant seat not found']);
            }
            
        }
    }

    public function store_waiting(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id'=>'required',
            'shift'=>'required',
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
            }else{
                return back()->withErrors($validator)->withInput();
            }
        }

        if($request->ajax()){
            $class_name = AdmissionClass::find($request->class_id);
            $take_seat = $class_name->waiting_list;
            $selected_student = Admission::where('class_id', $request->class_id)->where('final_submit', 1)
                ->where('shift', $request->shift)->where('selected','!=', 1);

               $selected_student = $selected_student->take($take_seat)->get();
                if($selected_student->count() > 0){
                    foreach($selected_student as $key=>$ss){
                        AdmissionResult::create(['admission_id'=>$ss->id,'sl'=>++$key,'position'=>'Waiting']);
                    }
                }
                         
                return response()->json(['status'=>true,'message'=>'Success']); 
        }
    }

    public function application_summary(Request $request)
    {
        $applications = Admission::where('paymentStatus',1)->with('semester','quota','selectedTrade')->get();
        return view('admin.admission.result.application_summary', compact('applications'));
    }

    public function application_result_details(Request $request){
        $data = [];
        $admission_trades = [];
        $admission_class = AdmissionClass::pluck('name','id');

        $results = Admission::with('semester','selectedTrade');

        if(!empty($request->class_id) && !empty($request->shift)){
            $data['class_id'] = $request->class_id;
            $data['shift'] = $request->shift;
            $admission_trades = AdmissionTrade::where('is_active',1)->where('class_id',$data['class_id'])->pluck('name','id');
            if($admission_trades->count()==0){
                $admission_trades = [];
            }
            $results = $results->where('class_id', $request->class_id)->where('shift', $request->shift)
            ->whereHas('result', function($q) use($request){
                $q->where('position', 'Merit');
            });

            if(!empty($request->trade_id)){
                $data['trade_id'] = $request->trade_id;
                $results = $results->where('trade_id', $request->trade_id);
            }

            $results = $results->get();
        }

        return view('admin.admission.result.application_result_details', compact('results','data','admission_trades','admission_class'));
    }

    public function application_result_summary(Request $request){
        $results = Admission::with('semester','selectedTrade','quota')->where('selected',1)->get();
        $quotas = AdmissionQuota::where('is_active',1)->pluck('name','id');
        $classes = AdmissionClass::where('is_active',1)->get();
        return view('admin.admission.result.application_result_summary', compact('results','quotas','classes'));
    }

    public function application_waiting_list(Request $request){
        $data = [];
        $admission_class = AdmissionClass::pluck('name','id');
        $results = Admission::with('semester','selectedTrade');

        if(!empty($request->class_id) && !empty($request->shift)){
            $data['class_id'] = $request->class_id;
            $data['shift'] = $request->shift;

            $results = $results->where('class_id', $request->class_id)->where('shift', $request->shift)
            ->whereHas('result', function($q) use($request){
                $q->where('position', 'Waiting');
            });

            $results = $results->get();
        }

        return view('admin.admission.result.application_waiting_list', compact('results','data','admission_class'));
    }

}
