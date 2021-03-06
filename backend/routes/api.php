<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Article;
use App\Http\Controllers\ArticleController;
use App\Http\Resources\ArticleResource;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ShoppingCartController;
use App\Http\Resources\ShoppingCartResource;
use App\Models\ShoppingCart;

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

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
    Route::put('/article/{id}',[ArticleController::class,'update']);
    Route::delete('/article/{id}',[ArticleController::class,'destroy']);
});

Route::put('/user/{id}',[Controller::class,'update']);

Route::delete('/user/{id}',[Controller::class,'destroy']);

Route::get('/article/{id}',function($id){
    return new ArticleResource(Article::findOrFail($id));
});
Route::get('/articles',function(){
    return ArticleResource::collection(Article::all());
});

Route::put('/article/{id}',[ArticleController::class,'update']);

Route::delete('/article/{id}',[ArticleController::class,'destroy']);

Route::post('/articles',[ArticleController::class,'store']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/shoppingcart/{id}',function($id){
    return new ShoppingCartResource(ShoppingCart::findOrFail($id));
});
Route::get('/shoppingcarts',function(){
    return ShoppingCartResource::collection(ShoppingCart::all());
});

Route::put('/shoppingcart/{id}',[ShoppingCartController::class,'update']);

Route::delete('/shoppingcart/{id}',[ShoppingCartController::class,'destroy']);

Route::post('/shoppingcart',[ShoppingCartController::class,'store']);

Route::get('send/email', [App\Http\Controllers\HomeController::class, 'mail'])->name('email');
