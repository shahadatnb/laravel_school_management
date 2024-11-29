<?php
namespace App\Traits;

use App\Models\Student\Course;
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

}
