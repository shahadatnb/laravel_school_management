<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student\Semester;

class MarkConfig extends Model
{
    use HasFactory;

    protected $table = 'exam_mark_configs';

    public function semester() {
        return $this->belongsTo(Semester::class, 'class_id');
    }

    public function exam() {
        return $this->belongsTo(ExamList::class, 'exam_id');
    }

    public function subject() {
        return $this->belongsTo(ExamSubject::class, 'subject_id');
    }
}
