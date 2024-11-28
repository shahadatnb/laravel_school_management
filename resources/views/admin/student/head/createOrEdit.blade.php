@extends('admin.layouts.layout')
@section('title',"Invoice Head")
@section('content')
<!-- Default box -->
<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title">Invoice Head</h3>
        <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fas fa-minus"></i></button>
        <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
            <i class="fas fa-times"></i></button>
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      @if ($mode == 'edit')
        {!! Form::model($invoiceHead, array('route'=>['invoiceHead.update',$invoiceHead],'method'=>'PUT','files' => true)) !!}
        {{-- {!! Form::model($category,['route'=>['category.update',$category], 'method'=>'PUT','enctype'=>'multipart/form-data']) !!} --}}

      @else
        {!! Form::open(array('route'=>['invoiceHead.store'],'files' => true)) !!}
      @endif
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('title', __('Title'),['class'=>'']) !!}
              {!! Form::text('title',null,['class'=>'form-control','placeholder'=> __('Title')]) !!}
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              {!! Form::label('amount', __('Amount'),['class'=>'']) !!}
              {!! Form::number('amount',null,['class'=>'form-control','placeholder'=> __('Amount')]) !!}
            </div>
          </div>
        </div>
      </div>
      {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
      {!! Form::close() !!}
    <!-- /.card-body -->
    <div class="card-footer">
        
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
