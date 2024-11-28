@extends('admin.layouts.layout')
@section('title',"Exam Hall")
@section('css')
<style type="text/css">
    .seat {
        min-height: 80px;
        border: 1px solid #ddd;
        text-align: center;
        padding: 5px;
        margin-bottom: 10px;
    }
</style>
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    {!! Form::open(['route' => ['examhall.saveSeats', $examHall->id], 'method' => 'POST']) !!}
    <div class="card-header">
        <div class="row">
            <div class="col-md-2">
                <h3 class="card-title">Room No: {{ $examHall->name }}</h3>

            </div>
            <div class="col-md-3">
                {!! Form::select('seat_even',$studentGroups,null,['class'=>'form-control select2','id'=>'seat_even','placeholder'=> __('Seat Even')]) !!}
            </div>
            <div class="col-md-3">
                {!! Form::select('seat_odd',$studentGroups,null,['class'=>'form-control select2','id'=>'seat_odd','placeholder'=> __('Seat Odd')]) !!}
            </div>
            <div class="col-md-1">
                <button type="submit" class="btn btn-success">Save</button>
            </div>
        </div>

    </div>
    <div class="card-body">
        @include('admin.layouts._message')
        @php $seatno = 0; @endphp 

        <div class="row">
            @for($i=1;$i<=$examHall->columns;$i++)
            @php ($i % 2 == 0) ? $seat_type = 'even' : $seat_type = 'odd' @endphp
            <div class="col-2">
                @for($j=1;$j<=$examHall->rows;$j++)
                    <div class="seat {{ $seat_type == 'even' ? $seat_type ='odd' : $seat_type = 'even'}}" id="seat{{++$seatno}}">
                        <input type="hidden" name="student_id[]" value="">
                        <span>1</span>
                    </div>
                @endfor
            </div>
            @endfor
        </div>
      {{-- <div class="table-responsive">       
        <table id="seats" class="table table-bordered table-striped">
            <tbody>
                @for($i=1;$i<=$examHall->rows;$i++)
                    <tr>
                        @for($j=1;$j<=$examHall->columns;$j++)
                            <td id="seat{{++$seatno}}">

                            </td>
                        @endfor
                    </tr>
                @endfor
            </tbody>
        </table>
      </div> --}}
    </div>
    {!! Form::close() !!}
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')

<script>
    $(function () {
        //let evens = $(".even");
        //console.log(evens.eq(0).find('span'));
      $("#seat_even").change(function(){
          let group = $(this).val();
          //console.log($(this).val());
          let _csrf = $('meta[name="csrf-token"]').attr('content');
          let studentInfo = '';
          if(group != ''){
              $.ajax({
                    type: "post",
                    url: "{{route('getStudentsByGroup')}}",
                    data: {
                        group: group,
                        _token: _csrf
                    },
                    success: function (data) {
                        console.log(data);
                        let evens = $(".even");
                        //let seat_no = 1;
                        for(let i=0;i<data.length;i++){
                            //$("#seat"+seat_no+" input").val(data[i].id);
                            studentInfo = data[i].class_roll + '<br>' + data[i].student_group + '<br>' + data[i].institute;
                            //evens[i].html(studentInfo);
                            evens.eq(i).find('span').html(studentInfo);
                            evens.eq(i).find('input').val(data[i].id);
                            //console.log(evens.eq(i).find('span'));
                            //seat_no = seat_no + 2;
                        }
                    }
                });
            }
        });

      $("#seat_odd").change(function(){
          let group = $(this).val();
          //console.log($(this).val());
          let _csrf = $('meta[name="csrf-token"]').attr('content');
          let studentInfo = '';
          if(group != ''){
              $.ajax({
                    type: "post",
                    url: "{{route('getStudentsByGroup')}}",
                    data: {
                        group: group,
                        _token: _csrf
                    },
                    success: function (data) {
                        console.log(data);
                        let evens = $(".odd");
                        //let seat_no = 1;
                        for(let i=0;i<data.length;i++){
                            //$("#seat"+seat_no+" input").val(data[i].id);
                            studentInfo = data[i].class_roll + '<br>' + data[i].student_group + '<br>' + data[i].institute;
                            //evens[i].html(studentInfo);
                            evens.eq(i).find('span').html(studentInfo);
                            evens.eq(i).find('input').val(data[i].id);
                            //console.log(evens.eq(i).find('span'));
                            //seat_no = seat_no + 2;
                        }
                    }
                });
            }
        });
    });
  </script>
@endsection
