@extends('admin.layouts.layout')
@section('title',"Exam Config")
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Edit Exam Config')}}</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fas fa-minus"></i></button>
        <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
            <i class="fas fa-times"></i></button>
        </div>
    </div>
    <div class="card-body">
    {{ Form::model($examConfig, ['route' => ['exam.config.exam_config.update', $examConfig->id],'class'=>'row', 'method' => 'PUT']) }}
        <div class="col">
            {!! Form::label('class', __('Class'),['class'=>'']) !!}
            {{$examConfig->semester? $examConfig->semester->name : ''}}
        </div>
        <div class="col">
            {!! Form::label('exam', __('Exam'),['class'=>'']) !!}
            {{$examConfig->exam ? $examConfig->exam->name : ''}}
        </div>
        <div class="col">
            <div class="form-group">
                {!! Form::label('merit_process_type_id', __('Merit Process Type'),['class'=>'']) !!}
                {!! Form::select('merit_process_type_id', $meritProcessTypes,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Merit Process Type')]) !!}
            </div>
        </div>
        <div class="col">
        {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        </div>
    {!! Form::close() !!}
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection