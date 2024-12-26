<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\MenuController;

use App\Http\Controllers\Student\AcademicYearController;
use App\Http\Controllers\Student\SemesterController;
use App\Http\Controllers\Student\ShiftController;
use App\Http\Controllers\Student\SectionController;
use App\Http\Controllers\Student\GroupController;
use App\Http\Controllers\Student\CategoryController;
use App\Http\Controllers\Student\ClassConfigController;
use App\Http\Controllers\Student\GroupConfigController;

use App\Http\Controllers\Exam\ExamListController;
use App\Http\Controllers\Exam\ExamSubjectController;
use App\Http\Controllers\Exam\ExamShortCodeController;
use App\Http\Controllers\Exam\ExamGradeController;
use App\Http\Controllers\Exam\ExamSubjectConfigController;
use App\Http\Controllers\Exam\ExamConfigurationController;
use App\Http\Controllers\Exam\MarkConfigController;
use App\Http\Controllers\Exam\ExamMarkController;

use App\Http\Controllers\sAccounts\StudentAcHeadController;
use App\Http\Controllers\sAccounts\StudentAcSubHeadController;
use App\Http\Controllers\sAccounts\StudentAcFeeWaiverController;
use App\Http\Controllers\sAccounts\StudentAcSubHeadConfigController;
use App\Http\Controllers\sAccounts\StudentAcFeeConfigController;
use App\Http\Controllers\sAccounts\StudentAcFreeWaiverConfigController;
use App\Http\Controllers\sAccounts\StudentAcTimeConfigController;

use App\Http\Controllers\Student\InvoiceHeadController;
use App\Http\Controllers\Student\InvoiceController;
use App\Http\Controllers\Student\StudentController;
use App\Http\Controllers\Student\MarksController;
use App\Http\Controllers\Student\AttendanceController;

use App\Http\Controllers\SMS\SmsContactController;
use App\Http\Controllers\SMS\SmsLogController;
use App\Http\Controllers\SMS\SmsTemplateController;
use App\Http\Controllers\SMS\SMSController;

use App\Http\Controllers\Auth\Admission\AdmissionForgotPasswordController;
use App\Http\Controllers\Auth\Admission\AdmissionResetPasswordController;
use App\Http\Controllers\Auth\Admission\AdmissionRegisterController;
use App\Http\Controllers\Auth\Admission\AdmissionLoginController;

use App\Http\Controllers\TaxonomyController;
use App\Http\Controllers\PostsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('ac_config', function()
{
    Artisan::call('config:cache');
    return 'OK';
});
//Route::domain('{company_name}.' . env('APP_DOMAIN', 'workspace.com'))
// Route::domain('{branch}.' . env('APP_DOMAIN', 'laravel-8-school.test'))->middleware('checkSubdomain')->group(function () {
//     Route::get('/', [HomeController::class,'homepage'])->name('/');
//     Route::get('page/{page}', [HomeController::class,'page'])->name('page');
//     Route::get('section/{post_type}', [HomeController::class,'section'])->name('section');
// });

//Route::get('/', [HomeController::class,'homepage'])->name('/');

Route::get('/', function () {
    return redirect()->route('login');
});

Route::prefix(config('app.admin_prefix','admin'))->group(function() {
    //Auth::routes(['register' => false]);//['verify'=> false]
});

