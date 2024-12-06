<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\MarkConfig;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Student\Semester;

class MarkConfigController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->orderBy('serial','ASC')->get();
        return view('admin.exam.setup.final_mark_config.index',compact('semesters'));
    }

    public function edit($id)
    {
        
    }

    public function update(Request $request, MarkConfig $finalMarkConfig)
    {
        //
    }

}
