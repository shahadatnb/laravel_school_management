<?php

namespace App\Http\Controllers\Student;
use App\Http\Controllers\Controller;

use App\Models\Student\ExamHall;
use App\Models\Student\ExamStudent;
use Illuminate\Http\Request;

class ExamHallController extends Controller
{
    public function index()
    {
        $examHalls = ExamHall::all();
        return view('admin.student.exams.examHall.index', compact('examHalls'));
    }

    public function create()
    {
        return view('admin.student.exams.examHall.createOrEdit');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:50|unique:exam_halls',
            'rows' => 'required',
            'columns' => 'required',
            'capacity' => 'required',
        ]);

        $examHall = new ExamHall();
        $examHall->name = $request->name;
        $examHall->rows = $request->rows;
        $examHall->columns = $request->columns;
        $examHall->capacity = $request->capacity;
        $examHall->save();

        session()->flash('success', 'Exam Hall Created');
        return redirect()->route('examHall.index');
    }

    public function show(ExamHall $examHall)
    {
        $studentGroups = ExamStudent::pluck('student_group','student_group')->unique();
        return view('admin.student.exams.examHall.show', compact('examHall','studentGroups'));
    }

    public function edit(ExamHall $examHall)
    {
        return view('admin.student.exams.examHall.createOrEdit', compact('examHall'));
    }

    public function update(Request $request, ExamHall $examHall)
    {
        $request->validate([
            'name' => 'required|string|max:50|unique:exam_halls,name,'.$examHall->id,
            'rows' => 'required',
            'columns' => 'required',
            'capacity' => 'required',
        ]);

        $examHall->name = $request->name;
        $examHall->rows = $request->rows;
        $examHall->columns = $request->columns;
        $examHall->capacity = $request->capacity;
        $examHall->save();

        session()->flash('success', 'Exam Hall Updated');
        return redirect()->route('examHall.index');
    }

    public function saveSeats(ExamHall $examHall, Request $request){
        $request->validate([
            'student_id' => 'required',
        ]);
        //dd($request->all()); exit;
        $examHall->studentSeat()->sync($request->student_id);
        session()->flash('success', 'Seats Updated');
        return redirect()->back();
    }

    public function destroy(ExamHall $examHall)
    {
        //
    }

    public function getStudentsByGroup(Request $request){
        $students = ExamStudent::where('student_group',$request->group)->get();
        return response()->json($students);
    }
}
