<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\AcademicYear;
use Illuminate\Http\Request;

class AcademicYearController extends Controller
{
    public function index()
    {
        $years = AcademicYear::where('branch_id', session('branch')['id'])->get();
        return view('admin.student.setup.academic_year.index', compact('years'));
    }

    public function create()
    {
        return view('admin.student.setup.academic_year.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'year' => 'required|unique_with:academic_years,year',
            'status' => 'required',
        ]);

        $academicYear = new AcademicYear;
        $academicYear->year = $request->year;
        $academicYear->branch_id = session('branch')['id'];
        $academicYear->status = $request->status;
        $academicYear->save();

        session()->flash('success', "Saved.");
        return redirect()->route('student.setup.academicYear.index');
    }

    public function show(AcademicYear $academicYear)
    {
        
    }

    public function edit(AcademicYear $academicYear)
    {
        return view('admin.student.setup.academic_year.createOrEdit', compact('academicYear'));
    }

    public function update(Request $request, AcademicYear $academicYear)
    {
        $request->validate([
            'year' => 'required|unique_with:academic_years,year,'.$academicYear->id,
            'status' => 'required',
        ]); 

        $academicYear->year = $request->year;
        $academicYear->sl = $request->sl;
        $academicYear->status = $request->status;
        $academicYear->save();

        session()->flash('success', "Saved.");
        return redirect()->route('student.setup.academicYear.index');
    }

    public function destroy(AcademicYear $academicYear)
    {
        //
    }
}
