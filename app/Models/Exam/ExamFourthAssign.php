<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student\Student;

class ExamFourthAssign extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'subject_id',
        'academic_year_id',
        'branch_id'
    ];

    public function student(){
        return $this->belongsTo(Student::class);
    }
}
