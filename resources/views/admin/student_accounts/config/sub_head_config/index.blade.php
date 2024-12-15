@extends('admin.layouts.layout')
@section('title', __("Sub Head Config"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="card">
  {{-- <div class="card-header">
      <h3 class="card-title">{{__('Choose Subjects')}}</h3>
      <div class="card-tools">
      </div>
  </div> --}}
  <div class="card-body">
    {!! Form::open(array('route'=>['sac.config.subHeadConfig.store'])) !!}
    <div class="row">
      <div class="col-5">
        <div class="form-group">
          {!! Form::label('head_id', __('Head Name'),['class'=>'']) !!}
          {!! Form::select('head_id', $heads,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Head Name')]) !!}
        </div>
      </div>
      <div class="col-7">
        <div class="form-group">
          {!! Form::label('sub_head_ids', __('Sub Head Name'),['class'=>'']) !!}
          {!! Form::select('sub_head_ids[]', $subHeads,null,['class'=>'form-control form-control-sm select2','required'=>true, 'multiple'=>true]) !!}
        </div>
      </div>
    </div>
      {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
    {!! Form::close() !!}
  </div>
</div>
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Sub Head Config List')}}</h3>
      <div class="card-tools">
      </div>
  </div>
  <div class="card-body">
    @include('admin.layouts._message')
    <table id="example1" class="table table-bordered table-striped table-sm">
      <thead>
      <tr>
        <th>{{__('Serial')}}</th>
        <th>{{__('Head')}}</th>
        <th>{{__('Sub Head')}}</th>
        <th>{{__('Action')}}</th>
      </tr>
      </thead>
      <tbody id="subject_config_list">
        @foreach ($subHeadConfigs as $item)
          <tr>
            <td>{{$item->serial}}</td>
            <td>{{$item->head? $item->head->name : ''}}</td>
            <td>{{$item->subHead ? $item->subHead->name : ''}}</td>
            <td>
              <div class="btn-group">
                {{-- <a href="{{route('sac.config.subHeadConfig.edit', $item->id)}}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></a> --}}
                <form class="delete" action="{{ route('sac.config.subHeadConfig.destroy',$item->id) }}" method="post">
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

@endsection
@section('js')

<script>   

  </script>
@endsection
