<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Marksheet</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 17px;
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
            border-spacing: 0;
        }

        .table-border th,.table-border td{
            border: 1px solid #000;
        }

        .table-border th{
            font-weight: bold;
        }

        .border-b{
            border-bottom: 1px solid #ddd;
        }
        .border-b-2 {
            border-bottom: 2px solid #000;
        }

        .certifecket{
            height: 97%;
            padding: 10px;
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
        /*
        @font-face{
            font-family: "bangla-font";
            src : url("{{ public_path('assets/kalpurush.ttf') }}")
        }
        .bangla-font{
            font: normal 20px/18px bangla-font;
        }
*/

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
                </div>
            </td>
            <td width="15%"></td>
            {{-- <td width="15%"><img width="100" class="img-thumbnail" src="{{public_path('/storage/'.$student->photo)}}" alt=""></td> --}}
        </tr>
    </table>    
</div>
    <h1 class="text-center"><span class="border-b-2">Marksheet</span></h1>

    <table class="table">
        <tr>
            <td width="60%">
                <table class="table" style="font-size: 20px">
                    <tr><td>Name: {{$student->name}}</td></tr>
                    <tr><td>Father`s Name: {{$student->fathersName}}</td></tr>
                    <tr><td>Mother`s Name: {{$student->mothersName}}</td></tr>
                    <tr><td>ID Number: {{$student->reg_no}}</td></tr>
                    <tr><td>Remarks: {{$result}}</td></tr>
                    {{-- <tr><td>গড় নম্বর: </td></tr> --}}
                    
                </table>
            </td>
            <td>
                <table class="table table-border">
                    <thead>
                        <tr>
                            <th colspan="2" align="center">Value distribution</th>
                        </tr>
                        <tr>
                            <th align="center">Number</th>
                            <th align="center">Indicator</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td align="center">100-80</td>
                            <td align="center">Oustanding</td>
                        </tr>
                        <tr>
                            <td align="center">79-60</td>
                            <td align="center">Excellent</td>
                        </tr>
                        <tr>
                            <td align="center">59-50</td>
                            <td align="center">Very Good</td>
                        </tr>
                        <tr>
                            <td align="center">49-40</td>
                            <td align="center">Good</td>
                        </tr>
                        <tr>
                            <td align="center">39-0</td>
                            <td align="center">Disqualifed</td>
                        </tr>
                    </tbody>
                </table>
<br>
                <table class="table table-border">
                    <thead>
                        <tr>
                            <th colspan="2" align="center">Number distribution</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td align="center">Presence</td>
                            <td align="center">50%</td>
                        </tr>
                        <tr>
                            <td align="center">Written</td>
                            <td align="center">25%</td>
                        </tr>
                        <tr>
                            <td align="center">Vivavoce</td>
                            <td align="center">25%</td>
                        </tr>
                        <tr>
                            <td align="center">Total	</td>
                            <td align="center">100%</td>
                        </tr>
                    </tbody>                    
                </table>
            </td>
        </tr>
    </table>
    <br>
    <h2 class="text-center">Yearly Marksheet</h2>
    <table class="table table-border">
        <thead>
            <tr>
                <th align="center">Year</th>
                <th align="center">Presence(%)</th>
                <th align="center">Written</th>
                <th align="center">Vivavoce</th>
                <th align="center">Total</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total_marks = 0;
            @endphp
            @foreach ($marks as $mark)
                <tr>
                    <td>{{$mark->semester->title}}</td>
                    <td>{{$mark->attendance}}</td>
                    <td>{{$mark->written_marks}}</td>
                    <td>{{$mark->oral_marks}}</td>
                    @php
                        $markst = $mark->attendance+$mark->written_marks+$mark->oral_marks;
                        $total_marks += $markst;
                    @endphp
                    <td>{{$markst}}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="4">Total Marks</td>
                <td>{{$total_marks}}</td>
            </tr>
            <tr>
                <td colspan="4">Average Number</td>
                <td>{{$marks->sum('total_marks')/$student->department->durationYear}}</td>
            </tr>
            <tr>
                <td colspan="4">Performance Indicator</td>
                <td>{{$result}}</td>
            </tr>
        </tbody>
    </table>
    <br><br><br><br>
    <table class="table">
        <tr>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td align="center">&nbsp;&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td width="40%" align="center" style="border-top: 1px solid #000">
                ({{config('settings.cultural_officer')}}) <br>
                District Cultural Officer <br>
                Zila Shilpakala Academy, Natore
            </td>
            <td width="5%">&nbsp;&nbsp;</td>
        </tr>
    </table>
</div>
</body>
</html>