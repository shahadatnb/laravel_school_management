@extends('admin.layouts.layout')
@section('title', __("Final Mark Config"))
@section('css')

@endsection
@section('content')
  <div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Exam Final Mark Configuration')}}</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <table id="example1" class="table table-bordered table-striped table-sm">
        <thead>
        <tr>
          <th>{{__('Class')}}</th>
          <th>{{__('Action')}}</th>
        </tr>
        </thead>
        <tbody id="subject_config_list">
          @foreach ($semesters as $semester)
            <tr>
              <td>{{$semester->name}}</td>
              <td>
                <div class="btn-group">
                  <a href="{{route('exam.config.final_mark_config.edit', $semester->id)}}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
@endsection
@section('js')

<script>   

  </script>
@endsection
