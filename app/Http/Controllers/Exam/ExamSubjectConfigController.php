<?php

namespace App\Http\Controllers\Exam;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Exam\ExamSubjectConfig;
use App\Models\Student\Semester;
use App\Models\Student\ClassConfig;
use App\Models\Exam\ExamSubject;
use App\Models\Exam\ExamSubjectType;

class ExamSubjectConfigController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $semesters = Semester::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $groups = [];
        $examSubject = ExamSubject::where('branch_id',session('branch')['id'])->get();
        $subjectType = ExamSubjectType::pluck('name', 'id');
        $subjectTypes = response()->json($subjectType);
        //dd($subjectTypes);
        return view('admin.exam.config.subject_config.index',compact('examSubject','semesters','groups','subjectTypes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'class_id' => 'required',
            'group_id' => 'required',
            'subject_ids' => 'required',
        ]);

        foreach ($request->subject_ids as $key => $value) {
            $examSubject = new ExamSubjectConfig;
            $examSubject->branch_id = session('branch')['id'];
            $examSubject->class_id = $request->class_id;
            $examSubject->group_id = $request->group_id;
            $examSubject->subject_id = $value;
            $examSubject->save();
        }

        session()->flash('success', "Subject Config Created Successfully");
        return redirect()->route('exam.config.subject.index');
    }


    public function list(Request $request)
    {
        $subjectConfigs = ExamSubjectConfig::with('subject')->where('branch_id',session('branch')['id'])
        ->where('class_id',$request->class_id)->where('group_id',$request->group_id)
        ->orderBy('serial','asc')->get();
        $subjectTypes = ExamSubjectType::pluck('name', 'id')->toArray();
        $subjectList = [];
        foreach ($subjectConfigs as $key => $value) {
            $subjectList[$key] = [
                'id' => $value->id,
                'subject' => $value->subject? $value->subject->name:'',
                'serial' => $value->serial,
                'subject_type_id' => $value->subject_type_id,
                'subject_type_name' => $subjectTypes[$value->subject_type_id],
                'merge' => $value->merge
            ];
        }
       // dd($subjectTypes);
        return response()->json(['list'=>$subjectList,'subjectTypes'=>$subjectTypes]);
    }


    public function multiple_update(Request $request)
    {
        //dd($request->all());
        foreach ($request->subject_config_id as $key => $value) {
            ExamSubjectConfig::where('id',$value)->update([
                'subject_type_id' => $request->subject_type[$value],
                'serial' => $request->serial[$value],
                'merge' => $request->merge_id[$value]
            ]);
        }

        session()->flash('success', "Short Code Updated Successfully");
        return redirect()->route('exam.config.subject.index');
    }



    public function update(Request $request, ExamSubjectConfig $examSubjectConfig)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $examSubjectConfig = ExamSubjectConfig::where('id',$request->id)->where('branch_id',session('branch')['id'])->first();
        if($examSubjectConfig){
            $examSubjectConfig->delete();
            return response()->json(['success'=>'Subject Config Deleted Successfully']);
        }
    }


    public function get_forth_subject_by_section_and_group(Request $request)
    {
        $class_config = ClassConfig::where('id',$request->section_id)->where('branch_id', session('branch')['id'])->first();
        if(!$class_config){
            return response()->json(['status' => false]);
        }

        $optional_subjects = ExamSubject::whereHas('subjectConfig', function ($query) use ($class_config,$request) {
            $query->where('class_id',$class_config->class_id)->where('group_id',$request->group_id)->where('subject_type_id',2);
        })->where('branch_id',session('branch')['id'])->select('id','name')->get()->toArray();

        return response()->json(['status' => true,'forth_subjects' => $optional_subjects]);
    }
}
