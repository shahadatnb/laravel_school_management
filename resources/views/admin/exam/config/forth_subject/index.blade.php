@extends('admin.layouts.layout')
@section('title', __("Exam Forth Subject Config"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
  <div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Choose Forth Subjects')}}</h3>
        <div class="card-tools">
          <a class="btn btn-primary btn-sm" href="{{ route('exam.config.fourth_assign.create')}}">Add Fourth Subject</a>
        </div>
    </div>
    <div class="card-body">
    {!! Form::open(array('route'=>['exam.config.fourth_assign.show'], 'class'=>'row')) !!}
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

      
    </div>
  </div>

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
        let htmlData = '';
        data.groups.forEach(function(value,index){
          htmlData += `
          <option value="${value.id}">${value.name}</option>
          `;
        })
        $("#group_id").html(htmlData);
      }
    })
  });
</script>
@endsection
