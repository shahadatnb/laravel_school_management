@extends('admin.layouts.layout')
@section('title',__("Student"))
@section('css')
<link rel="stylesheet" href="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
@endsection
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">{{__('Student')}}</h3>
        <div class="card-tools">
          <a href="{{route('student.index')}}" class="btn btn-sm btn-info"><i class="far fa-arrow-alt-circle-left"></i> Back</a>
          <a href="{{route('student.show',$student->id)}}" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> View</a>
        </div>
    </div>
</div>
<div class="row">
  <div class="col-lg-7 col-sm-12">
    <div class="card card-info">
      <div class="card-header">
        <h3 class="card-title">Payment of fees{{-- <h3>ফি প্রদান</h3> --}}</h3>
      </div>
      <!-- /.card-header -->
        <div class="card-body">
          {!! Form::open(array('route'=>['student.payment'])) !!}
            {!! Form::hidden('student_id',$student->id) !!}
            <div class="row">
              {{-- <div class="col-8">
                <div class="form-group">
                  {!! Form::label('invoice_head_id', __('Invoice head'),['class'=>'']) !!}
                  {!! Form::select('invoice_head_id',$invoiceHeads,null,['class'=>'form-control select2']) !!}
                </div>
              </div> --}}
              <div class="col-4">
                {!! Form::label('amount', __('Amount')) !!}
                  {!! Form::number('amount',null,['class'=>'form-control','required'=>'required','placeholder'=> __('Amount')]) !!}
              </div>
              <div class="col-6">
                {!! Form::label('remarks', __('Remarks')) !!}
                  {!! Form::text('remarks',null,['class'=>'form-control','placeholder'=> __('Remarks')]) !!}
              </div>
              <div class="col-2">
                <label>&nbsp; &nbsp;</label>
                {{ Form::submit('Payment',array('class'=>'btn btn-primary')) }}
              </div>
            </div>
            {!! Form::close() !!}
            <table class="table">
              <tr>
                <th>{{__('Date')}}</th>
                {{-- <th>{{__('Invoice head')}}</th> --}}
                <th>{{__('Amount')}}</th>
                <th>{{__('Remarks')}}</th>
              </tr>
              @foreach ($payments as $item)
                  <tr>
                    <td>{{shortDate($item->created_at)}}</td>
                    <td>{{$item->amount}}</td>
                    <td>{{$item->remarks}}</td>
                  </tr>
              @endforeach
            </table>
        </div>
        <!-- /.card-body -->
    </div>
  </div>
  <div class="col-lg-5 col-sm-12">
    <div class="card card-info">
      <div class="card-header">
        <h3 class="card-title">Fee Completion List{{-- <h3>ফি সম্পন্ন হওয়ার তালিকা</h3> --}}</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <ul class="list-group">
          @foreach ($student->marks as $item)
              <li class="list-group-item d-flex justify-content-between align-items-center">{{$item->semester->title}} 
                @if ($item->paid_confirm == 1)
                <span class="badge badge-success badge-pill">Completed</span>
                @else
                <a class="badge badge-primary badge-pill p-2" href="{{route('student.payment.complite',[$student->id,$item->id])}}">Make Complete</a>
              @endif
            </li>
          @endforeach
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{ asset('assets/admin/plugins/moment/moment.min.js') }}"> </script>
<!-- Tempusdominus -->
<script src="{{ asset('assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"> </script>
<script>
  (function ($) {
    $(document).ready(function() {
        $('#dateOfBirth2').datetimepicker({
            //format: 'DD/MM/YYYY'
            format: 'YYYY-MM-DD'
        });

        $('#presentZila').change(function(){
          $.get($(this).data('url'), {
                option: $(this).val()
            },
            function(data) {
                var subcat = $('#presentUpazila');
                subcat.empty();
                subcat.append("<option value=''>-----</option>")
                $.each(data, function(index, element) {
                    subcat.append("<option value='"+ element.id +"'>" + element.name + "</option>");
                });
            });
        });

        $('#permanentZila').change(function(){
          $.get($(this).data('url'), {
                option: $(this).val()
            },
            function(data) {
                var subcat = $('#permanentUpazila');
                subcat.empty();
                subcat.append("<option value=''>-----</option>")
                $.each(data, function(index, element) {
                    subcat.append("<option value='"+ element.id +"'>" + element.name + "</option>");
                });
            });
        });

    } );
    })(jQuery)
  </script>
@endsection