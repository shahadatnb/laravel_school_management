<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ID Card Print</title>
    {{-- <link rel="stylesheet" href="{{ asset('assets/admin/css/adminlte.min.css') }}"> --}}
    <style>
      @media print {
       .break {page-break-before: always; width: 100%;}
       .id-card{
         page-break-inside: avoid;
       }
     }
       #content-to-pdf {
         width: 297mm;
       }
       .id-card-front, .id-card-back {
         width: 2.125in;
         height: 3.375in;
         border: 1px dashed #363a20;
         margin: 4px;
         padding: 5px;
         float: left;
         position: relative;
       }
       .text-center {
        text-align: center;
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
           position: absolute;
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
</head>
<body>
    <div class="d-flex flex-wrap">
      @foreach ($students as $key => $student)
      <div class="id-card flex-row d-flex">
      @if($data['print_style'] == 'front' || $data['print_style'] == 'both')
        @include('admin.student.id_card.'.$template->slug.'.front')
      @endif
      @if($data['print_style'] == 'back' || $data['print_style'] == 'both')
        @include('admin.student.id_card.'.$template->slug.'.back')
      @endif
    </div>
    @if($data['print_style'] == 'both' && ($key+1)/8 == 0)
      <div class="break"></div>
    @elseIf(($key+1)/16 == 0)
      <div class="break"></div>
    @endif
    @endforeach
    </div>
</body>
</html>