@extends('admin.layouts.layout')
@section('title',__("Students Result"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
  <div class="card-header d-print-none">
    {!! Form::model($data,['route' => 'application_waiting_list','method'=>'get','id'=>'admission_result','class'=>'d-print-none row']) !!}
      <div class="col">
        {!! Form::select('shift',['1st Shift'=>'1st Shift','2nd Shift'=>'2nd Shift'],null,['class'=>'form-control','required'=>true,'id'=>'shift','placeholder'=> __('Shift')]) !!}
      </div>
      <div class="col">
        {!! Form::select('class_id',$admission_class,null,['class'=>'form-control select2','id'=>'class_id','placeholder'=> __('Class')]) !!}
      </div>
      <div class="col">
        <div class="btn btn-group">
          <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
          <button type="button" class="btn btn-info" onclick="window.print();"><i class="fas fa-print"></i> Print</button>
        </div>
      </div>
    {!! Form::close() !!}
</div>
    <div class="card-body">
      <div id="report-header" class="d-none d-print-block">
        <div class="heading text-center">
            <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
            <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
            <p class="text-center m-0">({{ config('settings.siteWeb') }})</p>
        </div>
        <h2 class="text-center">{{__('Waiting List')}}</h2>
      </div>
      @include('admin.layouts._message')
      <table id="example1" class="table table-bordered table-striped">
        <tbody>
          <tr>
            <th>SL</th>
            <th>ID</th>
            <th>Name</th>
            <th>Trades</th>
          </tr>
          @foreach ($results as $item)
            <tr>
              <td>{{$item->result->sl}}</td>
              <td>{{$item->id}}</td>
              <td>{{$item->name}}</td>
              <td>
                @foreach ($item->selectedTrade as $trade)
                  {{ $trade->trade->code }},
                @endforeach
              </td>
            </tr>            
          @endforeach
        </tbody>
      </table>
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
