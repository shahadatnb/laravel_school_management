<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\User;
use Illuminate\Http\Request;

class BranchController extends Controller
{

    public function index()
    {
        $branches = Branch::all();
        return view('admin.branch.index',compact('branches'));
    }

    public function create()
    {
        return view('admin.branch.edit');
    }


    public function store(Request $request)
    {
        $this->validate(request(),[
            'name' => 'required',
            'subdomain' => 'nullable|alpha_dash|unique:branches,subdomain',
            'address' => 'required',
            'contact' => 'nullable',
            'login_email' => 'required|email',
            'password' => 'required|string|min:6',
            'email' => 'nullable|email',
            'head' => 'nullable|string|max:150',
            'head_email' => 'nullable|email',
            'head_contact' => 'nullable',
            'head_designation' => 'nullable|string|max:150',
            'sms_domain_url' => 'nullable|string|max:150',
            'sms_api_key' => 'nullable|string|max:150',
            'sms_secretkey' => 'nullable|string|max:150',
            'sms_client' => 'nullable|string|max:150',
            'logo' => 'nullable|mimes:jpg,jpeg,png|max:512',
            'favicon' => 'nullable|mimes:jpg,jpeg,png|max:512',
            'exp_date' => 'nullable|date',
        ]);

        $branch = new Branch;
        $branch->name = $request->name;
        $branch->subdomain = $request->subdomain;
        $branch->address = $request->address;
        $branch->contact = $request->contact;
        $branch->email = $request->email;
        $branch->head = $request->head;
        $branch->head_email = $request->head_email;
        $branch->head_contact = $request->head_contact;
        $branch->head_designation = $request->head_designation;
        $branch->sms_domain_url = $request->sms_domain_url;
        $branch->sms_api_key = $request->sms_api_key;
        $branch->sms_secretkey = $request->sms_secretkey;
        $branch->sms_client = $request->sms_client;
        //$branch->logo = $request->logo;
        //$branch->favicon = $request->favicon;
        $branch->exp_date = $request->exp_date;
        $branch->save();

        $user = new User;
        $user->name = $request->name;
        $user->email = $request->login_email;
        $user->password = bcrypt($request->password);
        $user->save();

        $user->branches()->sync($branch->id);

        /*
        Post::create([
            'user_id' => 1, 'status' => 1,
            'branch_id' => $branch->id,
            'post_type' => 'page',
            'title' => 'Welcome to '.$branch->name,
            'slug' => 'about-us',
            'body' => 'Welcome to '.$branch->name.',<br> Here you can add your content, <br> and create your own website.',
        ]);

        Post::create([
            'user_id' => 1, 'status' => 1,
            'branch_id' => $branch->id,
            'post_type' => 'page',
            'title' => 'Contact Us',
            'slug' => 'contact-us',
            'body' => '
                <p>Address: '.$branch->address.'</p>
                <p>Phone: '.$branch->contact.'</p>
                <p>Email: '.$branch->email.'</p>
            ',
        ]);

        $menu = new Menu;
        $menu->branch_id = $branch->id;
        $menu->Title = 'Main Menu';
        $menu->menu_id = 'main-menu';
        $menu->save();

        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'Home',
            'menu_url' => '/',
            'menuType' => 'home',
            'sl' => 1
        ]);

        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'About Us',
            'menu_url' => 'page/about-us',
            'menuType' => 'others',
            'sl' => 2
        ]);

        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'Teachers',
            'menu_url' => 'section/teacher',
            'menuType' => 'others',
            'sl' => 3
        ]);

        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'Stuff',
            'menu_url' => 'section/stuff',
            'menuType' => 'others',
            'sl' => 4
        ]);

        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'Notices',
            'menu_url' => 'section/notice',
            'menuType' => 'others',
            'sl' => 5
        ]);


        MenuItem::create([
            'menu_id' => $menu->id,
            'lebel' => 'Contact Us',
            'menu_url' => 'page/contact-us',
            'menuType' => 'others',
            'sl' => 6
        ]);

        $munus = Menu::where('branch_id', $branch->id)->get();
        foreach($munus as $m){
            $settings[$m->menu_id] = MenuItem::with('subMenu')->withCount('subMenu')->where('menu_id',$m->id)->where('parent_id',null)->orderBy('sl')->orderBy('sl','ASC')->get()->toArray();
        }

        Cache::put($branch->subdomain, ['menus'=>$settings]);
        */

        session()->flash('success','Successfully Save');
        return redirect()->route('branch.index');
    }


    public function show(Branch $branch)
    {
        //
    }


    public function edit(Branch $branch)
    {
        return view('admin.branch.edit',compact('branch'));
    }


    public function update(Request $request, Branch $branch)
    {
        $this->validate(request(),[
            'name' => 'required',
            'subdomain' => 'nullable|alpha_dash|unique:branches,subdomain,'.$branch->id,
            'address' => 'required',
            'contact' => 'nullable',
            'email' => 'nullable|email',
            'head' => 'nullable|string|max:150',
            'head_email' => 'nullable|email',
            'head_contact' => 'nullable',
            'head_designation' => 'nullable|string|max:150',
            'sms_domain_url' => 'nullable|string|max:150',
            'sms_api_key' => 'nullable|string|max:150',
            'sms_secretkey' => 'nullable|string|max:150',
            'sms_client' => 'nullable|string|max:150',
            'logo' => 'nullable|mimes:jpg,jpeg,png|max:512',
            'favicon' => 'nullable|mimes:jpg,jpeg,png|max:100',
            'head_sign' => 'nullable|mimes:jpg,jpeg,png|max:100',
            'exp_date' => 'nullable|date',
        ]);

        $branch->name = $request->name;
        $branch->subdomain = $request->subdomain;
        $branch->address = $request->address;
        $branch->contact = $request->contact;
        $branch->email = $request->email;
        $branch->head = $request->head;
        $branch->head_email = $request->head_email;
        $branch->head_contact = $request->head_contact;
        $branch->head_designation = $request->head_designation;
        $branch->sms_domain_url = $request->sms_domain_url;
        $branch->sms_api_key = $request->sms_api_key;
        $branch->sms_secretkey = $request->sms_secretkey;
        $branch->sms_client = $request->sms_client;
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
        
        $branch->exp_date = $request->exp_date;
        $branch->status = $request->status ? 1 : 0;

        $branch->save();

        session()->flash('success','Successfully Save');
        return redirect()->route('branch.index');
    }

    public function destroy(Branch $branch)
    {
        //
    }
}
