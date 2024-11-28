@extends('admin.layouts.layout')
@section('title',"Income List")
@section('css')
{{-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> --}}
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
<style>  
  @media print {
      .dt-buttons, .dataTables_filter {
          display: none;
      }

  }
</style>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      {!! Form::model($data,['route' => 'incomeList','method'=>'get','class'=>'d-print-none']) !!}
			<div class="row">
				{{-- <div class="col-md-3">
					{{ Form::label('ledger_id','Ledger') }}
					{{ Form::select('ledger_id',$ledgers,null,array('class'=>'form-control select2','placeholder'=>'Select Ledger')) }}
				</div> --}}
				<div class="col-md-3">
					{{ Form::label('startDate','Form Date') }}
					<div class="input-group" id="startDate2" data-target-input="nearest">
						{!! Form::text('startDate',null,['class'=>'form-control datetimepicker-input','placeholder'=>__('Start Date'),
						'data-target'=>'#startDate2',
						'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
						<div class="input-group-append" data-target="#startDate2" data-toggle="datetimepicker">
								<span class="input-group-text"><i class="fa fa-calendar"></i></span>
							</div>
						</div>
				</div>
				<div class="col-md-3">
					{{ Form::label('endDate','End Date') }}
							<div class="input-group" id="endDate2" data-target-input="nearest">
									{!! Form::text('endDate',null,['class'=>'form-control datetimepicker-input','placeholder'=>__('End Date'),
									'data-target'=>'#endDate2',
									'data-inputmask-alias'=>'datetime','data-inputmask-inputformat'=>'yyyy/mm/dd','data-mask'=>'data-mask']) !!}
									<div class="input-group-append" data-target="#endDate2" data-toggle="datetimepicker">
											<span class="input-group-text"><i class="fa fa-calendar"></i></span>
									</div>
							</div>
					</div>
					<div class="col-md-2">
							{{ Form::label('session','Academic Year') }}
							{!! Form::number('session',null,['class'=>'form-control','min'=>'2015','max'=>'2050','placeholder'=> __('Academic Year')]) !!}
					</div>
					<div class="col-md-2">
						<br>
						{{ Form::submit('Show',array('class'=>'btn btn-success')) }}
						<button type="button" class="btn btn-primary printMe">Print</button>
					</div>
			</div>
			{!! Form::close() !!}
    </div>
    <div class="card-body">
			<div class="row d-none d-print-block">
				<div class="col-md-12">
					<div id="report-header">
						@include('admin.layouts.report_header')
						@if (isset($data['startDate']) && isset($data['endDate']))
							<p>Form: {{$data['startDate']}} To: {{$data['endDate']}}</p>	 
						@endif
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table id="report" class="table">
				<thead>
				<tr>
					<th>SL</th>
					<th>{{__('Date')}}</th>
					<th>{{__('Name Of Student')}}</th>
					<th>{{__('Reg No')}}</th>
					<th>{{__('Department')}}</th>
					<th>{{__('Amount')}}</th>
				</tr>
				</thead>
				<tbody>
				@foreach($invoices as $key=>$item)
				<tr>
					<td>{{ ++$key }}</td>
					<td>{{shortDate($item->created_at)}}</td>
					<td>{{ $item->student->name }}</td>
					<td>{{ $item->student->reg_no }}</td>
					<td>{{ $item->student->department->title }}</td>
					<td class="text-right">{{ $item->amount }}</td>
				</tr>
				@endforeach
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="text-right">Total</td>
						<td class="text-right">{{ number_format($invoices->sum('amount')) }}</td>
					</tr>
				</tfoot>
				</table>
				</div>
				<div class="card-footer">
					{{-- <div class="text-center">{{ $report->appends($_GET)->links() }}</div> --}}
				</div>
        
    </div>
    <!-- /.card-body -->
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>
<script src="{{ asset('assets/admin/plugins/moment/moment.min.js') }}"> </script>
<!-- daterangepicker -->
{{-- <script type="text/javascript" src="//cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> --}}
<!-- Tempusdominus -->
<script src="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"> </script>
<script>
  (function ($) {
    $(document).ready(function() {

		var header = $('#report-header').html();
		
        $('#report').DataTable( {
            dom: 'Bfrtip',
            buttons: [
				'copy',
				{
                extend: 'excel',
                	messageTop: header
            	},
                {
					extend: 'pdf',
					messageTop: header
				},
				{
					extend: 'print',
					messageTop: header,
					messageBottom: null
				}
            ],
            "paging":   false,
            //"ordering": false,
        } );
/*
		messageTop: function () {
			printCounter++;

			if ( printCounter === 1 ) {
				return 'This is the first time you have printed this document.';
			}
			else {
				return 'You have printed this document '+printCounter+' times';
			}
		},
*/

        $('#startDate2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

        $('#endDate2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

        $('.printMe').click(function(){
            window.print();
        });

    } );

/*
    //Date range as a button
    $(function() {
        if($('#startDate').val() != '' && $('#endDate').val() != ''){
           var start = moment($('#startDate').val(), "DD-MM-YYYY");
            var end = moment($('#endDate').val(), "DD-MM-YYYY");
        }else{
            var start = moment().subtract(29, 'days');
            var end = moment();
        }

        function cb(start, end) {
            $('#reportrange span').html(start.format('DD-MM-YYYY') + ' - ' + end.format('DD-MM-YYYY'));
            $('#startDate').val(start.format('DD-MM-YYYY'));
            $('#endDate').val(end.format('DD-MM-YYYY'));
        }

        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
            'This Year': [moment().startOf('year'), moment().endOf('year')],
            'Last Year': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')]
            }
        }, cb);

        cb(start, end);

        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
            //do something, like clearing an input
            $('#reportrange span').html('');
            $('#startDate').val('');
            $('#endDate').val('');
        });

      });
*/
    })(jQuery)
  </script>
@endsection