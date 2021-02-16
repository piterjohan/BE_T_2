<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CustomClass\ErrorLog as errorlog;

use Validator;
use DB;
use Carbon\Carbon;

class SupplierController extends Controller
{
    public function addstock(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'idBarang' => 'required',
            'barangMasuk' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()], 400);
        }


        $getBarang = DB::table('master_barang')->where('id', $request->idBarang)->first();
        $oldTotal = $getBarang->total_barang;
        $totalNow = $oldTotal + $request->barangMasuk;

        if ($totalNow < 0){
            return response()->json(['info' => 'Barang '. $getBarang->nama_barang.' harap di restock dulu sebelum diambil'], 200);
        }
        // Begin Transaction
        DB::beginTransaction();
        
        try{
            // insert
            DB::table('trx-produk')->insert([
                'id_barang' => $request->idBarang,
                'barang_masuk' => $request->barangMasuk,
                'id_user' => 1,
                'created_at' => Carbon::now()
            ]);

            // update
            DB::table('master_barang')
            ->where('id', $request->idBarang)
            ->update([
                'total_barang' => $totalNow,
                'status_barang' => 'tersedia',
                'updated_at' => Carbon::now(),
            ]);
            // Commit Transaction
            DB::commit();
            DB::disconnect('trx-produk');
            DB::disconnect('master_barang');
            
            return response()->json(['info' => 'Data Success'], 200);
        }catch(\Throwable $th){
             // Rollback Transaction
            DB::rollback();
            errorlog::_inserterrorLog($th->getMessage(), "API SupplierController func addstock");
            return response()->json(['info' => 'Terjadi Kesalahan Pada Server'], 408);
        }
    }

    public function avgproducts(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'idProduct' => 'required',
        ]);

        $masterBarang = DB::table('laporan_master_barang')
        ->join('data_master_produk', 'laporan_master_barang.id_produk', 'data_master_produk.id_produk')
        ->select(
            'laporan_master_barang.id', 
            'laporan_master_barang.nama_barang', 
            'laporan_master_barang.total_barang', 
            'laporan_master_barang.harga_barang', 
            'laporan_master_barang.status_barang',
            'data_master_produk.nama_produk'
            )
        ->where('laporan_master_barang.id_produk', $request->idProduct)
        ->get();

        foreach ($masterBarang as $key => $value) {
            $stocks = DB::table('laporan_trx_produk')
            ->select(DB::raw('id_user,avg(barang_masuk) as avgBarangMasuk,id_barang'))
            ->where([
                ['id_barang', $value->id],
                ['id_user', 1],
            ])
            ->get();
            $value->trx_barang = $stocks;
        }

        return response()->json(['data' => $masterBarang ],200);
    }
}