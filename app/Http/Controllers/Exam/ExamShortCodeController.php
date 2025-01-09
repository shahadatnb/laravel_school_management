<?php

namespace App\Http\Controllers\Exam;

use App\Models\Exam\ExamShortCode;
use App\Models\Exam\ExamShortCodeDefault;
use App\Models\Student\Semester;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamShortCodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $semesters = Semester::where('branch_id',session('branch')['id'])->pluck('name','id');
        $shortCodeDefault = ExamShortCodeDefault::all();
        $shortCodes = ExamShortCode::where('branch_id',session('branch')['id'])->get();
        return view('admin.exam.setup.short_code.index',compact('shortCodes','shortCodeDefault','semesters'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'class_id' => 'required',
            'short_code_id' => 'required',
        ]);

        foreach ($request->short_code_id as $key => $value) {
            $sc = ExamShortCodeDefault::find($value);
            $shortCode = new ExamShortCode;
            $shortCode->class_id = $request->class_id;
            $shortCode->default_id = $value;
            $shortCode->code_title = $sc->name;
            $shortCode->total_marks = $sc->total_marks;
            $shortCode->pass_mark = $sc->pass_mark;
            $shortCode->acceptance = $sc->acceptance;
            $shortCode->branch_id = session('branch')['id'];
            $shortCode->save();
        }

        session()->flash('success', "Short Code Created Successfully");
        return redirect()->route('exam.setup.examShortCode.index');

    }

    public function multiple_update(Request $request)
    {
        $request->validate([
            'short_code_id' => 'required',
            'code_title' => 'required',
        ]);

        // dd($request->all());

        foreach ($request->short_code_id as $key => $value) {
            ExamShortCode::where('id',$value)->update([
                'code_title' => $request->code_title[$value],
            ]);
        }

        session()->flash('success', "Short Code Updated Successfully");
        return redirect()->route('exam.setup.examShortCode.index');

    }

    public function edit(ExamShortCode $examShortCode)
    {
        //
    }

    public function update(Request $request, ExamShortCode $examShortCode)
    {
        //
    }

    public function destroy(ExamShortCode $examShortCode)
    {
        //
    }
}
