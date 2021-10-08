<?php

/**********************************************************************************************
 *                                      !IMPORTANTE                                         ***
 * esse controlador controla todas e apenas a exibições das paginas e variaveis de dicionario *
 **********************************************************************************************/

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Traits\SystemTrait; //essa variavel chama um conjunto de funções usadas diversas vezes, usando trait ela não limita certas funcionalidades de herença
use Illuminate\Support\Facades\DB;

use App\Models\User;


class PagesController extends Controller
{
    use SystemTrait;//essa variavel chama um conjunto de funções usadas diversas vezes, usando trait ela não limita certas funcionalidades de herença ex: $this->varDefault($page);

    public function showHome(){
        $page = 'show.home'; // pagina a ser mostrada e traduzida
        $data = $this->varDefault($page);
        $data['title_page'] = 'Bem vindo ao Sistema AgendAula';


        $data['status_scheduling'] = DB::table('sys_status AS s')
                                    ->select('s.cod_status',
                                            's.description as status_scheduling')
                                    ->where('s.tabela',DB::raw("'client_scheduling'"))
                                    ->where('s.field',DB::raw("'status_scheduling'"))
                                    ->whereIn('s.cod_status', [1,2,3,4,5,7])
                                    ->orderByRaw('s.cod_status ASC')
                                    ->get();

        $date_agendamentos = date('Y-m-d');

        $data['agendamentos'] = DB::select("SELECT
                                            aa.id as `id_agendamento`,
                                            a.`name` as `nome`,
                                            DATE_FORMAT( ag.schedule_date, '%Y-%m-%d %H:%i:%s' ) AS `data_agendamento`,
                                            CASE
                                                WHEN (a.id = 4) THEN 'bg-warning'
                                                else 'bg-info'
                                            END as `btnClass`
                                            from alunos a
                                            inner join aluno_agendamentos aa on aa.id_aluno = a.id and aa.`status` = 1
                                            inner join agendamentos ag on aa.id_agendamento = ag.id and ag.`status` = 1;");
        return view('Home', $data);
    }
}//fim classe
