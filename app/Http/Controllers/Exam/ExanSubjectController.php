<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExanSubject;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExanSubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $exanSubject = ExanSubject::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.exan_subject.index',compact('exanSubject'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.exam.setup.exan_subject.createOrEdit');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $exanSubject = new ExanSubject();
        $exanSubject->name = $request->name;
        $exanSubject->status = $request->status;
        $exanSubject->branch_id = session('branch')['id'];
        $exanSubject->save();

        session()->flash('success', "Examination Subject Created Successfully");
        return redirect()->route('exan.setup.exan_subject.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(ExanSubject $exanSubject)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExanSubject $exanSubject)
    {
        return view('admin.exam.setup.exan_subject.createOrEdit',compact('exanSubject'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ExanSubject $exanSubject)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $exanSubject->name = $request->name;
        $exanSubject->status = $request->status;
        $exanSubject->branch_id = session('branch')['id'];
        $exanSubject->save();

        session()->flash('success', "Examination Subject Updated Successfully");
        return redirect()->route('exan.setup.exan_subject.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExanSubject $exanSubject)
    {
        //
    }
}
