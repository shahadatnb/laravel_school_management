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
            'subdomain' => 'required|alpha_dash|unique:branches,subdomain',
            'address' => 'required',
            'contact' => 'nullable',
            'login_email' => 'required|email',
            'password' => 'required|string|min:6',
            'email' => 'nullable|email',
            'head' => 'nullable|string|max:150',
            'head_email' => 'nullable|email',
            'head_contact' => 'nullable',
            'head_designation' => 'nullable|string|max:150',
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
            'subdomain' => 'required|alpha_dash|unique:branches,subdomain,'.$branch->id,
            'address' => 'required',
            'contact' => 'nullable',
            'email' => 'nullable|email',
            'head' => 'nullable|string|max:150',
            'head_email' => 'nullable|email',
            'head_contact' => 'nullable',
            'head_designation' => 'nullable|string|max:150',
            'logo' => 'nullable|mimes:jpg,jpeg,png|max:512',
            'favicon' => 'nullable|mimes:jpg,jpeg,png|max:512',
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
        if(isset($request->logo)){
            if ($branch->logo != '' && file_exists( public_path('upload\\site_file\\') . $branch->logo)) {
                unlink(public_path('upload\\site_file\\') . $branch->logo);
            }
      
            $fileName = time().'.'.$request->logo->extension();  
            $upload_path = public_path('upload/site_file');
            $request->logo->move($upload_path, $fileName);
            $branch->logo = $fileName;
        }
        
        if(isset($request->favicon)){
            if ($branch->favicon != '' && file_exists( public_path('upload\\site_file\\') . $branch->favicon)) {
                unlink(public_path('upload\\site_file\\') . $branch->favicon);
            }
      
            $fileName = time().'.'.$request->favicon->extension();  
            $upload_path = public_path('upload/site_file');
            $request->favicon->move($upload_path, $fileName);
            $branch->favicon = $fileName;
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
