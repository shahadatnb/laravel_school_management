<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassConfig extends Model
{
    use HasFactory;

    public function class()
    {
        return $this->belongsTo(Semester::class, 'class_id');
    }

    public function shift(){
        return $this->belongsTo(Shift::class, 'shift_id');
    }

    public function section(){
        return $this->belongsTo(Section::class, 'section_id');
    }
}
