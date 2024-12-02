@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'student.student.index','method'=>'get','class'=>'d-print-none row']) !!}
            {{-- <div class="col">
              {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!}
              {!! Form::text('session',null,['class'=>'form-control','placeholder'=> __('Session')]) !!}
            </div> --}}
            <div class="col-6 col-md-2">
              {!! Form::select('section_id',$sections,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Section')]) !!}
            </div>
            <div class="col-6 col-md-2">
              {!! Form::select('group_id',$groups,null,['class'=>'form-control form-control-sm','placeholder'=> __('Group')]) !!}
            </div>
            {{-- <div class="col-6 col-md-2">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control form-control-sm select2','placeholder'=> __('Semester/Class')]) !!}
            </div> --}}
            <div class="col-6 col-md-2">
              {!! Form::select('category_id',$catetories,null,['class'=>'form-control form-control-sm','placeholder'=> __('Category')]) !!}
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
                {{-- Total: {{ $students->total() }} --}}
                <a class="btn btn-primary btn-sm" href="{{ route('student.student.create')}}"><i class="fas fa-plus"></i> New</a>
              </div>              
            </div>
          {!! Form::close() !!}
      <div id="report-header" class="d-none d-print-block">
        <h2 class="text-center">{{__('Students List')}}</h2>
      </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      {{ Form::open(array('route'=>'student.student.import','method'=>'POST','class'=>'row mb-3','files' => true)) }}
        <div class="col-6">
          <div class="row">
            <div class="col-4">
              {!! Form::select('section_id',$sections,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Section')]) !!}
            </div>
            <div class="col-4">
              {!! Form::select('group_id',$groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group')]) !!}
            </div>
            <div class="col-4">
              {!! Form::select('category_id',$catetories,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Category')]) !!}
            </div>
          </div>
        </div>
        <div class="col-6">
        <div class="row">
          <div class="input-group">
            <div class="col-6">
              {!! Form::file('file',['class'=>'form-control form-control-sm','required'=>true]) !!}
            </div>
            <div class="btn-group">
              <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-upload"></i> Import</button>
              <a href="{{ asset('assets/students.xlsx'); }}" class="btn btn-info btn-sm"><i class="fas fa-file-excel"></i> Template</a>
            </div>
          </div>
        </div>
        </div>
      {{ Form::close() }}
        
      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              {{-- <th>ID</th> --}}
              <th class="not-exported d-print-none">Action</th>
              <th class="not-exported">{{__('Photo')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Class Roll')}}</th>
              <th>{{__('Reg No')}}</th>
              <th>{{__('Class')}}</th>
              <th>{{__('Section')}}</th>
              <th>{{__('Group')}}</th>
              <th>{{__('Category')}}</th>
              <th>{{__('Sex')}}</th>
              <th>{{__('Mobile')}}</th>
              <th>{{__('Father Name')}}</th>
              <th>{{__('Mother Name')}}</th>
              <th>{{__('Gardian Mobile')}}</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($students as $item)
                <tr>
                    {{-- <td>{{$item->id}}</td> --}}
                    <td class="d-print-none not-exported">
                      <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <i class="fas fa-bars"></i>
                        </button>
                        <div class="dropdown-menu">
                          {{-- @if (Auth::user()->hasAnyRole(['Manager','Admin'])) --}}
                          <div class="dropdown-divider"></div>
                            {{-- <a href="{{route('student.payments',$item->id)}}" class="dropdown-item"><i class="fas fa-money-bill-alt"></i> Payment</a> --}}
                            <a href="{{route('student.student.edit',$item->id)}}" class="dropdown-item"><i class="fas fa-edit"></i> Edit</a>
                            <a href="{{route('student.student.show',$item->id)}}" class="dropdown-item"><i class="fas fa-eye"></i> Show</a>
                            <a href="{{route('student.admissionForm',$item->id)}}" class="dropdown-item"><i class="fas fa-file-pdf"></i> Download</a>
                            <div class="dropdown-divider"></div>
                            <form class="delete" action="{{ route('student.student.destroy',$item->id) }}" method="post">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete This Item?')"><i class="fas fa-trash"></i> Delete</button>
                            </form>
                            {{-- <a onclick="return confirm('Are you sure remove?');" href="{{route('insuranceRemove',$item->id)}}" class="dropdown-item"><i class="fas fa-trash text-danger"></i> Remove</a> --}}
                          {{-- @endif --}}
                        </div>
                      </div>
                    </td>
                    <td class="not-exported"><img width="80" src="{{asset('/storage/'.$item->photo)}}" alt=""></td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->class_roll}}</td>
                    <td>{{$item->reg_no}}</td>
                    <td>{{$item->semester? $item->semester->name : '' }}</td>
                    <td>{{$item->section? $item->section->name : '' }}</td>
                    <td>{{$item->group? $item->group->name : '' }}</td>
                    <td>{{$item->category? $item->category->name : '' }}</td>
                    <td>{{$item->sex}}</td>
                    <td>{{$item->mobile}}</td>
                    <td>{{$item->fathersName}}</td>
                    <td>{{$item->mothersName}}</td>
                    <td>{{$item->mobileFather}}</td>                    
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      <div class="text-center">{{ $students->appends($_GET)->links() }}</div>
    </div>
    <!-- /.card-footer-->
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
