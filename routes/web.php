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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/', 'HomeController@index');

Route::get('perfil', 'PerfilController@index');
Route::get('perfil/edit', 'PerfilController@edit');
Route::put('perfil/edit', 'PerfilController@update');

Route::get('usuarios', 'UsuariosController@index');
Route::get('usuarios/create', 'UsuariosController@create');
Route::post('usuarios/create', 'UsuariosController@post');
Route::get('usuarios/{obj}/edit', 'UsuariosController@edit')->name('usuarios.edit');
Route::put('usuarios/{obj}/edit', 'UsuariosController@update')->name('usuarios.edit.put');

//Cargar datos
Route::get('cargarDatos', 'CargarDatosController@index')->name('cargar.datos');
Route::get('cargarDatos/nuevo', 'CargarDatosController@nuevo');
Route::post('cargarDatos/nuevo', 'CargarDatosController@cargar');
Route::delete('cargarDatos/nuevo/{obj}', 'CargarDatosController@eliminar')->name('cargar.datos.borrar');


//Consultar cohortes
Route::get('consultarCohortes', 'ConsultarCohortesController@index')->name('consultar.cohortes');
Route::get('consultarCohortes/ver/{periodo}', 'ConsultarCohortesController@ver')->name('consultar.cohortes.ver');

//Comparar Cohortes
Route::get('compararCohortes', 'CompararCohortesController@index')->name('comparar.cohortes');