<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Student\Semester;

class ExamConfiguration extends Model
{
    use HasFactory;

    public function exam(){
        return $this->belongsTo(ExamList::class);
    }

    public function semester(){
        return $this->belongsTo(Semester::class,'class_id');
    }

    public function meritProcessType(){
        return $this->belongsTo(MeritProcessType::class);
    }
}
