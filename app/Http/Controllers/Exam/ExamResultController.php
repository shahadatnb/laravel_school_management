<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamResult;
use App\Models\Student\AcademicYear;
use App\Models\Student\ClassConfig;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamResultController extends Controller
{
    public function general_process(Request $request)
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.result_process.general_process',compact('academic_years','class_configs'));
    }

    public function general_process_save(Request $request)
    {
        //
    }

    public function merit_process(Request $request)
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.result_process.merit_process',compact('academic_years','class_configs'));
    }

    public function merit_process_save(Request $request)
    {
        //
    }

    public function merit_class_wise(Request $request)
    {
        //
    }

    public function merit_section_wise(Request $request)
    {
        //
    }

    public function marksheet(Request $request)
    {
        //
    }

    public function tabulation_sheet(Request $request)
    {
        //
    }
}
