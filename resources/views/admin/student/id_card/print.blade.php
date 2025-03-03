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