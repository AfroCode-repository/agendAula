<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\PagesController;
use Illuminate\Support\Facades\Route;

Route::get('/',[LoginController::class,'index'])->name('login');
//Route::get('/teste','Auth\TesteController@teste')->name('teste');
// existe uma rota no arquivo routes/Auth.php que faz nativamente no framework, porem estamos fazendo manual
Route::post('/Login',[LoginController::class,'login'])->name('realiza.login');

/*rotas que precisam de autenticação*/
Route::middleware(['auth'])->group(function () {
    Route::get('/home',[PagesController::class,'showHome'])->name('show.Home');

});//fim meddleware

require __DIR__.'/auth.php';
