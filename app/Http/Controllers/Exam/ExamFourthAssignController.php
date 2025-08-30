<?php

namespace App\Http\Controllers\Exam;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Exam\ExamFourthAssign;

class ExamFourthAssignController extends Controller
{

    public function index()
    {
        return view('admin.exam.config.forth_subject.index');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
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
