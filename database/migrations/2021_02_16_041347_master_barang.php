<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MasterBarang extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('master_barang', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_barang',100)->nullable();
            $table->integer('id_produk');
            $table->integer('total_barang')->nullable();
            $table->integer('harga_barang')->nullable();
            $table->enum('status_barang',['tersedia','habis'])->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('master_barang');
    }
}
