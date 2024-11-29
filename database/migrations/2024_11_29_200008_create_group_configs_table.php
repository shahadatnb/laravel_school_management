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
        Schema::create('group_configs', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('branch_id')->references('id')->on('branches');
            $table->unsignedBigInteger('group_id')->referances('id')->on('groups');
            $table->unsignedBigInteger('class_id')->referances('id')->on('semesters');
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
        Schema::dropIfExists('group_configs');
    }
};
