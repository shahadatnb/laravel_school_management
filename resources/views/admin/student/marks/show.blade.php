@extends('admin.layouts.layout')
@section('title',__("Student"))
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Student')}}</h3>
        <div class="card-tools">
        <a href="{{route('student.edit',$student->id)}}" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
        <a target="_blank" href="{{route('admissionForm',$student->id)}}" class="btn btn-sm btn-danger">
            <i class="far fa-file-pdf"></i> Download
        </a>
    </div>
    <div class="card-body">
        <div class="justify-content-center text-center">
            <img width="80" class="attachment-img" src="{{asset('/upload/site_file/'.config('settings.siteLogo',''))}}" alt="{{ config('settings.siteTitle','') }}">
            <div class=" position-relative">
                <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
                <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
                <p class="text-center m-0">({{ config('settings.siteWeb') }})</p>
                
                <div class="student_photo position-absolute" style="top:0; right:0">
                    <img width="150" class="img-thumbnail" src="{{asset('/storage/'.$student->photo)}}" alt="">
                </div>
            </div>
            
        </div>
        <table class="table">
            <tr>
                <td>{{__('Name Of Student')}}</td>
                <td colspan="3">{{$student->name}}</td>
            </tr>
            <tr>
                <td>{{__('Department')}}</td>
                <td colspan="3">@if($student->department){{$student->department->title}}@endif</td>
            </tr>
            <tr>
                <td>{{__('Father`s Name')}}</td>
                <td colspan="3">{{$student->fathersName}}</td>
            </tr>
            <tr>
                <td>{{__('Mother`s Name')}}</td>
                <td colspan="3">{{$student->mothersName}}</td>
            </tr>
            <tr>
                <td colspan="4"><h4>{{__('Present Address')}}</h4></td>
            </tr>
            <tr>
                <td>{{__('Village')}}</td>
                <td>{{$student->presentVillage}}</td>
                <td>{{__('Post Office')}}</td>
                <td>{{$student->presentPost}}</td>
            </tr>
            <tr>
                <td>{{__('Upazila')}}</td>
                <td>@if($student->presentUpazilaName){{$student->presentUpazilaName->name}}@endif</td>
                <td>{{__('Zila')}}</td>
                <td>@if($student->presentZilaName){{$student->presentZilaName->name}}@endif</td>
            </tr>
            <tr>
                <td colspan="4"><h4>{{__('Permanent Address')}}</h4></td>
            </tr>
            <tr>
                <td>{{__('Village')}}</td>
                <td>{{$student->permanentVillage}}</td>
                <td>{{__('Post Office')}}</td>
                <td>{{$student->permanentPost}}</td>
            </tr>
            <tr>
                <td>{{__('Upazila')}}</td>
                <td>@if($student->permanentUpazilaName){{$student->permanentUpazilaName->name}}@endif</td>
                <td>{{__('Zila')}}</td>
                <td>@if($student->permanentZilaName){{$student->permanentZilaName->name}}@endif</td>
            </tr>
            <tr>
                <td>{{__('Date of Birth')}}</td>
                <td colspan="3">{{shortDate($student->dateOfBirth)}}</td>
            </tr>
            <tr>
                <td>{{__('Educational Qualification')}}</td>
                <td colspan="3">{{$student->shift}}</td>
            </tr>
            <tr>
                <td>{{__('Sex')}}</td>
                <td colspan="3">{{$student->sex}}</td>
            </tr>
            <tr>
                <td>{{__('student_mobile')}}</td>
                <td colspan="3">{{$student->student_mobile}}</td>
            </tr>
            <tr>
                <td>{{__('student_group')}}</td>
                <td colspan="3">{{$student->student_group}}</td>
            </tr>
            <tr>
                <td>{{__('gardian_student_mobile')}}</td>
                <td colspan="3">{{$student->gardian_student_mobile}}</td>
            </tr>
        </table>
        
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection