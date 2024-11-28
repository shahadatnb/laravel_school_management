<?php

namespace App\Http\Controllers;

use App\Models\Admission;
use App\Models\AdmissionClass;
use App\Models\AdmissionTrade;
use App\Models\AdmissionPayment;
use App\Models\AdmissionQuota;
use App\Models\AdmissionSelectedTrade;
use Illuminate\Http\Request;
use App\Traits\CommonTrait;
use Storage;
use Image;
class AdmissionController extends Controller
{
    use CommonTrait;
    public function dashboard(){
        return view('frontend.admission.dashboard');
    }

    public function create(){
        $start_date = date('Y-m-d',strtotime(config('settings.admission_open')));
        $last_date = date('Y-m-d',strtotime(config('settings.admission_close')));

        if($start_date > date('Y-m-d')  || $last_date < date('Y-m-d')){
            session()->flash('error', 'Admission is closed');
            return redirect()->route('home.admission');
        }
        $admission_class = AdmissionClass::where('is_active',1)->pluck('name','id');
        $quotas = AdmissionQuota::where('is_active',1)->where('priority','>',0)->pluck('name','id');
        $locations = $this->zilaArray();
        $presentUpazila = [];
        $permanentUpazila = [];
        $admission_trades = AdmissionTrade::where('is_active',1)->pluck('name','id');
        return view('frontend.admission.create',compact('admission_class','quotas','locations','presentUpazila','permanentUpazila','admission_trades'));
    }
    
