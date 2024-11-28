@extends('admin.layouts.layout')
@section('title',__("Student"))
@section('css')
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
@endsection
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Student')}}</h3>
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
        {!! Form::model($student, array('route'=>['student.update',$student],'method'=>'PUT','files' => true)) !!}
      @else
        {!! Form::open(array('route'=>['student.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-9">
            <div class="form-group">
              {!! Form::label('name', __('Name Of Student'),['class'=>'']) !!}
              {!! Form::text('name',null,['class'=>'form-control','placeholder'=> __('Name Of Student')]) !!}
            </div>
          </div>
          <div class="col-3">
            <div class="form-group">
            {!! Form::label('department_id', __('Department'),['class'=>'']) !!}
            {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Department')]) !!}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('fathersName', __('Father`s Name'),['class'=>'']) !!}
              {!! Form::text('fathersName',null,['class'=>'form-control','placeholder'=> __('Father`s Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
            {!! Form::label('mothersName', __('Mother`s Name'),['class'=>'']) !!}
            {!! Form::text('mothersName',null,['class'=>'form-control','placeholder'=> __('Mother`s Name')]) !!}
            </div>
          </div>
        </div>
        <h5 class="mt-2 mb-2">{{__('Present Address')}}</h5>
        <div class="row">
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('presentVillage', __('Village'),['class'=>'']) !!}
                  {!! Form::text('presentVillage',null,['class'=>'form-control','placeholder'=> __('Village')]) !!}
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('presentPost', __('Post Office'),['class'=>'']) !!}
                  {!! Form::text('presentPost',null,['class'=>'form-control','placeholder'=> __('Post Office')]) !!}
                </div>
              </div>
            </div>
          </div>
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('presentZila', __('Zila'),['class'=>'']) !!}
                  {!! Form::select('presentZila',$locations,null,['class'=>'form-control select2','data-url'=> route('childLocation'),'placeholder'=> __('Zila')]) !!}
                </div>
              </div>
              <div class="col-6">
                {!! Form::label('presentUpazila', __('Upazila')) !!}
                  {!! Form::select('presentUpazila',$presentUpazila,null,['class'=>'form-control select2','placeholder'=> __('Upazila')]) !!}
              </div>
            </div>
          </div>
        </div>
        <h5 class="mt-2 mb-2">{{__('Permanent Address')}}</h5>
        <div class="row">
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('permanentVillage', __('Village'),['class'=>'']) !!}
                  {!! Form::text('permanentVillage',null,['class'=>'form-control','placeholder'=> __('Village')]) !!}
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('permanentPost', __('Post Office'),['class'=>'']) !!}
                  {!! Form::text('permanentPost',null,['class'=>'form-control','placeholder'=> __('Post Office')]) !!}
                </div>
              </div>
            </div>
          </div>
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('permanentZila', __('Zila'),['class'=>'']) !!}
                  {!! Form::select('permanentZila',$locations,null,['class'=>'form-control select2','data-url'=> route('childLocation'),'placeholder'=> __('Zila')]) !!}
                </div>
              </div>
              <div class="col-6">
                {!! Form::label('permanentUpazila', __('Upazila')) !!}
                  {!! Form::select('permanentUpazila',$permanentUpazila,null,['class'=>'form-control select2','placeholder'=> __('Upazila')]) !!}
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('dateOfBirth', __('Date of Birth'),['class'=>'']) !!}
                  <div class="input-group" id="dateOfBirth2" data-target-input="nearest">
                    {!! Form::text('dateOfBirth',null,['class'=>'form-control datetimepicker-input','placeholder'=>__('Date of Birth'),
                    'data-target'=>'#dateOfBirth2', 'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
                    <div class="input-group-append" data-target="#dateOfBirth2" data-toggle="datetimepicker">
                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group">
                  {!! Form::label('shift', __('Educational Qualification'),['class'=>'']) !!}
                  {!! Form::text('shift',null,['class'=>'form-control','placeholder'=> __('Educational Qualification')]) !!}
                </div>
              </div>
            </div>
          </div>
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                {!! Form::label('sex', __('Sex'),['class'=>'']) !!}
                {!! Form::select('sex',['Male'=>'Male','Female'=>'Female','Others'=>'Others'],null,['class'=>'form-control','placeholder'=> __('Sex')]) !!}
              </div>
              <div class="col-6">
                {!! Form::label('student_mobile', __('student_mobile'),['class'=>'']) !!}
                {!! Form::text('student_mobile',null,['class'=>'form-control','placeholder'=> __('student_mobile')]) !!}
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('student_group', __('student_group'),['class'=>'']) !!}
              {!! Form::text('student_group',null,['class'=>'form-control','placeholder'=> __('student_group')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="row">
              <div class="col-6">
                {!! Form::label('gardian_student_mobile', __('gardian_student_mobile'),['class'=>'']) !!}
                {!! Form::text('gardian_student_mobile',null,['class'=>'form-control','placeholder'=> __('gardian_student_mobile')]) !!}
              </div>
              <div class="col-6">
                {!! Form::label('photo', __('Select Photo'),['class'=>'']) !!}
                {!! Form::file('photo',null,['class'=>'form-control']) !!}
              </div>
            </div>
          </div>
        </div>

      </div>
      {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      {!! Form::close() !!}
    <!-- /.card-body -->
    <div class="card-footer">
      @if ($mode == 'edit')
        <div class="row">
          <div class="col-6">
            <h3>ফি প্রদান</h3>
            <table class="table">
              <tr>
                <th>ID</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </table>
          </div>
          <div class="col-6">
            <h3>ফি সম্পন্ন হওয়ার তালিকা</h3>
            <ul>
              @foreach ($student->marks as $item)
                  <li>{{$item->semester->title}} @if ($item->paid_confirm == 1)
                    সম্পন্ন
                    @else
                    <a href="#">সম্পন্ন করুন</a>
                  @endif
                </li>
              @endforeach
            </ul>
          </div>
        </div>
        @endif
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