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

//route create da me
/**
 * Questa è una funzionalita molto interessante di laravel!!! Ti semplifica la vita
 * Cosa fa?
 *
 * Banalmente ti permette di creare una url (cioè creare un link) richiamabile dal browser.
 * Cioè stai creando una url come questa: http://localhost:<port>/public/progects
 *
 * Quando parliamo di URL stiamo parlando di protocollo HTTP.
 * Il protocollo HTTP è basato da richieste (request) e risposte (response)
 * Il protocollo HTTP si basa su un client (fa le request) ed un server (da le response)
 *
 * Fare una request vuol dire chiamare una URL (un link per intenderci).
 * Ad ogni request corrisponde una response
 *
 *
 * Quando sul browser scrivi un link nella barra in alto stai facendo una request.
 * Cioè che ti viene ritornano (cioè che vedi a video!) è la response.
 *
 * Chiamare una URL nel gergo HTTP significa accedere ad una risorsa.
 *
 * Però HTTP ti dice: se mi chiedi una risorsa (URL) devi anche dirmi il metodo (GET;POST;PUT;DELETE)
 *
 * Quando scrivi una URL nel browser stati richiedendo una risorsa tramite il metodo GET.
 * In questo caso il GET lo sta decidendo il browser. E' imlpementato cosi.
 *
 */
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

