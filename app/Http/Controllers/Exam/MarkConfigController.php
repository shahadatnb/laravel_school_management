<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\MarkConfig;
use App\Models\Exam\ExamSubjectConfig;
use App\Models\Exam\ExamConfiguration;
use App\Models\Exam\ExamShortCode;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;
use App\Models\Student\GroupConfig;

class MarkConfigController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->pluck('name','id');
        return view('admin.exam.config.mark_config.index',compact('semesters'));
    }

    public function get_group(Request $request)
    {
        $groups = GroupConfig::where('class_id',$request->class_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $group_arrs = [];
        foreach ($groups as $key => $value) {
            $group_arrs[$key] = [
                'id' => $value->id,
                'name' => $value->group? $value->group->name:'',
            ];
        }

        return response()->json($group_arrs);
    }

    public function get_subject_exam(Request $request)
    {
        if(empty($request->class_id) || empty($request->group_id)){
            return response()->json(['subjects'=>[],'exams'=>[]]);
        }
        $subjects = ExamSubjectConfig::where('class_id',$request->class_id)->where('group_id',$request->group_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $subject_arrs = [];
        foreach ($subjects as $key => $value) {
            $subject_arrs[$key] = [
                'id' => $value->id,
                'name' => $value->subject? $value->subject->name:'',
            ];
        }
        $exams = ExamConfiguration::where('class_id',$request->class_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $exam_arrs = [];
        foreach ($exams as $key => $value) {
            $exam_arrs[$key] = [
                'id' => $value->id,
                'name' => $value->exam? $value->exam->name:'',
            ];
        }

        $short_codes = ExamShortCode::where('class_id',$request->class_id)->where('branch_id',session('branch')['id'])->get();

        return response()->json(['subjects'=>$subject_arrs,'exams'=>$exam_arrs,'short_codes'=>$short_codes]);
    }

    public function get_short_code(Request $request)
    {
        
    }

    public function save_config(Request $request)
    {
        
    }

    public function get_config(Request $request)
    {
        
    }


}
