<?php

namespace App\Http\Controllers\Exam;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Exam\ExamFourthAssign;
use App\Traits\StudentTrait;
use Illuminate\Support\Facades\Validator;

class ExamFourthAssignController extends Controller
{
    use StudentTrait;

    public function index()
    {
        $sections = $this->sectionArray();
        $academic_years = $this->academicYears();
        return view('admin.exam.config.forth_subject.index', compact('sections','academic_years'));
    }

    public function create()
    {
        $sections = $this->sectionArray();
        $academic_years = $this->academicYears();
        return view('admin.exam.config.forth_subject.create', compact('sections','academic_years'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_year_id'=>'required',
            'student_ids'=>'required',
            'subject_ids'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }



        foreach (json_decode($request->student_ids, true) as $key => $student_id) {
            $check = ExamFourthAssign::where('academic_year_id', $request->academic_year_id)->where('student_id', $student_id)->count();
            if($check == 0){
                foreach (json_decode($request->subject_ids, true) as $key2 => $subject_id) {
                    ExamFourthAssign::create([
                        'academic_year_id' => $request->academic_year_id,
                        'student_id' => $student_id,
                        'subject_id' => $subject_id,
                        'branch_id' => session('branch')['id']
                    ]);
                }                
            }
        }

        return response()->json(['status'=>true, 'message'=>'Success']);
    }


    public function edit(ExamFourthAssign $fourth_assign)
    {
        //
    }

    public function update(Request $request, ExamFourthAssign $fourth_assign)
    {
        //
    }

    public function destroy(ExamFourthAssign $fourth_assign)
    {
        //
    }
}
