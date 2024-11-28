<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    use HasFactory;

    
    public function invoice(){
        return $this->belongsTo(Invoice::class);
    }
    
    public function head(){
        return $this->belongsTo(InvoiceHead::class);
    }

}
