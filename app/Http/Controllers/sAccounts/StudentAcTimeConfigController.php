<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\Student\AcademicYear;
use App\Models\sAccounts\StudentAcTimeConfig;
use App\Models\sAccounts\StudentAcHead;
use App\Models\sAccounts\StudentAcSubHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class StudentAcTimeConfigController extends Controller
{
    public function index()
    {
        $heads = StudentAcHead::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        //$months = ['01'=>'January', '02'=>"February", '03'=>"March", '04'=>"April", '05'=>"May", '06'=>"June", '07'=>"July", '08'=>"August", '09'=>"September", '10'=>"October", '11'=>"November", '12'=>"December"];
        return view('admin.student_accounts.config.time_config.index', compact('heads', 'academic_years'));
    }

    public function get_sub_head(Request $request)
    {
        $sub_heads = StudentAcSubHead::whereHas('head', function ($q) use ($request) { //with('head')->
            $q->where('head_id', $request->head_id);
        })->where('branch_id', session('branch')['id'])->where('status',1)->get();

        return response()->json(['status'=>true,'sub_heads'=>$sub_heads]);
    }

    public function save_fee_time(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'head_id'=>'required',
            //'academic_year_ids.*'=>'required',
            'years.*'=>'required',
            'sub_head_ids.*'=>'required',
            'months.*'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }

        //$check = StudentAcTimeConfig::where('branch_id', session('branch')['id'])->where('sub_head_id', $request->sub_head_ids[0])->count();

        foreach ($request->sub_head_ids as $key => $sub_head_id) {
            //branch_id 	academic_year_id 	sub_head_id 	month
            $time_config = new StudentAcTimeConfig;
            $time_config->branch_id = session('branch')['id'];
            $time_config->year = $request->years[$key];
            $time_config->sub_head_id = $sub_head_id;
            $time_config->month = $request->months[$key];
            $time_config->save();
        }

        return response()->json(['status'=>true, 'message'=>'Successfully Saved']);
    }

    public function get_time_config(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'fee_head_id'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }

        $time_datas = StudentAcTimeConfig::with('sub_head')->where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id)->where('sub_head_id', $request->fee_head_id)->get();
        dd($time_datas);
        $time_configs = [];
        foreach ($time_datas as $key => $value) {
            $time_configs[$key] = [
                'head_name' =>  ($value->sub_head && $value->sub_head->head) ? $value->sub_head->head->name : '',
                'sub_head_name' =>  $value->sub_head? $value->sub_head->name : '',
                'month' =>  $value->month,
                'year' =>  $value->academic_year->year
            ];
        }
        return response()->json(['status'=>true,'time_configs'=>$time_configs]);

    }

    public function destroy(StudentAcTimeConfig $studentAcTimeConfig)
    {
        //
    }
}
