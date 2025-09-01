<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamSubject extends Model
{
    use HasFactory;

    public function subjectConfig(){
        return $this->hasMany(ExamSubjectConfig::class,'subject_id');
    }
}
