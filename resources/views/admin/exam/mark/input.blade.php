@extends('admin.layouts.layout')
@section('title', __("Mark Input"))
@section('css')

@endsection
@section('content')
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Mark Input')}}</h3>
      <div class="card-tools">
        {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
      </div>
  </div>
  <div class="card-body">

    <div class="row">
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('academic_year_id', __('Year'),['class'=>'']) !!}
          {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('section_id', __('Select Section'),['class'=>'']) !!}
          {!! Form::select('section_id', $class_configs,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Section')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('group_id', __('Select Group'),['class'=>'']) !!}
          {!! Form::select('group_id', [],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Group')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('exam_id', __('Select Exam'),['class'=>'']) !!}
          {!! Form::select('exam_id', [],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Exam')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('subject_id', __('Select Subject'),['class'=>'']) !!}
          {!! Form::select('subject_id', [],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Subject')]) !!}
        </div>
      </div>
      <div class="col-2">
        <button type="button" id="get_input_student" class="btn btn-info btn-block">Search</button>
      </div>
    </div>    

  </div>
</div>
<div class="card">
  <div class="card-header">
      
  </div>
  <div class="card-body">
    @include('admin.layouts._message')
    {!! Form::open(array('route'=>['exam.mark.input_save'],'id'=>'mark_input_form')) !!}
    <table id="example1" class="table table-bordered table-striped table-sm">
      <thead>
      <tr id="student_header">			
        <th>{{__('Student Name')}}</th>
        <th>{{__('Student ID')}}</th>
        <th>{{__('Roll')}}</th>
        <th>{{__('Is Absent?')}}</th>
      </tr>
      </thead>
      <tbody id="student_list">
        
      </tbody>
    </table>
    {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
    {!! Form::close() !!}
  </div>
</div>

@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
    $("#section_id").change(function(){
      let section_id = $("#section_id").val();
      if(section_id == '') return false;
      $.ajax({
        type: "get",
        url: "{{route('exam.mark.get_exam_group')}}",
        data: {section_id:section_id},
        success: function(data){
          //console.log(data);
          let htmlData = '';
          data.groups.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#group_id").html(htmlData);

          htmlData = '';
          data.exams.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#exam_id").html(htmlData);
          $("#exam_id").trigger("change");
        }
      });
    });

    $("#exam_id").change(function(){
      let section_id = $("#section_id").val();
      let group_id = $("#group_id").val();

      $.ajax({
        type: "get",
        url: "{{route('exam.mark.get_subject')}}",
        data: {section_id:section_id,group_id:group_id},
        success: function(data){
          //console.log(data);
          let htmlData = '<option value="">----------</option>';
          data.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#subject_id").html(htmlData);
        }
      });
    });

    $("#get_input_student").click(function(){
      let academic_year_id = $("#academic_year_id").val();
      let section_id = $("#section_id").val();
      let group_id = $("#group_id").val();
      let exam_id = $("#exam_id").val();
      let subject_id = $("#subject_id").val();
      $("#student_list").empty();
      $("#student_header .head_td").remove();
      $.LoadingOverlay("show");
      $("#errorMsg").empty();
      $.ajax({
        type: "get",
        url: "{{route('exam.mark.get_input_student')}}",
        data: {academic_year_id:academic_year_id,section_id:section_id,group_id:group_id,exam_id:exam_id,subject_id:subject_id},
        success: function(data){
          if(data.status == true){
            //console.log(data);
            let htmlData = '';
            let headData = '';
            data.mark_configs.forEach(function(mark_config,index){
              headData += `
              <th class="head_td">${mark_config.sc_title}</th>
              `;
            });
            $("#student_header").append(headData);
            data.students.forEach(function(student,index){
              htmlData += `
              <tr>
                <td>${student.name}</td>
                <td>${student.reg_no}</td>
                <td>${student.class_roll}</td>
                <td><input name="is_absent[${student.id}]" type="checkbox" value="1" class="form-control form-control-sm"></td>`;
                data.mark_configs.forEach(function(mark_config,index2){
                    htmlData += `<td><input name="mark_list[${student.id}][${mark_config.id}]" type="number" step="0.1" max="${mark_config.total_marks}" value="" class="form-control form-control-sm"></td>`;
                });
              htmlData += `</tr>`;
            });
            //console.log(data);
            $("#student_list").html(htmlData);            
          }else{
            //console.log(data);
            if(data.message){
              $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${data.message}</div>`);
            }
            data.errors.forEach(function(element){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
            });
          }
          $.LoadingOverlay("hide");
        }
      });
    });

    $("#mark_input_form").submit(function(e){
      e.preventDefault();
      let academic_year_id = $("#academic_year_id").val();
      let section_id = $("#section_id").val();
      let data = new FormData(this);
      data.append('academic_year_id',academic_year_id);
      data.append('section_id',section_id);
      $.LoadingOverlay("show");
      $("#errorMsg").empty();
      $.ajax({
        type: "post",
        url: $(this).attr('action'),
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        success: function(data){
          //console.log(data);
          if(data.status == true){
            //console.log(data);
            alert(data.message);
            $("#student_list").empty();
          }else{
            //console.log(data);
            if(data.message){
              $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${data.message}</div>`);
            }
            data.errors.forEach(function(element){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
            });
          }
          $.LoadingOverlay("hide");
        }
      });
    });

</script>
@endsection
