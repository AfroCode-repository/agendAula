<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Traits\SystemTrait;
use App\Models\ClientAddress;
use App\Models\ClientService;

class CalendarController extends Controller{

    use SystemTrait;

    public function dadosClienteNovoAgendamento(Request $request){
        $enderecos = ClientAddress::select(DB::raw("id,area_manager,concat(address,', ',city,', ',state,', ',postal_code ) as address,created_at,status"))
        ->where('id_client',$request->id)
        ->where('status',1)
        ->get();

        $servicos = ClientService::join('services','client_services.id_service','=','services.id')
        ->where('id_client',$request->id)->where('client_services.status',1)->get();

        $htmlEndereco = "<option value='' >Selecione uma opção</option>";

        foreach($enderecos as $e){
            $htmlEndereco .="<option value='$e->id' >Area manager: $e->area_manager - $e->address</option>";
        }

        $htmlService = "<option value='' >Selecione uma opção</option>";

        foreach($servicos as $s){
            $htmlService .="<option value='$s->id' >$s->name</option>";
        }

        $data['success'] = true;
        $data['htmlEndereco'] =$htmlEndereco;
        $data['htmlService'] =$htmlService;
        echo json_encode($data);
        return;
        exit();
    }
}
