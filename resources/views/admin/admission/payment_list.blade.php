@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    {{-- <div class="card-header d-print-none">
          {!! Form::model($data,['route' => 'admission.index','method'=>'get','class'=>'d-print-none row']) !!}
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
                <a class="btn btn-primary" href="{{ route('student.create')}}"><i class="fas fa-plus"></i> New</a>
              </div>
              Total Student : {{ $students->total() }}
            </div>
          {!! Form::close() !!}
      <div id="report-header" class="d-none d-print-block">
        <h2 class="text-center">{{__('Students List')}}</h2>
      </div> --}}
      <h2 class="text-center">Total Amount : {{ $total }}</h2></h2>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')       
      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th>Date</th>
              <th>{{__('Name')}}</th>
              <th>Amount</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($payments as $item)
                <tr>
                    <td>{{prettyDateTime($item->created_at)}}</td>
                    <td>{{$item->admission? $item->admission->name : ''}}</td>
                    <td>{{$item->amount}}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      <div class="text-center">{{ $payments->appends($_GET)->links() }}</div>
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

@endsection
