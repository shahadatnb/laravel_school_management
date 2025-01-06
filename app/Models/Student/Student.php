<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Location;
use App\Models\User;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'branch_id','academic_year_id','reg_no','class_roll','name','section_id','semester_id','shift_id','group_id','category_id','Comment','religion','fathersName','mothersName','sex','address','presentPost','presentUpazila','presentZila','permanentVillage','permanentPost','permanentUpazila','permanentZila','dateOfBirth','mobile','photo','mobileFather','mobileMother'
    ];
/*
    public function invoice(){
        return $this->hasMany(Invoice::class);
    }

    public function payment(){
        return $this->hasMany(InvoicePayment::class);
    }
*/
    public function payment(){
        return $this->hasMany(StudentPayment::class);
    }

    public function marks(){
        return $this->hasMany(StudentMark::class);
    }
    
    public function presentZilaName(){
        return $this->belongsTo(Location::class, 'presentZila');
    }
    public function presentUpazilaName(){
        return $this->belongsTo(Location::class, 'presentUpazila');
    }
    public function permanentZilaName(){
        return $this->belongsTo(Location::class, 'permanentZila');
    }
    public function permanentUpazilaName(){
        return $this->belongsTo(Location::class, 'permanentUpazila');
    }
    
    public function createdBy(){
        return $this->belongsTo(User::class, 'created_by');
    }

    public function category(){
        return $this->belongsTo(Category::class, 'shift_id');
    }

    public function section(){
        return $this->belongsTo(ClassConfig::class, 'section_id');
    }
    
    public function semester(){
        return $this->belongsTo(Semester::class);
    }

    public function group(){
        return $this->belongsTo(Group::class);
    }
    
    public function academicYear(){
        return $this->belongsTo(AcademicYear::class);
    }

    public function attendance(){
        return $this->hasMany(Attendance::class);
    }

}
