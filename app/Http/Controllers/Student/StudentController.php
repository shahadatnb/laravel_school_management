<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\Student;
use App\Models\Student\Section;
use App\Models\Student\Shift;
use App\Models\Student\Group;
use App\Models\Student\StudentMark;
use App\Models\Student\InvoicePayment;
use App\Models\Student\Category;
use Illuminate\Http\Request;
use App\Traits\StudentTrait;
use App\Traits\CommonTrait;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\StudentsImport;
use App\Imports\ImportCgpa;
use App\Models\Student\ClassConfig;
use Image;
//use PDF;
use Barryvdh\DomPDF\Facade\Pdf;
use Storage;

class StudentController extends Controller
{
    use CommonTrait,StudentTrait;

    public function index(Request $request)
    {
        $data = [
            'semester_id'=>'',
            'section_id'=>'',
            'category_id'=>'',
            'group_id'=>'',
            'reg_no'=>'',
            'probidhan'=>'',
            'class_roll'=>'',
            'reg_no'=>''
        ];

        $semesters = $this->semesterArray();
        //$shifts = Shift::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $sections = $this->sectionArray();
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $catetories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $students = Student::where('branch_id', session('branch')['id'] )->latest();
        if(!empty($request->semester_id)){
            $data['semester_id'] = $request->semester_id;
            $students = $students->where('semester_id', $request->semester_id);
        }
        if(!empty($request->section_id)){
            $data['section_id'] = $request->section_id;
            $students = $students->where('section_id', $request->section_id);
        }
        if(!empty($request->group_id)){
            $data['group_id'] = $request->group_id;
            $students = $students->where('group_id', $request->group_id);
        }
        if(!empty($request->category_id)){
            $data['category_id'] = $request->category_id;
            $students = $students->where('category_id',$request->category_id);
        }
        if(!empty($request->session)){
            $data['session'] = $request->session;
            $students = $students->where('session', $request->session);
        }
        if(!empty($request->reg_no)){
            $data['reg_no'] = $request->reg_no;
            $students = $students->where('reg_no', $request->reg_no);
        }
        if(!empty($request->class_roll)){
            $data['class_roll'] = $request->class_roll;
            $students = $students->where('class_roll', $request->class_roll);
        }
        $students = $students->paginate(100);

        return view('admin.student.student.index', compact('students','semesters','catetories','sections','groups','data'));
    }

    public function create()
    {
        $academicYear = $this->academicYear();
        $semesters = $this->semesterArray();
        $sections = $this->sectionArray();
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $catetories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');      
        $locations = $this->zilaArray();
        $presentUpazila = [];
        $permanentUpazila = [];
        $mode = 'create';
        return view('admin.student.student.createOrEdit', compact('mode','catetories','groups','sections','locations','presentUpazila','permanentUpazila','academicYear','semesters'));
    }

    protected function acValidator($data)
    {   
        return $data = [
            'name'=>['required','string'],
            // 'session_id'=>['required','numeric'],
            //'probidhan'=>['required','string'],
            //'session'=>['required','string'],
            'section_id'=>['required','numeric'],
            'fathersName'=>['nullable','string'],
            'mothersName'=>['nullable','string'],
            'presentVillage'=>['nullable','string'],
            'presentPost'=>['nullable','string'],
            'presentUpazila'=>['nullable','string'],
            'presentZila'=>['nullable','string'],
            'permanentVillage'=>['nullable','string'],
            'permanentPost'=>['nullable','string'],
            'permanentUpazila'=>['nullable','string'],
            'permanentZila'=>['nullable','string'],
            'group_id'=>['required'],
            'category_id'=>['required'],
            'photo'=>'nullable|mimes:jpg,jpeg,png|max:512',
            'sex'=>['nullable'],
            'cgpa' => ['nullable', 'numeric', 'max:10'],
            //'dateOfBirth'=>['required'],
            'mobile'=>['required','numeric','digits:11'],//,'unique:students'
            'mobileFather'=>['nullable','numeric','digits:11'],
        ];
    }

