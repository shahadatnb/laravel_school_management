<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamGrade;
use App\Models\Exam\ExamGradeDefault;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;

class ExamGradeController extends Controller
{

    public function index()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->pluck('name','id');
        $grades = ExamGradeDefault::all();
        $examGrades = ExamGrade::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.grade.index',compact('grades','semesters','examGrades'));
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'class_id' => 'required',
            'grade_id' => 'required',
        ]);

        foreach ($request->grade_id as $key => $value) {
            $sc = ExamGradeDefault::find($value);
            $shortCode = new ExamGrade;
            $shortCode->class_id = $request->class_id;
            $shortCode->grade = $sc->grade;
            $shortCode->grade_point = $sc->grade_point;
            $shortCode->grade_range = $sc->grade_range;
            $shortCode->branch_id = session('branch')['id'];
            $shortCode->save();
        }

        session()->flash('success', "Short Code Created Successfully");
        return redirect()->route('exam.setup.examGrade.index');
    }

    public function update(Request $request, ExamGrade $examGrade)
    {
        $examGrade->grade_point = $request->grade_point;
        $examGrade->grade_range = $request->grade_range;
        $examGrade->save();

        session()->flash('success', "Short Code Updated Successfully");
        return redirect()->route('exam.setup.examGrade.index');
    }

    public function destroy(ExamGrade $examGrade)
    {
        //
    }
}
