@extends('admin.layouts.layout')
@section('title',"Admission Quota")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Admission Quota')}}</h3>
        <div class="card-tools">
          <a href="{{route('admission_quota.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'admission_quota.edit')
        {!! Form::model($admissionQuotum, array('route'=>['admission_quota.update',$admissionQuotum],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['admission_quota.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('name', __('Name'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('quota_percentage', __('Quota Percentage'),['class'=>'']) !!}
              {!! Form::number('quota_percentage',null,['class'=>'form-control','placeholder'=> __('Quota Percentage')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('priority', __('Priority'),['class'=>'']) !!}
              {!! Form::number('priority',null,['class'=>'form-control','placeholder'=> __('Priority')]) !!}
            </div>
          </div>          
          <div class="col-6">
            @if (request()->route()->getName() == 'admission_quota.edit')
            <div class="form-group">
              {!! Form::label('is_active', __('Status'),['class'=>'']) !!}
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
