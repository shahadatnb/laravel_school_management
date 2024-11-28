@extends('admin.layouts.layout')
@section('title',__("Course"))
@section('css')
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
@endsection
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Course')}}</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fas fa-minus"></i></button>
        <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
            <i class="fas fa-times"></i></button>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if ($mode == 'edit')
        {!! Form::model($course, array('route'=>['course.update',$course],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['course.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('code', __('Course Code'),['class'=>'']) !!}
              {!! Form::text('code',null,['class'=>'form-control','placeholder'=> __('Course Code')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
            {!! Form::label('title', __('Course Title'),['class'=>'']) !!}
            {!! Form::text('title',null,['class'=>'form-control','placeholder'=> __('Course Title')]) !!}
            </div>
          </div>
        </div>   
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('writenMarks', __('Writen Marks'),['class'=>'']) !!}
              {!! Form::number('writenMarks',null,['class'=>'form-control','placeholder'=> __('Writen Marks')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
            {!! Form::label('practicalMarks', __('Practical Marks'),['class'=>'']) !!}
            {!! Form::number('practicalMarks',null,['class'=>'form-control','placeholder'=> __('Practical Marks')]) !!}
            </div>
          </div>
        </div>   
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('department_id', __('Department'),['class'=>'']) !!}
              {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Department')]) !!}
              </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('semester_id', __('Semester'),['class'=>'']) !!}
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
              </div>
          </div>
        </div>   

      </div>
      {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      {!! Form::close() !!}
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{ asset('assets/admin/plugins/moment/moment.min.js') }}"> </script>
<!-- Tempusdominus -->
<script src="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"> </script>
<script>
  (function ($) {
    $(document).ready(function() {
        $('#dateOfBirth2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

        $('#presentZila').change(function(){
          $.get($(this).data('url'), {
                option: $(this).val()
            },
            function(data) {
                var subcat = $('#presentUpazila');
                subcat.empty();
                subcat.append("<option value=''>-----</option>")
                $.each(data, function(index, element) {
                    subcat.append("<option value='"+ element.id +"'>" + element.name + "</option>");
                });
            });
        });

        $('#permanentZila').change(function(){
          $.get($(this).data('url'), {
                option: $(this).val()
            },
            function(data) {
                var subcat = $('#permanentUpazila');
                subcat.empty();
                subcat.append("<option value=''>-----</option>")
                $.each(data, function(index, element) {
                    subcat.append("<option value='"+ element.id +"'>" + element.name + "</option>");
                });
            });
        });

    } );
    })(jQuery)
  </script>
@endsection