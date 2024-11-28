<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamStudent extends Model
{
    use HasFactory;

    protected $fillable = [
        'name','class_roll','reg_no','session','semester','institute','shift','student_group','ref_subject','technology','probidhan','status','remarks','mobile'
    ];

    public function examList(){
        return $this->belongsTo(ExamList::class,'exam_id','id');
    }
}
