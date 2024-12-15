<?php

namespace App\Http\Controllers\sAccounts;

use App\Models\sAccounts\StudentAcFeeConfig;
use App\Models\Student\AcademicYear;
use App\Models\Student\Semester;
use App\Models\Student\Group;
use App\Models\Student\Category;
use App\Models\sAccounts\StudentAcHead;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
        //
    }

    public function save_fee_config(Request $request)
    {
        //
    }
    
    public function destroy(StudentAcFeeConfig $studentAcFeeConfig)
    {
        //
    }
}
