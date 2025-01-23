<?php

namespace App\Models\sAccounts;

use App\Models\Student\Semester;
use App\Models\Student\Group;
use App\Models\Student\Category;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentAcFeeConfig extends Model
{
    use HasFactory;

    public function sub_head(){
        return $this->belongsTo(StudentAcSubHead::class);
    }

    public function semester(){
        return $this->belongsTo(Semester::class, 'class_id');
    }

    public function group(){
        return $this->belongsTo(Group::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function head(){
        return $this->belongsTo(StudentAcHead::class);
    }
}
