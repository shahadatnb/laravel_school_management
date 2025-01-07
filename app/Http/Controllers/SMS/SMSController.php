<?php

namespace App\Http\Controllers\SMS;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\SMS\SmsTemplate;
use App\Models\SMS\SmsContactCategory;
use App\Models\SMS\SmsContact;
use App\Models\SMS\SmsLog;
use App\Models\Student\AcademicYear;
use App\Models\Student\Semester;
use App\Models\Student\ClassConfig;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ImportNumber;
use App\Facades\CustomHelperFacade as CustomHelper;
use App\Models\Student\Student;

class SMSController extends Controller
{
    public function index(){
        $templates = SmsTemplate::pluck('title', 'id')->where('branch_id', session('branch')['id'])->toArray();
        return view('admin.sms.send.index', compact('templates'));
    }

    public function send_class_wise(){
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $semesters = Semester::where('branch_id', session('branch')['id'])->orderBy('serial','ASC')->where('status',1)->pluck('name', 'id');
        $templates = SmsTemplate::where('branch_id', session('branch')['id'])->pluck('title', 'id')->toArray();
        return view('admin.sms.send.class_wise', compact('templates', 'academic_years', 'semesters'));
    }

    public function send_section_wise(){
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        $sections = ClassConfig::where('branch_id', session('branch')['id'])->pluck('name', 'id')->toArray();
        $templates = SmsTemplate::where('branch_id', session('branch')['id'])->pluck('title', 'id')->toArray();
        //dd($templates);
        return view('admin.sms.send.section_wise', compact('templates','academic_years','sections'));
    }

    public function send_file_wise(){
        $templates = SmsTemplate::where('branch_id', session('branch')['id'])->pluck('title', 'id')->toArray();
        //dd($templates);
        return view('admin.sms.send.file_wise', compact('templates'));
    }

    public function send_contact_wise(){
        $templates = SmsTemplate::where('branch_id', session('branch')['id'])->pluck('title', 'id')->toArray();
        $categories = SmsContactCategory::where('branch_id', session('branch')['id'])->pluck('name', 'id')->toArray();
        return view('admin.sms.send.contact_wise', compact('templates', 'categories'));
    }

    public function get_students(Request $request){
        $students = Student::where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id);
        if($request->type == 'section_wise'){
            $students = $students->where('section_id', $request->section_id);
        }

        if($request->type == 'class_wise'){
            $students = $students->where('semester_id', $request->class_id);
        }

        $students = $students->with('section', 'semester')->get();

        return response()->json([
            'status' => true,
            'students' => $students
        ]);
    }

    public function get_contacts(Request $request){
        $contacts = SmsContact::where('branch_id', session('branch')['id']);
        if($request->has('category_id')){
            $contacts = $contacts->where('category_id', $request->category_id);
        }
        $contacts = $contacts->get();
        return response()->json([
            'status' => true,
            'contacts' => $contacts
        ]);
    }

    public function get_file_data(Request $request){
        $validator = Validator::make($request->all(), [
            'file' => 'mimes:xlsx,xls|required',
        ]);
        //dd($request->all());

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }

        $array = Excel::toArray(new ImportNumber, $request->file('file'));
        //dd($array);
        return response()->json([
            'status' => true,
            'students' => $array[0]
        ]);
    }

    public function getContacts(Request $request){
        $contacts = SmsContact::where('branch_id', session('branch')['id']);
        if($request->has('category_id')){
            $contacts = $contacts->where('category_id', $request->category_id);
        }
        $contacts = $contacts->get();
        return response()->json($contacts);
    }

    public function send(Request $request){

        $validator = Validator::make($request->all(), [
            'content' => 'required',
            'mobile.*' => 'required|digits:11',
        ]);

        if ($validator->fails()) {
            return response()->json(['status'=>false,'errors'=>$validator->errors()->all()]);
        }


        $contacts = [];
        foreach($request->student_id as $key=>$student_id){
            $number = $request->mobile[$student_id];
            $contacts[$key] = substr($number, 0, 2) == '88' ? $number : '88'.$number;
        }

        //dd($contacts);

        if(count($contacts) > 50){
            foreach(array_chunk($contacts, 50) as $chunk){
                $numbers = implode(',', $chunk);
                $response = CustomHelper::send_sms($numbers, $request->content);
                $this->save_log($response, $numbers, $request);
            }
        }else{
            $numbers = implode(',', $contacts);
            $response = CustomHelper::send_sms($numbers, $request->content);
            $this->save_log($response, $numbers, $request);
        }

        return response()->json(['status'=>true, 'message'=>'Successfully Send']);

        /*
        $this->validate($request, [
            'numberType' => 'required',
            'contacts' => 'required_if:numberType,contact',
            'file' => 'mimes:xlsx,xls|required_if:numberType,excel',
            'content' => 'required',
        ]);


        if($request->numberType == 'contact'){            
            $contacts = [];
            foreach($request->contacts as $key => $number){
                $contacts[$key] = substr($number, 0, 2) == '88' ? $number : '88'.$number;
            }
            //$response = CustomHelper::post_send_sms($contacts, $request->content);
            if(count($contacts) > 2){
                foreach(array_chunk($contacts, 2) as $chunk){
                    $numbers = implode(',', $chunk);
                    $response = CustomHelper::send_sms($numbers, $request->content);
                    $this->save_log($response, $numbers, $request);
                }
            }else{
                $numbers = implode(', ', $contacts);
                $response = CustomHelper::send_sms($numbers, $request->content);
                $this->save_log($response, $numbers, $request);
            }
            
        }elseif($request->numberType == 'excel'){
            //Excel::import(new ImportNumber, $request->file('file'));
            $array = Excel::toArray(new ImportNumber, $request->file('file'));
            //dd($array); exit;
            foreach($array[0] as $key => $row){
                $numbers[$key] = substr($row['mobile'], 0, 1) == '1' ? '0'.$row['mobile'] : $row['mobile'];
            }
            //$response = CustomHelper::post_send_sms($numbers, $request->content);
            if(count($numbers) > 50){
                foreach(array_chunk($numbers, 50) as $chunk){
                    $numbers = implode(',', $chunk);
                    $response = CustomHelper::send_sms($numbers, $request->content);
                    $this->save_log($response, $numbers, $request);
                }
            }else{
                $numbers = implode(',', $numbers);
                $response = CustomHelper::send_sms($numbers, $request->content);
                $this->save_log($response, $numbers, $request);
            }
        }
        return redirect()->back();   

        */
             
    }

    private function save_log($response, $contacts, $request){
        if(str_contains($response, 'ACCEPTD')){
            session()->flash('success', 'SMS sent successfully');
            //return $response->json();
            //return $response;
            //return $data = json_decode($response->body());
            //$numbers = implode(' ', $contacts);
            SmsLog::create(
                [
                    'branch_id' => session('branch')['id'],
                    'mobile' => $contacts,
                    'message' => $request->content,
                    'status' => 'success',//$msg['Status'],
                    'created_by' => auth()->user()->id,
                    'sms_count' => 1,
                    'response' => 'success',//$data['Text'],
                ]
            );
            
        }
    }

    public function smsBalance(Request $request){
        //$response =  Http::get(config('settings.sms_domain_url')."/portal/sms/smsConfiguration/smsClientBalance.jsp?client=".config('settings.sms_client'));
        $response =  Http::get(config('settings.sms_domain_url').'/miscapi/'.config('settings.sms_api_key').'/getBalance');
        //$response = trim($response,'Your Balance is:BDT');
        return response()->json([
            'balance' => $response->body()
        ]);
        //return $response;
    }
}
