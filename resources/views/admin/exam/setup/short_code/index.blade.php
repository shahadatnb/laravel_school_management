@extends('admin.layouts.layout')
@section('title', __("Short Code"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-4">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Take Short Code')}}</h3>
          <div class="card-tools">
            {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
          </div>
      </div>
      <div class="card-body">
        {!! Form::open(array('route'=>['exam.setup.examShortCode.store'])) !!}
          <div class="form-group">
            {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
            {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
          </div>
          <table class="table table-bordered table-striped table-sm">
            <thead>
              <tr>
                <th>{{__('Select')}}</th>
                <th>{{__('Title')}}</th>
                <th>{{__('Total Marks')}}</th>
                <th>{{__('Pass mark')}}</th>
                <th>{{__('Acceptance')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($shortCodeDefault as $item)
              <tr>
                <td>
                  <input type="checkbox" name="short_code_id[]" value="{{$item->id}}">
                </td>
                <td>{{$item->name}}</td>
                <td>{{$item->total_marks}}</td>
                <td>{{$item->pass_mark}}</td>
                <td>{{$item->acceptance}}</td>
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
          {!! Form::open(array('route'=>['exam.setup.examShortCode.multiple_update'])) !!}
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
              @foreach ($shortCodes as $short_code)
              <tr>
                <td>
                  <input type="checkbox" name="short_code_id[]" value="{{$short_code->id}}">
                </td>
                <td>{{$short_code->semester ? $short_code->semester->name : ''}}</td>
                <td>{{$short_code->default_id}}</td>
                <td>
                  <input type="text" name="code_title[{{$short_code->default_id}}]" value="{{$short_code->code_title}}" class="form-control form-control-sm">
                </td>
                <td>{{$short_code->total_marks}}</td>
                <td>{{$short_code->pass_mark}}</td>
                <td>{{$short_code->acceptance}}</td>
                <td>
                  <form class="delete" action="{{ route('exam.setup.examShortCode.destroy',$short_code->id) }}" method="post">
                    {{ csrf_field() }}
                    {{ method_field('DELETE') }}
                    <button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete This Item?')"><i class="fas fa-trash"></i> </button>
                  </form>
                </td>
              </tr>
              @endforeach
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
  </script>
@endsection
