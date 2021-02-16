<?php

namespace App\CustomClass;

use Illuminate\Http\Request;
use Carbon\Carbon;
use DB;

class ErrorLog 
{
    public static function _inserterrorLog($errorSql, $keterangan) 
    {
        DB::table('error_log')->insert([
                'error_sql' => $errorSql,
                'keterangan' => $keterangan,
                'created_at' => Carbon::now(),
        ]);
        DB::disconnect('error_log');
    }
    
}
