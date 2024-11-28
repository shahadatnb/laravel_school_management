<div class="id-card-front position-relative">
    <div class="text-center id-card-logo">
      <img width="50" src="{{asset('/upload/site_file/'.config('settings.siteLogo'))}}" alt="">
      <h3 class="inst-name">{{ config('settings.siteTitle','') }}</h3>
    </div>
    <div class="id-card-title text-center">
        <h4>Identity Card</h4>
    </div>
    <p class="text-center id-card-id">ID No: {{ $student->id }}</p>
    <div class="text-center student-photo">
      <img width="80" src="{{asset('/storage/'.$student->photo)}}" alt="">
    </div>
    <div class="id-card-info">              
      <div style="font-weight: bold" class="text-center">{{ $student->name }}</div>
      <span>Trade</span>: {{ $student->department? $student->department->title : '' }} <br>
      <span>Class</span>: {{ $student->semester? $student->semester->title : '' }}<br>
        <span>Shift</span>: {{ $student->shift }} Roll No: {{ $student->class_roll }}<br>
        <span>Session</span>: {{ $student->session }}
    </div>
    <div class="signature position-absolute">
      <img src="{{asset('/upload/site_file/'.config('settings.principal_signature'))}}" alt=""> <br>
      <span>Principal</span>
    </div>
  </div>