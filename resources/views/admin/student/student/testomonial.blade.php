<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <title>Certificate</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 18px;            
        }
        .main-content p{
            line-height: 25px;
        }
        .certifecket{
            height: 94%;
            padding: 25px;
            border: 5px double black;
            position: relative;
        }
        .certifecket::before{
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

        .table{
            width: 100%;
        }

        .border-b{
            border-bottom: 1px solid #ddd;
        }

        .border-b-2 {
            border-bottom: 2px solid #000;
        }

        footer{
            position: absolute;
            bottom: 15px;
            width: 95%;
        }

    </style>
</head>
<body>
<div class="certifecket">
<div class="text-center">
    <div class="heading text-center">
        <p class="text-center m-0">{!! config('settings.tagLine') !!}</p>
        <p class="text-center m-0">{!! config('settings.tagLine2', 'Office of the Principal') !!}</p>
        <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
        {{-- <p class="text-center m-0">({{ config('settings.siteWeb') }})</p> --}}
    </div>
    <table class="table">
        <tr>
            <td width="15%">Sl No: {{$student->id}}</td>
            <td width="70%" align="center">
                <img width="80" class="attachment-img" src="{{public_path('/upload/site_file/'.config('settings.siteLogo',''))}}" alt="{{ config('settings.siteTitle','') }}">
            </td>
            <td width="15%">Date: {{ date("d-m-Y")}}</td>
        </tr>
    </table>    
</div>
<h1 class="text-center"><span class="border-b-2">Tesomonial</span></h1>
<br>  <br><br>{{-- --}}
<div class="main-content">
<p>
    This is to certify that <strong>{{$student->name}}</strong> Father`s Name : {{$student->fathersName}} Mother`s Name : {{$student->mothersName}} {{$student->address}} was a student of {{ config('settings.siteTitle','')}},
    appeared at the Examination of Diploma in engineering <strong>{{ $student->department->title }}</strong> Technology four year's course held in the month of <strong>{{ $student->exam_held }}</strong>
    form this institute and passed in the  <strong>{{$student->cgpa}}</strong> CGPA. His/Her Board class_roll no <strong>{{$student->class_roll}}</strong> Reg no <strong>{{$student->reg_no}}</strong>
    Session <strong>{{$student->session}}</strong> He/She Bears a good Character.</p>
<p>I wish him/her every success in Life.</p>
</div>
{{-- <br><br><br><br><br> <br><br><br><br>  --}}
<footer>
    <table class="table">
        <tr>
            <td align="left">Writer</td>
            <td>Registrar</td>
            <td width="35%" align="center" style="border-top: 1px solid #000">
                <strong>Principal </strong><br>
                {{ config('settings.siteTitle','') }}
            </td>
        </tr>
    </table>
</footer>
</div>
</body>
</html>