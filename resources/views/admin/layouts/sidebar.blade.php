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
          <li class="nav-item has-treeview {{ (request()->routeIs('student.*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('student.*')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-restroom"></i>
              <p>Student <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item has-treeview {{ (request()->routeIs('student.setup.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('student.setup.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tools"></i>
                  <p>
                    Setting
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("student.setup.academicYear.index") }}" class="nav-link {{ (request()->routeIs('student.setup.academicYear.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Academic Year') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.semester.index") }}" class="nav-link {{ (request()->routeIs('student.setup.semester.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Class') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.shift.index") }}" class="nav-link {{ (request()->routeIs('student.setup.shift.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Shift') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.section.index") }}" class="nav-link {{ (request()->routeIs('student.setup.section.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Section') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.group.index") }}" class="nav-link {{ (request()->routeIs('student.setup.group.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Group') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.category.index") }}" class="nav-link {{ (request()->routeIs('student.setup.category.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Category') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.class_config.index") }}" class="nav-link {{ (request()->routeIs('student.setup.class_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Class Config') }}</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.setup.group_config.index") }}" class="nav-link {{ (request()->routeIs('student.setup.group_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>{{__('Group Config') }}</p></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('student.reg.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('student.reg.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tasks"></i>
                  <p>
                    Registration
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("student.reg.mass_create") }}" class="nav-link {{ (request()->routeIs('student.reg.mass_create')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>New Registration</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("student.reg.mass_edit") }}" class="nav-link {{ (request()->routeIs('student.reg.mass_edit')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>Edit Registration</p></a>
                  </li>
                </ul>
              </li>
              <li class="nav-item"><a href="{{ route("student.student.index") }}" class="nav-link {{ (request()->routeIs('student.student.*')) ? ' active' : '' }}">
                <i class="far fa-user nav-icon"></i> <p>{{__('Student List') }}</p></a>
              </li>
              <li class="nav-item"><a href="{{ route("student_statitics") }}" class="nav-link {{ (request()->routeIs('student_statitics')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>{{__('Student Statistics') }}</p></a>
              </li>

              {{-- <li class="nav-item"><a href="{{ route("incomeList") }}" class="nav-link {{ (request()->routeIs('incomeList')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> {{__('Income List')}}</a>
              </li> --}}
              {{-- <li class="nav-item"><a href="{{ route("invoiceHead.index") }}" class="nav-link {{ (request()->routeIs('invoiceHead.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> Invoice Head</a>
              </li> --}}
              
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
          <li class="nav-item has-treeview {{ (request()->routeIs('exam.*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('exam.*')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-book"></i>
              <p>Exam <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item has-treeview {{ (request()->routeIs('exam.setup.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('exam.setup.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tools"></i>
                  <p>
                    Setting
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("exam.setup.examList.index") }}" class="nav-link {{ (request()->routeIs('exam.setup.exanList.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Exam')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.setup.examSubject.index") }}" class="nav-link {{ (request()->routeIs('exam.setup.exanSubject.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Subject')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.setup.examShortCode.index") }}" class="nav-link {{ (request()->routeIs('exam.setup.examShortCode.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Exam Short Code')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.setup.examGrade.index") }}" class="nav-link {{ (request()->routeIs('exam.setup.examGrade.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Exam Grade')}}</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('exam.config.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('exam.config.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-cogs"></i>
                  <p>
                    Config
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("exam.config.subject.index") }}" class="nav-link {{ (request()->routeIs('exam.config.subject.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Subject')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Exam')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.config.mark_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.mark_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Mark')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.config.final_mark_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.final_mark_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Exam Final')}}</a>
                  </li>
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Fourth Subject')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Admit Instruction')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Marksheet Template')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Final Marksheet Template')}}</a>
                  </li> --}}
                </ul>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('exam.mark.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('exam.mark.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tasks"></i>
                  <p>
                    Marks
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("exam.mark.input") }}" class="nav-link {{ (request()->routeIs('exam.mark.input')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Mark Input')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.mark.update") }}" class="nav-link {{ (request()->routeIs('exam.mark.update')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Mark Update')}}</a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview {{ (request()->routeIs('sac.*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('sac.*')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-book"></i>
              <p>Student Accounts <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item has-treeview {{ (request()->routeIs('sac.setup.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('sac.setup.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tools"></i>
                  <p>
                    Setting
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("sac.setup.head.index") }}" class="nav-link {{ (request()->routeIs('sac.setup.head.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Head')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sac.setup.subHead.index") }}" class="nav-link {{ (request()->routeIs('sac.setup.subHead.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Sub Head')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sac.setup.feeWaiver.index") }}" class="nav-link {{ (request()->routeIs('sac.setup.feeWaiver.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Fee Waiver')}}</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('sac.config.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('sac.config.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-cogs"></i>
                  <p>
                    Config
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("sac.config.subHeadConfig.index") }}" class="nav-link {{ (request()->routeIs('sac.config.subHeadConfig.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Sub Head')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sac.config.feeConfig") }}" class="nav-link {{ (request()->routeIs('sac.config.feeConfig')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Fee Config')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sac.config.feeWaiverConfig.index") }}" class="nav-link {{ (request()->routeIs('sac.config.feeWaiverConfig.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Fee Waiver')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sac.config.timeConfig") }}" class="nav-link {{ (request()->routeIs('sac.config.timeConfig')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Time Config')}}</a>
                  </li>
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Fourth Subject')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Admit Instruction')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Marksheet Template')}}</a>
                  </li> --}}
                  {{-- <li class="nav-item"><a href="{{ route("exam.config.exam_config.index") }}" class="nav-link {{ (request()->routeIs('exam.config.exam_config.*')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Final Marksheet Template')}}</a>
                  </li> --}}
                </ul>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('exam.mark.*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('exam.mark.*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tasks"></i>
                  <p>
                    Marks
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("exam.mark.input") }}" class="nav-link {{ (request()->routeIs('exam.mark.input')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Mark Input')}}</a>
                  </li>
                  <li class="nav-item"><a href="{{ route("exam.mark.update") }}" class="nav-link {{ (request()->routeIs('exam.mark.update')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> {{__('Mark Update')}}</a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview {{ (request()->routeIs('contact.*','smsTemplate.*','sms.*')) ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ (request()->routeIs('contact.*','smsTemplate.*','sms.*')) ? 'active' : '' }}">
              <i class="nav-icon fas fa-envelope"></i>
              <p>SMS & Notification <i class="right fas fa-angle-left"></i> </p>
            </a>
            <ul class="nav nav-treeview">
              {{-- @can('hr-employee') --}}
              <li class="nav-item"><a href="{{ route("smsTemplate.index") }}" class="nav-link {{ (request()->routeIs('smsTemplate.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>SMS Template</p></a>
              </li>
              {{-- @endcan
              @can('hr-leave') --}}
              <li class="nav-item"><a href="{{ route("contact.index") }}" class="nav-link {{ (request()->routeIs('contact.*')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>Phone Book</p></a>
              </li>
              <li class="nav-item has-treeview {{ (request()->routeIs('sms.send*')) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->routeIs('sms.send*')) ? 'active' : '' }}">
                  <i class="nav-icon fas fa-tasks"></i>
                  <p>
                    SMS Send
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"><a href="{{ route("sms.send_class_wise") }}" class="nav-link {{ (request()->routeIs('sms.send_class_wise')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>SMS Class Wise</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sms.send_section_wise") }}" class="nav-link {{ (request()->routeIs('sms.send_section_wise')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>SMS Section Wise</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sms.send_contact_wise") }}" class="nav-link {{ (request()->routeIs('sms.send_contact_wise')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>SMS Contact Wise</p></a>
                  </li>
                  <li class="nav-item"><a href="{{ route("sms.send_file_wise") }}" class="nav-link {{ (request()->routeIs('sms.send_file_wise')) ? ' active' : '' }}">
                    <i class="far fa-circle nav-icon"></i> <p>SMS File Wise</p></a>
                  </li>
                </ul>
              </li>
              {{-- @endcan
              @can('hr-department') --}}
              <li class="nav-item"><a href="{{ route("sms.report") }}" class="nav-link {{ (request()->routeIs('sms.report')) ? ' active' : '' }}">
                <i class="far fa-circle nav-icon"></i> <p>Report</p></a>
              </li>
              {{-- @endcan --}}
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
