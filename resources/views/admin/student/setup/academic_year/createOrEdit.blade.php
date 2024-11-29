@extends('admin.layouts.layout')
@section('title',"Academic Year")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Academic Year')}}</h3>
        <div class="card-tools">
          <a href="{{route('student.setup.academicYear.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'student.setup.academicYear.edit')
        {!! Form::model($academicYear, array('route'=>['student.setup.academicYear.update',$academicYear],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['student.setup.academicYear.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('year', __('Year'),['class'=>'']) !!}
              {!! Form::text('year',null,['class'=>'form-control','placeholder'=> __('Year')]) !!}
            </div>
          </div>
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('sl', __('Serial'),['class'=>'']) !!}
              {!! Form::number('sl',null,['class'=>'form-control','placeholder'=> __('Serial')]) !!}
            </div>
          </div>
          <div class="col-4">
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
