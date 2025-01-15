@extends('admin.layouts.layout')
@section('title', __("Marksheet"))
@section('css')

@endsection
@section('content')
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Mark Sheet')}}</h3>
      <div class="card-tools">
        {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
      </div>
  </div>
  <div class="card-body">
    @include('admin.layouts._message')
    {!! Form::open(['route' => ['exam.result.marksheet'], 'method' => 'get']) !!}
    <div class="row">
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('academic_year_id', __('Year'),['class'=>'']) !!}
          {!! Form::select('academic_year_id', $academic_years,$data['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('section_id', __('Select Section'),['class'=>'']) !!}
          {!! Form::select('section_id', $class_configs,$data['section_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Section')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('exam_id', __('Select Exam'),['class'=>'']) !!}
          {!! Form::select('exam_id', [],$data['exam_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Exam')]) !!}
        </div>
      </div>
      <div class="col-2">
        <button type="submit" class="btn btn-info btn-block">Process</button>
      </div>
    </div>    
    {!! Form::close() !!}
  </div>
</div>
<div class="card">
  <div class="card-header">
      @include('admin.exam.result.marksheet_pdf')
  </div>
  <div class="card-body">
    
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
        }
      });
    });

    $( document ).ready(function() {
      $("#section_id").trigger("change");
    });

</script>
@endsection
