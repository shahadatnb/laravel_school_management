<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamSubject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamSubjectController extends Controller
{

    public function index()
    {
        $examSubject = ExamSubject::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.exam_subject.index',compact('examSubject'));
    }

    public function create()
    {
        return view('admin.exam.setup.exam_subject.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:exam_subjects,name',
            'status' => 'required',
        ]);

        $examSubject = new ExamSubject();
        $examSubject->name = $request->name;
        $examSubject->status = $request->status;
        $examSubject->branch_id = session('branch')['id'];
        $examSubject->save();

        session()->flash('success', "Examination Subject Created Successfully");
        return redirect()->route('exam.setup.examSubject.index');
    }

    public function edit(ExamSubject $examSubject)
    {
        return view('admin.exam.setup.exam_subject.createOrEdit',compact('examSubject'));
    }

    public function update(Request $request, ExamSubject $examSubject)
    {
        $request->validate([
            'name' => 'required|unique_with:exam_subjects,name,'.$examSubject->id,
            'status' => 'required',
        ]);

        $examSubject->name = $request->name;
        $examSubject->status = $request->status;
        $examSubject->branch_id = session('branch')['id'];
        $examSubject->save();

        session()->flash('success', "Examination Subject Updated Successfully");
        return redirect()->route('exam.setup.examSubject.index');
    }

    public function destroy(ExamSubject $examSubject)
    {
        //
    }

}
