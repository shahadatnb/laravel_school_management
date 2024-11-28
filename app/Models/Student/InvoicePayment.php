<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class InvoicePayment extends Model
{
    use HasFactory;

    protected $fillable = ['invoice_id', 'student_id', 'amount', 'remarks','received_by'];

    public function invoice(){
        return $this->belongsTo(Invoice::class);
    }

    public function student(){
        return $this->belongsTo(Student::class);
    }

    public function receivedBy(){
        return $this->belongsTo(User::class, 'received_by');
    }
}
