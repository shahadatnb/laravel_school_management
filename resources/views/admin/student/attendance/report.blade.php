@extends('admin.layouts.layout')
@section('title',__("Students Attendance"))
@section('css')
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
<style>
  .rotate {
    /* height: 100px; */
    white-space: nowrap;
	  width: 0;
    flex: 1 1 0;
  } 
  .rotate > span {
    transform: 
      translate(0px, 110px)
      rotate(-90deg);
  }

  
</style>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'attendance.report','method'=>'get','class'=>'d-print-none row']) !!}
            {{-- <div class="col">
              {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!}
              {!! Form::text('session',null,['class'=>'form-control','placeholder'=> __('Session')]) !!}
            </div> --}}
            <div class="col-6 col-md-2">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Semester/Class')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('section_id',$departments,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Section')]) !!}
            </div>
            <div class="col-6 col-md-2">
              <div class="input-group" id="start_date2" data-target-input="nearest">
                {!! Form::text('start_date',null,['class'=>'form-control form-control-sm datetimepicker-input','required'=>true,'placeholder'=>__('Start Date'),
                'data-target'=>'#start_date2', 'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
                <div class="input-group-append" data-target="#start_date2" data-toggle="datetimepicker">
                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                </div>
              </div>
            </div>
            <div class="col-6 col-md-2">
              <div class="input-group" id="end_date2" data-target-input="nearest">
                {!! Form::text('end_date',null,['class'=>'form-control form-control-sm datetimepicker-input','required'=>true,'placeholder'=>__('End Date'),
                'data-target'=>'#end_date2', 'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
                <div class="input-group-append" data-target="#end_date2" data-toggle="datetimepicker">
                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                </div>
              </div>
            </div>
            <div class="col-6 col-md-2">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success btn-sm"><i class="fas fa-search"></i> Filter</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="window.print()" id="print"><i class="fas fa-print"></i> Print</button>
              </div>              
            </div>
          {!! Form::close() !!}
      <div id="report-header" class="d-none d-print-block">
        <h2 class="text-center">{{__('Students List')}}</h2>
      </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <h2 class="text-center">{{ __('Students Attendance Report') }}</h2>
      <p class="text-center">{{__('Date Range')}}: {{date('d/m/Y', strtotime($data['start_date']))}} - {{date('d/m/Y', strtotime($data['end_date']))}}</p>
      <div class="table-responsive">
        @if(isset($attendances) && count($attendances) > 0)
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th>{{__('Class Roll')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Reg No')}}</th>
              @foreach ($attendances->groupBy('date') as $key => $day)
                  <td class="rotate"><span> {{date('d/m', strtotime($day->first()->date))}}</span></td>
                  @php $days[$key] = $day->pluck('student_id')->toArray() @endphp
              @endforeach
            </tr>
            </thead>
            <tbody>
              {{-- @dd($days) --}}
                @foreach ($students as $item)
                <tr>                    
                    <td>{{$item->class_roll}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->reg_no}}</td>
                    @foreach ($days as $key => $day)
                      <td>
                        @if(in_array($item->id, $day))
                          <span class="badge badge-success"><i class="fas fa-check"></i></span>
                        @else
                          <span class="badge badge-danger"><i class="fas fa-times"></i></span>
                        @endif
                      </td>
                    @endforeach                   
                </tr>
                @endforeach
            </tbody>
        </table>
        @else
          <h3 class="text-center text-danger">{{__('No Data Found')}}</h3>
        @endif
      </div>
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
      $('#start_date2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

      $('#end_date2').datetimepicker({
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
