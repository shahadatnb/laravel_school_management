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
    { //Title	Total Marks	Pass-mark	Acceptance
        Schema::create('exam_short_code_defaults', function (Blueprint $table) {
            $table->id();
            $table->string('name');
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
        Schema::dropIfExists('exam_short_code_defaults');
    }
};
