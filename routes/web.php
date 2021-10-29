<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\AlunoController;
use App\Http\Controllers\ResponsavelController;
use Illuminate\Support\Facades\Route;

Route::get('/',[LoginController::class,'index'])->name('login');
//Route::get('/teste','Auth\TesteController@teste')->name('teste');
// existe uma rota no arquivo routes/Auth.php que faz nativamente no framework, porem estamos fazendo manual
Route::post('/Login',[LoginController::class,'login'])->name('realiza.login');

/*rotas que precisam de autenticação*/
Route::middleware(['auth'])->group(function () {
    Route::get('/home',[PagesController::class,'showHome'])->name('show.Home');
    Route::get('/home/{id}',[AlunoController::class,'showFiltroCalendarioAluno'])->name('show.Calendario.aluno');

    Route::get('/novoResponsavel',[PagesController::class,'showNovoResponsavel'])->name('show.novo.responsavel');
    Route::post('/novoResponsavel',[ResponsavelController::class,'storeNovoResponsavel'])->name('salvar.novo.responsavel');

    Route::get('/novoAluno',[PagesController::class,'showNovoAluno'])->name('show.novo.aluno');
    Route::post('/novoAluno',[AlunoController::class,'storeNovoAluno'])->name('salvar.novo.aluno');

    Route::get('/dadosResponsavel/{id}',[PagesController::class,'showDadosResponsavel'])->name('show.dados.responsavel');
    Route::get('/dadosAluno/{id}',[PagesController::class,'showDadosAluno'])->name('show.dados.Aluno');

    Route::post('/pesquisaEndereco',[PagesController::class,'pesquisaEndereco'])->name('pesquisa.endereco');


});//fim meddleware

require __DIR__.'/auth.php';