    public function store(Request $request)
    {
        //return $request->all();
        $data = $this->acValidator($request);
        //$data['mobile'] = ['required','numeric','digits:11','unique:students'];
        $this->validate($request, $data);

        $section = ClassConfig::find($request->section_id);
//dd($section);
        $student = new Student;
        //$student->reg_no = $this->newReg($request->department_id,$request->session);

        $student->branch_id = session('branch')['id'];
        //$student->reg_no = $request->reg_no;
        $student->reg_no = $this->newReg();
        $student->class_roll = $request->class_roll;
        $student->name = $request->name;
        $student->studentBirthRegNo = $request->studentBirthRegNo;
        $student->sex = $request->sex;
        $student->mobile = $request->mobile;
        //$student->session = $request->session;
        $student->section_id = $request->section_id;
        $student->semester_id  = $section->class_id;
        $student->shift_id = $section->shift_id;
        $student->group_id = $request->group_id;
        $student->category_id = $request->category_id;
        $student->Comment = $request->Comment;
        $student->religion = $request->religion;
        $student->dateOfBirth = $request->dateOfBirth;

        $student->fathersName = $request->fathersName;
        $student->mothersName = $request->mothersName;
        $student->mobileFather = $request->mobileFather;
        $student->mobileMother = $request->mobileMother;
        $student->guardianName = $request->guardianName;
        $student->mobileGuardian = $request->mobileGuardian;
        $student->guardianNID = $request->guardianNID;
        $student->guardianRelation = $request->guardianRelation;

        $student->presentVillage = $request->presentVillage;
        $student->presentPost = $request->presentPost;
        $student->presentUpazila = $request->presentUpazila;
        $student->presentZila = $request->presentZila;
        $student->permanentVillage = $request->permanentVillage;
        $student->permanentPost = $request->permanentPost;
        $student->permanentUpazila = $request->permanentUpazila;
        $student->permanentZila  = $request->permanentZila;

        $student->jscBoard = $request->jscBoard;
        $student->jscResistration = $request->jscResistration;
        $student->jscExamYear = $request->jscExamYear;
        $student->jscBoardRoll = $request->jscBoardRoll;
        $student->jscCgpa = $request->jscCgpa;

        $student->MISStudentID = $request->MISStudentID;
        $student->Bank_Mobile = $request->Bank_Mobile;
        $student->accountName = $request->accountName;
        $student->accountNumber = $request->accountNumber;

        $student->academic_year_id = $request->academic_year_id;
        $student->others = $request->others;
        /*
        if(isset($request->photo)){  
            $image = $request->photo;     
            //Storage::delete('public/'.$data->photo);     
            $filename = time().'.'.$image->extension();
            $full_path = 'students/'.$filename;
            $success = $image->storeAs('public/students/', $filename);
            if ($success) {                
                $student->photo = $full_path; 
            }
        }
        */
        $image = $request->file('photo');
        if ($image) {
            Storage::delete('public/'.$student->photo);
            $imgFile  = Image::make($request->photo)->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
            })->encode('jpg',80);
            $file_name = 'students/'. session('branch')['id'] .'/'.time() .'.jpg';
            Storage::disk('public')->put($file_name, $imgFile);
            //$filename = time().'.'.$image->extension();
            //$full_path = 'products/'.$filename;
            //$image->storeAs('public/products/', $filename);
            $student->photo = $file_name;
        }
        $student->save();
        //InvoicePayment::create(['student_id'=>$student->id, 'amount'=>$request->amount, 'remarks'=>$request->remarks,'received_by'=>auth()->user()->id]);
        StudentMark::create(['semester_id'=>1,'student_id'=>$student->id]);

        session()->flash('success', "Student Saved");
        return redirect()->route('student.student.index');
    }


    public function studentPayment(Request $request)
    {
        $this->validate($request, array(
            'student_id'=>'required',
            'amount'=>'required',
            'remarks'=>'nullable',
        ));
        InvoicePayment::create(['student_id'=>$request->student_id, 'amount'=>$request->amount, 'remarks'=>$request->remarks,'received_by'=>auth()->user()->id]);
        return redirect()->back();
    }
    
    public function studentPayments(Student $student)
    {
        $payments = InvoicePayment::where('student_id',$student->id)->get();
        return view('admin.student.student.studentPayment', compact('student','payments'));
    }

    public function studentPaymentComplite(Student $student,$id)
    {
        $mark = StudentMark::find($id);
        $mark->paid_confirm = 1;
        $mark->save();
        session()->flash('success', "Payment Confirmed.");
        return redirect()->back();
    }

    public function show(Student $student)
    {
        return view('admin.student.student.show  ', compact('student'));
    }

    public function admissionForm(Student $student)
    {
        $payment = InvoicePayment::where('student_id',$student->id)->first();
        /*
        $pdf = PDF::loadView('admin.student.student.admissionForm', array('student'=>$student,'payment'=>$payment), [], [
            'watermark_image_path' => public_path('/upload/site_file/'.config('settings.siteLogo','')),
            'show_watermark_image' => true,
            'margin_left' => '15',
            //'watermark' => 'true',
            //'show_watermark' => true
          ]);
        return $pdf->stream($student->reg_no.'-admissionForm.pdf');
        */
        $pdf = Pdf::loadView('admin.student.student.admissionForm', compact('student','payment'));
        return $pdf->download($student->reg_no.'-admissionForm.pdf');
    }


    public function edit(Student $student)
    {
        $semesters = $this->semesterArray();
        $academicYear = $this->academicYear();
        $sections = $this->sectionArray();
        $groups = Group::where('branch_id', session('branch')['id'])->pluck('name', 'id');
        $catetories = Category::where('branch_id', session('branch')['id'])->pluck('name', 'id');  

        $presentUpazila = $permanentUpazila = [];

        //$invoiceHeads = $this->invoiceHeadArray();
        
        $locations = $this->zilaArray();
        if($student->presentUpazila != null ){
            $presentUpazila[$student->presentUpazila] = $student->presentUpazilaName->name;
        }
        if($student->permanentUpazila != null ){
            $permanentUpazila[$student->permanentUpazila] = $student->permanentUpazilaName->name;
        }

        //$payments = InvoicePayment::where('student_id',$student->id)->get();

        $mode = 'edit';
        return view('admin.student.student.createOrEdit', compact('mode','catetories','groups','sections','student','semesters','locations','presentUpazila','permanentUpazila','academicYear'));
    }

    public function update(Request $request, Student $student)
    {
        $data = $this->acValidator($request);
        //$data['mobile'] = ['required','numeric','digits:11','unique:students'];
        $data['reg_no'] = ['nullable','unique:students,reg_no,'.$student->id];
        $this->validate($request, $data);

        $section = ClassConfig::find($request->section_id);

        $student->branch_id = session('branch')['id'];
        $student->reg_no = $request->reg_no;
        $student->class_roll = $request->class_roll;
        $student->name = $request->name;
        $student->studentBirthRegNo = $request->studentBirthRegNo;
        $student->sex = $request->sex;
        $student->mobile = $request->mobile;
        //$student->session = $request->session;
        $student->section_id = $request->section_id;
        $student->semester_id  = $section->class_id;
        $student->shift_id = $section->shift_id;
        $student->group_id = $request->group_id;
        $student->category_id = $request->category_id;
        $student->Comment = $request->Comment;
        $student->religion = $request->religion;
        $student->dateOfBirth = $request->dateOfBirth;

        $student->fathersName = $request->fathersName;
        $student->mothersName = $request->mothersName;
        $student->mobileFather = $request->mobileFather;
        $student->mobileMother = $request->mobileMother;
        $student->guardianName = $request->guardianName;
        $student->mobileGuardian = $request->mobileGuardian;
        $student->guardianNID = $request->guardianNID;
        $student->guardianRelation = $request->guardianRelation;

        $student->presentVillage = $request->presentVillage;
        $student->presentPost = $request->presentPost;
        $student->presentUpazila = $request->presentUpazila;
        $student->presentZila = $request->presentZila;
        $student->permanentVillage = $request->permanentVillage;
        $student->permanentPost = $request->permanentPost;
        $student->permanentUpazila = $request->permanentUpazila;
        $student->permanentZila  = $request->permanentZila;

        $student->jscBoard = $request->jscBoard;
        $student->jscResistration = $request->jscResistration;
        $student->jscExamYear = $request->jscExamYear;
        $student->jscBoardRoll = $request->jscBoardRoll;
        $student->jscCgpa = $request->jscCgpa;

        $student->MISStudentID = $request->MISStudentID;
        $student->Bank_Mobile = $request->Bank_Mobile;
        $student->accountName = $request->accountName;
        $student->accountNumber = $request->accountNumber;

        $student->academic_year_id = $request->academic_year_id;
        $student->others = $request->others;

        $image = $request->file('photo');
        if ($image) {
            Storage::delete('public/'.$student->photo);
            $imgFile  = Image::make($request->photo)->resize(300, 300, function ($constraint) {
                $constraint->aspectRatio();
            })->encode('jpg',80);
            $file_name = 'students/'. session('branch')['id'] . '/'. time() .'.jpg';
            Storage::disk('public')->put($file_name, $imgFile);            
            //$filename = time().'.'.$image->extension();
            //$full_path = 'products/'.$filename;
            //$image->storeAs('public/products/', $filename);
            $student->photo = $file_name;
        }
        $student->save();

        session()->flash('success', "Student Updated");
        return redirect()->back();
    }

    public function import(Request $request){
        $request->validate([
            'section_id' => 'required',
            'group_id' => 'required',
            'category_id' => 'required',
            'file' => 'required|mimes:xlsx,xls',
        ]);

        $class_config = ClassConfig::find($request->section_id);
        
        session()->put('import_student',[
            'section_id'=>$request->section_id,
            'semester_id'=>$class_config->class_id,
            'shift_id'=>$class_config->shift_id,
            'group_id'=>$request->group_id,
            'category_id'=>$request->category_id
        ]);

        Excel::import(new StudentsImport, $request->file('file'));
        session()->forget('import_student');
        session()->flash('success', 'Imported Successfully!');
        return redirect()->back();
    }

    public function importCgpa(Request $request){
        $request->validate([
            'cgpa' => 'required|mimes:xlsx,xls',
        ]);

        //dd($request->file('file')); exit;
        
        Excel::import(new ImportCgpa, $request->file('cgpa'));

        session()->flash('success', 'Imported Successfully!');
        return redirect()->back();
    }

    public function IDCard(Request $request){
        $data = [
            'department_id'=>'',
            'semester_id'=>'',
            'session'=>'',
            'reg_no'=>'',
            'shift'=>'',
            'student_group'=>'',
            'probidhan'=>'',
            'class_roll'=>'',
            'reg_no'=>'',
            'print_style'=>'both'
        ];
        $departments = $this->departmentArray();
        $semesters = $this->semesterArray();
        $students = Student::where('branch_id', session('branch')['id'])->latest();
        if(!empty($request->department_id)){
            $data['department_id'] = $request->department_id;
            $students = $students->where('department_id', $request->department_id);
        }
        if(!empty($request->semester_id)){
            $data['semester_id'] = $request->semester_id;
            $students = $students->where('semester_id', $request->semester_id);
        }
        if(!empty($request->session)){
            $data['session'] = $request->session;
            $students = $students->where('session', $request->session);
        }
        if(!empty($request->reg_no)){
            $data['reg_no'] = $request->reg_no;
            $students = $students->where('reg_no', $request->reg_no);
        }
        if(!empty($request->shift)){
            $data['shift'] = $request->shift;
            $students = $students->where('shift','like', '%'.$request->shift.'%');
        }
        if(!empty($request->student_group)){
            $data['student_group'] = $request->student_group;
            $students = $students->where('student_group', $request->student_group);
        }
        if(!empty($request->probidhan)){
            $data['probidhan'] = $request->probidhan;
            $students = $students->where('probidhan', $request->probidhan);
        }
        if(!empty($request->class_roll)){
            $data['class_roll'] = $request->class_roll;
            $students = $students->where('class_roll', $request->class_roll);
        }
        $data['print_style'] = $request->print_style;
        $students = $students->paginate(100);

        return view('admin.student.student.IDCard', compact('students','departments','semesters','data'));
    }

    public function student_statitics(Request $request){
        $data = [
            
        ];
        $students = Student::where('semester_id', '<',9)->orderBy('semester_id', 'asc');

        if(!empty($request->session)){
            $data['session'] = $request->session;
            $students = $students->where('session', $request->session);
        }
        if(!empty($request->shift)){
            $data['shift'] = $request->shift;
            $students = $students->where('shift','like', '%'.$request->shift.'%');
        }
        if(!empty($request->student_group)){
            $data['student_group'] = $request->student_group;
            $students = $students->where('student_group', $request->student_group);
        }

        $students = $students->get();

        return view('admin.student.student.student_statitics', compact('students','data'));
    }

    public function destroy(Student $student)
    {
        Storage::delete('public/'.$student->photo);
        $student->delete();
        session()->flash('success', "Student Deleted");
        return redirect()->back();
    }
}
