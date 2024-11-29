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
        Schema::create('class_configs', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('class_id')->referances('id')->on('semesters');
            $table->unsignedBigInteger('shift_id')->referances('id')->on('shifts');
            $table->unsignedBigInteger('section_id')->referances('id')->on('sections');
            $table->unsignedTinyInteger('serial')->default(0)->nullable();
            $table->unsignedTinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('class_configs');
    }
};
