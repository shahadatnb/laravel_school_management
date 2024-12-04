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

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(ExamGrade $examGrade)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExamGrade $examGrade)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ExamGrade $examGrade)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExamGrade $examGrade)
    {
        //
    }
}
