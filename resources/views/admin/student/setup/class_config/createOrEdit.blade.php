@extends('admin.layouts.layout')
@section('title',__("Class Config"))
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Class Config')}}</h3>
        <div class="card-tools">
          <a href="{{route('student.setup.class_config.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'student.setup.class_config.edit')
        {!! Form::model($classConfig, array('route'=>['student.setup.class_config.update',$classConfig],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['student.setup.class_config.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-3">
            <div class="form-group">
              {!! Form::label('class_id', __('Class'),['class'=>'']) !!}
              {!! Form::select('class_id',$semesters,null,['class'=>'form-control','placeholder'=> __('Class')]) !!}
            </div>
          </div>
          <div class="col-3">
            <div class="form-group">
              {!! Form::label('shift_id', __('Shift'),['class'=>'']) !!}
              {!! Form::select('shift_id',$shifts,null,['class'=>'form-control','placeholder'=> __('Shift')]) !!}
            </div>
          </div>
          <div class="col-3"> 
            <div class="form-group">
              {!! Form::label('section_id', __('Section'),['class'=>'']) !!}
              {!! Form::select('section_id',$sections,null,['class'=>'form-control','placeholder'=> __('Section')]) !!}
            </div>
          </div>
          <div class="col-1">
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
