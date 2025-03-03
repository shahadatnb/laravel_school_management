<div class="id-card-front position-relative">
    <div class="text-center id-card-logo">
      <img width="50" src="{{asset('/upload/logo/'.session('branch')['logo'])}}" alt="">
      <h3 class="inst-name">{{ session('branch')['name'] }}</h3>
    </div>
    <div class="id-card-title text-center">
        <h4>Identity Card</h4>
    </div>
    <p class="text-center id-card-id">ID No: {{ $student->reg_no }}</p>
    <div class="text-center student-photo">
      <img width="80" src="{{asset('/storage/'.$student->photo)}}" alt="">
    </div>
    <div class="id-card-info">              
      <div style="font-weight: bold" class="text-center">{{ $student->name }}</div>
      <span>Class</span>: {{ $student->semester? $student->semester->name : '' }}<br>
      <span>Section</span>: {{ $student->section? $student->section->section? $student->section->section->name : '' : '' }} <br>
      <span>Class Roll</span>: {{ $student->class_roll }}
    </div>
    <div class="signature position-absolute">
      <img src="{{asset('/upload/head_sign/'.session('branch')['head_sign'])}}" alt=""> <br>
      <span>Principal</span>
    </div>
  </div>