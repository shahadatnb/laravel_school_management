@extends('admin.layouts.layout')
@section('title',"Branch Edit")
@section('css')
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Branch Edit</h3>
        <div class="card-tools">
          <a href="{{ route('branch.index')}}"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @if (request()->routeIs('branch.edit'))
        {!! Form::model($branch, array('route'=>['branch.update',$branch],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['branch.store'],'files' => true)) !!}          
      @endif
        @include('admin.layouts._message')
        <div class="row">
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('name', __('Name'),['class'=>'']) !!}
                {!! Form::text('name',null,['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Name')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('subdomain', __('Subdomain'),['class'=>'']) !!}
                {!! Form::text('subdomain',null,['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Subdomain')]) !!}
            </div>  
          </div>
        </div>
        @if (request()->routeIs('branch.create'))
        <div class="row">
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('login_email', __('Login Email'),['class'=>'']) !!}
                {!! Form::email('login_email',null,['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Login Email')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('password', __('Password'),['class'=>'']) !!}
                {!! Form::password('password',['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Password')]) !!}
            </div>  
          </div>
        </div>
        @endif
        <div class="row">
          <div class="col-12 col-md-12">
            <div class="form-group">
                {!! Form::label('address', __('Address'),['class'=>'']) !!}
                {!! Form::text('address',null,['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Address')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('contact', __('Contact Phone/Mobile'),['class'=>'']) !!}
                {!! Form::text('contact',null,['class'=>'form-control','requerd'=>'requerd','placeholder'=> __('Contact Phone/Mobile')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
              {!! Form::label('email', __('Email'),['class'=>'']) !!}
              {!! Form::email('email',null,['class'=>'form-control','requerd'=>false,'placeholder'=> __('Email')]) !!}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('head', __('Head Name'),['class'=>'']) !!}
                {!! Form::text('head',null,['class'=>'form-control','requerd'=>false,'placeholder'=> __('Head')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
              {!! Form::label('head_email', __('Head Email'),['class'=>'']) !!}
              {!! Form::email('head_email',null,['class'=>'form-control','requerd'=>false,'placeholder'=> __('Head Email')]) !!}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('head_contact', __('Head Contact'),['class'=>'']) !!}
                {!! Form::text('head_contact',null,['class'=>'form-control','requerd'=>false,'placeholder'=> __('Head Contact')]) !!}
            </div>
          </div>
          <div class="col-12 col-md-6">
            <div class="form-group">
                {!! Form::label('head_designation', __('Head Designation'),['class'=>'']) !!}
                {!! Form::text('head_designation',null,['class'=>'form-control','requerd'=>false,'placeholder'=> __('Head Designation')]) !!}
            </div>
          </div>
        </div>
        <div class="row">
          @if (request()->routeIs('branch.edit'))
            <div class="col-3">
                <div class="form-group">
                    {!! Form::label('status', __('Status'),['class'=>'']) !!}
                    {!! Form::checkbox('status',1,null,['class'=>'']) !!}
                </div>
            </div>
            <div class="col-3">
              @if($branch->logo != '')
                <img src="{{asset('upload/site_file/'.$branch->logo)}}" alt="" width="100">
              @endif
              <div class="form-group">
                  {!! Form::label('logo', __('Logo'),['class'=>'']) !!}
                  {!! Form::file('logo') !!}
              </div>
            </div>
            <div class="col-3">
              @if($branch->favicon != '')
                <img src="{{asset('upload/site_file/'.$branch->favicon)}}" alt="" width="100">
              @endif
              <div class="form-group">
                {!! Form::label('favicon', __('Favicon'),['class'=>'']) !!}
                {!! Form::file('favicon') !!}
              </div>
            </div>            
          @endif
        </div>
        
        {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      {!! Form::close() !!}
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        Footer
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/summernote/summernote-bs4.min.js"></script>
<script src="{{asset('/assets/admin')}}/js/main.js"></script>
<script>
    $(function () {
      // Summernote
      $('.textarea').summernote()
    })
</script>
@endsection