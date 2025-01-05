@extends('admin.layouts.layout')
@section('title',__("User List"))
@section('content')
<!-- DataTables Example -->
<div class="card mb-3">
    <div class="card-header">
        <div class="card-header">
            <h3 class="card-title">{{__('Shift')}}</h3>
            <div class="card-tools">
              <a class="btn btn-primary btn-sm" href="{{ route('users.create')}}"><i class="fas fa-plus"></i> New</a>
            </div>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Permissions</th>
                <th>Tools</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Permissions</th>
                <th>Tools</th>
            </tr>
            </tfoot>
            <tbody>
                @foreach ($users as $user)      
                @if(!\Auth::user()->hasRole('admin') && $user->hasRole('admin')) @continue; @endif                          
                <tr {{ Auth::user()->id == $user->id ? 'bgcolor=#ddd' : '' }}>
                    <td>{{$user['id']}}</td>
                    <td>{{$user['name']}}</td>
                    <td>{{$user['email']}}</td>
                    <td>
                        @if ($user->roles->isNotEmpty())
                            @foreach ($user->roles as $role)
                                <span class="badge badge-secondary">
                                    {{ $role->name }}
                                </span>
                            @endforeach
                        @endif

                    </td>
                    <td>
                        @if ($user->permissions->isNotEmpty())
                                        
                            @foreach ($user->permissions as $permission)
                                <span class="badge badge-secondary">
                                    {{ $permission->name }}                                    
                                </span>
                            @endforeach
                        
                        @endif
                    </td>
                    <td>
                    <a href="{{ route('users.show', $user['id']) }}"><i class="fa fa-eye"></i></a>
                        <a href="{{ route('users.edit', $user['id']) }}"><i class="fa fa-edit"></i></a>
                        {{-- @cannot('isManager') --}}
                            {{-- @can('delete-user', $user) --}}
                                <a href="#" data-toggle="modal" data-target="#deleteModal" data-userid="{{$user['id']}}"><i class="fas fa-trash-alt"></i></a>
                            {{-- @endcan --}}
                        {{-- @endcannot --}}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        </div>
        <!-- delete Modal-->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Are you shure you want to delete this?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                </div>
                <div class="modal-body">Select "delete" If you realy want to delete this user.</div>
                <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <form method="POST" action="">
                    @method('DELETE')
                    @csrf
                    {{-- <input type="hidden" id="user_id" name="user_id" value=""> --}}
                    <a class="btn btn-primary" onclick="$(this).closest('form').submit();">Delete</a>
                </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

@section('js_user_page')

<script src="{{url('/public/admin')}}/vendor/chart.js/Chart.min.js"></script>
<script src="{{url('/public/admin')}}/js/admin/demo/chart-area-demo.js"></script>

    <script>
        $('#deleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) 
            var user_id = button.data('userid') 
            
            var modal = $(this)
            // modal.find('.modal-footer #user_id').val(user_id)
            modal.find('form').attr('action','/users/' + user_id);
        })
    </script>

@endsection

@endsection
