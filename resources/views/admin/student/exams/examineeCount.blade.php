@extends('admin.layouts.layout')
@section('title',"Exam Students")
@section('css')
@endsection
@section('content')
<!-- Default box -->
<div class="card">
  <div class="card-body">
    @foreach ($students->groupBy('semester') as $student)
        @php $igroup_total = 0; @endphp
        <h3>{{$student->first()->semester}}</h3>
        <table class="table table-bordered table-striped table-sm">
            <tr>
                <th>Group</th>
                @foreach ($institutions as $institution)
                    <th>{{$institution}}</th>
                @endforeach
                <th>Total</th>
            </tr>
            @foreach ($student->groupBy('student_group') as $group)
                @php $group_total = 0; @endphp
                <tr>
                    <td>{{$group->first()->student_group}}</td>
                    @foreach ($institutions as $institution)
                        @php $group_count = $group->where('institute',$institution)->count();
                        $group_total += $group_count;
                        @endphp
                        <td>{{$group_count}}</td>
                    @endforeach
                    <td>{{$group_total}}</td>
                </tr>
            @endforeach
            <tr>
                <th>Total</th>
                @foreach ($institutions as $institution)
                    @php $igroup_total += $igroup_count = $student->where('institute',$institution)->count(); @endphp
                    <th>{{ $igroup_count }}</th>
                @endforeach
                <th>{{$igroup_total}}</th>
            </tr>
        </table>
    @endforeach
  </div>
</div>
<!-- /.card -->
@endsection
@section('js')

@endsection
