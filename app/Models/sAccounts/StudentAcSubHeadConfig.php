<?php

namespace App\Models\sAccounts;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentAcSubHeadConfig extends Model
{
    use HasFactory;

    public function head()
    {
        return $this->belongsTo(StudentAcHead::class, 'head_id', 'id');
    }

    public function subHead()
    {
        return $this->belongsTo(StudentAcSubHead::class, 'sub_head_id', 'id');
    }
}
