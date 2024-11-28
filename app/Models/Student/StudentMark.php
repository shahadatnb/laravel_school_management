<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentMark extends Model
{
    use HasFactory;
    protected $fillable = [
        'semester_id',
        'student_id',
        'paid_confirm',
        'paid_confirm_by',
        'attendance',
        'written_marks',
        'oral_marks',
        'total_marks',
        'mark_entry_by',
        'mark_locked',
        'mark_locked_by',
    ];

    public function student(){
        return $this->belongsTo(Student::class, 'student_id');
    }

    public function semester(){
        return $this->belongsTo(Semester::class, 'semester_id');
    }
    
    public function paiddBy(){
        return $this->belongsTo(User::class, 'paid_confirm_by');
    }
        
    public function markEntryBy(){
        return $this->belongsTo(User::class, 'mark_entry_by');
    }
}
