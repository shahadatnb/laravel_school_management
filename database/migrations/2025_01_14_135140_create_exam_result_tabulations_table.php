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
        Schema::create('exam_result_tabulations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('exam_result_id');
            $table->foreign('exam_result_id')->references('id')->on('exam_results')->onDelete('cascade');
            $table->unsignedBigInteger('subject_id');
            $table->float('marks', 7, 2)->nullable();
            $table->string('grade')->nullable();
            $table->string('grade_point')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_result_tabulations');
    }
};
