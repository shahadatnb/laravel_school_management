@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      
    </div>
    <div class="card-body">
      @include('admin.layouts._message')

      <h2 class="text-center">{{__('Application Result Summary')}}</h2>
      <h3 class="text-center">1st Shift</h3>
      <table id="example1" class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Class</th>
            @foreach ($quotas as $key => $quota)
                <th>{{ $quota }}</th>
            @endforeach
            <th>General</th>
            <th>Total</th>
          </tr>

        </thead>
        <tbody>
          @foreach ($classes as $class)
            <tr>
              <td>{{ $class->name }}</td>
              @foreach ($quotas as $key => $quota)
                  <td>{{ $results->where('shift', '1st Shift')->where('class_id', $class->id)->where('select_quota_id', $key)->count() }}</td>
                  @endforeach
              <td>{{ $results->where('shift', '1st Shift')->where('class_id', $class->id)->where('select_quota_id', null)->count() }}</td>
              <td>{{ $results->where('shift', '1st Shift')->where('class_id', $class->id)->count() }}</td>
            </tr>
            @if($class->trades->count() > 0)
            @foreach ($class->trades as $trade)                
              <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;  {{ $trade->name }}</td>
                @foreach ($quotas as $key => $quota)
                  <td>{{ $results->where('shift', '1st Shift')->where('trade_id', $trade->id)->where('class_id', $class->id)->where('select_quota_id', $key)->count() }}</td>
                @endforeach
                <td>{{ $results->where('shift', '1st Shift')->where('trade_id', $trade->id)->where('class_id', $class->id)->where('select_quota_id', null)->count() }}</td>
                <td>{{ $results->where('shift', '1st Shift')->where('trade_id', $trade->id)->where('class_id', $class->id)->count() }}</td>
              </tr>
            @endforeach
            @endif
          @endforeach
        </tbody>
      </table>
      <br>
      <h3 class="text-center">2nd Shift</h3>
      <table id="example1" class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Class</th>
            @foreach ($quotas as $key => $quota)
                <th>{{ $quota }}</th>
            @endforeach
            <th>General</th>
            <th>Total</th>
          </tr>

        </thead>
        <tbody>
          @foreach ($classes as $class)
            <tr>
              <td>{{ $class->name }}</td>
              @foreach ($quotas as $key => $quota)
                  <td>{{ $results->where('shift', '2nd Shift')->where('class_id', $class->id)->where('select_quota_id', $key)->count() }}</td>
                  @endforeach
              <td>{{ $results->where('shift', '2nd Shift')->where('class_id', $class->id)->where('select_quota_id', null)->count() }}</td>
              <td>{{ $results->where('shift', '2nd Shift')->where('class_id', $class->id)->count() }}</td>
            </tr>
          @endforeach
        </tbody>
      </table>
      <br><br><br><br>
      <table id="example1" class="table table-bordered table-striped">
        <tbody>
          @foreach ($results->groupBy('shift') as $items)
            <tr>
              <th>{{ $items->first()->shift }}</th>
              <th>{{ $items->count() }}</th>
            </tr>
            @foreach ($items->groupBy('class_id') as $items2)
              <tr>
                <td>&nbsp;&nbsp; {{ $items2->first()->semester->name }}</td>
                <td>{{ $items2->count() }}</td>
              </tr>
              @foreach ($items2->groupBy('trade_id') as $item)
                <tr>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp; {{ $item->first()->trade? $item->first()->trade->name : "" }}</td>
                  <td>{{ $item->count() }}</td>
                </tr>
                  @foreach ($item->groupBy('select_quota_id') as $item2)
                      <tr>
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $item2->first()->selectQuota? $item2->first()->selectQuota->name : 'General'}}</td>
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
