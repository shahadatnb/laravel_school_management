@extends('admin.layouts.layout')
@section('title', __("Merit Class Wise"))
@section('css')

@endsection
@section('content')
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Merit Class Wise')}}</h3>
      <div class="card-tools">
        {{-- <a class="btn btn-primary btn-sm" href="{{ route('exam.setup.examList.create')}}">New Item</a> --}}
      </div>
  </div>
  <div class="card-body">
    {!! Form::open(['route' => ['exam.result.merit_class_wise'], 'method' => 'get']) !!}
    @include('admin.layouts._message')
    <div class="row">
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('academic_year_id', __('Year'),['class'=>'']) !!}
          {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('class_id', __('Select Class'),['class'=>'']) !!}
          {!! Form::select('class_id', $class_configs,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Section')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('exam_id', __('Select Exam'),['class'=>'']) !!}
          {!! Form::select('exam_id', [],null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Exam')]) !!}
        </div>
      </div>
      <div class="col-2">
        <button type="submit" class="btn btn-info btn-block">Result</button>
      </div>
    </div>    
    {!! Form::close() !!}
  </div>
</div>
{{-- Student ID	Student Name	Student Roll	Total Marks	Grand Total Marks	Section Position	Grade	CGPA --}}
<div class="card">
  <div class="card-body">
    <table id="example1" class="table table-bordered table-striped table-sm">
      <thead>
      <tr>
        <th>{{__('Student ID')}}</th>
        <th>{{__('Student Name')}}</th>
        <th>{{__('Student Roll')}}</th>
        <th>{{__('Total Marks')}}</th>
        {{-- <th>{{__('Grand Total Marks')}}</th> --}}
        <th>{{__('Class Position')}}</th>
        <th>{{__('Grade')}}</th>
        <th>{{__('CGPA')}}</th>
      </tr>
      </thead>
      <tbody id="student_list">
        @foreach($results as $result)
        <tr>
          <td>{{$result->student->reg_no}}</td>
          <td>{{$result->student->name}}</td>
          <td>{{$result->student->class_roll}}</td>
          <td>{{$result->total_marks}}</td>
          {{-- <td>{{$result->grand_total_marks}}</td> --}}
          <td>{{$result->class_position}}</td>
          <td>{{$result->grade}}</td>
          <td>{{$result->grade_point}}</td>
        </tr>
        @endforeach
      </tbody>
    </table>
  </div>
</div>

@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
    $("#class_id").change(function(){
      let class_id = $("#class_id").val();
      if(class_id == '') return false;
      $.ajax({
        type: "get",
        url: "{{route('exam.config.get_exam_by_semester')}}",
        data: {class_id:class_id},
        success: function(data){
          //console.log(data);
          htmlData = '';
          data.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#exam_id").html(htmlData);
        }
      });
    });

</script>
@endsection
