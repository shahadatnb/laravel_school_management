<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ID Card Print</title>
    <link rel="stylesheet" href="{{ asset('assets/admin/css/adminlte.min.css') }}">
    <style type="">

    </style>
</head>
<body>
    <div class="d-flex flex-wrap">
        @foreach ($students as $student)
          <div class="id-card flex-row d-flex">
          <div class="id-card-front">
            <div class="text-center id-card-logo">
              <img width="50" src="{{asset('/upload/site_file/'.config('settings.siteLogo'))}}" alt="">
              <h3 class="inst-name">{{ config('settings.siteTitle','') }}</h3>
            </div>
            <div class="text-center student-photo">
              <img width="80" src="{{asset('/storage/'.$student->photo)}}" alt="">
            </div>
            <div class="id-card-info">              
              <div style="fomt-weight: bold" class="text-center">{{ $student->name }}</div>
              Class: {{ $student->semester? $student->semester->title : '' }} <br>
              Class Roll: {{ $student->classRoll }}
            </div>
          </div>
          <div class="id-card-back text-center align-middle">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, quos error reprehenderit voluptatem nisi ullam itaque perferendis repudiandae et iste!
          </div>
        </div>
        @endforeach
    </div>
</body>
</html>