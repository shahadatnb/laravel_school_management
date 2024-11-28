<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <title>Admission Form</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 17px;
        }
        body::before{
            background-image: url('{{public_path('/upload/site_file/'.config('settings.siteLogo',''))}}');
            background-repeat:no-repeat;
            background-position:center center;
            content: ' ';
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            opacity: 0.15;
            background-position: 50% 50%;
        }
        .text-center{
            text-align: center;
        }
        .m-0{margin: 0}

        .img-thumbnail{
            border: 2px solid #ddd;
            max-width: 100%;
        }

        .heading{
            position: relative;
        }
        .table{
            width: 100%;
        }

        .border-b{
            border-bottom: 1px solid #ddd;
        }

        .student_photo{
            position:absolute;
            top: 0;
            right: 0;
            width: 120px;
        }

    </style>
</head>
<body>
<div class="text-center">
    <img width="80" class="attachment-img" src="{{public_path('/upload/site_file/'.config('settings.siteLogo',''))}}" alt="{{ config('settings.siteTitle','') }}">
    {{-- <div class="heading">
        <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
        <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
        <p class="text-center m-0">({{ config('settings.siteWeb') }})</p>
        
        <div class="student_photo">
            <img style="max-width: 100%" class="img-thumbnail" src="{{public_path('/storage/'.$student->photo)}}" alt="">
        </div>
    </div> --}}

    <table class="table">
        <tr>
            <td width="15%"></td>
            <td width="70%" align="center">
                <div class="heading text-center">
                    <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
                    <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
                    <p class="text-center m-0">({{ config('settings.siteWeb') }})</p>
                </div>
            </td>
            <td width="15%"><img width="100" class="img-thumbnail" src="{{public_path('/storage/'.$student->photo)}}" alt=""></td>
        </tr>
    </table>
    
</div>
<p style="margin-top:0;">
    To <br>
    District Cultural Officer<br>
    Zila Shilpakala Academy, Natore
</p>
<table class="table">
    <tr>
        <td>1) {{__('Department')}}</td>
        <td colspan="3" class="border-b">: @if($student->department){{$student->department->title}}@endif</td>
    </tr>
    <tr>
        <td>2) {{__('Name Of Student')}}</td>
        <td colspan="3" class="border-b">: {{$student->name}}</td>
    </tr>
    <tr>
        <td>3) {{__('Father`s Name')}}</td>
        <td colspan="3" class="border-b">: {{$student->fathersName}}</td>
    </tr>
    <tr>
        <td>4) {{__('Mother`s Name')}}</td>
        <td colspan="3" class="border-b">: {{$student->mothersName}}</td>
    </tr>
    <tr>
        <td colspan="4">5) {{__('Present Address')}}</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;{{__('Village')}}</td>
        <td class="border-b">: {{$student->presentVillage}}</td>
        <td>&nbsp;&nbsp;&nbsp;{{__('Post Office')}}</td>
        <td class="border-b">: {{$student->presentPost}}</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;{{__('Upazila')}}</td>
        <td class="border-b">: @if($student->presentUpazilaName){{$student->presentUpazilaName->name}}@endif</td>
        <td>&nbsp;&nbsp;&nbsp;{{__('Zila')}}</td>
        <td class="border-b">: @if($student->presentZilaName){{$student->presentZilaName->name}}@endif</td>
    </tr>
    <tr>
        <td colspan="4">6) {{__('Permanent Address')}}</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;{{__('Village')}}</td>
        <td class="border-b">: {{$student->permanentVillage}}</td>
        <td>&nbsp;&nbsp;&nbsp;{{__('Post Office')}}</td>
        <td class="border-b">: {{$student->permanentPost}}</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;{{__('Upazila')}}</td>
        <td class="border-b">: @if($student->permanentUpazilaName){{$student->permanentUpazilaName->name}}@endif</td>
        <td>&nbsp;&nbsp;&nbsp;{{__('Zila')}}</td>
        <td class="border-b">@if($student->permanentZilaName){{$student->permanentZilaName->name}}@endif</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;{{__('Educational Qualification')}}</td>
        <td colspan="3" class="border-b">: {{$student->shift}}</td>
    </tr>
    <tr>
        <td>7) {{__('Date of Birth')}}</td>
        <td colspan="3" class="border-b">: {{shortDate($student->dateOfBirth)}}</td>
    </tr>    
    <tr>
        <td>8) {{__('Educational Qualification')}}</td>
        <td colspan="3" class="border-b">: {{$student->shift}}</td>
    </tr>
    <tr>
        <td>9) {{__('gardian_student_mobile')}}</td>
        <td colspan="3" class="border-b">: {{$student->gardian_student_mobile}}</td>
    </tr>
    <tr>
        <td>10) {{__('student_group')}}</td>
        <td colspan="3" class="border-b">: {{$student->student_group}}</td>
    </tr>
    <tr>
        <td>11) {{__('student_mobile')}}</td>
        <td colspan="3" class="border-b">: {{$student->student_mobile}}</td>
    </tr>
</table>
    
    <p>The above information is correct. If admitted I will be bound to abide by all rules and regulations of Zila Shilpakala Academy, Natore.</p>
<br> <br>
    <table class="table">
        <tr>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td align="center" style="border-top: 1px solid #000">Signature and date of guardian</td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td align="center" style="border-top: 1px solid #000">Applicant's signature and date</td>
            <td>&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    <p style="border-top: 1px solid #000; width:100%"></p>
    <p>Admission is allowed in @if($student->department){{$student->department->title}}@endif Training Department of Zila Shilpakala Academy, Natore.<br>
        @if ($payment)
        Date: {{shortDate($payment->created_at)}} Receipt No:  {{$payment->id}}
        @endif        
        ID Number: {{$student->reg_no}}
    </p>
    <br>
    <p style="text-align: right"><span style="border-top: 1px solid #000">Signature and date of District Cultural Officer</p>
</body>
</html>