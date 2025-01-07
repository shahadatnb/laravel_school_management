@extends('admin.layouts.layout')
@section('title',__("Students Create"))
@section('css')
@endsection
@section('content')
<!-- Default box -->
{{ Form::open(array('route'=>'student.reg.mass_update','method'=>'POST','id'=>'mass_update','files' => true)) }}
<div class="card">
    <div class="card-header d-print-none">
          
    </div>
    <div class="card-body">
      @include('admin.layouts._message')
      <div id="errorMsg"></div>
        <div class="row mb-2">
          <div class="col">
            {!! Form::select('academic_year_id',$academic_years,session('branch')['academic_year_id'],['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Year')]) !!}
          </div>
          <div class="col">
            {!! Form::select('section_id',$sections,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Section')]) !!}
          </div>
          <div class="col">
            {!! Form::select('group_id',$groups,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Group')]) !!}
          </div>
          <div class="col">
            {!! Form::select('category_id',$catetories,null,['class'=>'form-control form-control-sm select2','required'=>true,'placeholder'=> __('Category')]) !!}
          </div>
          <div class="col">
            <button type="button" id="search" class="btn btn-primary btn-sm"><i class="fas fa-search"></i> Search</button>
          </div>
        </div>
      
        {{-- Select	Roll	Name	Gender	Religion	Father Name	Mother Name	Mobile No.	Add/Del --}}
      <div class="table-responsive">
        <table id="students" class="table table-sm table-bordered table-striped">
            <thead>
            <tr>
              {{-- <th>Select</th> --}}
              {{-- <th>{{__('Registration No')}}</th> --}}
              <th>{{__('Roll')}}</th>
              <th>{{__('Name')}}</th>
              <th>{{__('Gender')}}</th>
              <th>{{__('Religion')}}</th>
              <th>{{__('Father Name')}}</th>
              <th>{{__('Mother Name')}}</th>
              <th>{{__('Mobile No')}}</th>
              {{-- <th>{{__('Date of Birth')}}</th> --}}
            </tr>
            </thead>
            <tbody id="student_list">
                
            </tbody>
        </table>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
      {{ Form::submit('Update',array('class'=>'btn btn-primary')) }}
    </div>
    <!-- /.card-footer-->
</div>
{{ Form::close() }}
<!-- /.card -->
@endsection
@section('js')
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script>
    $(function () {
      
        $('#search').click(function(){
            var academic_year_id = $('select[name="academic_year_id"]').val();
            var section_id = $('select[name="section_id"]').val();
            var group_id = $('select[name="group_id"]').val();
            var category_id = $('select[name="category_id"]').val();
            const sexs = ['Male','Female','Others'];
            const religions = ['Muslim','Hindu','Christian','Buddhist','Others'];
            if(academic_year_id == ''){
                alert('Please select academic year');
                return false;
            }
            if(section_id == ''){
                alert('Please select section');
                return false;
            }
            if(group_id == ''){
                alert('Please select group');
                return false;
            }
            $.LoadingOverlay("show");
            $('#student_list').html('');
            $("#errorMsg").html('');
            $.ajax({
                url: "{{ route('student.get_student_by_section') }}",
                type: 'GET',
                data: {academic_year_id:academic_year_id,section_id:section_id,group_id:group_id,category_id:category_id},
                success: function(json){
                  if(json.status == true){
                    json.students.forEach(function(value,index){
                      var html = `<tr>
                      <td>
                        <input type="checkbox" checked class="student_id" name="student_id[]" value="${value.id}">
                      </td>
                      <td><input type="text" name="class_roll[${value.id}]" value="${value.class_roll}" class="form-control form-control-sm" required></td>
                      <td><input type="text" name="name[${value.id}]" value="${value.name}" class="form-control form-control-sm" required></td>
                      <td><select name="sex[${value.id}]"" class="form-control form-control-sm" required>`;
                        sexs.forEach(function(value1,index1){
                          html += `<option value="${value1}" ${value.sex == value1 ? 'selected' : ''}>${value1}</option>`;
                        });
                      html += `</select></td>`;
                      html += `<td><select name="religion[${value.id}]" class="form-control form-control-sm" required>`;
                        religions.forEach(function(value1,index1){
                          html += `<option value="${value1}" ${value.religion == value1 ? 'selected' : ''}>${value1}</option>`;
                          });
                        html += `</select></td>`;
                        html += `<td><input type="text" name="fathersName[${value.id}]" value="${value.fathersName}" class="form-control form-control-sm" required></td>
                        <td><input type="text" name="mothersName[${value.id}]" value="${value.mothersName}" class="form-control form-control-sm" required></td>
                        <td><input type="text" name="mobile[${value.id}]" value="${value.mobile}" class="form-control form-control-sm" required></td>
                      </tr>`;
                      $('#student_list').append(html);
                    });
                  }else{
                    //console.log(json);
                    if(json.message){
                      $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
                    }
                    json.errors.forEach(function(element){
                        $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
                    });
                    //alert(data.errors);
                  }
                }
              });
            $.LoadingOverlay("hide");
        });

        $("#mass_update").submit(function(e){
        e.preventDefault();
        var student_id = $(".student_id']:checked").length;
        if(student_id == 0){
          alert('Please select at least one student');
          return false;
        }
        $.LoadingOverlay("show");
        $("#errorMsg").html('');
        $.ajax({
          url: $(this).attr('action'),
          type: $(this).attr('method'),
          data: $(this).serialize(),
          success: function(json){
            //console.log(json);
            if(json.status == true){
              if(json.message){
                $("#errorMsg").append(`<div class="alert alert-success"><strong>Success: </strong>${json.message}</div>`);
              }
            }else{
              //console.log(json);
              if(json.message){
                $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${json.message}</div>`);
              }
              json.errors.forEach(function(element){
                  $("#errorMsg").append(`<div class="alert alert-danger"><strong>Warning: </strong>${element}</div>`);
              });
              //alert(data.errors);
            }
            $.LoadingOverlay("hide");
          }
        });

      });
    });
  </script>
@endsection
