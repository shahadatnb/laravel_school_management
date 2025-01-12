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
        Schema::create('idcard_templates', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('branch_id')->nullable();
            $table->string('title');
            $table->string('slug');
            $table->string('image')->nullable();
            $table->string('text_1')->nullable();
            $table->string('text_2')->nullable();
            $table->string('text_3')->nullable();
            $table->string('text_4')->nullable();
            $table->string('text_5')->nullable();
            $table->string('text_6')->nullable();
            $table->string('color_code_1')->nullable();
            $table->string('color_code_2')->nullable();
            $table->string('color_code_3')->nullable();
            $table->string('color_code_4')->nullable();
            $table->string('color_code_5')->nullable();
            $table->string('color_code_6')->nullable();
            $table->string('color_code_7')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('idcard_templates');
    }
};
