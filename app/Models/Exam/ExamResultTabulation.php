<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamResultTabulation extends Model
{
    use HasFactory;
    protected $fillable = [
        'exam_result_id',
        'subject_id',
        'full_marks',
        'marks',
        'grade',
        'grade_point'
    ];
}