Route::get('/dashboard', function () {
    return redirect()->route('home');
});

Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=>'auth'], function(){  

    Route::get('/home', [AdminController::class,'home'])->name('home');
    Route::post('/branchSelect', [AdminController::class,'branchSelect'])->name('branchSelect');
    Route::get('/', [AdminController::class,'index'])->name('dashboard');
    Route::get('/profile', [UsersController::class,'profile'])->name('profile');
    Route::get('/editProfile', [UsersController::class,'editProfile'])->name('editProfile');
    Route::post('/updateProfile', [UsersController::class,'updateProfile'])->name('updateProfile');
    Route::post('/chengePassword', [UsersController::class,'chengePassword'])->name('chengePassword');

    //Route::resource('unit', UnitController::class);
});
Route::get('/childLocation', [LocationController::class,'childLocation'])->name('childLocation');
Route::get('/branch_info', [BranchController::class,'branch_info'])->name('branch_info');

Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=> ['auth','branch']], function(){
    Route::prefix('student')->as('student.')->group(function() {
        
        Route::prefix('setup')->as('setup.')->group(function() {
            Route::resource('academicYear', AcademicYearController::class);
            Route::resource('semester', SemesterController::class);
            Route::resource('shift', ShiftController::class);
            Route::resource('section', SectionController::class);
            Route::resource('group', GroupController::class);
            Route::resource('category', CategoryController::class);
            Route::resource('class_config', ClassConfigController::class);
            Route::resource('group_config', GroupConfigController::class);
        });

        Route::get('student/admissionForm/{student}', [StudentController::class,'admissionForm'])->name('admissionForm');
        Route::post('student/import', [StudentController::class,'import'])->name('student.import');
        Route::resource('student', StudentController::class);

    });

    Route::prefix('exam')->as('exam.')->group(function() {
        
        Route::prefix('setup')->as('setup.')->group(function() {
            Route::resource('examList', ExamListController::class)->except('show');
            Route::resource('examSubject', ExamSubjectController::class)->except('show');
            Route::post('examShortCode/mass_update', [ExamShortCodeController::class,'mass_update'])->name('examShortCode.mass_update');
            Route::resource('examShortCode', ExamShortCodeController::class)->except('show','edit','update','create');
            Route::resource('examGrade', ExamGradeController::class)->except('show','edit','create');
        });
        
        Route::prefix('configation')->as('config.')->group(function() {
            Route::get('subject/delete', [ExamSubjectConfigController::class,'destroy'])->name('subject.delete');
            Route::get('subject/list', [ExamSubjectConfigController::class,'list'])->name('subject.list');
            Route::post('subject/mass_update', [ExamSubjectConfigController::class,'mass_update'])->name('subject.mass_update');
            Route::resource('subject', ExamSubjectConfigController::class)->except('show','create','edit');
            Route::resource('exam_config', ExamConfigurationController::class)->except('show','create');

            Route::get('mark_config', [MarkConfigController::class, 'index'])->name('mark_config.index');
            Route::get('get_group', [MarkConfigController::class, 'get_group'])->name('mark_config.get_group');
            Route::get('get_group_exam', [MarkConfigController::class, 'get_group_exam'])->name('mark_config.get_group_exam');
            Route::get('get_subject_exam', [MarkConfigController::class, 'get_subject_exam'])->name('mark_config.get_subject_exam');
            Route::post('save_config', [MarkConfigController::class, 'save_config'])->name('mark_config.save_config');
            Route::get('get_config', [MarkConfigController::class, 'get_config'])->name('mark_config.get_config');

            Route::get('final_mark_config', [ExamConfigurationController::class, 'finalMarkConfig'])->name('final_mark_config.index');
            Route::get('final_mark_config/edit/{id}', [ExamConfigurationController::class, 'finalMarkConfigEdit'])->name('final_mark_config.edit');
            Route::post('final_mark_config/update', [ExamConfigurationController::class, 'finalMarkConfigUpdate'])->name('final_mark_config.update');
            
        });

        Route::prefix('marks')->as('mark.')->group(function() {
            Route::get('get_exam_group',[ExamMarkController::class,'get_exam_group'])->name('get_exam_group');
            Route::get('get_subject',[ExamMarkController::class,'get_subject'])->name('get_subject');

            Route::get('input',[ExamMarkController::class,'input'])->name('input');
            Route::get('get_input_student',[ExamMarkController::class,'get_input_student'])->name('get_input_student');
            Route::post('input_save',[ExamMarkController::class,'input_save'])->name('input_save');

            Route::get('update',[ExamMarkController::class,'update'])->name('update');
            Route::get('get_update_student',[ExamMarkController::class,'get_update_student'])->name('get_update_student');
            Route::post('update_save',[ExamMarkController::class,'update_save'])->name('update_save');
        });
    });

    Route::prefix('student_accounts')->as('sac.')->group(function() {
        
        Route::prefix('setup')->as('setup.')->group(function() {
            Route::resource('head', StudentAcHeadController::class)->except('show');
            Route::resource('subHead', StudentAcSubHeadController::class)->except('show');
            Route::resource('feeWaiver', StudentAcFeeWaiverController::class)->except('show');
        });
        
        Route::prefix('configation')->as('config.')->group(function() {
            Route::resource('subHeadConfig', StudentAcSubHeadConfigController::class)->except('show','create');
            Route::get('feeConfig', [StudentAcFeeConfigController::class,'index'])->name('feeConfig');
            Route::get('get_fee_config', [StudentAcFeeConfigController::class,'get_fee_config'])->name('get_fee_config');
            Route::post('save_fee_config', [StudentAcFeeConfigController::class,'save_fee_config'])->name('save_fee_config');

            Route::get('timeConfig', [StudentAcTimeConfigController::class,'index'])->name('timeConfig');
            Route::get('get_sub_head', [StudentAcTimeConfigController::class,'get_sub_head'])->name('get_sub_head');
            Route::post('save_fee_time', [StudentAcTimeConfigController::class,'save_fee_time'])->name('save_fee_time');
            Route::get('get_fee_time', [StudentAcTimeConfigController::class,'get_fee_time'])->name('get_fee_time');

            Route::resource('feeWaiverConfig', StudentAcFreeWaiverConfigController::class)->except('show','create');
            
        });

        Route::prefix('marks')->as('mark.')->group(function() {

        });
    });

    Route::post('student/import-cgpa', [StudentController::class,'importCgpa'])->name('student.import.cgpa');
    Route::get('student/id_card', [StudentController::class,'IDCard'])->name('id_card');
    Route::get('student/student_statitics', [StudentController::class,'student_statitics'])->name('student_statitics');
    Route::get('student/incomeList', [InvoiceController::class,'incomeList'])->name('incomeList');
    Route::resource('invoice', InvoiceController::class);
    Route::resource('attendance', AttendanceController::class);
    Route::get('attendance/report', [AttendanceController::class,'attendanceReport'])->name('attendance.report');

/*
    Route::resource('admission', AdmissionController::class);
    Route::resource('admission_class', AdmissionClassController::class);
    Route::resource('admission_trade', AdmissionTradeController::class);
    Route::resource('admission_result', AdmissionResultController::class);
    Route::resource('admission_quota', AdmissionQuotaController::class);
    Route::get('application_payment_list', [AdmissionController::class,'paymentList'])->name('application_payment_list');
    Route::post('application_store_waiting', [AdmissionResultController::class,'store_waiting'])->name('application.store_waiting');
    Route::get('application_summary', [AdmissionResultController::class,'application_summary'])->name('application_summary');
    Route::get('application_result_summary', [AdmissionResultController::class,'application_result_summary'])->name('application_result_summary');
    Route::get('application_result_details', [AdmissionResultController::class,'application_result_details'])->name('application_result_details');
    Route::get('application_waiting_list', [AdmissionResultController::class,'application_waiting_list'])->name('application_waiting_list');
*/
    
    Route::resource('posts', PostsController::class);
//    Route::get('PostDelete/{id}',[PostsController::class, 'PostDelete')->name('PostDelete');
    Route::get('postOrder', [PostsController::class, 'postOrder'])->name('postOrder');

    Route::resource('taxonomy', TaxonomyController::class);
    Route::get('taxonomy/hide{id}', [TaxonomyController::class, 'hide'])->name('taxonomy.hide');
});

