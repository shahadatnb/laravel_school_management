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
        .certifecket{
            height: 94%;
            padding: 25px;
            border: 5px double black;
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

    </style>
</head>
<body>
    <div class="certifecket">
<div class="text-center">
    <img width="80" class="attachment-img" src="{{public_path('/upload/site_file/'.config('settings.siteLogo',''))}}" alt="{{ config('settings.siteTitle','') }}">
    <table class="table">
        <tr>
            <td width="15%"></td>
            <td width="70%" align="center">
                <div class="heading text-center">
                    <h2 class="text-center m-0">{{ config('settings.siteTitle','') }}</h2>
                    {{-- <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
                    <p class="text-center m-0">({{ config('settings.siteWeb') }})</p> --}}
                </div>
            </td>
            <td width="15%"></td>
        </tr>
    </table>    
</div>
<h1 class="text-center"><span class="border-b-2">Certificate</span></h1>
<br>  <br><br>{{-- --}}
<h1 class="m-0">{{$student->name}}</h1>
Father`s Name : {{$student->fathersName}} <br>
Mother`s Name : {{$student->mothersName}} <br>
ID Number : {{$student->reg_no}}
<p>
    This is to certify that, he/ she has completed a course Department of {{$student->department->title}} {{$student->department->durationYear}} year's duration.<br>
    His/ Her performance indicator is <b>{{$result}}</b>.
</p>
<br><br><br><br><br> <br><br><br><br>{{--   --}}
    <table class="table">
        <tr>
            <td>Date: {{ date("d-m-Y", strtotime($student->final_result_date))}}</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td width="40%" align="center" style="border-top: 1px solid #000">
                ({{config('settings.cultural_officer')}}) <br>
                District Cultural Officer<br>
                Zila Shilpakala Academy, Natore
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>
</body>
</html>