@extends('admin.layouts.layout')
@section('title',__("Students Promotion"))
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
      <div class="row">
        <div class="col">
          {!! Form::model($data,['route' => 'student.promotion','method'=>'get','class'=>'d-print-none']) !!}
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
        <div class="col">
          <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#pramoteStudentModal" data-original-title="" title="">Promote</button>
        </div>
      </div>
    </div>
    <div class="card-body">
      {!! Form::open(['route' => 'student.promotion.submit','method'=>'post','class'=>'promote_form']) !!}
      {{ Form::hidden('department_id',$data['department_id']) }}
      {{ Form::hidden('semester_id',$data['semester_id']) }}
      <div class="table-responsive">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              {{-- <th>ID</th> --}}
              <th><input class="checkbox" id="selectAll" name="selectAll" type="checkbox"> <label for="selectAll">All</label></th>
              <th>{{__('Reg No')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Department')}}</th>
              <th>{{__('Semester')}}</th>
              <th>{{__('Mark')}}</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($students as $item)
                <tr>
                    {{-- <td>{{$item->id}}</td> --}}
                    <td><input class="student_list" name="student_list[]" type="checkbox" value="{{$item->id}}"></td>
                    <td>{{$item->reg_no}}</td>
                    <td>{{$item->name}}</td>
                    <td>@if($item->department){{$item->department->title}}@endif</td>
                    <td>@if($item->semester){{$item->semester->title}}@endif</td>
                    <td>
                      @foreach ($item->marks->where('semester_id',$item->semester_id) as $mark)
                          {{--$mark->semester->title--}}<b>A:</b>{{$mark->attendance}} <b>W:</b>{{$mark->written_marks}} <b>O:</b>{{$mark->oral_marks}} 
                            <b>Total:</b>{{$mark->attendance+$mark->written_marks+$mark->oral_marks}} <span class="badge badge-info">{{($mark->paid_confirm == 1) ? 'Paid':'Unpaid'}}</span>
                      @endforeach                      
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
      {!! Form::close() !!}
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      
    </div>
    <!-- /.card-footer-->
</div>

<div class="modal" id="pramoteStudentModal">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title">Promote Confirmation</h4>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          </div>
          <div class="modal-body">
              <p>Are you sure you, want to promote confirm?</p>
          </div>
          <div class="modal-footer">
            {{-- <div class="callout callout-info">
              <h5><i class="fas fa-info"></i> Note:</h5>
              This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
            </div> --}}
              <button type="button" class="btn btn-sm btn-primary pramote_student">Submit</button>
              <button type="button" title="Close and reload" class="btn btn-sm btn-danger pramote_close">Close</button>
          </div>
      </div>
  </div>
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script>
    $(function () {
      $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
        "aaSorting": [],
        "paging": false,
          "columnDefs": [ {
          "targets": [0,5],
          "orderable": false
          } ],
      });

      $(':checkbox[name=selectAll]').click (function () {
        //$(':checkbox[name=student_list]').prop('checked', this.checked);
        $('.student_list').prop('checked', this.checked);
      });
      
      $('#pramoteStudentModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        })

        $('#pramoteStudentModal').on('click', '.pramote_close', function (e) {
          $('#pramoteStudentModal').modal('hide');
          location.reload(true);
        });


        $('#pramoteStudentModal').on('click', '.pramote_student', function (e) {
            var $modalDiv = $(e.delegateTarget);
            var datastring = $(".promote_form").serialize();
            //console.log(datastring);
            $.ajax({
                type: "POST",
                url: '{{route("student.promotion.submit")}}',
                data: datastring,
                dataType:"JSON",
                beforeSend: function () {
                    $modalDiv.addClass('modal_loading');
                },
                success: function (data) {
                  //console.log(data);
                    //$('.sessionmodal_body').html(data);
                    if (data.status == "fail") {
                        var error_html="";
                        $.each(data.msg, function (index, value) {                           
                            error_html+=value;
                        });

                      errorMsg(error_html);
                    } else {
                        //console.log(data);
                        let returnMsg = `<table class="table table-sm table-striped">
                          <tr><th>Reg No</th><th>Result</th><th>Payment</th><th>Status</th></tr>`;
                        $.each(data.message, function (index, value) {                           
                          returnMsg+= `<tr><td>${value.reg_no}</td><td>${value.result}</td><td>${value.payment}</td><td>${value.status}</td></tr>`;
                        });
                          returnMsg+= `</table>`;
                        $('#pramoteStudentModal .modal-body').html(returnMsg);
                        //$('#pramoteStudentModal').modal('toggle')
                        //location.reload(true);
                    }
                },
                error: function (xhr) { // if error occured
                    $modalDiv.removeClass('modal_loading');
                },
                complete: function () {
                    $modalDiv.removeClass('modal_loading');
                },
            });

        });
    });
  </script>
@endsection
