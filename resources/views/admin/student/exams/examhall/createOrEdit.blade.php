@extends('admin.layouts.layout')
@section('title',"Exam Hall")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Exam Hall')}}</h3>
        <div class="card-tools">
          <a href="{{route('examHall.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->routeIs('examHall.edit'))
        {!! Form::model($examHall, array('route'=>['examHall.update',$examHall],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['examHall.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-12">
            <div class="form-group">
              {!! Form::label('name', __('Hall Title'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Hall Title')]) !!}
            </div>
          </div>
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('rows', __('Rows'),['class'=>'']) !!}
              {!! Form::number('rows',null,['class'=>'form-control','placeholder'=> __('Rows')]) !!}
            </div>
          </div>
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('columns', __('Columns'),['class'=>'']) !!}
              {!! Form::number('columns',null,['class'=>'form-control','placeholder'=> __('Columns')]) !!}
            </div>
          </div>
          <div class="col-4">
            <div class="form-group">
              {!! Form::label('capacity', __('Capacity'),['class'=>'']) !!}
              {!! Form::number('capacity',null,['class'=>'form-control','readonly'=>true,'placeholder'=> __('Capacity')]) !!}
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
@section('js')
<script>
  $(function () {
    'use strict';
    $(document).ready(function() {
      $('#rows').keyup(function(){
        if($('#columns').val() >0){
          $('#capacity').val($(this).val() * $('#columns').val());
        }
      });
      $('#columns').keyup(function(){
        if($('#rows').val() >0){
          $('#capacity').val($(this).val() * $('#rows').val());
        }
      });
    });
  })
</script>
@endSection