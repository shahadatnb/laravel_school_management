@extends('admin.layouts.layout')
@section('title',"ID Card")
@section('content')
 <style>
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
            {{-- <div class="col">
              {!! Form::select('session_id',$academicYear,null,['class'=>'form-control select2','placeholder'=> __('Academic Year')]) !!}
            </div> --}}
            <div class="col">
              {!! Form::select('section_id',$sections,null,['class'=>'form-control select2','placeholder'=> __('Section')]) !!}
            </div>
            {{-- <div class="col">
              {!! Form::select('semester_id',$semesters,null,['class'=>'form-control select2','placeholder'=> __('Semester')]) !!}
            </div> --}}
            <div class="col">
              {!! Form::select('template_id',$templates,null,['class'=>'form-control select2']) !!}
            </div>
            <div class="col">
              {!! Form::number('class_roll_start',null,['class'=>'form-control','placeholder'=> __('Roll start')]) !!}
            </div>
            <div class="col">
              {!! Form::number('class_roll_end',null,['class'=>'form-control','placeholder'=> __('Roll end')]) !!}
            </div>
            <div class="col">
              {!! Form::text('valid_date',null,['class'=>'form-control','required'=>true,'placeholder'=> __('Valid Date')]) !!}
            </div>
            <div class="col">
              {!! Form::select('print_style',['both'=>"Both Side",'front'=>"Front Side","back"=>"Back Side"],null,['class'=>'form-control']) !!}
            </div>
            <div class="col">
              <div class="btn btn-group">
                <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Filter</button>
                <button type="button" class="btn btn-info" onclick="window.print();">Print</button>
                <button type="button" class="btn btn-info" id="generate-pdf">PDF</button>
              </div>
            </div>
          </div>
          {!! Form::close() !!}
    </div>
    <div class="card-body" id="content-to-pdf">
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

  </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script>
// JavaScript to Generate PDF
document.getElementById('generate-pdf').addEventListener('click', () => {
            const { jsPDF } = window.jspdf;

            // Get the HTML element
            const element = document.getElementById('content-to-pdf');

            // Use html2canvas to render the element as an image
            html2canvas(element).then((canvas) => {
                const imgData = canvas.toDataURL('image/png'); // Convert canvas to image data
                const pdf = new jsPDF('p', 'mm', 'a4'); // Create a new PDF instance

                // Add the image to the PDF
                const imgWidth = 190; // Width of the image in the PDF
                const imgHeight = (canvas.height * imgWidth) / canvas.width; // Calculate height to maintain aspect ratio
                let heightLeft = imgHeight;
                let position = 20; // Start position for the image

    // Add first page
                pdf.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
                heightLeft -= pdf.internal.pageSize.height - 30; // Subtract the height of the first page

                  // Add additional pages if needed
                  while (heightLeft > 0) {
                      position = heightLeft - imgHeight; // Adjust position for the next page
                      pdf.addPage();
                      pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                      heightLeft -= pdf.internal.pageSize.height - 30;
                  }
                // Save the PDF
                pdf.save("student-info.pdf");
            });
        });
</script>
@endsection