<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('exam_fourth_assigns', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('academic_year_id')->references('id')->on('academic_years');
            $table->unsignedBigInteger('student_id')->references('id')->on('students');
            $table->unsignedBigInteger('section_id')->referances('id')->on('sections');
            $table->unsignedBigInteger('group_id')->references('id')->on('groups');
            $table->unsignedBigInteger('subject_id')->references('id')->on('subjects');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_fourth_assigns');
    }
};
