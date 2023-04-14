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
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['page', 'news']);
            $table->string('slug');
            $table->string('name');
            $table->string('title');
            $table->string('subtitle');
            $table->string('featured_image');
            $table->string('headline_long');
            $table->string('headline_short');
            $table->text('content');
            $table->boolean('headline_is_not_displaying');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
