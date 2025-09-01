@extends('admin.layouts.layout')
@section('title',"Add Forth Subject")
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Add Forth Subject')}}</h3>
        <div class="card-tools">
            
        </div>
    </div>
    <div class="card-body">
    {!! Form::open(array('route'=>['student.get_student_by_section'], 'class'=>'row','id'=>'get_student_form','method'=>'get')) !!}
        <div class="col-2">
          <div class="form-group">
            {!! Form::label('academic_year_id', __('Year'),['class'=>'']) !!}
            {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
          </div>
        </div>
        <div class="col-3">
          <div class="form-group">
            {!! Form::label('section_id', __('Select Section'),['class'=>'']) !!}
            {!! Form::select('section_id', $sections,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Section')]) !!}
          </div>
        </div>
        <div class="col-3">
          <div class="form-group">
            {!! Form::label('group_id', __('Select Group'),['class'=>'']) !!}
            {!! Form::select('group_id', [],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Group')]) !!}
          </div>
        </div>
        <div class="col-2">
          <button type="submit" id="get_input_student" class="btn btn-info btn-block">Search</button>
        </div>  
      {!! Form::close() !!}
        
      <div class="row mt-3">
        <div class="col-6">
            <h2 class="card-title float-none">Compulsory Subjects</h2>
            <div class="clearfix"  id="compulsory_subjects"></div>
        </div>
        <div class="col-6">
            <h2 class="card-title float-none">Optional Subjects</h2>
            <div class="clearfix" id="forth_subjects"></div>
        </div>
      </div>
      <div id="errorMsg"></div>
        <h2 class="mt-3">Student List</h2>
        <table id="student_list_table" class="table table-bordered table-striped table-sm mt-3">
            <thead>
                <tr>
                    <th>
                      <input type="checkbox" name="select_all" id="select_all">
                    </th>
                    <th>{{__('Student ID')}}</th>
                    <th>{{__('Student Name')}}</th>
                    <th>{{__('Roll')}}</th>
                    <th>{{__('Group')}}</th>
                </tr>
            </thead>
            <tbody id="student_list">
                
            </tbody>
        </table>
        <button type="button" id="add_forth_subject" class="btn btn-primary mt-3">Add Forth Subject</button>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')

<script>   
  $('#section_id').change(function(){
    $("#group_id").html('');
    $.ajax({
      type: "get",
      url: "{{route('student.get_group_by_section')}}",
      data: {section_id:$(this).val()},
      success: function(data){
        //console.log(data);
        let htmlData = '<option value="">----------</option>';
        data.groups.forEach(function(value,index){
          htmlData += `
          <option value="${value.id}">${value.name}</option>
          `;
        })
        $("#group_id").html(htmlData);
      }
    })
  });

  $("#group_id").change(function(){
    let url = "{{route('exam.config.get_forth_subject_by_section_and_group')}}";
    let section_id = $("#section_id").val();
    let group_id = $("#group_id").val();
    $.ajax({
      type: "get",
      url: url,
      data: {section_id:section_id,group_id:group_id},
      success: function(data){
        //console.log(data);
        let htmlData = '';
        if(data.forth_subjects){
            data.forth_subjects.forEach(function(value,index){
            htmlData += `
            <div class="custom-control custom-checkbox">
                <input class="custom-control-input" id="forth_subject_id_${value.id}" type="checkbox" name="forth_subject_ids[]" value="${value.id}">
                <label class="custom-control-label" for="forth_subject_id_${value.id}">${value.name}</label>
            </div>
            `;
            });            
        }
        $("#forth_subjects").html(htmlData);
      }
    });
  });

  $('#get_student_form').submit(function(e){
    e.preventDefault();
    // get students
    $("#student_list").html('');    
    let url = $(this).attr('action');
    let form_data = $(this).serialize();
    $.ajax({
      type: "get",
      url: url,
      data: form_data,
      success: function(data){
        //console.log(data);
        let htmlData = '';
        data.students.forEach(function(value,index){
          htmlData += `
          <tr>
            <td>
              <input type="checkbox" name="student_ids[]" value="${value.id}">
            </td>
            <td>${value.reg_no}</td>
            <td>${value.name}</td>
            <td>${value.class_roll}</td>
            <td>${value.group.name}</td>
          </tr>
          `;
        });
        $("#student_list").html(htmlData);
      }
    });

  });

  $("#select_all").click(function(){
    if(this.checked){
      $("input[name='student_ids[]']").each(function(){
        this.checked = true;
      });
    }else{
      $("input[name='student_ids[]']").each(function(){
        this.checked = false;
      });
    }
  });

  $("#add_forth_subject").click(function(){
    let url = "{{route('exam.config.fourth_assign.store')}}";
    let form_data = {
        subject_ids:JSON.stringify($("input[name='forth_subject_ids[]']:checked").map(function(){return $(this).val();}).get()),
        student_ids:JSON.stringify($("input[name='student_ids[]']:checked").map(function(){return $(this).val();}).get()),
        academic_year_id:$("#academic_year_id").val(),
        _token:'{{ csrf_token() }}'
    }
    
    $.ajax({
      type: "post",
      url: url,
      data: form_data,
      success: function(json){
        if(json.status == true){
          if(json.message){
            $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${json.message}</div>`);
          }
        }else{
            //console.log(json);
            if(json.message){
            $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
            }
            json.errors.forEach(function(element){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
            });
        }
      }
    });
  });

</script>
@endsection