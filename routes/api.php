<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Get Stock item
Route::get('v1/stocks', 'API\StockController@getdata');
// Post
Route::post('v1/min-stock-distributor', 'API\DistributorController@minstock');
// Supplier
Route::post('v1/add-stock-supplier', 'API\SupplierController@addstock');
Route::post('v1/avg-products','API\SupplierController@avgproducts');
// check Stock
Route::post('v1/monthly-report','API\StockController@monthlystocks');


