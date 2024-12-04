<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Student\Semester;

class ExamShortCode extends Model
{
    use HasFactory;

    protected $fillable = [
        'class_id',
        'default_id',
        'code_title',
        'total_marks',
        'pass_mark',
        'acceptance',
        'branch_id',
    ];

    public function semester(){
        return $this->belongsTo(Semester::class,'class_id');
    }
}
