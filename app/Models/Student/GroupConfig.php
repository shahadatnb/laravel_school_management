<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupConfig extends Model
{
    use HasFactory;
    public function group()
    {
        return $this->belongsTo(Group::class, 'group_id');
    }
   
    public function semester()
    {
        return $this->belongsTo(Semester::class, 'class_id');
    }

}
