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
    {{ Form::open(['route' => ['exam.config.final_mark_config.update']]) }}
        @foreach ($examConfigs as $item)
            <div class="row">
                <div class="col">
                    <input type="hidden" name="exam_config_ids[{{$item->id}}]" value="{{$item->id}}">
                    {!! Form::label('Exam', __('Exam'),['class'=>'']) !!}
                    {{$item->exam ? $item->exam->name : ''}}
                </div>
                <div class="col">
                    <div class="form-group">
                        {!! Form::label('percentage', __('Percentage'),['class'=>'']) !!}
                        <input type="number" name="percentage[{{$item->id}}]" value="{{$item->percentage}}" class="form-control form-control-sm" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        {!! Form::label('serial', __('Serial'),['class'=>'']) !!}
                        <input type="number" name="serial[{{$item->id}}]" value="{{$item->serial}}" class="form-control form-control-sm" required>
                    </div>
                </div>
            </div>
        @endforeach
        
        {{ Form::submit('Update',array('class'=>'btn btn-primary')) }}
    {!! Form::close() !!}
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection