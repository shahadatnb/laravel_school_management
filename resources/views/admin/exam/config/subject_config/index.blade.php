@extends('admin.layouts.layout')
@section('title', __("Exam Subject Config"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-4">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Choose Subjects')}}</h3>
          <div class="card-tools">
            {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
          </div>
      </div>
      <div class="card-body">
        {!! Form::open(array('route'=>['exam.config.subject.store'])) !!}
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
              {!! Form::select('group_id', $groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group Name')]) !!}
            </div>
          </div>
        </div>
        @foreach ($examSubject as $subject)
          <div class="form-group">
            <div class="custom-control custom-checkbox">
              <input class="custom-control-input" type="checkbox" name="subject_ids[]" value="{{$subject->id}}" id="subject_id{{$subject->id}}">
              <label for="subject_id{{$subject->id}}" class="custom-control-label">{{$subject->name}}</label>
            </div>
          </div>
        @endforeach

          {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        {!! Form::close() !!}
      </div>
    </div>
    </div>
    <div class="col-md-8">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Subject Configuration List')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          @include('admin.layouts._message')
          {!! Form::open(array('route'=>['exam.config.subject.multiple_update'])) !!}
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
      $("#group_id").prop('selectedIndex',0);
      let class_id = $("#class_id").val();
      $.ajax({
        type: "get",
        url: "{{route('exam.config.mark_config.get_group')}}",
        data: {class_id:class_id},
        success: function(data){
          console.log(data);
          let htmlData = '<option value="">----------</option>';
          data.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#group_id").html(htmlData);
        }
      });
    });
    $("#group_id").change(function(){
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
                  <input type="number" name="merge_id[${value.id}]" value="${value.merge}" class="form-control form-control-sm">  
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
