<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamMark;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\AcademicYear;
use App\Models\Student\ClassConfig;
use App\Models\Student\GroupConfig;
use App\Models\Exam\ExamConfiguration;
use App\Models\Exam\ExamSubjectConfig;
use App\Models\Exam\MarkConfig;
use Illuminate\Support\Facades\Validator;
use App\Models\Student\Student;

class ExamMarkController extends Controller
{

    public function input()
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.mark.input',compact('academic_years','class_configs'));
    }

    public function get_exam_group(Request $request)
    {
        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id',session('branch')['id'])->first();
        $groups = GroupConfig::where('class_id',$class_config->class_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $group_arrs = [];
        foreach ($groups as $key => $value) {
            $group_arrs[$key] = [
                'id' => $value->group_id,
                'name' => $value->group? $value->group->name:'',
            ];
        }

        $exams = ExamConfiguration::where('class_id',$class_config->class_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $exam_arrs = [];
        foreach ($exams as $key => $value) {
            $exam_arrs[$key] = [
                'id' => $value->exam_id,
                'name' => $value->exam? $value->exam->name:'',
            ];
        }


        return response()->json(['groups'=>$group_arrs,'exams'=>$exam_arrs]);
    }

    public function get_subject(Request $request){
        if(empty($request->section_id) || empty($request->group_id)){
            return response()->json([]);
        }

        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id',session('branch')['id'])->first();

        $subjects = ExamSubjectConfig::where('class_id',$class_config->class_id)->where('group_id',$request->group_id)->where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        $subject_arrs = [];
        foreach ($subjects as $key => $value) {
            $subject_arrs[$key] = [
                'id' => $value->subject_id,
                'name' => $value->subject? $value->subject->name:'',
            ];
        }

        return response()->json($subject_arrs);
    }

    public function get_input_student(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'section_id'=>'required',
            'group_id'=>'required',
            'exam_id'=>'required',
            'subject_id'=>'required',
        ]);

        if ($validator->fails()) {
            //if($request->ajax()){
                return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
           // }
        }

        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id',session('branch')['id'])->first();
        $mark_configs = MarkConfig::where('branch_id',session('branch')['id'])->where('class_id',$class_config->class_id)->where('group_id',$request->group_id)->where('exam_id',$request->exam_id)->where('subject_id',$request->subject_id)->get();
        if($mark_configs->count()==0){
            return response()->json(['status'=>false,'errors'=>['No Mark Config Found']]);
        }

        $saved_marks = ExamMark::where('branch_id',session('branch')['id'])->where('academic_year_id',$request->academic_year_id)->where('section_id',$request->section_id)
        ->whereHas('mark_config',function($q)use($class_config,$request){
            $q->where('branch_id',session('branch')['id'])->where('class_id',$class_config->class_id)->where('group_id',$request->group_id)->where('exam_id',$request->exam_id)->where('subject_id',$request->subject_id);
        })->count();//->where('mark_config_id',$mark_configs->first()->id)
        //dd($saved_marks);
        if($saved_marks>0){
            return response()->json(['status'=>false,'errors'=>['Marks Already Saved']]);
        }

        $students = Student::where('branch_id',session('branch')['id'])->where('section_id',$request->section_id)->where('group_id',$request->group_id)->select('id','reg_no','class_roll','name')->get();
        return response()->json(['status'=>true,'mark_configs'=>$mark_configs,'students'=>$students]);
    
    }

    public function input_save(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mark_list'=>'required',
            'mark_list.*.*'=>'nullable|numeric|required_without:is_absent.*',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }
        
        foreach ($request->mark_list as $key => $mark_list) {
            foreach ($mark_list as $key2 => $value) {
                $exam_mark = new ExamMark();
                $exam_mark->branch_id = session('branch')['id'];
                $exam_mark->academic_year_id = $request->academic_year_id;
                $exam_mark->section_id = $request->section_id;
                $exam_mark->student_id = $key;
                $exam_mark->mark_config_id = $key2;
                $exam_mark->is_absent = $request->is_absent[$key] ?? null;
                $exam_mark->marks = $value;
                $exam_mark->save();
            }
        }

        return response()->json(['status'=>true,'message'=>'Success']);
        
    }

    public function update(Request $request)
    {
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $class_config = ClassConfig::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->get();
        $class_configs = [];
        foreach ($class_config as $key => $value) {
            $class_configs[$value->id] = $value->name;
        }
        return view('admin.exam.mark.update',compact('academic_years','class_configs'));
    }

    public function get_update_student(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'section_id'=>'required',
            'group_id'=>'required',
            'exam_id'=>'required',
            'subject_id'=>'required',
        ]);

        if ($validator->fails()) {
            //if($request->ajax()){
                return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
           // }
        }


        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id',session('branch')['id'])->first();
        $saved_marks = ExamMark::where('branch_id',session('branch')['id'])->where('academic_year_id',$request->academic_year_id)->where('section_id',$request->section_id)
        ->whereHas('mark_config',function($q) use($request,$class_config){
            $q->where('branch_id',session('branch')['id'])->where('class_id',$class_config->class_id)->where('group_id',$request->group_id)->where('exam_id',$request->exam_id)->where('subject_id',$request->subject_id);
        })->get();
        
        if($saved_marks->count()==0){
            return response()->json(['status'=>false,'errors'=>['Marks Not Saved']]);
        }

        $mark_configs = [];
        foreach ($saved_marks->groupBy('mark_config_id') as $key => $value) {
            $mark_configs[$key] = [
                'id' => $value->first()->mark_config_id,
                'sc_title' => $value->first()->mark_config? $value->first()->mark_config->sc_title:'',
            ];
        }

        $students = [];
        foreach ($saved_marks->groupBy('student_id') as $key => $value) {
            $students[$key] = [
                'id' => $value->first()->student_id,
                'reg_no' => $value->first()->student->reg_no,
                'class_roll' => $value->first()->student->class_roll,
                'name' => $value->first()->student->name,
                'is_absent' => $value->first()->is_absent,
            ];
            foreach ($value as $key2 => $value2) {
                $students[$key]['marks'][$value2->mark_config_id] = [
                    'id' => $value2->id,
                    'mark_config_id' => $value2->mark_config_id,
                    'mark' => $value2->marks
                ];
            }
        }

        return response()->json(['status'=>true,'mark_configs'=>$mark_configs,'students'=>$students]);

    }

    public function update_save(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mark_list'=>'required',
            'mark_list.*.*'=>'nullable|numeric|required_without:is_absent.*',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }
        
        foreach ($request->mark_list as $key => $mark_list) {
            foreach ($mark_list as $key2 => $value) {
                $exam_mark = ExamMark::find($key2);
                $exam_mark->is_absent = $request->is_absent[$key] ?? null;
                $exam_mark->marks = isset($request->is_absent[$key]) ? null : $value;
                $exam_mark->save();
            }
        }

        return response()->json(['status'=>true,'message'=>'Success']);
    }
}
