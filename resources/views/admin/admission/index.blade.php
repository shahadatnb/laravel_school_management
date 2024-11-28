@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'admission.index','method'=>'get','class'=>'d-print-none row']) !!}
            {{-- <div class="col">
              {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Technology')]) !!}
            </div> --}}
            <div class="col">
              {!! Form::select('class_id',$admission_class,null,['class'=>'form-control select2','id'=>'class_id','placeholder'=> __('Class')]) !!}
            </div>
            <div class="col" id="admission_trades">
              @if($admission_trades)
              {!! Form::select('trade_id',$admission_trades,null,['class'=>'form-control select2','placeholder'=> __('Trade')]) !!}
              @endif
            </div>
            <div class="col">
              {!! Form::select('shift',['1st'=>'1st Shift','2nd'=>'2nd Shift'],null,['class'=>'form-control','placeholder'=> __('Shift')]) !!}
            </div>
            {{-- <div class="col">
              {!! Form::select('student_group',['A'=>'A','B'=>'B'],null,['class'=>'form-control','placeholder'=> __('Group')]) !!}
            </div> --}}
            {{-- <div class="col">
              {!! Form::text('probidhan',null,['class'=>'form-control','placeholder'=> __('Probidhan')]) !!}
            </div> --}}
            <div class="col">
              {!! Form::text('mobile',null,['class'=>'form-control','placeholder'=> __('Mobile')]) !!}
            </div>
            <div class="col">
              {!! Form::label('form_filup', __('Filup'),['class'=>'mb-1']) !!}
              {{ Form::checkbox('form_filup',1,null) }}
            </div>
            <div class="col">
              {!! Form::label('final_submit', __('Final'),['class'=>'mb-1']) !!}
              {{ Form::checkbox('final_submit',1,null) }}
            </div>
            <div class="col">
              {!! Form::label('paymentStatus', __('Payment'),['class'=>'mb-1']) !!}
              {{ Form::checkbox('paymentStatus',1,null) }}
            </div>
            <div class="col">
              {!! Form::label('selected', __('Selected'),['class'=>'mb-1']) !!}
              {{ Form::checkbox('selected',1,null) }}
            </div>
            <div class="col">
              {!! Form::label('admitted', __('Admitted'),['class'=>'mb-1']) !!}
              {{ Form::checkbox('admitted',1,null) }}
            </div>
            <div class="col-12">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
                {{-- {{ Form::submit(__('Filter'),array('class'=>'btn btn-sm btn-success')) }} --}}
                <a class="btn btn-primary" href="{{ route('student.create')}}"><i class="fas fa-plus"></i> New</a>
              </div>
              Total Student : {{ $students->total() }}
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
              <th>ID</th>
              <th class="not-exported d-print-none">Action</th>
              <th class="not-exported">{{__('Photo')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Class')}}</th>
              <th>{{__('Shift')}}</th>
              <th>{{__('Sex')}}</th>
              <th>{{__('Mobile')}}</th>
              <th>{{__('Father Name')}}</th>
              <th>{{__('Mother Name')}}</th>
              <th>{{__('Gardian Mobile')}}</th>
              <th>{{__('Present Address')}}</th>
              <th>{{__('Permanent Address')}}</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($students as $item)
                <tr>
                    <td>{{$item->id}}</td>
                    <td class="d-print-none not-exported">
                      <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <i class="fas fa-bars"></i>
                        </button>
                        <div class="dropdown-menu">
                          {{-- @if (Auth::user()->hasAnyRole(['Manager','Admin'])) --}}
                          <div class="dropdown-divider"></div>
                            <a href="{{route('admission.edit',$item->id)}}" class="dropdown-item"><i class="fas fa-edit"></i> Edit</a>
                            <a href="{{route('admission.show',$item->id)}}" class="dropdown-item"><i class="fas fa-eye"></i> Show</a>
                            {{-- <a href="{{route('admissionForm',$item->id)}}" class="dropdown-item"><i class="fas fa-file-pdf"></i> Download</a> --}}
                            <div class="dropdown-divider"></div>
                            <form class="delete" action="{{ route('admission.destroy',$item->id) }}" method="post">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Reject This Application?')"><i class="fas fa-trash"></i> Reject</button>
                            </form>
                            {{-- <a onclick="return confirm('Are you sure remove?');" href="{{route('insuranceRemove',$item->id)}}" class="dropdown-item"><i class="fas fa-trash text-danger"></i> Remove</a> --}}
                          {{-- @endif --}}
                        </div>
                      </div>
                    </td>
                    <td class="not-exported"><img width="80" src="{{asset('/storage/'.$item->photo)}}" alt=""></td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->semester?$item->semester->name:''}}</td>
                    <td>{{$item->shift}}</td>
                    <td>{{$item->sex}}</td>
                    <td>{{$item->mobile}}</td>
                    <td>{{$item->fathersName}}</td>
                    <td>{{$item->mothersName}}</td>
                    <td>{{$item->mobileFather}}</td>
                    <td>{{$item->presentVillage}}, {{$item->presentPost}}, 
                      {{$item->presentUpazilaName?$item->presentUpazilaName->name:''}}, 
                      {{$item->presentZilaName?$item->presentZilaName->name:''}}
                    </td>
                    <td>{{$item->permanentVillage}}, {{$item->permanentPost}}, 
                      {{$item->permanentUpazilaName?$item->permanentUpazilaName->name:''}}, 
                      {{$item->permanentZilaName?$item->permanentZilaName->name:''}}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
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

        $("#class_id").change(function(){
          $("#admission_trades").empty();
          let url = "{{route('admission_trades')}}?class_id="+$(this).val();
          $.get(url, {
              
            },
            function(data) {
              console.log(data);
              if(data.status == true){
                $("#admission_trades").append(`
                  <select class="form-control" required="" id="trade_id" name="trade_id"><option selected="selected" value="">Select Trade</option></select>
                `);
                  data.trades.forEach(function(element){
                    $("#trade_id").append("<option value='"+ element.id +"'>" + element.name + "</option>");
                  });
              }
            });
          
        });
    });
  </script>
@endsection