    public function store(Request $request)
    {
        $start_date = date('Y-m-d',strtotime(config('settings.admission_open')));
        $last_date = date('Y-m-d',strtotime(config('settings.admission_close')));

        if($start_date > date('Y-m-d')  || $last_date < date('Y-m-d')){
            session()->flash('error', 'Admission is closed');
            return redirect()->route('home.admission');
        }
        
        $data = $this->acValidator($request);
        //$data['mobile'] = ['required','numeric','digits:11','unique:students'];
        $this->validate($request, $data,[
            'studentBirthRegNo.unique_with' => 'The student birth registration number has already been taken.',
        ]);
        //dd($request->all());
        $admission = new Admission();
        $admission->name = $request->name;
        $admission->studentBirthRegNo = $request->studentBirthRegNo;
        $admission->sex = $request->sex;
        $admission->mobile = $request->mobile;
        $admission->class_id  = $request->class_id;
        //$admission->trade_id  = $request->trade_id;
        //$admission->religion = $request->religion;
        $admission->shift = $request->shift;
        $admission->dateOfBirth = $request->dateOfBirth;

        $admission->fathersName = $request->fathersName;
        $admission->mothersName = $request->mothersName;
        $admission->nidFather = $request->nidFather;
        $admission->nidMother = $request->nidMother;
        $admission->guardianName = $request->guardianName;
        $admission->nidGuardian = $request->nidGuardian;
        $admission->guardianRelation = $request->guardianRelation;

        $admission->presentVillage = $request->presentVillage;
        $admission->presentPost = $request->presentPost;
        $admission->presentUpazila = $request->presentUpazila;
        $admission->presentDistrict = $request->presentDistrict;
        $admission->permanentVillage = $request->permanentVillage;
        $admission->permanentPost = $request->permanentPost;
        $admission->permanentUpazila = $request->permanentUpazila;
        $admission->permanentDistrict  = $request->permanentDistrict;

        /*
        $admission->jscBoard = $request->jscBoard;
        $admission->jscResistration = $request->jscResistration;
        $admission->jscExamYear = $request->jscExamYear;
        $admission->jscBoardRoll = $request->jscBoardRoll;
        $admission->jscCgpa = $request->jscCgpa;
*/
        $admission->lastQualification = $request->lastQualification;
        //$admission->TypeOfOrg = $request->TypeOfOrg;
        $admission->previous_school = $request->previous_school;
        $admission->quota_id = $request->quota_id;
        $admission->self_institute = $request->self_institute;
        $admission->class_roll = $request->class_roll;
        $admission->form_filup = 1;
        $admission->final_submit = 1;
        $admission->save();

        $image = $request->file('photo');
        if ($image) {
            Storage::delete('public/'.$admission->photo);
            $imgFile  = Image::make($request->photo)->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
            })->encode('jpg',80);
            $file_name = 'admission/'.time() .'.jpg';
            Storage::disk('public')->put($file_name, $imgFile);            
            //$filename = time().'.'.$image->extension();
            //$full_path = 'products/'.$filename;
            //$image->storeAs('public/products/', $filename);
            $admission->photo = $file_name;
            $admission->save();
        }
        
        if($request->trade_id && $request->class_id == 4){
            foreach($request->trade_id as $key=>$tradeid){
                AdmissionSelectedTrade::create(
                    [
                        'admission_id' => $admission->id,
                        'trade_id' => $tradeid,
                        'priority' => $key
                    ]
                );
            }
        }

        session()->flash('success', "Student Updated");
        session()->put('student_id', $admission->id);
        return redirect()->route('admission.form_show');
    }

    
    protected function acValidator($data)
    {   
        return $data = [
            'name'=>['required','string'],
            'class_id'=>['required','numeric'],
            'fathersName'=>['required','string'],
            'nidFather'=>['required','numeric'],
            'mothersName'=>['required','string'],
            'nidMother'=>['required','numeric'],
            'guardianName'=>['required','string'],
            'nidGuardian'=>['nullable','numeric'],
            //'religion' => ['required'],
            'presentVillage'=>['required','string'],
            'presentPost'=>['required','string'],
            'presentUpazila'=>['nullable','string'],
            'presentDistrict'=>['required'],
            'permanentVillage'=>['required','string'],
            'permanentPost'=>['required','string'],
            'permanentUpazila'=>['nullable','string'],
            'permanentDistrict'=>['required'],
            'shift'=>['required','string'],
            'photo'=>'required|mimes:jpg,jpeg,png|max:100',
            'sex'=>['required'],
            'dateOfBirth'=>['required'],
            'mobile'=>['nullable','numeric','digits:11','confirmed'],//,'unique:students'
            'studentBirthRegNo'=>['required','numeric','unique_with:admissions,studentBirthRegNo,shift'],
            'class_roll'=>['required_if:self_institute,1'],
            'nidFather'=>['nullable','numeric'],
        ];
    }

    public function admissionForm(){
        $last_date = date('Y-m-d',strtotime(config('settings.admission_close')));
        if($last_date < date('Y-m-d')){return redirect()->route('admission.dashboard');}
        $student = Admission::find(auth('admission')->user()->id);
        $admission_class = AdmissionClass::where('is_active',1)->pluck('name','id');
        $locations = $this->zilaArray();
        $presentUpazila = [];
        $permanentUpazila = [];
        $admission_trades = [];
        $student_class = AdmissionClass::where('id',$student->class_id)->with('trades')->first();
        if($student_class){
            $admission_trades = AdmissionTrade::where('is_active',1)->where('class_id',$student_class->id)->pluck('name','id');
            if($admission_trades->count()==0){
                $admission_trades = [];
            }
        }
        //dd($admission_trades);
        if($student->presentUpazila != null ){
            $presentUpazila[$student->presentUpazila] = $student->presentUpazilaName->name;
        }
        if($student->permanentUpazila != null ){
            $permanentUpazila[$student->permanentUpazila] = $student->permanentUpazilaName->name;
        }
        return view('frontend.admission.form',compact('student','admission_class','locations','presentUpazila','permanentUpazila','student_class','admission_trades'));
    }

    public function admissionFormSave(Request $request, Admission $admission){
        $data = $this->acValidator($request,$admission);
        //$data['mobile'] = ['required','numeric','digits:11','unique:students'];
        $this->validate($request, $data);

        $admission->name = $request->name;
        $admission->studentBirthRegNo = $request->studentBirthRegNo;
        $admission->sex = $request->sex;
        $admission->mobile = $request->mobile;
        $admission->class_id  = $request->class_id;
        $admission->trade_id  = $request->trade_id;
        //$admission->religion = $request->religion;
        $admission->shift = $request->shift;
        $admission->dateOfBirth = $request->dateOfBirth;

        $admission->fathersName = $request->fathersName;
        $admission->mothersName = $request->mothersName;
        $admission->nidFather = $request->nidFather;
        $admission->nidMother = $request->nidMother;
        $admission->guardianName = $request->guardianName;
        $admission->nidGuardian = $request->nidGuardian;
        $admission->guardianRelation = $request->guardianRelation;

        $admission->presentVillage = $request->presentVillage;
        $admission->presentPost = $request->presentPost;
        $admission->presentUpazila = $request->presentUpazila;
        $admission->presentDistrict = $request->presentDistrict;
        $admission->permanentVillage = $request->permanentVillage;
        $admission->permanentPost = $request->permanentPost;
        $admission->permanentUpazila = $request->permanentUpazila;
        $admission->permanentDistrict  = $request->permanentDistrict;

        /*
        $admission->jscBoard = $request->jscBoard;
        $admission->jscResistration = $request->jscResistration;
        $admission->jscExamYear = $request->jscExamYear;
        $admission->jscBoardRoll = $request->jscBoardRoll;
        $admission->jscCgpa = $request->jscCgpa;
*/
        $admission->lastQualification = $request->lastQualification;
        //$admission->TypeOfOrg = $request->TypeOfOrg;
        $admission->previous_school = $request->previous_school;
        $admission->form_filup = 1;

        $image = $request->file('photo');
        if ($image) {
            Storage::delete('public/'.$admission->photo);
            $imgFile  = Image::make($request->photo)->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
            })->encode('jpg',80);
            $file_name = 'admission/'.time() .'.jpg';
            Storage::disk('public')->put($file_name, $imgFile);            
            //$filename = time().'.'.$image->extension();
            //$full_path = 'products/'.$filename;
            //$image->storeAs('public/products/', $filename);
            $admission->photo = $file_name;
        }
        $admission->save();

        session()->flash('success', "Student Updated");
        return redirect()->route('admission.form_show');
    }

    public function find_admission(Request $request){
        return view('frontend.admission.find_admission');
    }

    public function find_admission_submit(Request $request){
        $student = Admission::where('dateOfBirth', $request->dateOfBirth)->where('id', $request->student_id)->first();
        if($student){
            session()->put('student_id', $student->id);
            return redirect()->route('admission.form_show');
        }
        else{
            return redirect()->back();
        }
    }

    public function form_show(){
        //return session()->get('admission_id');
        $student = Admission::find(session()->get('student_id'));
        //if($student){            
            return view('frontend.admission.form_show',compact('student'));
        //}
        //else{
        //    return redirect()->route('home.admission');
        //}
    }


    public function index(Request $request)
    {
        $data = [
            'class_id'=>'',
            'trade_id'=>'',
            'shift'=>'',
            'form_filup'=>0,
            'final_submit'=>0,
            'paymentStatus'=>0,
            'selected'=>0,
            'admitted'=>0
        ];
        $admission_trades = [];
        $admission_class = AdmissionClass::pluck('name','id');

        $students = Admission::latest();
        if(!empty($request->class_id)){
            $data['class_id'] = $request->class_id;
            $students = $students->where('class_id', $request->class_id);

            $admission_trades = AdmissionTrade::where('is_active',1)->where('class_id',$data['class_id'])->pluck('name','id');
            if($admission_trades->count()==0){
                $admission_trades = [];
            }
        }
        if(!empty($request->trade_id)){
            $data['trade_id'] = $request->trade_id;
            $students = $students->where('trade_id',$request->trade_id);
        }
        if(!empty($request->shift)){
            $data['shift'] = $request->shift;
            $students = $students->where('shift','like', '%'.$request->shift.'%');
        }
        if(!empty($request->form_filup)){
            $data['form_filup'] = $request->form_filup;
            $students = $students->where('form_filup', $request->form_filup);
        }
        if(!empty($request->final_submit)){
            $data['final_submit'] = $request->final_submit;
            $students = $students->where('final_submit', $request->final_submit);
        }
        if(!empty($request->paymentStatus)){
            $data['paymentStatus'] = $request->paymentStatus;
            $students = $students->where('paymentStatus', $request->paymentStatus);
        }
        if(!empty($request->selected)){
            $data['selected'] = $request->selected;
            $students = $students->where('selected', $request->selected);
        }
        if(!empty($request->admitted)){
            $data['admitted'] = $request->admitted;
            $students = $students->where('admitted', $request->admitted);
        }
        //dd($data);
        if(!empty($request->class_id)){
            $students = $students->paginate(1000);
        }else{
            $students = $students->paginate(100);
        }
        return view('admin.admission.index', compact('admission_class','students','data','admission_trades'));
    }

    public function admissionPayment(){
        $payments = AdmissionPayment::where('admission_id',auth('admission')->user()->id)->get();
        return view('frontend.admission.payment',compact('payments'));
    }

    public function paymentList()
    {
        $payments = AdmissionPayment::with('admission')->paginate(100);
        $total   = AdmissionPayment::sum('amount');
        return view('admin.admission.payment_list', compact('payments','total'));
    }

    public function show(Admission $admission)
    {
        //
    }


    public function edit(Admission $admission)
    {
        //
    }

    public function update(Request $request, Admission $admission)
    {
        //
    }


    public function destroy(Admission $admission)
    {
        $admission->final_submit = 0;
        $admission->save();
        session()->flash('success', 'Admission form rejected successfully');
        return redirect()->back();
    }
}
