<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Shift;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShiftController extends Controller
{

    public function index()
    {
        $shifts = Shift::where('branch_id', session('branch')['id'])->get();
        return view('admin.student.setup.shift.index', compact('shifts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.student.setup.shift.createOrEdit');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique_with:shifts,name',
            'status' => 'required',
        ]);

        $shift = new Shift;
        $shift->name = $request->name;
        $shift->branch_id = session('branch')['id'];
        $shift->status = $request->status;
        $shift->serial = $request->serial;
        $shift->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.shift.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Shift $shift)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Shift $shift)
    {
        return view('admin.student.setup.shift.createOrEdit', compact('shift'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Shift $shift)
    {
        $request->validate([
            'name' => 'required|unique_with:shifts,name,' . $shift->id,
            'status' => 'required',
        ]);

        $shift->name = $request->name;
        $shift->branch_id = session('branch')['id'];
        $shift->status = $request->status;
        $shift->serial = $request->serial;
        $shift->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.shift.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Shift $shift)
    {
        //
    }
}
