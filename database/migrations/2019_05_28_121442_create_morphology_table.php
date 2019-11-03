<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMorphologyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('morphology', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_morphology_type')->unsigned();
            $table->char('description', 100);
            $table->char('path', 100);

            //references
            $table->foreign('id_morphology_type')->references('id')->on('morphology_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('morphology');
    }
}
