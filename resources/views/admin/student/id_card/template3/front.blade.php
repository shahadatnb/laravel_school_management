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
<style type="text/css">
    .id-card-front, .id-card-back {
      width: 53.98mm;
      height: 85.60mm;
      border: 3px solid #dbef79;
      margin: 10px;
      padding: 5px;
    }
    
    .id-card-logo img {
      max-height: 12mm !important;
      max-width: 100%;
    }
    
    .id-card-title {
      background: #df002d;
      padding: 2px;
      margin: .5mm 0 .5mm 0;
    }
    
    .id-card-title h4 {
      color: #fff;
      font-family: arial;
      margin: 0;
      font-size: 5mm;
    }
    
    .inst-name {
      font-size: 4mm;
      font-family: arial;
      line-height: 4mm;
      margin: 0;
    }
    
    .id-card-id {
      margin: 0;
      line-height: 4mm;
      font-size: 4mm;
      margin-bottom: 1mm;
    }
    .student-photo {
      height: 22mm;
    }
    .student-photo img {
      border: 3px solid #635bcd;
      max-height: 100%;
    }
    .id-card-info {
      line-height: 3.8mm;
      margin-top: 5px;
      font-size: 4mm;
    }
    
    .id-card-info span {
      width: 18mm;
      display: inline-block;
    }
    
    .signature {
      width: 50%;
      right: 0;
      bottom: 0;
      text-align: center;
    }
    
    .signature img {
      max-width: 80%;
      max-height: 6mm;
      margin-bottom: -2.5mm;
    }
    
    .signature span {
      border-top: 1px solid #000;
      font-size: 4mm;
    }
</style>