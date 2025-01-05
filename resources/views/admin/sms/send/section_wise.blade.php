@extends('admin.layouts.layout')
@section('title',"Send SMS")
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
{!! Form::open(array('route'=>['sms.send.post'],'method'=>'POST','files' => true)) !!}
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
                            {!! Form::label('section_id', __('Select Section'),['class'=>'']) !!}
                            {!! Form::select('section_id', $class_configs,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Section')]) !!}
                        </div>
                    </div>
                    <div class="col-3">
                        <button type="button" id="search_student" class="btn btn-info btn-block">Search</button>
                    </div>
                </div>
            </div><!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>    
</div>
{!! Form::close() !!}
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script>
$(document).ready(function() {

    $("#search_student").click(function(){
        let section_id = $('#section_id').val();
        let academic_year_id = $('#academic_year_id').val();
        if(section_id == ''){
            alert('Please select section');
            return false;
        }
        if(academic_year_id == ''){
            alert('Please select year');
            return false;
        }

        $.ajax({
            url: "{{ route('sms.get_students') }}",
            type: "GET",
            data: {section_id:section_id,academic_year_id:academic_year_id},
            success: function(data){
                console.log(data);
                $('#student_table').html(data);
            }
        })
    });


    var arr = [];
    
    $('#template').on('change', function() {
        let template_id = $(this).val();
        if(template_id == ''){
            return false;
        }
        let url = "{{ url('sms/smsTemplate') }}/"+template_id;
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function(data){
                $('#content').val(data.content);
            }
        })
    });

    function smsType(type){
        var $radios = $('input:radio[name=numberType]');
        //if($radios.is(':checked') === false) {
            $radios.filter('[value='+type+']').prop('checked', true);
        //}
    }

    $("input[name='contacts[]']").change(function() {
        smsType('contact');
    });

    $("#file").change(function() {
        smsType('excel');
    });

    $('#selectAllStudent').click(function(){
        if($(this).is(':checked')){
            $('input.studentNumber').prop('checked', true);
            smsType('contact');
        }else{
            $('input.studentNumber').prop('checked', false);
        }
    });

    $('#selectAllSupplier').click(function(){
        if($(this).is(':checked')){
            $('input.supplierNumber').prop('checked', true);
            smsType('contact');
        }else{
            $('input.supplierNumber').prop('checked', false);
        }
    });

    $('#selectAllContact').click(function(){
        if($(this).is(':checked')){
            $('input.contactNumber').prop('checked', true);
            smsType('contact');
        }else{
            $('input.contactNumber').prop('checked', false);
        }
    });

    $('.dselectAll').click(function(){
        $('input[name="contacts[]"]').prop('checked', false);
    });

    $(function () {
      $("#student_table").DataTable({
        "responsive": true,
        "autoWidth": false,
        "paging": false,
      });      
    });
    $(function () {
      $("#supplier_table").DataTable({
        "responsive": true,
        "autoWidth": false,
        "paging": false,
      });      
    });
    $(function () {
      $("#contact_table").DataTable({
        "responsive": true,
        "autoWidth": false,
        "paging": false,
      });      
    });

})
</script>
@endsection