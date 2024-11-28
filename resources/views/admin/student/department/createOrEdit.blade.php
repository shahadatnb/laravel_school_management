@extends('admin.layouts.layout')
@section('title',"Department")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Department')}}</h3>
        <div class="card-tools">
          <a href="{{route('department.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'department.edit')
        {!! Form::model($department, array('route'=>['department.update',$department],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['department.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('title', __('Department Title'),['class'=>'']) !!}
              {!! Form::text('title',null,['class'=>'form-control','placeholder'=> __('Department Title')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('durationYear', __('Duration'),['class'=>'']) !!}
              {!! Form::number('durationYear',null,['class'=>'form-control','placeholder'=> __('Duration')]) !!}
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
