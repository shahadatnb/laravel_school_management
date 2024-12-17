<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\Student\AcademicYear;
use App\Models\sAccounts\StudentAcTimeConfig;
use App\Models\sAccounts\StudentAcHead;
use App\Models\sAccounts\StudentAcSubHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StudentAcTimeConfigController extends Controller
{
    public function index()
    {
        $heads = StudentAcHead::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $months = ['01'=>'January', '02'=>"February", '03'=>"March", '04'=>"April", '05'=>"May", '06'=>"June", '07'=>"July", '08'=>"August", '09'=>"September", '10'=>"October", '11'=>"November", '12'=>"December"];
        return view('admin.student_accounts.config.time_config.index', compact('heads', 'academic_years', 'months'));
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
        //
    }

    public function get_fee_time(Request $request)
    {
        //
    }

    public function destroy(StudentAcTimeConfig $studentAcTimeConfig)
    {
        //
    }
}
