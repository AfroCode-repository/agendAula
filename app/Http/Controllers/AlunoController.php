<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Traits\SystemTrait; //essa variavel chama um conjunto de funções usadas diversas vezes, usando trait ela não limita certas funcionalidades de herença
use App\Models\Aluno;
use App\Models\Aluno_responsaveis;
use Illuminate\Support\Facades\DB;
class AlunoController extends Controller
{
    use SystemTrait;

    public function showFiltroCalendarioAluno(Request $request){

            $page = 'show.home'; // pagina a ser mostrada e traduzida
            $data = $this->varDefault($page);
            $data['title_page'] = 'Bem vindo ao Sistema AgendAula';

            if($request->id){
                $id = $request->id;
                $filtroID = " where a.id = $id";
            }else{
                $filtroID = "";
            }


            $data['status_scheduling'] = DB::table('sys_status AS s')
                                        ->select('s.cod_status',
                                                's.description as status_scheduling')
                                        ->where('s.tabela',DB::raw("'client_scheduling'"))
                                        ->where('s.field',DB::raw("'status_scheduling'"))
                                        ->whereIn('s.cod_status', [1,2,3,4,5,7])
                                        ->orderByRaw('s.cod_status ASC')
                                        ->get();

            $data["filtroNome"] = Aluno::select("name")->where("id",$id)->get();

            $data['agendamentos'] = DB::select("SELECT
                                                aa.id as `id_agendamento`,
                                                a.`name` as `nome`,
                                                DATE_FORMAT( ag.schedule_date, '%Y-%m-%d %H:%i:%s' ) AS `data_agendamento`,
                                                'bg-info' as `btnClass`
                                                from alunos a
                                                inner join aluno_agendamentos aa on aa.id_aluno = a.id and aa.`status` = 1
                                                inner join agendamentos ag on aa.id_agendamento = ag.id and ag.`status` = 1
                                                $filtroID;");
            return view('Home', $data);
    }//fim função

    public function storeNovoAluno(Request $request){
        $nome = $request->nome;
        $cor = $request->cor;
        $responsavel = $request->responsavel;
        $parentesco = $request->parentesco;

        $aluno = new Aluno;
        $aluno->name = $nome;
        $aluno->btnClass = $cor;
        $aluno->save();

        $this->verificaCRUD($aluno, "Erro ao Inserir dados");

        $aluno_Id = $aluno->id;

        $alunoResponsavel = new Aluno_responsaveis;
        $alunoResponsavel->id_responsavel = $responsavel;
        $alunoResponsavel->id_aluno = $aluno_Id;
        $alunoResponsavel->parentesco = $parentesco;

        $alunoResponsavel->save();

        $this->verificaCRUD($alunoResponsavel, "Erro ao Inserir dados");

        $data['success'] = true;
        $data['message'] = 'Dados Inseridos com Sucesso';
        DB::commit();
        echo json_encode($data);
        return;
    }//fim função

}
