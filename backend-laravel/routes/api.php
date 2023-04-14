<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::apiResource('menu', \App\Http\Controllers\MenuItemController::class);
Route::apiResource('slider', \App\Http\Controllers\SliderElementController::class);
Route::apiResource('posts', \App\Http\Controllers\PostController::class);
Route::apiResource('dashboard_elements', \App\Http\Controllers\DashboardElementController::class);
