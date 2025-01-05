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
            <div class="card-header">
            
            </div><!-- /.card-header -->
            <div class="card-body">
            
            </div><!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>    
</div>
{!! Form::close() !!}
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script src="{{asset('/assets/admin/js/sms.counter.js')}}"></script>
<script>
$(document).ready(function() {
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

    $("#messagecontent").on("change keyup paste", function () {
        countSmsBody();
    });

    countSmsBody = function () {
        var msg = $("#messagecontent").val();
        var data = SMSCounter.count(msg, true);
        var length = data["length"];
        var remaining = data["remaining"];
        var part_count = data["part_count"];
        var text = data["text"];
        var per_message = data["per_message"];
        var encoding = data["encoding"];
        var sms_type = "";
        if (encoding == "GSM_7BIT") {
        sms_type = "Normal";
        } else if (encoding == "GSM_7BIT_EX") {
        sms_type = "Extended"; // for 7 bit GSM: ^ { } \ [ ] ~ | €
        } else if (encoding == "GSM_7BIT_EX_TR") {
        sms_type = "Turkish"; // Only for Turkish Characters "Ş ş Ğ ğ ç ı İ" encoding see https://en.wikipedia.org/wiki/GSM_03.38#Turkish_language_.28Latin_script.29
        } else if (encoding == "UTF16") {
        sms_type = "Unicode"; // for other languages "Arabic, Chinese, Russian" see http://en.wikipedia.org/wiki/GSM_03.38#UCS-2_Encoding
        }

        if (length < 1) {
        $("#smsbodycountdiv").text(" 1/0 : (160 Characters Per SMS)");
        } else {
        $("#smsbodycountdiv").text(
            part_count +
            "/" +
            length +
            "  : (" +
            per_message +
            " Characters Per SMS)"
        );
        }
    };

})
</script>
@endsection