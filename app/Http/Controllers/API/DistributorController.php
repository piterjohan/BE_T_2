<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CustomClass\ErrorLog as errorlog;

use Validator;
use DB;
use Carbon\Carbon;

class DistributorController extends Controller
{
    public function minstock(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'idBarang' => 'required',
            'barangKeluar' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()], 400);
        }


        $getBarang = DB::table('master_barang')->where('id', $request->idBarang)->first();
        $oldTotal = $getBarang->total_barang;
        $totalNow = $oldTotal - $request->barangKeluar;

        if ($totalNow < 0){
            return response()->json(['info' => 'Barang '. $getBarang->nama_barang.' harap di restock dulu sebelum diambil'], 200);
        }
        // Begin Transaction
        DB::beginTransaction();
        
        try{
            // insert
            DB::table('trx-produk')->insert([
                'id_barang' => $request->idBarang,
                'barang_keluar' => $request->barangKeluar,
                'id_user' => 2,
                'created_at' => Carbon::now(),
            ]);

            // update
            DB::table('master_barang')
            ->where('id', $request->idBarang)
            ->update([
                'total_barang' => $totalNow,
                'status_barang' => ($totalNow == 0) ? 'habis' : 'tersedia',
                'updated_at' => Carbon::now(),
            ]);
            // Commit Transaction
            DB::commit();
            DB::disconnect('trx-produk');
            DB::disconnect('master_barang');
            
            return response()->json(['info' => 'Barang Sukses diambil'], 200);
        }catch(\Throwable $th){
             // Rollback Transaction
            DB::rollback();
            errorlog::_inserterrorLog($th->getMessage(), "API DistributorController func minstock");
            return response()->json(['info' => 'Terjadi Kesalahan Pada Server'], 408);
        }




    }
}
