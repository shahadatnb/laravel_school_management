@extends('admin.layouts.layout')
@section('title',"Exam Students")
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
  <div class="card-header d-print-none">
    {!! Form::model($data,['route' => 'examStudent.index','method'=>'get','class'=>'d-print-none row']) !!}
    <div class="row">
      <div class="col">
        {{-- {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!} --}}
        {!! Form::text('session',null,['class'=>'form-control','placeholder'=> __('Session')]) !!}
      </div>
      <div class="col">
        {!! Form::select('technology',$departments,null,['class'=>'form-control select2','placeholder'=> __('Technology')]) !!}
      </div>
      <div class="col">
        {!! Form::select('semester',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
      </div>
      <div class="col">
        {!! Form::select('shift',['1st'=>'1st Shift','2nd'=>'2nd Shift'],null,['class'=>'form-control','placeholder'=> __('Shift')]) !!}
      </div>
      <div class="col">
        {!! Form::select('student_group',$groups,null,['class'=>'form-control','placeholder'=> __('Group')]) !!}
      </div>
      <div class="col">
        {!! Form::select('status',['Regular'=>'Regular','Irregular'=>'Irregular'],null,['class'=>'form-control','placeholder'=> __('Status')]) !!}
      </div>
      <div class="col">
        {!! Form::select('probidhan',$probidhans,null,['class'=>'form-control','placeholder'=> __('Probidhan')]) !!}
      </div>
    </div>
    <div class="row">
      <div class="col">
        {!! Form::text('reg_no',null,['class'=>'form-control','placeholder'=> __('Reg No')]) !!}
      </div>
      <div class="col">
        {!! Form::text('class_roll',null,['class'=>'form-control','placeholder'=> __('class_roll')]) !!}
      </div>
      <div class="col">
        {!! Form::select('institute',$institutes,null,['class'=>'form-control','placeholder'=> __('Institute')]) !!}
      </div>
      <div class="col">
        {!! Form::text('ref_subject',null,['class'=>'form-control','placeholder'=> __('Ref Subject')]) !!}
      </div>
      <div class="col">
        {!! Form::text('remark',null,['class'=>'form-control','placeholder'=> __('Remark')]) !!}
      </div>
      <div class="col-4">
        <div class="btn btn-group">
          <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
          {{-- {{ Form::submit(__('Filter'),array('class'=>'btn btn-sm btn-success')) }} --}}
          <a class="btn btn-primary" href="{{ route('student.create')}}"><i class="fas fa-plus"></i> New</a>
          <button type="button" class="btn btn-default" id="print">Total Student : {{ $students->total() }}</button>
        </div>        
      </div>
    </div>
    {!! Form::close() !!}
<div id="report-header" class="d-none d-print-block">
  <h2 class="text-center">{{__('Students List')}}</h2>
</div>
</div>
    <div class="card-body">
      @include('admin.layouts._message')
      {{ Form::open(array('route'=>'exam.student.import','method'=>'POST','files' => true)) }}
        <div class="form-group">
          <div class="input-group">
            <div class="custom-file">
              {!! Form::file('file',['class'=>'form-control','required'=>true]) !!}
            </div>
            <div class="input-group-append">
              <button type="submit" class="btn btn-primary"><i class="fas fa-upload"></i> Import</button>
              <a href="{{ asset('assets/examStudents.xlsx'); }}" class="btn btn-info"><i class="fas fa-file-excel"></i> Template</a>
            </div>
          </div>
        </div>
        {{ Form::close() }}

      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>class_roll</th>
              <th>Reg No</th>
              <th>Session</th>
              <th>Sem</th>
              <th>Technology</th>
              <th>Shift</th>
              <th>Group</th>
              <th>Probidhan</th>
              <th>Ref Subject</th>
              <th>Institute</th>
              <th>Status</th>
              <th>Remark</th>
              <th>#</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($students as $item)
                <tr>
                    <td>{{$item->id}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->class_roll}}</td>
                    <td>{{$item->reg_no}}</td>
                    <td>{{$item->session}}</td>
                    <td>{{$item->semester}}</td>
                    <td>{{$item->technology}}</td>
                    <td>{{$item->shift}}</td>
                    <td>{{$item->student_group}}</td>
                    <td>{{$item->probidhan}}</td>
                    <td>{{$item->ref_subject}}</td>
                    <td>{{$item->institute}}</td>
                    <td>{{$item->status}}</td>
                    <td>{{$item->remark}}</td>
                    <td>
                      <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="fas fa-bars"></i>
                        </button>
                        <div class="dropdown-menu">
                          {{-- @if (Auth::user()->hasAnyRole(['Manager','Admin'])) --}}
                          <div class="dropdown-divider"></div>
                            <a href="{{route('examStudent.edit',$item->id)}}" class="dropdown-item"><i class="fas fa-edit"></i> Edit</a>
                            <div class="dropdown-divider"></div>
                            <form class="delete" action="{{ route('examStudent.destroy',$item->id) }}" method="post">
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
        {{ $students->links() }}
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>
<script>
    $(function () {
      var header = $('#report-header').html();
		
        $('#student').DataTable( {
            dom: '<"row d-print-none"<"col"B><"col"f><"col text-right"l>>tip',
            buttons: [
				'copy',
				{
                extend: 'excel',
					text: '<i title="Excel" class="far fa-file-excel"></i>',
                	messageTop: header,
                  exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                  },
            	},
                {
					extend: 'pdfHtml5',	//pdf
					text: '<i title="PDF" class="far fa-file-pdf"></i>',
					messageTop: header,
					exportOptions: {
						columns: ':visible:Not(.not-exported)',
						rows: ':visible'
					},
				},
				{
					extend: 'print',
					text: '<i title="Print" class="fas fa-print"></i>',
					messageTop: header,
					title: '',
					exportOptions: {
						columns: ':visible:Not(.not-exported)',
						rows: ':visible'
					},
					messageBottom: null
				},
				{
                  extend: 'colvis',
                  text: '<i title="column visibility" class="fa fa-eye"></i>',
                  columns: ':gt(0)'
              },
            ],
            "paging":   false,
            //"ordering": false,
        } );
    });
  </script>
@endsection
