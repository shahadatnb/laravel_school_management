<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('home') }}" class="brand-link">
      <img src=""
           alt=""
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">{{ config('app.name', 'Laravel') }}</span>
    </a>
    
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            @if(Auth::user()->photo)
                @php $profilePhoto=Auth::user()->photo @endphp
            @else
                @php $profilePhoto='/assets/admin/img/avatar.png' @endphp
            @endif
        <div class="image">
          <img src="{{ asset($profilePhoto) }}" class="img-circle elevation-2" alt="">
        </div>
        <div class="info">
        <a href="{{route('profile')}}" class="d-block">{{Auth::user()->name}}</a>
        </div>
      </div>
      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="{{ route("dashboard") }}" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Dashboard</p>
            </a>
          </li>          
          <li class="nav-item has-treeview {{ (request()->routeIs('student.*','department.*','attendance.*','studentMark.*','invoiceHead.*','department.*','incomeList')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('student.*','department.*','attendance.*','studentMark.*','invoiceHead.*','department.*','incomeList')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-restroom"></i>
              <p>Student <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item"><a href="{{ route("student.index") }}" class="nav-link {{ (request()->routeIs('student.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>{{__('Student List') }}</p></a>
              </li>
              <li class="nav-item"><a href="{{ route("student_statitics") }}" class="nav-link {{ (request()->routeIs('student_statitics')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>{{__('Student Statistics') }}</p></a>
              </li>
              <li class="nav-item"><a href="{{ route("studentMark.index") }}" class="nav-link {{ (request()->routeIs('studentMark.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>{{__('Marks Entry') }}</p></a>
              </li>
              <li class="nav-item"><a href="{{ route("student.promotion") }}" class="nav-link {{ (request()->routeIs('student.promotion')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Promotion')}}</a>
              </li>
              <li class="nav-item"><a href="{{ route("student.marksheet") }}" class="nav-link {{ (request()->routeIs('student.marksheet')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Marksheet')}}/{{__('Certificate')}}</a>
              </li>
              {{-- <li class="nav-item"><a href="{{ route("incomeList") }}" class="nav-link {{ (request()->routeIs('incomeList')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Income List')}}</a>
              </li> --}}
              {{-- <li class="nav-item"><a href="{{ route("invoiceHead.index") }}" class="nav-link {{ (request()->routeIs('invoiceHead.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Invoice Head</a>
              </li> --}}
              <li class="nav-item"><a href="{{ route("department.index") }}" class="nav-link {{ (request()->routeIs('department.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>Department List</p></a>
              </li>
              <li class="nav-item"><a href="{{ route("id_card") }}" class="nav-link {{ (request()->routeIs('id_card')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>ID Card Print</p></a>
              </li>
              {{-- <li class="nav-item"><a href="{{ route("course.index") }}" class="nav-link {{ (request()->routeIs('course.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Course List</a>
              </li> --}}
              <li class="nav-item"><a href="{{ route('attendance.index') }}" class="nav-link {{ (request()->routeIs('attendance.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Attendance') }}</a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview {{ (request()->routeIs('examStudent.*','examHall.*','examineeCount','hallSetup')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('examStudent.*','examHall.*','examineeCount','hallSetup')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-book"></i>
              <p>Exam <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item"><a href="{{ route("examStudent.index") }}" class="nav-link {{ (request()->routeIs('examStudent.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Exam Students')}}</a>
              </li>
              <li class="nav-item"><a href="{{ route("examineeCount") }}" class="nav-link {{ (request()->routeIs('examineeCount')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Examinee count')}}</a>
              </li>
              <li class="nav-item"><a href="{{ route("examHall.index") }}" class="nav-link {{ (request()->routeIs('examHall.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Exam Hall List</a>
              </li>
              {{-- <li class="nav-item"><a href="{{ route("hallSetup") }}" class="nav-link {{ (request()->routeIs('hallSetup')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Student Hall Setup</a>
              </li> --}}
              {{-- <li class="nav-item"><a href="{{ route("course.index") }}" class="nav-link {{ (request()->routeIs('course.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Course List</a>
              </li> --}}
              <li class="nav-item"><a href="{{ route('location.index') }}" class="nav-link {{ (request()->routeIs('location.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Location</a>
              </li>
            </ul>
          </li>

          <li class="nav-item has-treeview {{ (request()->routeIs('admission.*','admission_class.*','admission_trade.*','application_*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('admission.*','admission_class.*','admission_trade.*','application_*')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-book"></i>
              <p>Admission <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item"><a href="{{ route("admission.index") }}" class="nav-link {{ (request()->routeIs('admission.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Admission List')}}</a>
              </li>
              <li class="nav-item"><a href="{{ route("admission_result.index") }}" class="nav-link {{ (request()->routeIs('admission_result.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Admission Result')}}</a>
              </li>
              <li class="nav-item"><a href="{{ route("admission_class.index") }}" class="nav-link {{ (request()->routeIs('admission_class.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Admission Class</a>
              </li>
              <li class="nav-item"><a href="{{ route("admission_trade.index") }}" class="nav-link {{ (request()->routeIs('admission_trade.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Admission Trade</a>
              </li>
              <li class="nav-item"><a href="{{ route("admission_quota.index") }}" class="nav-link {{ (request()->routeIs('admission_quota.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Admission Quota</a>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('application_*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link">
                  <i class="nav-icon far fa-list-alt"></i>
                  <p>
                    Report
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview" {{ (request()->routeIs('application_*')) ? 'style="display: block;"' : '' }}>
                  <li class="nav-item"><a href="{{ route("application_payment_list") }}" class="nav-link {{ (request()->routeIs('admission_payment_list')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> Admission Payment</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("application_summary") }}" class="nav-link {{ (request()->routeIs('application_summary')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> Application Summary</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("application_result_summary") }}" class="nav-link {{ (request()->routeIs('application_result_summary')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> Result Summary</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("application_result_details") }}" class="nav-link {{ (request()->routeIs('application_result_details')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> Result Details</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("application_waiting_list") }}" class="nav-link {{ (request()->routeIs('application_waiting_list')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> Waiting List</a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview {{ (request()->routeIs('posts*','menu*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-list-alt"></i>
              <p>
                Web Site
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview" {{ (request()->routeIs('posts*','menu*')) ? 'style="display: block;"' : '' }}>
              <li class="nav-item"><a href="{{ route('menus.index') }}" class="nav-link {{ (request()->routeIs('menu*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Menus</a>
              </li>
              @foreach($postType as $key=>$item)
              <li class="nav-item has-treeview {{ (request()->get('type') == $item['postType']) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->get('type') == $item['postType']) ? 'active' : '' }}">
                  <i class="nav-icon fas {{$item['icon']}}"></i>
                  <p>
                    {{$item['title']}}
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route('posts.index') }}?type={{$item['postType']}}" class="nav-link">
                    <i class="far fa-circle nav-icon"></i> All {{$item['title']}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route('posts.create') }}?type={{$item['postType']}}" class="nav-link">
                    <i class="far fa-circle nav-icon"></i> New {{$item['title']}}</a>
                  </li>
                  @if($item['taxonomy']==true)
                  <li class="nav-item"><a href="{{ route('taxonomy.index') }}?type={{$item['postType']}}" class="nav-link">
                    <i class="far fa-circle nav-icon"></i> Category</a>
                  </li>
                  @endif
                </ul>
              </li>
              @endforeach
            </ul>
          </li>
          <li class="nav-header">Super Admin</li>
          @role('superadmin','admin')
          <li class="nav-item has-treeview {{ (request()->routeIs('users.*','branch.*','location.*','roles.*','permissions.*','language.*','settings')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('users.*','branch.*','location.*','roles.*','permissions.*','language.*','settings')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Setings
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item"><a href="{{ route('users.index') }}" class="nav-link {{ (request()->routeIs('users.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Users</a>
              </li>
              <li class="nav-item"><a href="{{ route('branch.index') }}" class="nav-link {{ (request()->routeIs('branch.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Branch</a>
              </li>
              <li class="nav-item"><a href="{{ route('location.index') }}" class="nav-link {{ (request()->routeIs('location.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Location</a>
              </li>
              @role('superadmin')
              <li class="nav-item"><a href="{{ route('roles.index') }}" class="nav-link {{ (request()->routeIs('roles.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Role</a>
              </li>
              <li class="nav-item"><a href="{{ route('permissions.index') }}" class="nav-link {{ (request()->routeIs('permissions.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>Permission</p></a>
              </li>
              <li class="nav-item"><a href="{{ route('language.index') }}" class="nav-link {{ (request()->routeIs('language.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Language</a>
              </li>
              @endrole
              <li class="nav-item"><a href="{{ route('settings') }}" class="nav-link {{ (request()->routeIs('settings')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Settings</a>
              </li>
            </ul>
          </li>
          @endrole


          <li class="nav-item">
            <a href="{{ route('logout') }}" class="nav-link" onclick="event.preventDefault();
            document.getElementById('logout-form').submit();">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>{{ __('Logout') }}</p>
            </a>
          </li>
          <li class="nav-header"></li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
