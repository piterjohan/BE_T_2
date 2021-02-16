<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        //date
        $dt = Carbon::create(2020, 10, 01, 0);

        DB::table('users')->insert([
            ['nama_user' => Str::random(10),'status_user' => 'supplier', 'created_at' => Carbon::now()],
            ['nama_user' => Str::random(10),'status_user' => 'distributor', 'created_at' => Carbon::now()]
        ]);

         DB::table('master_produk')->insert([
                ['nama_produk' => 'Sabun','created_at' => $dt->addWeeks(1)],
                ['nama_produk' => 'Kursi','created_at' => $dt->addWeeks(1)],
        ]);

        for ($i=1; $i <= 5; $i++) { 
            if($i % 2 == 0){
                DB::table('master_barang')->insert([
                    ['id_produk' => 1, 'nama_barang' => Str::random(10), 'total_barang' => 0 ,'harga_barang' => abs(1000 * $i),'status_barang' => 'habis' ,'created_at' => $dt->addWeeks(1)],
                ]);
            }else{
                DB::table('master_barang')->insert([
                    ['id_produk' => 2, 'nama_barang' => Str::random(10), 'total_barang' => 0, 'harga_barang' => abs(1000 * $i) , 'status_barang' => 'habis', 'created_at' => $dt->addWeeks(1)],
                ]);
            }
        }
        
    }
}
