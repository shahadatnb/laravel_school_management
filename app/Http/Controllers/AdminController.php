<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Branch;
use App\Models\Menu;
use App\Models\MenuItem;
use App\Models\Student\AcademicYear;

class AdminController extends Controller
{
    
    public function index()
    {      
        $this->middleware('branch');  
        return view('admin.pages.dashboard');
    }

    public function home(){
         $branches = auth()->user()->branches->pluck('name','id')->toArray();
         return view('admin.pages.home',compact('branches'));
     }

     public function branchSelect(Request $request){
         $branch = Branch::find($request->branch_id);
         //session()->forget('branch');
         session()->put('branch',$branch->toArray());
         return redirect()->route('dashboard');
     }

    public function settings()
    {
        $this->middleware('branch');
        $settings = Branch::where('id', session('branch')['id'])->first();
        $academic_years = AcademicYear::where('branch_id', session('branch')['id'])->orderBy('sl','ASC')->where('status',1)->pluck('year', 'id');
        return view('admin.pages.settings',compact('settings','academic_years'));
    }

    public function saveSetting(Request $request)
    {
        $this->validate(request(),[
            'name' => 'required',
            //'subdomain' => 'required|alpha_dash|unique:branches,subdomain,'.$request->id,
            'address' => 'required',
            'contact' => 'nullable',
            'email' => 'nullable|email',
            'head' => 'nullable|string|max:150',
            'head_email' => 'nullable|email',
            'head_contact' => 'nullable',
            'head_designation' => 'nullable|string|max:150',
            'logo' => 'nullable|mimes:jpg,jpeg,png|max:512',
            'favicon' => 'nullable|mimes:jpg,jpeg,png|max:100',
            'head_sign' => 'nullable|mimes:jpg,jpeg,png|max:100',
        ]);

        $branch = Branch::where('id', session('branch')['id'])->first();
        $branch->name = $request->name;
        $branch->subdomain = $request->subdomain;
        $branch->address = $request->address;
        $branch->contact = $request->contact;
        $branch->email = $request->email;
        $branch->head = $request->head;
        $branch->head_email = $request->head_email;
        $branch->head_contact = $request->head_contact;
        $branch->head_designation = $request->head_designation;
        $branch->academic_year_id = $request->academic_year_id;
        if(isset($request->logo)){
            if ($branch->logo != '' && file_exists( public_path('upload\\logo\\') . $branch->logo)) {
                unlink(public_path('upload\\logo\\') . $branch->logo);
            }
      
            $fileName = time().'.'.$request->logo->extension();  
            $upload_path = public_path('upload/logo');
            $request->logo->move($upload_path, $fileName);
            $branch->logo = $fileName;
        }
        
        if(isset($request->favicon)){
            if ($branch->favicon != '' && file_exists( public_path('upload\\logo\\') . $branch->favicon)) {
                unlink(public_path('upload\\logo\\') . $branch->favicon);
            }
      
            $fileName = time().'.'.$request->favicon->extension();  
            $upload_path = public_path('upload/logo');
            $request->favicon->move($upload_path, $fileName);
            $branch->favicon = $fileName;
        }

        if(isset($request->head_sign)){
            if ($branch->head_sign != '' && file_exists( public_path('upload\\head_sign\\') . $branch->head_sign)) {
                unlink(public_path('upload\\head_sign\\') . $branch->head_sign);
            }
      
            $fileName = time().'.'.$request->head_sign->extension();  
            $upload_path = public_path('upload/head_sign');
            $request->head_sign->move($upload_path, $fileName);
            $branch->head_sign = $fileName;
        }

        $branch->save();       

        session()->flash('success','Setting Seved');
        return redirect()->back();
    }

    
    public function siteCache(){
        $munus = Menu::where('branch_id', session('branch')['id'])->get();
        foreach($munus as $m){
            $settings[$m->menu_id] = MenuItem::with('subMenu')->withCount('subMenu')->where('menu_id',$m->id)->where('parent_id',null)->orderBy('sl')->orderBy('sl','ASC')->get()->toArray();
        }
        
        //$branch = Branch::where('id', session('branch')['id'])->first()->toArray( );
        Cache::put(session('branch')['subdomain'], ['menus'=>$settings]);
        session()->flash('success', "Saved.");
        return redirect()->back();
    }
}
