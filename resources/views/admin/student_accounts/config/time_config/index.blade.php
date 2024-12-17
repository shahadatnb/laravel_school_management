@extends('admin.layouts.layout')
@section('title', __("Fee Subhead Time Configuration"))
@section('css')

@endsection
@section('content')
<!-- Default box -->
<div class="row">
  <div class="col-md-6">
    <div class="card">
      <div class="card-header">
          <h3 class="card-title">{{__('Fee Head')}}</h3>
          <div class="card-tools">
          </div>
      </div>
      <div class="card-body">
        @include('admin.layouts._message')
        {!! Form::open(array('route'=>['exam.config.mark_config.save_config'])) !!}
          <div class="form-group">
            {!! Form::label('head_id', __('Head Name'),['class'=>'']) !!}
            {!! Form::select('head_id', $heads,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Class Name')]) !!}
          </div>
          <div class="col-12">
            <h3 class="text-center">{{__('Fee Head List')}}</h3>
            <table class="table table-sm table-bordered table-striped">
              <thead>
                <tr>
                  {{-- <th>{{__('Fee Head')}}</th> --}}
                  <th>{{__('Fee Subhead')}}</th>
                  <th>{{__('Payable Year')}}</th>
                  <th>{{__('Payable Month')}}</th>
                  {{-- <th>{{__('Action')}}</th> --}}
                </tr>
              </thead>
              <tbody id="fee_head_list">
                
              </tbody>
            </table>
          </div>
        </div>
        {{ Form::submit('Save',array('class'=>'btn btn-primary')) }}
        {!! Form::close() !!}          
      </div>
    </div>

    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
            <h3 class="card-title">{{__('Year Wise Fee Head')}}</h3>
            <div class="card-tools">
            </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-4">
              <div class="form-group">
                {!! Form::label('academic_year_id', __('Select Year'),['class'=>'']) !!}
                {!! Form::select('academic_year_id', $academic_years,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Select Year')]) !!}
              </div>
            </div>
            <div class="col-4">
              <div class="form-group">
                {!! Form::label('fee_head_id', __('Select Feehead'),['class'=>'']) !!}
                {!! Form::select('fee_head_id',$heads,null,['class'=>'form-control form-control-sm select2','id'=>'fee_head_id','required'=>true,'placeholder'=> __('Select Feehead')]) !!}
              </div>
            </div>
            <div class="col-4">
              <button type="button" id="get_time_config" class="btn btn-primary btn-sm btn-block">Search</button>
            </div>
          </div>
          <table id="subject_config_list_table" class="table table-bordered table-striped table-sm mt-3">
            <tbody id="time_config_list">
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

@endsection
@section('js')
<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js" integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.8.4/jspdf.plugin.autotable.min.js" integrity="sha512-PRJxIx+FR3gPzyBBl9cPt62DD7owFXVcfYv0CRNFAcLZeEYfht/PpPNTKHicPs+hQlULFhH2tTWdoxnd1UGu1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    const academic_years = {!! json_encode($academic_years) !!};
    const default_year = {{ session('branch')['academic_year_id'] }};
    const academic_years_options = Object.keys(academic_years).map((key) => `<option ${default_year == key ? 'selected' : ''} value="${key}">${academic_years[key]}</option>`);
    //console.log(academic_years_options);
    // academic_years.forEach(function(value,index){
      //   console.log(value);
      // });
      const months = {!! json_encode($months) !!};
      const month_options = Object.keys(months).map((key) => `<option value="${key}">${months[key]}</option>`);

    $("#head_id").change(function(){
      let head_id = $("#head_id").val();
      if(head_id == '') return false;
      $.ajax({
        type: "get",
        url: "{{route('sac.config.get_sub_head')}}",
        data: {head_id:head_id},
        success: function(data){
          console.log(data);
          let htmlData = '';
          data.sub_heads.forEach(function(value,index){
            htmlData += `<tr>
            <td>${value.name}</td>
            <td><select name="academic_year_ids[${value.id}]" class="form-control form-control-sm select2" required>`;
              academic_years_options.forEach(function(value1,index1){
              htmlData += value1;
            });
            htmlData += `</select></td>
            <td><select name="months[${value.id}]" class="form-control form-control-sm select2" required>`;
              month_options.forEach(function(value1,index1){
              htmlData += value1;
            });
            htmlData += `</select></td>
            </tr>`;            
          })
          $("#fee_head_list").html(htmlData);
        }
      });
    });

    $("#search").click(function(){
      let class_id = $("#class_id").val();
      let group_id = $("#group_id").val();
      if(class_id != '' && group_id != ''){
        $("#subject_div").html('');
        $("#exam_div").html('');
        $("#subject_sc_list").html('');
        $.ajax({
          type: "get",
          url: "{{route('exam.config.mark_config.get_subject_exam')}}",
          data: {class_id:class_id,group_id:group_id},
          success: function(data){
            console.log(data);
            let subjectData = '';
            let examData = '';
            let subject_sc_list = '';
            data.subjects.forEach(function(value,index){
              subjectData += `
              <div class="form-group">
                <div class="custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" name="subject_ids[]" value="${value.id}" id="subject_id_${value.id}">
                  <label for="subject_id_${value.id}" class="custom-control-label">${value.name}</label>
                </div>
              </div>
              `;
            });
            $("#subject_div").html(subjectData);
            data.exams.forEach(function(value,index){
              examData += `
              <div class="form-group">
                <div class="custom-control custom-checkbox">
                  <input class="custom-control-input" type="checkbox" name="exam_ids[]" value="${value.id}" id="exam_id_${value.id}">
                  <label for="exam_id_${value.id}" class="custom-control-label">${value.name}</label>
                </div>
              </div>
              `;
            })
            $("#exam_div").html(examData);
            data.short_codes.forEach(function(value,index){
              subject_sc_list += `
              <tr>
                <td>${value.code_title}</td>
                <td><input type="number" name="total_marks[${value.id}]" value="${value.total_marks}" class="form-control form-control-sm"></td>
                <td><input type="number" name="pass_mark[${value.id}]" value="${value.pass_mark}" class="form-control form-control-sm"></td>
                <td><input type="number" name="acceptance[${value.id}]" value="${value.acceptance}" class="form-control form-control-sm"></td>
                <td><input type="number" name="sc_merge[${value.id}]" value="0" class="form-control form-control-sm"></td>
                <td>
                  <input type="hidden" name="sc_title[${value.id}]" value="${value.code_title}">
                  <a href="#" data-id="${value.id}" class="btn btn-danger btn-sm delete"><i class="fas fa-trash"></i></a>
                </td>
              </tr>
              `;
            })
            $("#subject_sc_list").html(subject_sc_list);
          }
        });
      }
    });

    $("#class_id2").change(function(){
      let class_id = $("#class_id2").val();
      $.ajax({
        type: "get",
        url: "{{route('exam.config.mark_config.get_group_exam')}}",
        data: {class_id:class_id},
        success: function(data){
          //console.log(data);
          let htmlData = '';
          data.groups.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#group_id2").html(htmlData);

          htmlData = '';
          data.exams.forEach(function(value,index){
            htmlData += `
            <option value="${value.id}">${value.name}</option>
            `;
          })
          $("#exam_id").html(htmlData);
        }
      });
    });

    $("#get_config").click(function(){
      let class_id = $("#class_id2").val();
      let group_id = $("#group_id2").val();
      let exam_id = $("#exam_id").val();
      if(class_id != '' && group_id != '' && exam_id != ''){
        $.ajax({
          type: "get",
          url: "{{route('exam.config.mark_config.get_config')}}",
          data: {class_id:class_id,group_id:group_id,exam_id:exam_id},
          success: function(data){
            let htmlData = '';
            for (var key of Object.keys(data)) {
              htmlData += `<tr>
                <th>Subject Name</th>
                <th>Short Code</th>
                <th>Total Mark</th>
                <th>Pass Mark</th>
                <th>Acceptance</th>
                <th>SC Merge</th>
              </tr>`;
              data[key].forEach(function(value2,index2){
                htmlData += `<tr>
                  <td>${value2.subject}</td>
                  <td>${value2.sc_title}</td>
                  <td>${value2.total_marks}</td>
                  <td>${value2.pass_mark}</td>
                  <td>${value2.acceptance}</td>
                  <td>${value2.sc_merge}</td>
                </tr>`;
              });
            };
            
            $("#subject_config_list").html(htmlData);
          }
        });
      }
    });

    $("#download").click(function(){
      var doc = new jsPDF()

      doc.text("Hello world!", 10, 10);
      doc.save("a4.pdf");
    });


    $("#subject_sc_list").on('click','.delete',function(){
      $(this).closest('tr').remove();      
    });
  </script>
@endsection
