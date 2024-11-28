<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentPayment extends Model
{
    use HasFactory;

    public function head(){
        return $this->hasMany(InvoiceHead::class);
    }
    
    public function createdBy(){
        return $this->belongsTo(User::class, 'entry_by');
    }
}
