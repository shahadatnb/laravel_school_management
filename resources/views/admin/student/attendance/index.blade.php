@extends('admin.layouts.layout')
@section('title',__("Students Attendance"))
@section('css')
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'attendance.index','method'=>'get','class'=>'d-print-none row']) !!}
            {{-- <div class="col">
              {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!}
              {!! Form::text('session',null,['class'=>'form-control','placeholder'=> __('Session')]) !!}
            </div> --}}
            <div class="col-6 col-md-2">
              {!! Form::select('section_id',$sections,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Section')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('category_id',$catetories,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Category')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('group_id',$groups,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Group')]) !!}
            </div>

            <div class="col-6 col-md-2">
              <div class="input-group" id="date2" data-target-input="nearest">
                {!! Form::text('date',null,['class'=>'form-control form-control-sm datetimepicker-input','required'=>true,'placeholder'=>__('Date'),
                'data-target'=>'#date2', 'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
                <div class="input-group-append" data-target="#date2" data-toggle="datetimepicker">
                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                </div>
              </div>
            </div>
            <div class="col-6 col-md-2">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success btn-sm"><i class="fas fa-search"></i> Filter</button>
              </div>              
            </div>
          {!! Form::close() !!}
      <div id="report-header" class="d-none d-print-block">
        <h2 class="text-center">{{__('Students List')}}</h2>
      </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')  
      {!! Form::open(['route' => 'attendance.store','method'=>'post','class'=>'promote_form']) !!}
      <input type="hidden" name="date" value="{{ $data['date'] }}">
      <input type="hidden" name="category_id" value="{{ $data['category_id'] }}">
      <input type="hidden" name="section_id" value="{{ $data['section_id'] }}">
      <input type="hidden" name="group_id" value="{{ $data['group_id'] }}">
      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th>{{__('Class Roll')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Reg No')}}</th>
              <th>
                <input class="checkbox" id="selectAll" name="selectAll" type="checkbox"> <label for="selectAll">Attened All</label>
              </th>
            </tr>
            </thead>
            <tbody>
              {{-- @dd($attendances) --}}
                @foreach ($students as $item)
                <tr>                    
                    <td>{{$item->class_roll}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->reg_no}}</td>
                    <td>
                      <input type="hidden" name="student_id[]" value="{{$item->id}}">
                      <input class="student_list" name="student_list[]" type="checkbox" {{ in_array($item->id, $attendances) ? 'checked' : ''}} value="{{$item->id}}">
                    </td>                    
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
      <button type="submit" class="btn btn-primary d-print-none"><i class="fas fa-check"></i> {{__('Save Attendance')}}</button>
      {!! Form::close() !!}
    </div>
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{ asset('assets/admin/plugins/moment/moment.min.js') }}"> </script>
<!-- Tempusdominus -->
<script src="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"> </script>
<script>
    $(function () {
      $('#date2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

      $(':checkbox[name=selectAll]').click (function () {
        //$(':checkbox[name=student_list]').prop('checked', this.checked);
        $('.student_list').prop('checked', this.checked);
      });
    });
  </script>
@endsection