Route::group(['prefix'=>'sms','middleware'=> ['auth']], function(){
    Route::post('contact_import', [SmsContactController::class, 'import'])->name('contact.import');
    Route::resource('contact', SmsContactController::class);
    Route::post('addCategory', [SmsContactController::class, 'addCategory'])->name('add.contact.category');
    Route::resource('smsTemplate', SmsTemplateController::class);
    Route::get('/smsBalance', [SMSController::class, 'smsBalance'])->name('smsBalance');
    Route::get('send', [SmsController::class, 'index'])->name('sms.send');
    Route::post('send', [SmsController::class, 'send'])->name('sms.send.post');
    Route::get('report', [SmsLogController::class, 'report'])->name('sms.report');
    Route::get('report-summary', [SmsLogController::class, 'reportSummary'])->name('sms.report.summary');
});

Route::group(['prefix'=>'student','middleware'=> ['auth']], function(){
    Route::get('studentPromotion', [MarksController::class,'studentPromotion'])->name('student.promotion');
    Route::post('studentPromotionSubmit', [MarksController::class,'studentPromotionSubmit'])->name('student.promotion.submit');

    Route::get('studentMarksheet', [MarksController::class,'studentMarksheet'])->name('student.marksheet');
    Route::get('studentAppearedDownload/{student}', [MarksController::class,'studentAppearedDownload'])->name('student.appeared.download');
    Route::get('studentMarksheetDownload/{student}', [MarksController::class,'studentMarksheetDownload'])->name('student.marksheet.download');
    Route::get('studentCertificateDownload/{student}', [MarksController::class,'studentCertificateDownload'])->name('student.certificate.download');
    Route::get('studentTestomonialDownload/{student}', [MarksController::class,'studentTestomonialDownload'])->name('student.testomonial.download');

    //Route::get('studentCertificate', [MarksController::class,'studentCertificate'])->name('student.certificate');

    Route::get('studentPayments/{student}', [StudentController::class,'studentPayments'])->name('student.payments');
    Route::post('studentPayment', [StudentController::class,'studentPayment'])->name('student.payment');
    Route::get('complitePayment/{student}/{id}', [StudentController::class,'studentPaymentComplite'])->name('student.payment.complite');

    Route::resource('invoiceHead', InvoiceHeadController::class);
});


Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=> ['auth','branch']], function(){
    Route::post('/menuItemStore', [MenuController::class, 'menuItemStore'])->name('menuItem.store');
    Route::post('/menuItemUpdate/{id}', [MenuController::class, 'menuItemUpdate'])->name('menuItem.update');
    Route::get('/menuItemEdit/{id}', [MenuController::class,'menuItemEdit'])->name('menuItem.edit');
    Route::get('/menuItemDelete/{id}', [MenuController::class,'menuItemDelete'])->name('menuItem.delete');
    Route::post('menu_sl', [MenuController::class, 'menuSl'])->name('menu_sl');
    
    Route::get('/siteCache', [AdminController::class, 'siteCache'])->name('siteCache');
    Route::get('/basic-settings', [AdminController::class, 'settings'])->name('settings');
    Route::put('/saveSetting', [AdminController::class,'saveSetting'])->name('saveSetting');
});

Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=> ['auth','role:superadmin,admin']], function(){
    Route::resource('users', UsersController::class);
    Route::resource('branch', BranchController::class);
    Route::resource('location', LocationController::class);
    Route::resource('menus',MenuController::class);

    Route::post('/assignPermission/{user}', [UsersController::class, 'assignPermission'])->name('user.assignPermission');
    Route::post('/assignBranch/{user}', [UsersController::class, 'assignBranch'])->name('user.assignBranch');
    Route::post('/user-ban', [UsersController::class, 'ban'])->name('user-ban');
    Route::get('/user-unban/{id}', [UsersController::class, 'unban'])->name('user-unban');
});

Route::group(['prefix'=>'admin','middleware'=> ['auth','role:superadmin']], function(){

    Route::get('ac_config_store', function()
    {
        $exitCode = Artisan::call('storage:link');
        return 'OK';
    });

    Route::get('/forceLogin/{id}', [UsersController::class, 'forceLogin'])->name('users.forceLogin');
    Route::resource('roles', RolesController::class);
    Route::resource('permissions', PermissionController::class);
    Route::resource('language', LanguageController::class);    
});


require __DIR__.'/auth.php';
