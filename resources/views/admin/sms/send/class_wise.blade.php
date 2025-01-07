@extends('admin.layouts.layout')
@section('title',"Send SMS Class Wise")
@section('css')
@endsection
@section('content')
{!! Form::open(array('route'=>['sms.send.post'],'method'=>'POST','id'=>'sms_send','files' => true)) !!}
<div class="row">
    <div class="col-sm-12 col-md-3">
        @include('admin.sms.send.send_box')
    </div>
    <div class="col-sm-12 col-md-9">
        <!-- Default box -->
        <div class="card">
            <div class="card-header p-2">
            
            </div><!-- /.card-header -->
            <div class="card-body">
                <div class="row">                    
                    <div class="col-3">
                        <div class="form-group">
                            {!! Form::label('academic_year_id', __('Year'),['class'=>'']) !!}
                            {!! Form::select('academic_year_id', $academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            {!! Form::label('class_id', __('Select Class'),['class'=>'']) !!}
                            {!! Form::select('class_id', $semesters,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Class')]) !!}
                        </div>
                    </div>
                    <div class="col-3">
                        <button type="button" id="search_student" class="btn btn-info btn-block">Search</button>
                    </div>
                    <div class="col-3">
                        <button type="submit" class="btn btn-success btn-block">Send SMS</button>
                    </div>
                </div>
                <div id="errorMsg"></div>
                <div class="table-responsive">
                    <table class="table table-bordered table-sm" id="student_table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"></th>
                                <th>{{__('Roll')}}</th>
                                <th>{{__('Name')}}</th>
                                <th>{{__('Father Name')}}</th>
                                <th>{{__('Mother Name')}}</th>
                                <th>{{__('Mobile')}}</th>
                            </tr>
                        </thead>
                        <tbody id="student_list">
                        </tbody>
                    </table>
                </div>              

            </div><!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>    
</div>
{!! Form::close() !!}
@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>

<script>
$(document).ready(function() {

    $("#search_student").click(function(){
        let class_id = $('#class_id').val();
        let academic_year_id = $('#academic_year_id').val();
        if(class_id == ''){
            alert('Please select section');
            return false;
        }
        if(academic_year_id == ''){
            alert('Please select year');
            return false;
        }
        $.LoadingOverlay("show");
        $("#errorMsg").html('');
        $('#student_list').html('');
        $.ajax({
            url: "{{ route('sms.get_students') }}",
            type: "GET",
            data: {class_id:class_id,academic_year_id:academic_year_id,type:'class_wise'},
            success: function(json){
                if(json.status == true){
                    json.students.forEach(function(value,index){
                        var html = `<tr>
                        <td>
                        <input type="checkbox" checked class="student_id" name="student_id[]" value="${value.id}">
                        </td>
                        <td>${value.class_roll}</td>
                        <td>${value.name}</td>
                        <td>${value.fathersName}</td>
                        <td>${value.mothersName}</td>
                        <td>${value.mobile}<input type="hidden" name="mobile[${value.id}]" value="${value.mobile}"></td>
                        </tr>`;
                        $('#student_list').append(html);
                    });
                }else{
                    //console.log(json);
                    if(json.message){
                        $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
                    }
                    json.errors.forEach(function(element){
                        $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
                    });
                    //alert(data.errors);
                }
            }
        });
        $.LoadingOverlay("hide");
    });

});
</script>
@endsection