<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Invoice extends Model
{
    use HasFactory;    
    
    public function items(){
        return $this->hasMany(InvoiceItem::class);
    }
    
    public function createdBy(){
        return $this->belongsTo(User::class, 'created_by');
    }

}
