<?php

use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('pages.auth.login');
});

Route::get('/home', function () {
    return view('pages.dashboard');
});



Route::resource('user', UserController::class);
Route::resource('company', CompanyController::class);
Route::resource('attendance', AttendanceController::class);
Route::resource('permission', PermissionController::class);

// Route::get('/login', function () {
//     return view('pages.auth.login', ['type_menu' => 'dashboard']);
// });

// Route::get('/register', function () {
//     return view('pages.auth.register', ['type_menu' => 'dashboard']);
// });