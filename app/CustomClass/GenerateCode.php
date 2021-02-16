<?php

namespace App\CustomClass;

use Illuminate\Http\Request;
use DB;

class GenerateCode
{
    public static function _randomNumber() {
        $integer = random_int(1, 999999999999999);
        return $integer;
    }

    public static function _randomCodeHex() {
        $bytes = random_bytes(4);
        return  bin2hex($bytes);
    }
}
