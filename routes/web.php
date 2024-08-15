<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

route::get('/{pathMatch}', function(){

    return view('welcome');
})->where('pathMatch',".*") ;
