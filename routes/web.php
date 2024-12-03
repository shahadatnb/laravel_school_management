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

use App\Http\Controllers\Exam\ExanListController;
use App\Http\Controllers\Exam\ExanSubjectController;

use App\Http\Controllers\Student\InvoiceHeadController;
use App\Http\Controllers\Student\InvoiceController;
use App\Http\Controllers\Student\CourseController;
use App\Http\Controllers\Student\DepartmentController;
use App\Http\Controllers\Student\StudentController;
use App\Http\Controllers\Student\MarksController;
use App\Http\Controllers\Student\AttendanceController;

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
    return view('welcome');
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

Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=> ['auth']], function(){
    Route::prefix('student')->as('student.')->group(function() {
        
        Route::prefix('setup')->as('setup.')->group(function() {
            Route::resource('academicYear', AcademicYearController::class);
            Route::resource('semester', SemesterController::class);
            Route::resource('shift', ShiftController::class);
            Route::resource('section', SectionController::class);
            Route::resource('group', GroupController::class);
            Route::resource('category', CategoryController::class);
            Route::resource('class_config', ClassConfigController::class);
        });

        Route::get('student/admissionForm/{student}', [StudentController::class,'admissionForm'])->name('admissionForm');
        Route::post('student/import', [StudentController::class,'import'])->name('student.import');
        Route::resource('student', StudentController::class);

    });

    Route::prefix('exan')->as('exan.')->group(function() {
        
        Route::prefix('setup')->as('setup.')->group(function() {
            Route::resource('exanList', ExanListController::class);
            Route::resource('exanSubject', ExanSubjectController::class);
        });
    });

    Route::post('student/import-cgpa', [StudentController::class,'importCgpa'])->name('student.import.cgpa');
    Route::get('student/id_card', [StudentController::class,'IDCard'])->name('id_card');
    Route::get('student/student_statitics', [StudentController::class,'student_statitics'])->name('student_statitics');
    Route::get('student/incomeList', [InvoiceController::class,'incomeList'])->name('incomeList');
    Route::resource('invoice', InvoiceController::class);
    Route::resource('attendance', AttendanceController::class);
    Route::get('attendance/report', [AttendanceController::class,'attendanceReport'])->name('attendance.report');


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

    
    Route::resource('posts', PostsController::class);
//    Route::get('PostDelete/{id}',[PostsController::class, 'PostDelete')->name('PostDelete');
    Route::get('postOrder', [PostsController::class, 'postOrder'])->name('postOrder');

    Route::resource('taxonomy', TaxonomyController::class);
    Route::get('taxonomy/hide{id}', [TaxonomyController::class, 'hide'])->name('taxonomy.hide');
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

    Route::resource('studentMark', MarksController::class);
    Route::resource('department', DepartmentController::class);    
    Route::resource('course', CourseController::class);
    Route::resource('invoiceHead', InvoiceHeadController::class);
});


Route::group(['prefix'=>config('app.admin_prefix','admin'),'middleware'=> ['auth']], function(){
    Route::resource('users', UsersController::class);
    Route::resource('branch', BranchController::class);
    Route::resource('location', LocationController::class);

    Route::resource('menus',MenuController::class);
    Route::post('/menuItemStore', [MenuController::class, 'menuItemStore'])->name('menuItem.store');
    Route::post('/menuItemUpdate/{id}', [MenuController::class, 'menuItemUpdate'])->name('menuItem.update');
    Route::get('/menuItemEdit/{id}', [MenuController::class,'menuItemEdit'])->name('menuItem.edit');
    Route::get('/menuItemDelete/{id}', [MenuController::class,'menuItemDelete'])->name('menuItem.delete');
    Route::post('menu_sl', [MenuController::class, 'menuSl'])->name('menu_sl');

    Route::post('/assignPermission/{user}', [UsersController::class, 'assignPermission'])->name('user.assignPermission');
    Route::post('/assignBranch/{user}', [UsersController::class, 'assignBranch'])->name('user.assignBranch');
    Route::post('/user-ban', [UsersController::class, 'ban'])->name('user-ban');
    Route::get('/user-unban/{id}', [UsersController::class, 'unban'])->name('user-unban');

    Route::get('/siteCache', [AdminController::class, 'siteCache'])->name('siteCache');
    Route::get('/basic-settings', [AdminController::class, 'settings'])->name('settings');
    Route::put('/saveSetting', [AdminController::class,'saveSetting'])->name('saveSetting');
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
