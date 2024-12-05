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
        Schema::create('exam_subject_configs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('class_id')->references('id')->on('semesters');
            $table->unsignedBigInteger('group_id')->references('id')->on('groups');
            $table->unsignedBigInteger('subject_id')->references('id')->on('subjects');
            $table->unsignedBigInteger('subject_type_id')->references('id')->on('exam_subject_types');
            $table->unsignedSmallInteger('serial')->default(0)->nullable();
            $table->unsignedSmallInteger('merge')->default(0)->nullable();            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_subject_configs');
    }
};
