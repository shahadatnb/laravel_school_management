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

        .grade_list {
            position: absolute;
            top: 25mm;
            right: 15mm;
            width: 65mm;
        }

        .grade_list th, .grade_list td {
            border: 1px solid #000;
            padding: 2px;
            text-align: center;
        }

        .mark_table {
            width: 100%;
        }

        .mark_table th, .mark_table td {
            border: 1px solid #000;
            padding: 2px;
            text-align: center;
        }

    </style>
</head>
<body>
@foreach ($results as $result)
<div class="certifecket">
    <div class="text-center">
        <img width="80" class="attachment-img" src="{{public_path('/upload/logo/'.session('branch')['logo'])}}" alt="">
        <table class="table">
            <tr>
                <td width="15%"></td>
                <td width="70%" align="center">
                    <div class="heading text-center">
                        <h2 class="text-center m-0">{{ session('branch')['name'] }}</h2>
                        {{-- <p class="text-center m-0">{{ config('settings.tagLine') }}</p>
                        <p class="text-center m-0">({{ config('settings.siteWeb') }})</p> --}}
                    </div>
                </td>
                <td width="15%"></td>
            </tr>
        </table>    
    </div>
    <h1 class="text-center"><span class="border-b-2">ACADEMIC TRANSCRIPT</span></h1>
    <table border="1" class="grade_list">
        <tr>
            <th>Range</th>
            <th>Grade</th>
            <th>GP</th>
        </tr>
        @foreach ($grades as $grade)
            <tr>
                <td>{{$grade->grade_range}}</td>
                <td>{{$grade->grade}}</td>
                <td>{{$grade->grade_point}}</td>
            </tr>
        @endforeach
    </table>

    <br>  <br><br>{{-- --}}
    <table border="0" width="100%">
        <tr>
            <td>Name of Student</td>
            <td colspan="3">: {{$result->student->name}}</td>            
        </tr>
        <tr></tr>
            <td>Father`s Name</td>
            <td colspan="3">: {{$result->student->fathersName}}</td>
        </tr>
        <tr>
            <td>Mother`s Name</td>
            <td colspan="3">: {{$result->student->mothersName}}</td>
        </tr>
        <tr>
            <td width="15%">Student ID</td>
            <td width="50%">: {{$result->student->reg_no}}</td>
            <td width="15%">Exam</td>
            <td width="20%">: {{$result->exam->name}}</td>
        </tr>
        <tr>
            <td>Roll No</td>
            <td>: {{$result->student->reg_no}}</td>
            <td>Session</td>
            <td>: {{$result->year? $result->year->year : ''}}</td>
        </tr>
        <tr>
            <td>Class</td>
            <td>: {{$result->section? $result->section->name : ''}}</td>
            <td>Group</td>
            <td></td>
        </tr>
    </table>
    <table class="mark_table">
        <tr>
            <th rowspan="2">Subject</th>
            <th rowspan="2">Full Mark</th>
            <th colspan="{{$op = count(reset($marks[$result->student_id]))}}">Obtaining Marks</th>            
            <th rowspan="2">Total Mark</th>
            <th rowspan="2">Grade</th>
            <th rowspan="2">Point</th>
        </tr>
        <tr>
            @foreach ($marks[$result->student_id] as $key=>$mark)
                @foreach ($mark as $key2=>$value)
                    <th>{{$key2}}</th>
                @endforeach
                @break
            @endforeach
        </tr>
        @foreach ($result->tabulation as $tabulation)
        <tr>
            <td class="text-left">{{$tabulation->subject->name}}</td>
            <td>{{$tabulation->full_marks}}</td>
            @foreach ($marks[$result->student_id][$tabulation->subject_id] as $mark)
                    <td>{{$mark}}</td>
            @endforeach
            <td>{{$tabulation->marks}}</td>
            <td>{{$tabulation->grade}}</td>
            <td>{{$tabulation->grade_point}}</td>
        </tr>
        @endforeach
        <tr>
            <th>Total Exam Marks</th>
            <th>{{$tabulation->sum('full_marks')}}</th>
            <th>{{$tabulation->sum('marks')}}</th>
            <th colspan="{{$op}}">Obtained Marks & GPA</th>
            <th>{{$result->grade}}</th>
            <th>{{$result->grade_point}}</th>
        </tr>
    </table>
</div>
@endforeach
</body>
</html>