<?php
namespace App\Traits;

use App\Models\Location;
use App\Models\Student\AcademicYear;
use App\Models\Student\InvoiceHead;

trait CommonTrait {

    public function zilaArray() {
        $parants = Location::where('parent_id', null)->get();
        $plocations = [];
        foreach ($parants as $parant) {
            $plocations[$parant->id] = $parant->name;
        }
        return $plocations;
    }

    public function upaZilaArray($parent_id) {
        $parants = Location::where('parent_id', $parent_id)->get();
        $plocations = [];
        foreach ($parants as $parant) {
            $plocations[$parant->id] = $parant->name;
        }
        return $plocations;
    }

    public function academicYear() {
        $parants = AcademicYear::where('status', 1)->latest()->get();
        $years = [];
        foreach ($parants as $parant) {
            $years[$parant->id] = $parant->year;
        }
        return $years;
    }

    public function invoiceHeadArray() {
        $parants = InvoiceHead::where('status', 1)->get();
        $years = [];
        foreach ($parants as $parant) {
            $years[$parant->id] = $parant->title;
        }
        return $years;
    }

}
