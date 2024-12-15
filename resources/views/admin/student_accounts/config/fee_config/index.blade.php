@extends('admin.layouts.layout')
@section('title', __("Fee Config"))
@section('css')

@endsection
@section('content')
{!! Form::open(array('route'=>['sac.config.save_fee_config'])) !!}
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Fee Amount Configuration Here')}}</h3>
      <div class="card-tools">
      </div>
  </div>
  <div class="card-body">
    <div class="row">
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('academic_year_id', __('Academic Year'),['class'=>'']) !!}
          {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Academic Year')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
          {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('group_id', __('Group Name'),['class'=>'']) !!}
          {!! Form::select('group_id', $groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('category_id', __('Category Name'),['class'=>'']) !!}
          {!! Form::select('category_id', $categories,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Category Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('head_id', __('Head Name'),['class'=>'']) !!}
          {!! Form::select('head_id', $heads,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Head Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <button type="button" id="get_config" class="btn btn-primary btn-sm btn-block">Search</button>
      </div>
    </div>
  </div>
</div>
  <div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Fee Amount Configuration')}}</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <table id="example1" class="table table-bordered table-striped table-sm">
        <thead>
        <tr>
          <th>{{__('Check')}}</th>
          <th>{{__('Fee SubHead')}}</th>
          <th>{{__('Fee Amount')}}</th>
          <th>{{__('Fine Amount')}}</th>
        </tr>
        </thead>
        <tbody id="fee_config_list">
          
        </tbody>
      </table>
    </div>
  </div>
  {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
{!! Form::close() !!}
@endsection
@section('js')

<script>   

  </script>
@endsection
