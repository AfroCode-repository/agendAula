<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Traits\SystemTrait; //essa variavel chama um conjunto de funções usadas diversas vezes, usando trait ela não limita certas funcionalidades de herença
use Illuminate\Support\Facades\DB;

use App\Models\User;
use App\Models\Language;
use App\Models\SysGroup;

class HomeController extends Controller
{
    use SystemTrait;

    public function filtroAgendamento(Request $request){
        $dataInicio = ($request->dataInicio) ? trim($this->dateEmMysqlSemHora($request->dataInicio)) : date('Y-m-d') ;
        $datatermino = ($request->datatermino) ? trim($this->dateEmMysqlSemHora($request->datatermino)) : $dataInicio ;

        if (!$request->dataInicio) {
            $filtroData ="DATE_FORMAT(cs.schedule_date,'%Y-%m-%d') <= '$dataInicio'";
        } else {
            $filtroData ="DATE_FORMAT(cs.schedule_date,'%Y-%m-%d') between '$dataInicio' and '$datatermino'";
        }

        $table = DB::table('clients AS c')
                                    ->join('client_scheduling AS cs', function($join)
                                        {
                                            $join->on('cs.id_client', '=', 'c.id');
                                            $join->on('cs.status', '=', DB::raw("'1'"));
                                        })
                                    ->join('client_addresses as ca', function($join)
                                        {
                                            $join->on('ca.id_client', '=', 'cs.id_client_address');
                                        })
                                    ->leftJoin('client_service_scheduling as css', function($join)
                                        {
                                            $join->on('css.id_client_scheduling', '=', 'cs.id');
                                            $join->on('css.status', '=', DB::raw("'1'"));
                                        })
                                    ->join('sys_status AS ss', function($join)
                                        {
                                            $join->on('ss.cod_status', '=', 'cs.status_scheduling');
                                            $join->on('ss.field', '=', DB::raw("'status_scheduling'"));
                                            $join->on('ss.tabela', '=',DB::raw("'client_scheduling'"));
                                        })
                                    ->select('c.id as id',
                                            'c.name as name_cliente',
                                            'cs.schedule_date as data_agendamento',
                                            'cs.obs as obs',
                                            'cs.status',
                                            'ss.description as status_scheduling')
                                    ->selectRaw("format(SUM(css.price),2,'de_DE') as preco")
                                    ->selectRaw("concat(ca.address,', ',ca.city,', ',ca.state,', ',ca.postal_code ) as address")
                                    ->selectRaw("CASE WHEN DATE_FORMAT(cs.schedule_date, '%Y-%m-%d') < '".date('Y-m-d')."' THEN 0 ELSE	1 END as  'se_atrasado'")
                                    //->whereBetween(DB::raw("DATE_FORMAT(cs.schedule_date,'%Y-%m-%d')"), [$dataInicio, $datatermino])    # code...
                                    ->whereRaw(DB::raw($filtroData))
                                    ->whereNull('end_date')
                                    ->groupBy('cs.id')
                                    ->orderByRaw('cs.schedule_date DESC')
                                    ->get();

        if ($table->isEmpty()) {
            $data['success'] = 'semDados';
            $data['message'] = "Nenhum Registro Encontrado entre as datas $request->dataInicio e $request->datatermino";
            echo json_encode($data);
            return;
            exit();
        }

        if($table){
            $htmlTable = '';
            $htmlTable .= "<thead>
                                <th>#</th>
                                <th>Cliente</th>
                                <th>Data do agendamento ".$this->datePadraoText()."</th>
                                <th>Preço</th>
                                <th>Status Agendamento</th>
                                <th>Situação</th>
                                <th>Ação</th>
                            </thead>
                            <tbody>";
            foreach($table as $t){
                    $data_agendamento = $this->datePadrao($t->data_agendamento);
                    $htmlTable .= (0 == $t->se_atrasado) ? '<tr bgcolor="#fab1a0">' : '<tr>' ;
                    $htmlTable .= "<td>$t->id</td>";
                    $htmlTable .= "<td>$t->name_cliente</td>";
                    $htmlTable .= "<td>$data_agendamento</td>";
                    $htmlTable .= "<td>US$ $t->preco</td>";
                    $htmlTable .= "<td>$t->status_scheduling</td>";
                    $htmlTable .= (1 == $t->se_atrasado) ? "<td><i class='fas fa-check text-success'></i> ok</td>" : "<td><i class='fas fa-times text-danger'></i> Atrasado</td>" ;
                    $htmlTable .= "<td><a alt='$t->id' class='btn btn-success verDadosCliente'><i class='fab fa-searchengin'></i> Ver Cliente</a></td>";
                    $htmlTable .= "</tr>";


            }
            $htmlTable .= "</tbody>";

            $dicionarioTable = $this->dicionaryPages('language.dataTables');

            $languageDataTable='';
            foreach ($dicionarioTable as $dT) {
                $languageDataTable .= '{
                                            "order": [],
                                            "language":{
                                                "url": "'.env('APP_URL').'/'.$dT->text.'"
                                            }
                                        }';
            }

            $data['success'] = true;
            $data['table'] =  $htmlTable;
            $data['languageDataTable'] = $languageDataTable;
            echo json_encode($data);
            return;
        }else{
            $data['success'] = false;
            $data['message'] = 'Não foi possivel recuperar os dados de agendamentos';
            echo json_encode($data);
            return;
        }
    }//fim função

}//fim classe
