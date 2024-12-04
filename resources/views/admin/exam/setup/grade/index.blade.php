@extends('admin.layouts.layout')
@section('title', __("Exam Grade"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-4">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Take Exam Grade')}}</h3>
          <div class="card-tools">
            {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
          </div>
      </div>
      <div class="card-body">
        {!! Form::open(array('route'=>['exam.setup.examGrade.store'])) !!}
          <div class="form-group">
            {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
            {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
          </div>
          <table class="table table-bordered table-striped table-sm">
            <thead>
              <tr>
                <th><input class="checkbox" id="selectAll" name="selectAll" type="checkbox"> <label for="selectAll">Attened All</label></th>
                <th>{{__('Grade')}}</th>
                <th>{{__('Grade Range')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($grades as $item)
              <tr>
                <td>
                  <input type="checkbox" name="grade_id[]" value="{{$item->id}}">
                </td>
                <td>{{$item->grade}}</td>
                <td>{{$item->grade_range}}</td>
              </tr>
              @endforeach
            </tbody>
          </table>
          {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        {!! Form::close() !!}
      </div>
    </div>
    </div>
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Short Code List')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          @include('admin.layouts._message')
          <table id="example1" class="table table-bordered table-striped table-sm">
            <thead>
            <tr>
              <th>{{__('Select')}}</th>
              <th>{{__('Class')}}</th>
              <th>{{__('Default ID')}}</th>
              <th>{{__('Short Code Title')}}</th>
              <th>{{__('Total Mark')}}</th>
              <th>{{__('Pass Mark')}}</th>
              <th>{{__('Acceptance')}}</th>
              <th>{{__('Action')}}</th>
            </tr>
            </thead>
            <tbody>
              @foreach ($shortCodes as $grade)              
              {!! Form::open(array('route'=>['exam.setup.examGrade.update',$grade])) !!}
              <tr>
                <td>{{$grade->semester ? $grade->semester->name : ''}}</td>
                <td>
                  <input type="text" name="grade_range" value="{{$grade->grade_range}}" class="form-control form-control-sm">
                </td>
                <td>
                  {{ Form::submit('Update',array('class'=>'btn btn-primary')) }}
                </td>
              </tr>
              {!! Form::close() !!}
              @endforeach
            </tbody>
          </table>
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
  </script>
@endsection
