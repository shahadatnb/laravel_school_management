<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamHall extends Model
{
    use HasFactory;

    public function studentSeat(){
        return $this->belongsToMany(ExamStudent::class,'exam_hall_students','exam_hall_id','student_id');
    }
}
