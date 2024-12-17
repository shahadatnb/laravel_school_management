<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\sAccounts\StudentAcFeeConfig;
use App\Models\Student\AcademicYear;
use App\Models\Student\Semester;
use App\Models\Student\Group;
use App\Models\Student\Category;
use App\Models\sAccounts\StudentAcHead;
use App\Models\sAccounts\StudentAcSubHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class StudentAcFeeConfigController extends Controller
{

    public function index()
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $semesters = Semester::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->pluck('name', 'id');
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $categories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $heads = StudentAcHead::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        return view('admin.student_accounts.config.fee_config.index',compact('academic_years','semesters','groups','categories','heads'));
    }

    public function get_fee_config(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'class_id'=>'required',
            'group_id'=>'required',
            'category_id'=>'required',
            'head_id'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }

        $sub_heads = StudentAcSubHead::whereHas('head',function($q)use($request){
            $q->where('head_id',$request->head_id);
        })->where('branch_id',session('branch')['id'])->where('status',1)->get();

        return response()->json(['status'=>true,'sub_heads'=>$sub_heads]);
    }

    public function save_fee_config(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'class_id'=>'required',
            'group_id'=>'required',
            'category_id'=>'required',
            'head_id'=>'required',
            'fee_amount.*'=>'nullable|numeric|required_with:fee_config_id.*',
            'fine_amount.*'=>'nullable|numeric|required_with:fee_config_id.*',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }

        $fee_configs = StudentAcFeeConfig::where('branch_id',session('branch')['id'])
        ->where('academic_year_id',$request->academic_year_id)
        ->where('class_id',$request->class_id)
        ->where('group_id',$request->group_id)
        ->where('category_id',$request->category_id)
        ->where('head_id',$request->head_id)
        ->delete();
        
        foreach ($request->fee_config_id as $key => $fee_config_id) {
            $fee_config = new StudentAcFeeConfig;
            $fee_config->branch_id = session('branch')['id'];
            $fee_config->academic_year_id = $request->academic_year_id;
            $fee_config->class_id = $request->class_id;
            $fee_config->group_id = $request->group_id;
            $fee_config->category_id = $request->category_id;
            $fee_config->head_id = $request->head_id;
            $fee_config->sub_head_id = $key;
            $fee_config->fee_amount = $request->fee_amount[$key];
            $fee_config->fine_amount = $request->fine_amount[$key];
            $fee_config->save();
        }

        return response()->json(['status'=>true,'message'=>'Success']);
    }
    
    public function destroy(StudentAcFeeConfig $studentAcFeeConfig)
    {
        //
    }
}
