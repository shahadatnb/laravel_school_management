<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamResult extends Model
{
    use HasFactory;
    protected $fillable = [
        'branch_id',
        'academic_year_id',
        'class_id',
        'section_id',
        'exam_id',
        'student_id',
        'total_marks',
        'grand_total_marks',
        'class_position',
        'section_position',
        'grade',
        'grade_point',
    ];

    public function student(){
        return $this->belongsTo('App\Models\Student\Student');
    }

    public function exam(){
        return $this->belongsTo(ExamList::class);
    }

    public function tabulation(){
        return $this->hasMany(ExamResultTabulation::class);
    }
}
