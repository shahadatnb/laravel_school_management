@extends('admin.layouts.layout')
@section('title',__("Students Attendance"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
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
              {!! Form::select('department_id',$departments,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Department')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Semester/Class')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('shift',['1st'=>'1st Shift','2nd'=>'2nd Shift'],null,['class'=>'form-control form-control-sm','placeholder'=> __('Shift')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('student_group',['A'=>'A','B'=>'B'],null,['class'=>'form-control form-control-sm','placeholder'=> __('Group')]) !!}
            </div>
            <div class="col-3 col-md-1">
              {!! Form::text('reg_no',null,['class'=>'form-control form-control-sm','placeholder'=> __('Reg No')]) !!}
            </div>
            <div class="col-3 col-md-1">
              {!! Form::text('class_roll',null,['class'=>'form-control form-control-sm','placeholder'=> __('Class Roll')]) !!}
            </div>
            <div class="col-6 col-md-2">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success btn-sm"><i class="fas fa-search"></i> Filter</button>
                {{-- {{ Form::submit(__('Filter'),array('class'=>'btn btn-sm btn-success')) }} --}}
                <a class="btn btn-primary btn-sm" href="{{ route('student.create')}}"><i class="fas fa-plus"></i> New</a>
              </div>              
            </div>
          {!! Form::close() !!}
      <div id="report-header" class="d-none d-print-block">
        <h2 class="text-center">{{__('Students List')}}</h2>
      </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')        
      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th>{{__('Class Roll')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Reg No')}}</th>
              <th>{{__('Action')}}</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($students as $item)
                <tr>                    
                    <td>{{$item->class_roll}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->reg_no}}</td>                    
                    <td>
                      
                    </td>                    
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
</div>
<!-- /.card -->
@endsection
@section('js')
{{-- <script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script> --}}
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>
<script>
    $(function () {
      // $("#example1").DataTable({
      //   "responsive": true,
      //   "autoWidth": false,
      // });

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
