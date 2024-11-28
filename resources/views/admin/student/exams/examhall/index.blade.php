@extends('admin.layouts.layout')
@section('title',"Exam Hall")
@section('css')
<link rel="stylesheet" href="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.css">
@endsection
@section('content')
<!-- Default box -->
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Exam Hall</h3>
        <div class="card-tools">
          <a class="btn btn-primary" href="{{ route('examHall.create')}}">New Item</a>
        </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Row</th>
              <th>Col</th>
              <th>Capacity</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
                @foreach ($examHalls as $item)
                <tr>
                    <td>{{$item->id}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->rows}}</td>
                    <td>{{$item->columns}}</td>
                    <th>{{$item->capacity }}</th>
                    <td>
                      <div class="btn-group btn-group-sm">
                        <a class="btn btn-success btn-sm" href="{{ route('examHall.show',$item->id)}}"><i class="fas fa-eye"></i> Setup</a>
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Action
                        </button>
                        <div class="dropdown-menu">
                          {{-- @if (Auth::user()->hasAnyRole(['Manager','Admin'])) --}}
                          <div class="dropdown-divider"></div>
                            <a href="{{route('examHall.edit',$item->id)}}" class="dropdown-item"><i class="fas fa-edit"></i> Edit</a>
                            <div class="dropdown-divider"></div>
                            <form class="delete" action="{{ route('examHall.destroy',$item->id) }}" method="post">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-danger btn-xs" onclick="return confirm('Are You Sure To Delete This Item?')"><i class="fas fa-trash"></i> Delete</button>
                            </form>
                            {{-- <a onclick="return confirm('Are you sure remove?');" href="{{route('insuranceRemove',$item->id)}}" class="dropdown-item"><i class="fas fa-trash text-danger"></i> Remove</a> --}}
                          {{-- @endif --}}
                        </div>
                      </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        Footer
    </div>
    <!-- /.card-footer-->
</div>
<!-- /.card -->
@endsection
@section('js')
<script src="{{asset('/assets/admin')}}/plugins/datatables/datatables.min.js"></script>
<script>
    $(function () {
      $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
        'paging': false,
      });
    });
  </script>
@endsection
