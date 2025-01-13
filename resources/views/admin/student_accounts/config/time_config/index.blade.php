@extends('admin.layouts.layout')
@section('title', __("Fee Subhead Time Configuration"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-6">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Fee Head')}}</h3>
          <div class="card-tools">
          </div>
      </div>
      <div class="card-body">
        @include('admin.layouts._message')
        {!! Form::open(array('route'=>['sac.config.save_fee_time'],'id'=>'save_fee_time')) !!}
          <div class="form-group">
            {!! Form::label('head_id', __('Head Name'),['class'=>'']) !!}
            {!! Form::select('head_id', $heads,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
          </div>
          <div class="col-12">
            <h3 class="text-center">{{__('Fee Head List')}}</h3>
            <table class="table table-sm table-bordered table-striped">
              <thead>
                <tr>
                  {{-- <th>{{__('Fee Head')}}</th> --}}
                  <th>{{__('Fee Subhead')}}</th>
                  <th>{{__('Payable Year')}}</th>
                  <th>{{__('Payable Month')}}</th>
                  {{-- <th>{{__('Action')}}</th> --}}
                </tr>
              </thead>
              <tbody id="fee_head_list">
                
              </tbody>
            </table>
          </div>
        </div>
        {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        {!! Form::close() !!}          
      </div>
    </div>

    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Year Wise Fee Head')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-4">
              <div class="form-group">
                {!! Form::label('academic_year_id', __('Select Year'),['class'=>'']) !!}
                {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Year')]) !!}
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                {!! Form::label('fee_head_id', __('Select Feehead'),['class'=>'']) !!}
                {!! Form::select('fee_head_id',$heads,null,['class'=>'form-control form-control-sm select2','id'=>'fee_head_id','required'=>true,'placeholder'=> __('Select Feehead')]) !!}
              </div>
            </div>
            <div class="col-4">
              <button type="button" id="get_time_config" class="btn btn-primary btn-sm btn-block">Search</button>
            </div>
          </div>
          <table id="subject_config_list_table" class="table table-bordered table-striped table-sm mt-3">
            <thead>
              <tr>
                <th>{{__('Fee Head')}}</th>
                <th>{{__('Fee Subhead')}}</th>
                <th>{{__('Payable Year')}}</th>
                <th>{{__('Payable Month')}}</th>
                <th>{{__('Action')}}</th>
              </tr>
            </thead>
            <tbody id="time_config_list">
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
    const academic_years = {!! json_encode($academic_years) !!};
    const default_year = {{ session('branch')['academic_year_id'] }};
    const academic_years_options = Object.keys(academic_years).map((key) => `<option ${default_year == key ? 'selected' : ''} value="${key}">${academic_years[key]}</option>`);
    //console.log(academic_years_options);
    // academic_years.forEach(function(value,index){
      //   console.log(value);
      // });
      const months = {!! json_encode($months) !!};
      //console.log(months);
      const month_options = Object.keys(months).map((key) => `<option value="${key}">${months[key]}</option>`);
      console.log(month_options);

    $("#head_id").change(function(){
      let head_id = $("#head_id").val();
      if(head_id == '') return false;
      $.LoadingOverlay("show");
      $.ajax({
        type: "get",
        url: "{{route('sac.config.get_sub_head')}}",
        data: {head_id:head_id},
        success: function(data){
          console.log(data);
          let htmlData = '';
          data.sub_heads.forEach(function(value,index){
            htmlData += `<tr>
            <td>${value.name}
            <input type="hidden" name="sub_head_ids[${value.id}]" value="${value.id}"></td>
            <td><select name="academic_year_ids[${value.id}]" class="form-control form-control-sm select2" required>`;
              academic_years_options.forEach(function(value1,index1){
              htmlData += value1;
            });
            htmlData += `</select></td>
            <td><select name="months[${value.id}]" class="form-control form-control-sm select2" required>`;
              month_options.forEach(function(value1,index1){
              htmlData += value1;
            });
            htmlData += `</select></td>
            </tr>`;            
          })
          $("#fee_head_list").html(htmlData);
          $.LoadingOverlay("hide");
        }
      });
    });

    $("#save_fee_time").submit(function(e){
      e.preventDefault();
      $("#errorMsg").empty();
      $.LoadingOverlay("show");
      let data = new FormData(this);
      $.ajax({
        type: "post",
        url: $(this).attr('action'),
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        success: function(json){
          console.log(json);
          if(json.status == true){
            if(json.message){
              $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${json.message}</div>`);
            }
          }else{
            console.log(json);
            if(json.message){
              $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
            }
            json.errors.forEach(function(element){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
            });
            //alert(data.errors);
          }
          $.LoadingOverlay("hide");
        }
      });
    });

    $("#get_time_config").click(function(){
      let academic_year_id = $("#academic_year_id").val();
      let fee_head_id = $("#fee_head_id").val();
      $.LoadingOverlay("show");
      $.ajax({
        type: "get",
        url: "{{route('sac.config.get_time_config')}}",
        data: {academic_year_id:academic_year_id,fee_head_id:fee_head_id},
        success: function(data){
          console.log(data);
          let htmlData = '';
          data.forEach(function(value,index){
            htmlData += `
            <tr>
            </tr>
            `;
          });
          $("#time_config_list").html(htmlData);
          $.LoadingOverlay("hide");
        }
      });
    });
    
  </script>
@endsection
