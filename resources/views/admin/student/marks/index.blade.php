@extends('admin.layouts.layout')
@section('title',__("Students List"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      <div class="row">
        <div class="col">
          {!! Form::model($data,['route' => 'studentMark.index','method'=>'get','class'=>'d-print-none']) !!}
          <div class="row">
            <div class="col">
              {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Department')]) !!}
            </div>
            <div class="col">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
            </div>
            <div class="col">{{ Form::submit(__('Filter'),array('class'=>'btn btn-success')) }}</div>
          </div>
          {!! Form::close() !!}
        </div>
        {{-- <div class="col text-right"><a class="btn btn-primary" href="{{ route('student.create')}}">New Student</a></div> --}}
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>SL</th>
              <th>{{__('Reg No')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('attendance')}}</th>
              <th>{{__('written_marks')}}</th>
              <th>{{__('oral_marks')}}</th>
              <th>{{__('total_marks')}}</th>
            </tr>
            </thead>
            @php
                $sl = 1;
            @endphp
            <tbody>
                @foreach ($students as $item)
                <tr>
                    <td>{{$sl++}}</td>
                    <td>{{$item->student->reg_no}}</td>
                    <td width="25%">{{$item->student->name}}</td>
                    <td><input data-id="{{$item->id}}" type="number" value="{{$item->attendance}}" name="attendance" id="attendance{{$item->id}}" min="0" max="100" class="form-control"></td>
                    <td><input data-id="{{$item->id}}" type="number" step="any" value="{{$item->written_marks}}" name="written_marks" id="written_marks{{$item->id}}" min="0" max="100" class="form-control"></td>
                    <td><input data-id="{{$item->id}}" type="number" step="any" value="{{$item->oral_marks}}" name="oral_marks" id="oral_marks{{$item->id}}" min="0" max="100" class="form-control"></td>
                    <td class="full_marks">{{$item->attendance + $item->written_marks + $item->oral_marks}}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script>
    $(function () {      

      $.ajaxSetup({
            headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
          });

      $('#example1').on('blur', 'input[name="attendance"], input[name="written_marks"], input[name="oral_marks"]', function(event) {
        let mark = $(this).val();
        let itemId = $(this).data('id');
        let name = $(this).attr('name');
        let full_marks = $(this).closest('tr').find('.full_marks')[0];
        if(mark == ''){
            alert('Please Input Value.');
            return false;
        }

        let formData = {
          mark: mark,
          name: name,
        };

        //console.log(itemId);

          let url = "{{route('studentMark.update','')}}";
          url = url+'/'+itemId;

          $.ajax({
            type: 'PUT',
            url: url,
            data: formData,
            dataType: 'json',
            success: function (data) {
              full_marks.innerHTML=Number(data.attendance) + Number(data.written_marks) + Number(data.oral_marks);
            },
            error: function (data) {
                console.log('Error:', data);
              }
          });


        
    });


      $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
        "paging": false,
      });
      $('#example2').DataTable({
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
      });
    });
  </script>
@endsection
