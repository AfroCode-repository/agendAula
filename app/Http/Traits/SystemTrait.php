<?php

namespace App\Http\Traits;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\SysLogUpdate;
use App\Models\Aluno;

trait SystemTrait {
    //variaveis do sistema para todos os controladores
    public function varDefault(){
        $data['listaAlunos'] = Aluno::where('status', 1)->get();
        return $data;
    }//fim função

    public function verificaCRUD($tabela, $msgSeErro){
        if(true != $tabela){
            $data['success'] = false;
            $data['message'] = $msgSeErro;
            DB::rollBack();
            echo json_encode($data);
            return;
            exit();
        }else{
            return true;
        }
    }//fim função

    public static function dateEmMysqlReverse($dateSql){
        $ano= trim(substr($dateSql, 0,4));
        $mes= substr($dateSql, 5,2);
        $dia= substr($dateSql, 8,2);
        return $dia."/".$mes."/".$ano;
    }//fim função

    public function dateEmMysql($dateSql, $padrao = null){
        $ano= trim(substr($dateSql, 6,4));
        $mes= substr($dateSql, 3,2);
        $dia= substr($dateSql, 0,2);
        $hora= substr($dateSql, 11,2);
        $minuto= substr($dateSql, 14,2);
        return $ano."-".$mes."-".$dia." ".$hora.":".$minuto.":00";
    }//fim função

    public function dateEmMysqlSemHora($dateSql){
        $ano= trim(substr($dateSql, 6,4));
        $mes= substr($dateSql, 3,2);
        $dia= substr($dateSql, 0,2);
        return $ano."-".$mes."-".$dia;
    }//fim função

    public static function datePadrao($date){
        $language = Auth::user()->id_language;
        return date('d-m-Y H:i:s',strtotime($date));
    }//fim função

    public static function dateAtual(){
        $language = Auth::user()->id_language;
        return date('d-m-Y');
    }//fim função

    public static function mesTextoPorPais($m){
        $language = Auth::user()->id_language;
        $months = array (1=>'Jan',2=>'Fev',3=>'Mar',4=>'Abr',5=>'Mai',6=>'Jun',7=>'Jul',8=>'Ago',9=>'Set',10=>'Out',11=>'Nov',12=>'Dez');
        return $months[(int)$m];
    }//fim função


    public function addLogUpdates($id_tabela,$table_name,$field,$new_value,$old_value,$action,$obs){

        $log = new SysLogUpdate;
        $log->id_user = Auth::user()->id;
        $log->id_tabela = $id_tabela;
        $log->table_name = $table_name;
        $log->field = $field;
        $log->new_value = $new_value;
        $log->old_value = $old_value;
        $log->action = $action;
        $log->obs = $obs;
        $log->save();

        $validaLog = $this->verificaCRUD($log, "Erro Inesperado ao Inserir dados!");

        return $validaLog;
    }//fim função

    public function validaSeCompanyAtribuida($id_company){
        if(0 == Auth::user()->id_company){
            $data['success'] = false;
            $data['message'] = 'Não Possui uma atribuição valida!';
            echo json_encode($data);
            return;
            exit();
        }else if($id_company != Auth::user()->id_company){
            $data['success'] = false;
            $data['message'] = 'Sua atribuição mudou, por favor atualize a pagina';
            return;
            exit();
        }else {
            return $id_company;
        }
    }
}//fim classe

