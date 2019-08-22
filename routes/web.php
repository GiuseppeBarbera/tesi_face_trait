<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


//Route::resource('projects', 'ProjectController');
Route::get('projects/create', 'ProjectController@create')->name('create');
Route::get('projects', 'ProjectController@index')->name('projects')->middleware('auth');
Route::post('projects/store', 'ProjectController@store')->middleware('auth');
Route::get('projects/{id}/delete', 'ProjectController@delete')->middleware('auth');
Route::get('projects/{id}/editor', 'ProjectController@editor')->middleware('auth');
Route::post('projects/{id}/upload/{type}', 'ProjectController@uploadImage')->middleware('auth');


//AJAX
Route::get('morphology/{id}', 'ProjectController@getMorphologies')->middleware('auth');
Route::get('projects/{id}/metadata/{type}', 'ProjectController@getMetadata')->middleware('auth');
Route::post('projects/{id}/save/{type}', 'ProjectController@saveMetadata')->middleware('auth');


Route::get('addMorphology', 'ProjectController@myScript');

Route::get('testScript','ProjectController@myScript');
