<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExanList;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExanListController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = ExanList::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.exan_list.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.exam.setup.exan_list.createOrEdit');
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

        $exanList = new ExanList();
        $exanList->name = $request->name;
        $exanList->status = $request->status;
        $exanList->branch_id = session('branch')['id'];
        $exanList->save();

        session()->flash('success', "Examination List Created Successfully");
        return redirect()->route('exan.setup.exan_list.index');
    }


    public function show(ExanList $exanList)
    {
        //
    }


    public function edit(ExanList $exanList)
    {
        return view('admin.exam.setup.exan_list.createOrEdit',compact('exanList'));
    }


    public function update(Request $request, ExanList $exanList)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $exanList->name = $request->name;
        $exanList->status = $request->status;
        $exanList->branch_id = session('branch')['id'];
        $exanList->save();

        session()->flash('success', "Examination List Updated Successfully");
        return redirect()->route('exan.setup.exan_list.index');
    }

    public function destroy(ExanList $exanList)
    {
        //
    }
}
