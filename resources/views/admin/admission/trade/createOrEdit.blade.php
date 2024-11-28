@extends('admin.layouts.layout')
@section('title',"Admission Trade")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Admission Trade')}}</h3>
        <div class="card-tools">
          <a href="{{route('admission_trade.index')}}" class="btn btn-sm btn-info"><i class="fas fa-arrow-alt-circle-left"></i> Back</a>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if (request()->route()->getName() == 'admission_trade.edit')
        {!! Form::model($admissionTrade, array('route'=>['admission_trade.update',$admissionTrade],'method'=>'PUT','files' => false)) !!}
      @else
        {!! Form::open(array('route'=>['admission_trade.store'],'files' => false)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('name', __('Trade Name'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Trade Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('code', __('Trade Code'),['class'=>'']) !!}
              {!! Form::text('code',null,['class'=>'form-control','placeholder'=> __('Trade Code')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
              {!! Form::select('class_id',$admission_class,null,['class'=>'form-control','placeholder'=> __('Class Name')]) !!}
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
            <div class="form-group">
              {!! Form::label('vacant_seat2', __('Vacant Seat 2nd'),['class'=>'']) !!}
              {!! Form::number('vacant_seat2',null,['class'=>'form-control','placeholder'=> __('Vacant Seat')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('waiting_list', __('Waiting List'),['class'=>'']) !!}
              {!! Form::number('waiting_list',null,['class'=>'form-control','placeholder'=> __('Waiting List')]) !!}
            </div>
          </div>
          <div class="col-6">
            @if (request()->route()->getName() == 'admission_class.edit')
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
