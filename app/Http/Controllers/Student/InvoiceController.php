<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student\InvoicePayment;

class InvoiceController extends Controller
{
    public function incomeList(Request $request){
        $data = [
            'department_id'=>'',
            'semester_id'=>'',
            'session'=>'',
            'reg_no'=>'',
            'startDate'=> date('Y-m-d'),
            'endDate'=> date('Y-m-d')
        ];

        $invoices = InvoicePayment::with('student');
        if($request->has('startDate') && $request->has('endDate')){
            $data['startDate'] =  $request->startDate;
            $data['endDate'] = $request->endDate;
            $invoices = $invoices->whereBetween('created_at',[$data['startDate'].' 00:00:00' ,$data['endDate'].' 23:59:59']);
        }

        if($request->has('session')){
            $data['session'] = $request->session;
            $invoices = $invoices->wherehas('student', function($q) use ($data){
                $q->where('session',$data['session']);
            });
        }

        $invoices = $invoices->get();

        return view('admin.student.report.incomeList', compact('data','invoices'));
    }
}
