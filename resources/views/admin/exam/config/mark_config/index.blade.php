@extends('admin.layouts.layout')
@section('title', __("Mark Configuration"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-6">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
              {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('group_id', __('Group Name'),['class'=>'']) !!}
              {!! Form::select('group_id',[],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group Name')]) !!}
            </div>
          </div>
          <button type="button" id="search" class="btn btn-primary btn-sm btn-block" id="search">Search</button>
        </div>
        <div class="row">
          <div class="col-6" id="subject_div">
          </div>
          <div class="col-6" id="exam_div">
          </div>
        </div>          
        <div class="row">
          <div class="col-12">
            <h3 class="text-center">{{__('Subject List')}}</h3>
            <table class="table table-sm table-bordered table-striped">
              <thead>
                <tr>
                  <th>{{__('Short Code Title')}}</th>
                  <th>{{__('Total Mark')}}</th>
                  <th>{{__('Pass Mark')}}</th>
                  <th>{{__('Acceptance')}}</th>
                  <th>{{__('SC Merge')}}</th>
                  <th>{{__('Action')}}</th>
                </tr>
              </thead>
              <tbody id="subject_sc_list">
                
              </tbody>
            </table>
          </div>
        </div>
          {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      </div>
    </div>
    </div>
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Mark Configuration')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          @include('admin.layouts._message')
          {!! Form::open(array('route'=>['exam.config.subject.mass_update'])) !!}
          <table id="example1" class="table table-bordered table-striped table-sm">
            <thead>
            <tr>
              <th>{{__('Subject')}}</th>
              <th>{{__('Subject Type')}}</th>
              <th>{{__('Subject Serial')}}</th>
              <th>{{__('Merge ID')}}</th>
              <th>{{__('Action')}}</th>
            </tr>
            </thead>
            <tbody id="subject_config_list">
              
            </tbody>
          </table>
          {{ Form::submit('Update',array('class'=>'btn btn-primary')) }}
          {!! Form::close() !!}
        </div>
      </div>
    </div>
  </div>

@endsection
@section('js')

<script>
    $(function () {
      
    });
    $("#class_id").change(function(){
      let class_id = $("#class_id").val();
      $.ajax({
        type: "get",
        url: "{{route('exam.config.mark_config.get_group')}}",
        data: {class_id:class_id},
        success: function(data){
          console.log(data);
          let htmlData = '';
          data.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#group_id").html(htmlData);
        }
      });
    });

    $("#search").click(function(){
      let class_id = $("#class_id").val();
      let group_id = $("#group_id").val();
      if(class_id != '' && group_id != ''){
        $("#subject_div").html('');
        $("#exam_div").html('');
        $("#subject_sc_list").html('');
        $.ajax({
          type: "get",
          url: "{{route('exam.config.mark_config.get_subject_exam')}}",
          data: {class_id:class_id,group_id:group_id},
          success: function(data){
            console.log(data);
            let subjectData = '';
            let examData = '';
            let subject_sc_list = '';
            data.subjects.forEach(function(value,index){
              subjectData += `
              <div class="form-group">
                <div class="custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" name="subject_ids[]" value="${value.id}" id="subject_id_${value.id}">
                  <label for="subject_id_${value.id}" class="custom-control-label">${value.name}</label>
                </div>
              </div>
              `;
            });
            $("#subject_div").html(subjectData);
            data.exams.forEach(function(value,index){
              examData += `
              <div class="form-group">
                <div class="custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" name="exam_ids[]" value="${value.id}" id="exam_id_${value.id}">
                  <label for="exam_id_${value.id}" class="custom-control-label">${value.name}</label>
                </div>
              </div>
              `;
            })
            $("#exam_div").html(examData);
            data.short_codes.forEach(function(value,index){
              subject_sc_list += `
              <tr>
                <td>${value.code_title}</td>
                <td><input type="number" name="total_marks[${value.id}]" value="${value.total_marks}" class="form-control form-control-sm"></td>
                <td><input type="number" name="pass_mark[${value.id}]" value="${value.pass_mark}" class="form-control form-control-sm"></td>
                <td><input type="number" name="acceptance[${value.id}]" value="${value.acceptance}" class="form-control form-control-sm"></td>
                <td><input type="number" name="sc_merge[${value.id}]" value="0" class="form-control form-control-sm"></td>
                <td>
                  <a href="#" data-id="${value.id}" class="btn btn-danger btn-sm delete"><i class="fas fa-trash"></i></a>
                </td>
              </tr>
              `;
            })
            $("#subject_sc_list").html(subject_sc_list);
          }
        });
      }
    });

    $("#group_idggggggg").change(function(){
      let class_id = $("#class_id").val();
      let group_id = $("#group_id").val();
      
      if(class_id != '' && group_id != ''){
        $("#subject_config_list").html('');
        $.ajax({
          type: "get",
          url: "{{route('exam.config.subject.list')}}",
          data: {class_id:class_id,group_id:group_id},
          success: function(data){
            console.log(data);
            let htmlData = '';
            //let subjectTypes = parseJSON(data.subjectTypes);
            //console.log(subjectTypes);
            data.list.forEach(function(value,index){
              htmlData += `
              <tr>
                <td>${value.subject}
                  <input type="hidden" name="subject_config_id[${value.id}]" value="${value.id}">
                </td>
                <td>
                  <select name="subject_type[${value.id}]" class="form-control form-control-sm">
                    <option value="${value.subject_type_id}">${value.subject_type_name}</option>                    
                    ${Object.keys(data.subjectTypes).map((key) => {
                      return `<option value="${key}">${data.subjectTypes[key]}</option>`;
                    })}
                </td>
                <td>
                  <input type="number" name="serial[${value.id}]" value="${value.serial}" class="form-control form-control-sm">
                </td>
                <td>
                  <input type="number" name="merge_id[${value.id}]" value="${value.merge_id}" class="form-control form-control-sm">  
                </td>
                <td>
                  <a href="#" data-id="${value.id}" class="btn btn-danger btn-sm delete"><i class="fas fa-trash"></i></a>
                </td>
              </tr>
              `;
            })
            

            $("#subject_config_list").html(htmlData);
          }
        });        
      }
    });


    $("#subject_config_list").on('click','.delete',function(){      
      let id = $(this).data('id');
      let tr = $(this).closest('tr');
      $.ajax({
        url: "{{route('exam.config.subject.delete')}}",
        type: "get",
        data: {id:id},
        success: function(data){
          tr.remove();
        }
      })
      
    });
  </script>
@endsection
