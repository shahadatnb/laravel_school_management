<?php

namespace App\Http\Controllers\Exam;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Exam\ExamSubjectConfig;
use App\Models\Student\Semester;
use App\Models\Student\Group;
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
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $examSubject = ExamSubject::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.config.subject_config.index',compact('examSubject','semesters','groups'));
    }

    public function store(Request $request)
    {
        //
    }


    public function mass_update(Request $request)
    {
        //
    }



    public function update(Request $request, ExamSubjectConfig $examSubjectConfig)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExamSubjectConfig $examSubjectConfig)
    {
        //
    }
}
