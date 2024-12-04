<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamListController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $examList = ExamList::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.exam_list.index',compact('examList'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.exam.setup.exam_list.createOrEdit');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:exam_subjects,name',
            'status' => 'required',
        ]);

        $examList = new ExamList();
        $examList->name = $request->name;
        $examList->status = $request->status;
        $examList->branch_id = session('branch')['id'];
        $examList->save();

        session()->flash('success', "Examination List Created Successfully");
        return redirect()->route('exam.setup.examList.index');
    }


    public function show(ExamList $examList)
    {
        //
    }


    public function edit(ExamList $examList)
    {
        return view('admin.exam.setup.exam_list.createOrEdit',compact('examList'));
    }


    public function update(Request $request, ExamList $examList)
    {
        $request->validate([
            'name' => 'required|unique_with:exam_subjects,name,'.$examList->id,
            'status' => 'required',
        ]);

        $examList->name = $request->name;
        $examList->status = $request->status;
        $examList->branch_id = session('branch')['id'];
        $examList->save();

        session()->flash('success', "Examination List Updated Successfully");
        return redirect()->route('exam.setup.examList.index');
    }

    public function destroy(ExamList $examList)
    {
        //
    }
}
