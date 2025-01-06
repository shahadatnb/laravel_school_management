<div class="card card-primary card-outline">
    <div class="card-body">
        @include('admin.layouts._message')
        <div class="form-group">
            {!! Form::label('template', __('Select Template'),['class'=>'']) !!}
            {!! Form::select('template',$templates,null,['class'=>'form-control','placeholder'=> __('Select Template')]) !!}
        </div>
        <div class="form-group">
            {!! Form::label('content', __('Content'),['class'=>'']) !!}
            {!! Form::textarea('content',null,['class'=>'form-control','placeholder'=> __('Content')]) !!}
            {!! Form::hidden('numberType', 'contact') !!}
        </div>
        <div class="form-group">
            <div class="text-primary">
            <h4 id="smsbodycountdiv">1/0  : (160 Characters Per SMS)</h4>
            </div>
        </div>
        {{ Form::submit(__('Send'),array('class'=>'btn btn-primary')) }}
    </div>
    <!-- /.card-body -->
</div>
@section('js2')
<script src="{{asset('/assets/admin/js/sms.counter.js')}}"></script>
<script>
    $("#content").on("change keyup paste", function () {
        countSmsBody();
    });

    countSmsBody = function () {
        var msg = $("#content").val();
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

</script>
@endsection