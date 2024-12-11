<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student\Student;

class ExamMark extends Model
{
    use HasFactory;
    
    public function student() {
        return $this->belongsTo(Student::class, 'student_id');
    }

    public function mark_config() {
        return $this->belongsTo(MarkConfig::class, 'mark_config_id');
    }
}
