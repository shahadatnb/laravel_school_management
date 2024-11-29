<?php

namespace App\Http\Controllers\Student;

use App\Models\Student\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::where('branch_id',session('branch')['id'])->get();
        return view('admin.student.setup.category.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.student.setup.category.createOrEdit');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $category = new Category;
        $category->name = $request->name;
        $category->branch_id = session('branch')['id'];
        $category->status = $request->status;
        $category->serial = $request->serial;
        $category->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.category.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Category $category)
    {
        return view('admin.student.setup.category.createOrEdit',compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required',
            'status' => 'required',
        ]);

        $category->name = $request->name;
        $category->branch_id = session('branch')['id'];
        $category->status = $request->status;
        $category->serial = $request->serial;
        $category->save();

        session()->flash('success', "Saved");
        return redirect()->route('student.setup.category.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        //
    }
}
