@extends('admin.layouts.layout')
@section('title', __("Fee Config"))
@section('css')

@endsection
@section('content')
{!! Form::open(array('route'=>['sac.config.save_fee_config'],'id'=>'save_fee_config')) !!}
<div class="card">
  <div class="card-header">
      <h3 class="card-title">{{__('Fee Amount Configuration Here')}}</h3>
      <div class="card-tools">
      </div>
  </div>
  <div class="card-body">
    <div class="row">
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('academic_year_id', __('Academic Year'),['class'=>'']) !!}
          {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Academic Year')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('class_id', __('Class Name'),['class'=>'']) !!}
          {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('group_id', __('Group Name'),['class'=>'']) !!}
          {!! Form::select('group_id', $groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('category_id', __('Category Name'),['class'=>'']) !!}
          {!! Form::select('category_id', $categories,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Category Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <div class="form-group">
          {!! Form::label('head_id', __('Head Name'),['class'=>'']) !!}
          {!! Form::select('head_id', $heads,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Head Name')]) !!}
        </div>
      </div>
      <div class="col-2">
        <input type="hidden" id="save_type" name="save_type">
        <button type="button" id="get_fee_config" class="btn btn-primary btn-sm btn-block">Search</button>
      </div>
    </div>
  </div>
</div>
  <div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Fee Amount Configuration')}}</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <table id="example1" class="table table-bordered table-striped table-sm">
        <thead>
        <tr>
          <th>{{__('Check')}}</th>
          <th>{{__('Fee SubHead')}}</th>
          <th>{{__('Fee Amount')}}</th>
          <th>{{__('Fine Amount')}}</th>
        </tr>
        </thead>
        <tbody id="fee_config_list">
          
        </tbody>
      </table>
    </div>
  </div>
  {{-- Class	Group	Student Category	Fee Head	Fee SubHead	Fee Amount	Fine Amount	Update	Delete --}}
  <div class="card">
    <div class="card-header">
        <h3 class="card-title">{{__('Fee Amount Configuraed List')}}</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
      <table id="example2" class="table table-bordered table-striped table-sm">
        <thead>
        <tr>
          <th>{{__('Class')}}</th>
          <th>{{__('Group')}}</th>
          <th>{{__('Category')}}</th>
          <th>{{__('Fee SubHead')}}</th>
          <th>{{__('Fee Amount')}}</th>
          <th>{{__('Fine Amount')}}</th>
          <th>{{__('Update')}}</th>
          <th>{{__('Delete')}}</th>
        </tr>
        </thead>
        <tbody id="fee_config_list_update">
          
        </tbody>
      </table>
    </div>
  </div>
  {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
{!! Form::close() !!}
@endsection
@section('js')

<script>   
  $("#get_fee_config").click(function(){
    var academic_year_id = $("#academic_year_id").val();
    var class_id = $("#class_id").val();
    var group_id = $("#group_id").val();
    var category_id = $("#category_id").val();
    var head_id = $("#head_id").val();
    $.ajax({
      type: "get",
      url: "{{route('sac.config.get_fee_config')}}",
      data: {academic_year_id:academic_year_id,class_id:class_id,group_id:group_id,category_id:category_id,head_id:head_id},
      success: function(data){
        $("#fee_config_list").empty();
        $("#fee_config_list_update").empty();
        let html_data = '';
        let html_data_config = '';
        console.log(data);
        if(data.status == true){
          data.sub_heads.forEach((data) => {
          html_data += `
          <tr>
            <td><input type="checkbox" checked name="fee_config_id[${data.id}]" value="${data.id}"></td>
            <td>${data.name}</td>
            <td><input type="number" name="fee_amount[${data.id}]" value="${data.fee_amount??0}" class="form-control form-control-sm"></td>
            <td><input type="number" name="fine_amount[${data.id}]" value="${data.fine_amount??0}" class="form-control form-control-sm"></td>
          </tr>
          `;
          });
          $("#fee_config_list").append(html_data);

          if(data.fee_configs.length > 0){
            console.log(data.fee_configs);
            data.fee_configs.forEach((data) => {
              html_data_config += `
              <tr>
                <td>
                  ${data.class} 
                </td>
                <td>
                  ${data.group} 
                </td>
                <td>
                  ${data.category} 
                </td>
                <td>
                  ${data.sub_head_name} 
                </td>
                <td>
                  <input type="number" name="fee_amount" value="${data.fee_amount}" class="form-control form-control-sm">
                </td>
                <td>
                  <input type="number" name="fine_amount" value="${data.fine_amount}" class="form-control form-control-sm">
                </td>
                <td>
                  <a href="javascript:void(0)" data-id="${data.id}" class="btn btn-primary btn-sm update"><i class="fas fa-edit"></i></a>
                </td>
                <td>
                  <a href="javascript:void(0)" data-id="${data.id}" class="btn btn-danger btn-sm delete"><i class="fas fa-trash"></i></a>
                </td>
              </tr>
              `;
            });
            $("#fee_config_list_update").append(html_data_config);            
          }
        }
        
      }
    });
  });

  $("#save_fee_config").submit(function(e){
    e.preventDefault();
    let data = new FormData(this);
    $.ajax({
      type: "post",
      url: $(this).attr('action'),
      data: data,
      cache: false,
      contentType: false,
      processData: false,
      success: function(data){
        console.log(data);
        if(data.status == true){
          alert(data.message);
        }else{
          console.log(data);
          //alert(data.errors);
        }
      }
    });
  });

  $("#fee_config_list_update").on('click','.update',function(){
    let id = $(this).data('id');
    let fee_amount = $(this).closest('tr').find('input[name="fee_amount"]').val();
    let fine_amount = $(this).closest('tr').find('input[name="fine_amount"]').val();
    let tr = $(this).closest('tr');
    $.ajax({
      url: "{{route('sac.config.update_fee_config')}}",
      type: "post",
      data: {fee_config_id:id,fee_amount:fee_amount,fine_amount:fine_amount,_token:"{{csrf_token()}}"},
      success: function(data){
        tr.remove();
        if(data.status == true){
          if(data.message){
            $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${data.message}</div>`);
          }
        }
      }
    })
  });

  $("#fee_config_list_update").on('click','.delete',function(){
    let id = $(this).data('id');
    let tr = $(this).closest('tr');
    if(confirm('Are You Sure To Delete This Item?')){      
      $.ajax({
        url: "{{route('sac.config.delete_fee_config')}}",
        type: "post",
        data: {fee_config_id:id,_token:"{{csrf_token()}}"},
        success: function(data){
          tr.remove();
          if(data.status == true){
            if(data.message){
              $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${data.message}</div>`);
            }
          }
        }
      });
    }
  });

  </script>
@endsection
