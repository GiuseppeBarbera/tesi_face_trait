<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateImageSubjectTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('image_subject', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_subject')->unsigned();
            $table->integer('id_image_type')->unsigned();
            $table->char('path', 100);

            //references
            $table->foreign('id_subject')->references('id')->on('subject');
            $table->foreign('id_image_type')->references('id')->on('image_type');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('image_subject');
    }
}
