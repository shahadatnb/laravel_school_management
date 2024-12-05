@extends('admin.layouts.layout')
@section('title', __("Exam Subject Config"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-4">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Choose Subjects')}}</h3>
          <div class="card-tools">
            {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
          </div>
      </div>
      <div class="card-body">
        {!! Form::open(array('route'=>['exam.config.subject.store'])) !!}
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
              {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('group_id', __('Group Name'),['class'=>'']) !!}
              {!! Form::select('group_id', $groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group Name')]) !!}
            </div>
          </div>
        </div>
        @foreach ($subjects as $subject)
          <div class="form-group">
            <div class="custom-control custom-checkbox"></div>
              <input class="custom-control-input" type="checkbox" name="subject_ids[]" value="{{$subject->id}}" id="subject_id{{$subject->id}}">
              <label for="subject_id{{$subject->id}}" class="custom-control-label">{{$subject->name}}</label>
            </div>
          </div>
        @endforeach

          {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        {!! Form::close() !!}
      </div>
    </div>
    </div>
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Subject Configuration List')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          @include('admin.layouts._message')
          {!! Form::open(array('route'=>['exam.config.subject.mass_update'])) !!}
          <table id="example1" class="table table-bordered table-striped table-sm">
            <thead>
            <tr>
              <th>{{__('Subject')}}</th>
              <th>{{__('Subject Type')}}</th>
              <th>{{__('Subject Serial')}}</th>
              <th>{{__('Merge ID')}}</th>
              <th>{{__('Action')}}</th>
            </tr>
            </thead>
            <tbody id="subject_config_list">
              
            </tbody>
          </table>
          {{ Form::submit('Update',array('class'=>'btn btn-primary')) }}
          {!! Form::close() !!}
        </div>
      </div>
    </div>
  </div>

@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script>
    $(function () {
      $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
      });
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
      });
    });
    $("#class_id").change(function(){
      $("#group_id").prop('selectedIndex',0);
    });
  </script>
@endsection
