<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\InvoiceHead;
use Illuminate\Http\Request;

class InvoiceHeadController extends Controller
{
    public function index()
    {
        $invoiceHeads = InvoiceHead::latest()->paginate(100);

        return view('admin.student.head.index', compact('invoiceHeads'));
    }

    public function create()
    {
        $mode = 'create';
        return view('admin.student.head.createOrEdit', compact('mode'));
    }

    public function store(Request $request)
    {
        $this->validate($request, array(
            'code'=>'nullable',
            'title'=>'required|unique:invoice_heads',
            'amount'=>'required',
        ));

        $course = new InvoiceHead;
        $course->code = $request->code;
        $course->title = $request->title;
        $course->amount = $request->amount;
        $course->save();

        session()->flash('success', "Invoice Head Saved");
        return redirect()->route('invoiceHead.index');
    }

    public function show(InvoiceHead $invoiceHead)
    {
        //
    }

    public function edit(InvoiceHead $invoiceHead)
    {
        $mode = 'edit';
        return view('admin.student.head.createOrEdit', compact('mode','invoiceHead'));
    }

    public function update(Request $request, InvoiceHead $invoiceHead)
    {
        $this->validate($request, array(
            'code'=>'nullable',
            'title'=>'required|unique:invoice_heads,title,'.$invoiceHead->id,
            'amount'=>'required',
        ));

        $invoiceHead->code = $request->code;
        $invoiceHead->title = $request->title;
        $invoiceHead->amount = $request->amount;
        $invoiceHead->save();

        session()->flash('success', "Invoice Head Update");
        return redirect()->route('invoiceHead.index');
    }

    public function destroy(InvoiceHead $invoiceHead)
    {
        //
    }
}
