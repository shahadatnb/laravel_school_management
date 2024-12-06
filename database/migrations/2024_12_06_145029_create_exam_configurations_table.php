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
        Schema::create('exam_configurations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('class_id')->references('id')->on('semesters');
            $table->unsignedBigInteger('exam_id')->references('id')->on('exams');
            $table->unsignedBigInteger('merit_process_type_id')->references('id')->on('exam_merit_process_types');            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_configurations');
    }
};
