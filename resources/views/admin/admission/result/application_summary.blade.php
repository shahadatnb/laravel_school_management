@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      <h2 class="text-center">Total : {{ $applications->count() }}</h2></h2>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <table id="example1" class="table table-bordered table-striped">
        <tbody>
      @foreach ($applications->groupBy('final_submit') as $items)
          <tr>
            <th>{{ $items->first()->final_submit == 1 ? 'Approved' : 'Not Approved' }}</th>
            <th>{{ $items->count() }}</th>
          </tr>
          @foreach ($items->groupBy('shift') as $items2)
            <tr>
              <td>&nbsp;&nbsp; <b>{{ $items2->first()->shift }}</b></td>
              <td>{{ $items2->count() }}</td>
            </tr>
            @foreach ($items2->groupBy('class_id') as $item)
              <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp; {{ $item->first()->semester->name }}</td>
                <td>{{ $item->count() }}</td>
              </tr>
                @foreach ($item->groupBy('quota_id') as $item2)
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $item2->first()->quota? $item2->first()->quota->name : 'Without Quota'}}</td>
                        <td>{{ $item2->count() }}</td>
                    </tr>
                @endforeach
            @endforeach
          @endforeach
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
