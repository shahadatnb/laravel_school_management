<?php

namespace App\Models\sAccounts;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentAcSubHead extends Model
{
    use HasFactory;

    public function head()
    {
        return $this->belongsToMany(StudentAcHead::class, 'student_ac_sub_head_configs', 'sub_head_id', 'head_id');
    }
}
