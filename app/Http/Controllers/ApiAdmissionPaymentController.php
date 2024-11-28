<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AdmissionPayment;
use App\Models\Admission; 
use Illuminate\Support\Facades\Log;
use App\Http\Requests\PaymentRequest;

class ApiAdmissionPaymentController extends Controller
{
    public function checkStudent(Request $request)
    {
        $student = Admission::find($request->studentID);
        if($student === null) return response()->json(['Error' => 'Student not found.'], 200);
        if($student->paymentStatus==1){
            return response()->json(['Error' => 'Already Paid.'], 200);
        }
        $student_data = [
            'ID' => $student->id,
            'Name' => $student->name,
            'Amount' => $student->semester->application_fee,
            'MobileNo' => null,
            'TrxID' => null,
            'Success' => 'Succeed',
            'Error' => null,
            'Message' => 'Authorized'
        ];
        return response()->json($student_data);
    }

    public function StudentPayment(Request $request)//PaymentRequest
    {
        //Log::info($request->all());
        if($request->authenCode =='Rocket@AsianCoder' && $request->userID =='ROCKET'){
            $student = Admission::find($request->studentID);
            if($student === null) return response()->json(['Error' => 'Student not found.'], 404);
            $student->paymentStatus = 1;
            $student->save();
            $amount = $student->semester->application_fee;
            AdmissionPayment::create(['admission_id'=>$student->id, 'amount'=>$amount,'payment_method'=>'Rocket', 'txn_id'=>$request->trxID,'date'=>date('Y-m-d H:i'),'note'=>$request->mobileNo]);
            $student_data = [
                'ID' => $student->id,
                'Name' => $student->name,
                'Amount' => $amount,
                'MobileNo' => $student->mobile,
                'TrxID' => $request->trxID,
                'Success' => 'Succeed',
                'Error' => null,
                'Message' => 'Successfully done'
            ];
            return response()->json($student_data,200);
        }
        return response()->json(['Error' => 'Unauthorized.'], 401);
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
