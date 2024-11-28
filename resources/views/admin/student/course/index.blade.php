@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      <div class="row">
        <div class="col">
          {!! Form::model($data,['route' => 'course.index','method'=>'get','class'=>'d-print-none']) !!}
          <div class="row">
            <div class="col">
              {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Department')]) !!}
            </div>
            <div class="col">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
            </div>
            <div class="col">{{ Form::submit(__('Filter'),array('class'=>'btn btn-success')) }}</div>
          </div>
          {!! Form::close() !!}
        </div>
        <div class="col text-right"><a class="btn btn-primary" href="{{ route('course.create')}}">New Course</a></div>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>ID</th>
              <th>{{__('Code')}}</th>
              <th>{{__('Title')}}</th>
              <th>{{__('Full Marks')}}</th>
              {{-- <th>{{__('Department')}}</th> --}}
              {{-- <th>{{__('Semester')}}</th> --}}
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($courses as $item)
                <tr>
                    <td>{{$item->id}}</td>
                    <td>{{$item->code}}</td>
                    <td>{{$item->title}}</td>
                    <td>{{$item->fullMarks}}</td>
                    {{-- <td>@if($item->department){{$item->department->title}}@endif</td> --}}
                    {{-- <td>@if($item->semester){{$item->semester->title}}@endif</td> --}}
                    <td>
                      <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Action
                        </button>
                        <div class="dropdown-menu">
                          {{-- @if (Auth::user()->hasAnyRole(['Manager','Admin'])) --}}
                          <div class="dropdown-divider"></div>
                            <a href="{{route('student.edit',$item->id)}}" class="dropdown-item"><i class="fas fa-edit"></i> Edit</a>
                            <a href="{{route('student.show',$item->id)}}" class="dropdown-item"><i class="fas fa-eye"></i> Show</a>
                            <div class="dropdown-divider"></div>
                            <form class="delete" action="{{ route('student.destroy',$item->id) }}" method="post">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete This Item?')"><i class="fas fa-trash"></i> Delete</button>
                            </form>
                            {{-- <a onclick="return confirm('Are you sure remove?');" href="{{route('insuranceRemove',$item->id)}}" class="dropdown-item"><i class="fas fa-trash text-danger"></i> Remove</a> --}}
                          {{-- @endif --}}
                        </div>
                      </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      <div class="text-center">{{ $courses->appends($_GET)->links() }}</div>
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
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
