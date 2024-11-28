@extends('admin.layouts.layout')
@section('title',"Admission Class")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Admission Class')}}</h3>
        <div class="card-tools">
          <a href="{{route('admission_class.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'admission_class.edit')
        {!! Form::model($admissionClass, array('route'=>['admission_class.update',$admissionClass],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['admission_class.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('name', __('Class Name'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Class Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('total_seat', __('Total Seat'),['class'=>'']) !!}
              {!! Form::number('total_seat',null,['class'=>'form-control','placeholder'=> __('Total Seat')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('vacant_seat', __('Vacant Seat'),['class'=>'']) !!}
              {!! Form::number('vacant_seat',null,['class'=>'form-control','placeholder'=> __('Vacant Seat')]) !!}
            </div>
          </div>
          <div class="col-6">
            @if (request()->route()->getName() == 'admission_class.edit')
            <div class="form-group">
              {!! Form::label('is_active', __('Duration'),['class'=>'']) !!}
              {{ Form::checkbox('is_active',1,null) }}
            </div>
            @endif
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
