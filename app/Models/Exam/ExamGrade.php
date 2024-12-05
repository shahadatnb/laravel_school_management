<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student\Semester;

class ExamGrade extends Model
{
    use HasFactory;

    public function semester(){
        return $this->belongsTo(Semester::class,'class_id');
    }
}
