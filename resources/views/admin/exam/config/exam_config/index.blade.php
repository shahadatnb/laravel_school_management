@extends('admin.layouts.layout')
@section('title', __("Exam Config"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-4">
    <div class="card">
      {{-- <div class="card-header">
          <h3 class="card-title">{{__('Choose Subjects')}}</h3>
          <div class="card-tools">
          </div>
      </div> --}}
      <div class="card-body">
        {!! Form::open(array('route'=>['exam.config.exam_config.store'])) !!}
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
              {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('merit_process_type_id', __('Merit Process Type'),['class'=>'']) !!}
              {!! Form::select('merit_process_type_id', $meritProcessTypes,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Merit Process Type')]) !!}
            </div>
          </div>
        </div>
        @foreach ($examLists as $examList)
          <div class="form-group">
            <div class="custom-control custom-checkbox">
              <input class="custom-control-input" type="checkbox" name="exam_ids[]" value="{{$examList->id}}" id="exam_ids{{$examList->id}}">
              <label for="exam_ids{{$examList->id}}" class="custom-control-label">{{$examList->name}}</label>
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
            <h3 class="card-title">{{__('Exam Configuration List')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          @include('admin.layouts._message')
          <table id="example1" class="table table-bordered table-striped table-sm">
            <thead>
            <tr>
              <th>{{__('Class')}}</th>
              <th>{{__('Exam')}}</th>
              <th>{{__('Merit Process Type')}}</th>
              <th>{{__('Action')}}</th>
            </tr>
            </thead>
            <tbody id="subject_config_list">
              @foreach ($examConfigurations as $examConfig)
                <tr>
                  <td>{{$examConfig->semester? $examConfig->semester->name : ''}}</td>
                  <td>{{$examConfig->exam ? $examConfig->exam->name : ''}}</td>
                  <td>{{$examConfig->meritProcessType->name}}</td>
                  <td>
                    <div class="btn-group">
                      <a href="{{route('exam.config.exam_config.edit', $examConfig->id)}}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a>
                      <form class="delete" action="{{ route('exam.config.exam_config.destroy',$examConfig->id) }}" method="post">
                        {{ csrf_field() }}
                        {{ method_field('DELETE') }}
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are You Sure To Delete This Item?')"><i class="fa fa-trash"></i></button>
                      </form>
                    </div>
                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

@endsection
@section('js')

<script>   

  </script>
@endsection
