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
                        <div class="input-group">
                            <div class="custom-file">
                              {!! Form::file('file',['class'=>'form-control','id'=>'file','required'=>false]) !!}
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        
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
                                <th>{{__('Mobile')}}</th>
                                <th>{{__('Name')}}</th>
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

    $("#file").change(function(){        
        $.LoadingOverlay("show");
        $("#errorMsg").html('');
        $('#student_list').html('');
        //$(this)[0]
        let formData = new FormData();
        formData.append('file', $(this)[0].files[0]);
        formData.append('_token', '{{ csrf_token() }}');
        console.log(formData);
        $.ajax({
            url: "{{ route('sms.get_file_data') }}",
            type: "POST",
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            success: function(json){
                if(json.status == true){
                    json.students.forEach(function(value,index){
                        var html = `<tr>
                        <td>
                        <input type="checkbox" checked class="student_id" name="student_id[${index}]" value="1">
                        </td>
                        <td>${value.mobile}<input type="hidden" name="mobile[${index}]" value="${value.mobile}"></td>
                        <td>${value.name ?? ''}</td>
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