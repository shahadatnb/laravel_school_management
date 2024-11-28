@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'admission_result.index','method'=>'get','id'=>'admission_result','class'=>'d-print-none row']) !!}
            <div class="col">
              {!! Form::select('class_id',$admission_class,null,['class'=>'form-control select2','id'=>'class_id','placeholder'=> __('Class')]) !!}
            </div>
            <div class="col {{$data['priority'] == '' ? 'd-none' : ''}}" id="choose_department">
              {!! Form::select('priority',['1'=>'1st','2'=>'2nd','3'=>'3rd','4'=>'4th'],null,['class'=>'form-control','id'=>'priority','required'=>false,'placeholder'=> __('Choose')]) !!}
            </div>
            <div class="col" id="admission_trades">
              @if($admission_trades)
              {!! Form::select('trade_id',$admission_trades,null,['class'=>'form-control select2','placeholder'=> __('Trade')]) !!}
              @endif
            </div>
            <div class="col">
              {!! Form::select('quota_id',$quotas,null,['class'=>'form-control','id'=>'quota_id','placeholder'=> __('Quata')]) !!}
            </div>
            <div class="col">
              {!! Form::select('shift',['1st Shift'=>'1st Shift','2nd Shift'=>'2nd Shift'],null,['class'=>'form-control','required'=>true,'id'=>'shift']) !!}
            </div>
            <div class="col">
              {!! Form::select('result_type',['Merit'=>'Merit','Waiting'=>'Waiting'],null,['class'=>'form-control','required'=>true,'id'=>'result_type']) !!}
            </div>
            
            <div class="col">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
                {{-- {{ Form::submit(__('Filter'),array('class'=>'btn btn-sm btn-success')) }} --}}
                <button id="lottery" type="button" class="btn btn-primary" ><i class="fas fa-plus"></i> Lottery</button>
                <button id="lottery_waiting" type="button" class="btn btn-danger" ><i class="fas fa-plus"></i> Waiting</button>
              </div>
              Total Student : {{$students? $students->total():'' }}
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
              <th>Position</th>
              <th>S.ID</th>
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
                    <td>{{$item->result->sl}}</td>
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

      $('#lottery').click(function(){
        let class_id = $('#class_id').val();
        let shift = $('#shift').val();

        //$("#errorMsg").empty();
        fetch("{{route('admission_result.store')}}", {
            method: 'post',
            credentials: "same-origin",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                "X-Requested-With":'XMLHttpRequest'
            },
            body: new FormData(document.getElementById('admission_result'))
        }).then(function(response){
            return response.json();
        }).then(function(json){
            if(json.status == false){
              //console.log('error');
                // json.errors.forEach(function(element){
                //     $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
                // });
            }else{
                //console.log(json);
                $('#admission_result').submit();
            }

        })
        .catch(function(error){});
      });

      $('#lottery_waiting').click(function(){
        let class_id = $('#class_id').val();
        let shift = $('#shift').val();

        //$("#errorMsg").empty();
        fetch("{{route('application.store_waiting')}}", {
            method: 'post',
            credentials: "same-origin",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                "X-Requested-With":'XMLHttpRequest'
            },
            body: new FormData(document.getElementById('admission_result'))
        }).then(function(response){
            return response.json();
        }).then(function(json){
            if(json.status == false){
              //console.log('error');
                // json.errors.forEach(function(element){
                //     $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
                // });
            }else{
                //console.log(json);
                $('#admission_result').submit();
            }

        })
        .catch(function(error){});
      });

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

        $( document ).ready(function() {
          if($("#class_id").val() == 4){
            $("#priority").attr("required", "required");
            $("#choose_department").removeClass("d-none");
          }
        });

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
                $("#priority").attr("required", "required");
                $("#choose_department").removeClass("d-none");
              }else{
                $("#priority").removeAttr("required");
                $("#priority").val('');
                $("#choose_department").addClass("d-none");
              }
            });
        });
    });
  </script>
@endsection
