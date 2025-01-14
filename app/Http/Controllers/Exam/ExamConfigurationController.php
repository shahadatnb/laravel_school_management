<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamConfiguration;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;
use App\Models\Exam\ExamList;
use App\Models\Exam\MeritProcessType;


class ExamConfigurationController extends Controller
{
    public function index()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->pluck('name','id');
        $examLists = ExamList::where('branch_id',session('branch')['id'])->get();
        $meritProcessTypes = MeritProcessType::pluck('name', 'id');
        $examConfigurations = ExamConfiguration::where('branch_id',session('branch')['id'])->with('exam','semester','meritProcessType')->get();
        return view('admin.exam.config.exam_config.index',compact('examLists','semesters','meritProcessTypes','examConfigurations'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'exam_ids' => 'required',
            'class_id' => 'required',
            'merit_process_type_id' => 'required',
        ]);

        foreach ($request->exam_ids as $key => $value) {
            $config = new ExamConfiguration;
            $config->branch_id = session('branch')['id'];
            $config->exam_id = $value;
            $config->class_id = $request->class_id;
            $config->merit_process_type_id = $request->merit_process_type_id;
            $config->save();
        }

        session()->flash('success', "Exam Config Created Successfully");
        return redirect()->route('exam.config.exam_config.index');
    }

    public function show(ExamConfiguration $examConfiguration)
    {
        //
    }

    public function edit(ExamConfiguration $examConfig)
    {
        $meritProcessTypes = MeritProcessType::pluck('name', 'id');
        return view('admin.exam.config.exam_config.edit',compact('examConfig','meritProcessTypes'));
    }

    public function update(Request $request, ExamConfiguration $examConfig)
    {
        if($examConfig->branch_id == session('branch')['id']){
            //$examConfig->exam_id = $request->exam_id;
            //$examConfig->class_id = $request->class_id;
            $examConfig->merit_process_type_id = $request->merit_process_type_id;
            $examConfig->save();
            session()->flash('success', "Exam Config Updated Successfully");
        }
        return redirect()->route('exam.config.exam_config.index');
    }

    public function destroy(ExamConfiguration $examConfig)
    {
        if($examConfig->branch_id == session('branch')['id']){
            $examConfig->delete();
            session()->flash('success', "Exam Config Deleted Successfully");
        }
        return redirect()->back();
    }

    public function finalMarkConfig(){
        $semesters = Semester::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.config.final_mark_config.index',compact('semesters'));
    }

    public function finalMarkConfigEdit($id){
        $examConfigs = ExamConfiguration::where('branch_id',session('branch')['id'])->where('class_id',$id)->get();
        return view('admin.exam.config.final_mark_config.edit',compact('examConfigs'));
    }

    public function finalMarkConfigUpdate(Request $request){
        //dd($request->all());
        foreach($request->exam_config_ids as $key => $value){
            $examConfig = ExamConfiguration::find($value);
            $examConfig->percentage = $request->percentage[$key];
            $examConfig->serial = $request->serial[$key];
            $examConfig->save();
        }
        session()->flash('success', "Final Exam Config Updated Successfully");
        return redirect()->route('exam.config.final_mark_config.index');
    }

    public function get_exam_by_semester(Request $request){
        $examLists = ExamConfiguration::where('branch_id',session('branch')['id'])->where('class_id',$request->class_id)->get();
        $exams = [];
        foreach($examLists as $key => $value){
            $exams[$key] = [
                'id' => $value->exam_id,
                'name' => $value->exam? $value->exam->name:''
            ];
        }
        return response()->json($exams);
    }
}
