@extends('admin.layouts.layout')
@section('title',__("Student Account Head Create/Edit"))
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Student Account Head Create/Edit')}}</h3>
        <div class="card-tools">
          <a href="{{route('sac.setup.head.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'sac.setup.head.edit')
        {!! Form::model($head, array('route'=>['sac.setup.head.update',$head],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['sac.setup.head.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('name', __('Name'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Name')]) !!}
            </div>
          </div>
          <div class="col-2">
            <div class="form-group">
              {!! Form::label('serial', __('Serial'),['class'=>'']) !!}
              {!! Form::number('serial',null,['class'=>'form-control','placeholder'=> __('Serial')]) !!}
            </div>
          </div>
          <div class="col-2">
            <div class="form-group">
              {!! Form::label('status', __('Status'),['class'=>'']) !!}
              {!! Form::select('status',['1'=>'Active','0'=>'Inactive'],null,['class'=>'form-control','placeholder'=> __('Status')]) !!}
            </div>
          </div>
        </div>
      </div>
      {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      {!! Form::close() !!}
    <!-- /.card-body -->
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
