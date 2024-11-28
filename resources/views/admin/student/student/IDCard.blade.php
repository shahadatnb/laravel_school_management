@extends('admin.layouts.layout')
@section('title',"ID Card")
@section('content')
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
	width: 14mm;
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

@media print {
  .break {page-break-before: always; width: 100%;}
  .id-card{
    page-break-inside: avoid;
  }
}
 </style>
<!-- Default box -->
<div class="card">
    <div class="card-header">
        {!! Form::model($data,['route' => 'id_card','method'=>'get','class'=>'d-print-none ']) !!}
        <div class="row">
            <div class="col">
              {{-- {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!} --}}
              {!! Form::text('session',null,['class'=>'form-control','placeholder'=> __('Session')]) !!}
            </div>
            <div class="col">
              {!! Form::select('department_id',$departments,null,['class'=>'form-control select2','placeholder'=> __('Technology')]) !!}
            </div>
            <div class="col">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
            </div>
            <div class="col">
              {!! Form::select('shift',['1st'=>'1st Shift','2nd'=>'2nd Shift'],null,['class'=>'form-control','placeholder'=> __('Shift')]) !!}
            </div>
            <div class="col">
              {!! Form::select('student_group',['A'=>'A','B'=>'B'],null,['class'=>'form-control','placeholder'=> __('Group')]) !!}
            </div>
            <div class="col">
              {!! Form::text('probidhan',null,['class'=>'form-control','placeholder'=> __('Probidhan')]) !!}
            </div>
            <div class="col">
              {!! Form::text('reg_no',null,['class'=>'form-control','placeholder'=> __('Reg No')]) !!}
            </div>
            <div class="col">
              {!! Form::text('class_roll',null,['class'=>'form-control','placeholder'=> __('Class Roll')]) !!}
            </div>
          </div>
          <div class="row mt-2">
            <div class="col">
              {!! Form::select('print_style',['both'=>"Both Side",'front'=>"Front Side","back"=>"Back Side"],null,['class'=>'form-control']) !!}
            </div>
            <div class="col-10">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
                <button type="button" class="btn btn-info" onclick="window.print();">Print</button>
              </div>
            </div>
          </div>
          {!! Form::close() !!}
    </div>
    <div class="card-body">
      <div class="d-flex flex-wrap">
        @foreach ($students as $key => $student)
          <div class="id-card flex-row d-flex">
          @if($data['print_style'] == 'front' || $data['print_style'] == 'both')
            @include('admin.student.id_card.front')
          @endif
          @if($data['print_style'] == 'back' || $data['print_style'] == 'both')
            @include('admin.student.id_card.back')
          @endif
        </div>
        @if($data['print_style'] == 'both' && ($key+1)/8 == 0)
          <div class="break"></div>
        @elseIf(($key+1)/16 == 0)
          <div class="break"></div>
        @endif
        @endforeach
      </div>
      {{-- <table class="table table-sm">
        <tr>
          <th>Name</th>
          <th>Roll</th>
          <th>Class</th>
        </tr>
        @foreach ($students as $student)
        <tr>
          <td>{{ $student->name }}</td>
          <td>{{ $student->classRoll }}</td>
          <td>{{ $student->semester? $student->semester->title : '' }}</td>
        </tr>
        @endforeach
      </table> --}}
    </div>

    <div class="card-footer">
      <div class="text-center">{{ $students->appends($_GET)->links() }}</div>
    </div>
        <!-- /.card-footer-->
  </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->
@endsection