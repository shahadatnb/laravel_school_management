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
        Schema::create('exam_mark_configs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('class_id')->references('id')->on('semesters');
            $table->unsignedBigInteger('group_id')->references('id')->on('groups');
            $table->unsignedBigInteger('exam_id')->references('id')->on('exam_lists');
            $table->unsignedBigInteger('subject_id')->references('id')->on('exan_subjects');
            $table->string('sc_title');
            $table->unsignedSmallInteger('total_marks')->default(0);
            $table->float('pass_mark')->default(0);
            $table->float('acceptance')->default(1);
            $table->unsignedTinyInteger('sc_merge')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_final_mark_configs');
    }
};
