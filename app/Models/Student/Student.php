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
        'reg_no','class_roll','name','department_id','semester_id','fathersName','mothersName','sex','address','presentPost','presentUpazila','presentZila','permanentVillage','permanentPost','permanentUpazila','permanentZila','dateOfBirth','shift','student_group','probidhan','contact_number','mobileFather','photo','session','cgpa'
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

    public function shift(){
        return $this->belongsTo(Shift::class, 'shift_id');
    }

    public function section(){
        return $this->belongsTo(Section::class, 'section_id');
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
