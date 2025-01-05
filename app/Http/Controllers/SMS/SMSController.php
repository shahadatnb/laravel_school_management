<?php

namespace App\Http\Controllers\SMS;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\SMS\SmsTemplate;
use App\Models\SMS\SmsContact;
use App\Models\SMS\SmsLog;
use App\Models\Student\AcademicYear;
use App\Models\Student\Semester;
use App\Models\Student\ClassConfig;
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
        $templates = SmsTemplate::pluck('title', 'id')->where('branch_id', session('branch')['id'])->toArray();
        return view('admin.sms.send.class_wise', compact('templates', 'academic_years', 'semesters'));
    }

    public function send_section_wise(){
        $sections = ClassConfig::where('branch_id', session('branch')['id'])->pluck('name', 'id')->toArray();
        $templates = SmsTemplate::pluck('title', 'id')->where('branch_id', session('branch')['id'])->toArray();
        return view('admin.sms.send.section_wise', compact('templates', 'sections'));
    }

    public function get_students(Request $request){
        $studentDatas = Student::where('branch_id', session('branch')['id'])->where('academic_year_id', $request->academic_year_id);
        if($request->has('section_id')){
            $studentDatas = $studentDatas->where('section_id', $request->section_id);
        }

        if($request->has('class_id')){
            $studentDatas = $studentDatas->where('semester_id', $request->class_id);
        }

        $studentDatas = $studentDatas->with('section', 'semester')->get();

        $students = [];
        foreach($studentDatas as $student){
            $students[$student->id] = [
                'id' => $student->id,
                'name' => $student->name,
                'mobile' => $student->mobile,
                'section' => $student->section->name,
                'class' => $student->semester->name,
            ];
        }

        return response()->json([
            'status' => true,
            'students' => $students
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
        $this->validate($request, [
            'numberType' => 'required',
            'contacts' => 'required_if:numberType,contact',
            'file' => 'mimes:xlsx,xls|required_if:numberType,excel',
            'content' => 'required',
        ]);

        //dd($request->all()); exit;

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

        /*
        return Http::post(config('settings.sms_domain_url').':7788/send',[
            'apikey'=> config('settings.sms_api_key'),
            'secretkey'=> config('settings.sms_secretkey'),
            'content'=> [
                "callerID"=>"12345",
                "toUser"=>$numbers,
                "messageContent"=>$request->content
            ]
        ]);
        */
        //$response = Http::get(config('settings.sms_domain_url').':7788/send?apikey='.config('settings.sms_api_key').'&secretkey='.config('settings.sms_secretkey').'&content=[{"callerID":"12345","toUser":"'.$numbers.'","messageContent":"'.$request->content.'"}]');
        //$response = Http::get(config('settings.sms_domain_url',null).'/miscapi/'.config('settings.sms_api_key').'/getDLR/getAll');
        //dd($response);exit;
        //if($response->successful()){
        
        return redirect()->back();        
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
