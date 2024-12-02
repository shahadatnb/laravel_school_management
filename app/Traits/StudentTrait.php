<?php
namespace App\Traits;

use App\Models\Student\Student;
use App\Models\Student\Semester;

trait StudentTrait {

    public function semesterArray() {
        $parants = Semester::where('status', 1)->where('branch_id', session('branch')['id'])->get();
        $plocations = [];
        foreach ($parants as $parant) {
            $plocations[$parant->id] = $parant->name;
        }
        return $plocations;
    }

    public function newReg(){
        $student = Student::where('branch_id', session('branch')['id'])->orderBy('reg_no','desc')->first();
        if($student){
            /*
            $year = substr($student->reg_no,0,4);
            if($year == date('Y')){
                return ++$student->reg_no;
            }else{
                return date('Y').$dept.'001';
            }
            */
            return ++$student->reg_no;
        }else{
            return date('y').'001';
        }
    }

}
