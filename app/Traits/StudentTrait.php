<?php
namespace App\Traits;

use App\Models\Student\Course;
use App\Models\Student\Department;
use App\Models\Student\Semester;

trait StudentTrait {

    public function departmentArray() {
        $parants = Department::where('status', 1)->get();
        $plocations = [];
        foreach ($parants as $parant) {
            $plocations[$parant->id] = $parant->title;
        }
        return $plocations;
    }

    public function semesterArray() {
        $parants = Semester::where('status', 1)->get();
        $plocations = [];
        foreach ($parants as $parant) {
            $plocations[$parant->id] = $parant->title;
        }
        return $plocations;
    }

}
