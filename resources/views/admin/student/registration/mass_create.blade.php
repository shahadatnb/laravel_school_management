@extends('admin.layouts.layout')
@section('title',__("Students Create"))
@section('css')
@endsection
@section('content')
<!-- Default box -->
{{ Form::open(array('route'=>'student.reg.mass_save','method'=>'POST','id'=>'mass_save','files' => true)) }}
<div class="card">
    <div class="card-header d-print-none">
          
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <div id="errorMsg"></div>
        <div class="row mb-2">
          <div class="col">
            {!! Form::select('academic_year_id',$academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
          </div>
          <div class="col">
            {!! Form::select('section_id',$sections,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Section')]) !!}
          </div>
          <div class="col">
            {!! Form::select('group_id',$groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group')]) !!}
          </div>
          <div class="col">
            {!! Form::select('category_id',$catetories,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Category')]) !!}
          </div>
        </div>
      
        {{-- Select	Roll	Name	Gender	Religion	Father Name	Mother Name	Mobile No.	Add/Del --}}
      <div class="table-responsive">
        <table id="student" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              <th><input class="checkbox" id="selectAllStudent" type="checkbox"> <label for="selectAllStudent">All</label></th>
              {{-- <th>{{__('Registration No')}}</th> --}}
              <th>{{__('Roll')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Gender')}}</th>
              <th>{{__('Religion')}}</th>
              <th>{{__('Father Name')}}</th>
              <th>{{__('Mother Name')}}</th>
              <th>{{__('Mobile No')}}</th>
              {{-- <th>{{__('Date of Birth')}}</th> --}}
              <th>Action</th>
            </tr>
            </thead>
            <tbody id="student_list">
                <tr>
                    <td>
                        <input type="checkbox" class="student_id" name="student_id[]" value="1">
                    </td>
                    <td>
                        <input type="text" name="class_roll[]" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="text" name="name[]" class="form-control form-control-sm" required>
                    </td>
                    <td>
                      <select name="sex[]" class="form-control form-control-sm" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Others">Others</option>
                      </select>
                    </td>
                    <td>
                        <select name="religion[]" class="form-control form-control-sm" required>
                            <option value="Muslim">Muslim</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Christian">Christian</option>
                            <option value="Buddhist">Buddhist</option>
                            <option value="Others">Others</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="fathersName[]" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="text" name="mothersName[]" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="text" name="mobile[]" class="form-control form-control-sm" required>
                    </td>
                    <td>
                      <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-info copy"><i class="fas fa-copy"></i></button>
                        <button type="button" class="btn btn-sm btn-danger remove"><i class="fas fa-trash"></i></button>
                      </div>
                    </td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
    </div>
    <!-- /.card-footer-->
</div>
{{ Form::close() }}
<!-- /.card -->
@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>

<script>
    $(function () {
      $("#student_list").on('click','.copy',function(){
          var tr = $(this).closest('tr');
          var clone = tr.clone();
          clone.find('input').val('');
          tr.after(clone);
      });

      $("#student_list").on('click','.remove',function(){
          if(confirm('Are you sure?')){
            var tr = $(this).closest('tr');
            tr.remove();
          }
      });

      $("#mass_save").submit(function(e){
        e.preventDefault();
        var student_id = $(".student_id:checked").length;
        if(student_id == 0){
          alert('Please select at least one student');
          return false;
        }
        $.LoadingOverlay("show");
        $("#errorMsg").html('');
        $.ajax({
          url: $(this).attr('action'),
          type: $(this).attr('method'),
          data: $(this).serialize(),
          success: function(json){
            //console.log(json);
            if(json.status == true){
              if(json.message){
                $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${json.message}</div>`);
              }
              $("#student_list").empty();
            }else{
              //console.log(json);
              if(json.message){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
              }
              json.errors.forEach(function(element){
                  $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
              });
              //alert(data.errors);
            }
            $.LoadingOverlay("hide");
          }
        });

      });

      $('#selectAllStudent').click(function(){
        if($(this).is(':checked')){
            $('.student_id').prop('checked', true);
        }else{
            $('.student_id').prop('checked', false);
        }
      });

    });
  </script>
@endsection
