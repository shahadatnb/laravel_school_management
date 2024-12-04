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
    {   //Class	Default ID	Short Code Title	Total Mark	Pass Mark	Acceptance
        Schema::create('exam_short_codes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('class_id')->references('id')->on('semesters');
            $table->unsignedBigInteger('default_id')->references('id')->on('exam_short_code_defaults');
            $table->string('code_title');
            $table->unsignedSmallInteger('total_marks');
            $table->float('pass_mark', 5, 2);
            $table->float('acceptance', 5, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_short_codes');
    }
};
