<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use DB;

class StockController extends Controller
{
    public function getdata()
    {
        $stocks = DB::table('master_barang')
        ->join('master_produk', 'master_barang.id_produk', 'master_produk.id_produk')
        ->select('master_barang.*','master_produk.id_produk','master_produk.nama_produk')
        ->get();

        return response()->json(['data' => $stocks], 200);
    }

    public function monthlystocks(Request $request)
    {

        $validator = Validator::make($request->all(),[
            'tanggal' => 'required',
        ]);

        // get month
        $month = date("m",strtotime($request->tanggal));

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()], 400);
        }

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
        ->get();
        
        foreach ($masterBarang as $key => $value) {
            $stocks = DB::table('laporan_trx_produk')
            ->select(DB::raw('sum(barang_masuk) as barangMasuk, sum(barang_keluar) as barangKeluar, id_barang'))
            ->where('id_barang', $value->id)
            ->whereMonth('created_at', $month)
            ->get();
            $value->trx_barang = $stocks;
        }

        return response()->json(['data' => $masterBarang ],200);
    }

    
}
