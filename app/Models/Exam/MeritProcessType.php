<?php

namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MeritProcessType extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'exam_merit_process_types';
}
