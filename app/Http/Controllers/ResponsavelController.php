<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Traits\SystemTrait; //essa variavel chama um conjunto de funções usadas diversas vezes, usando trait ela não limita certas funcionalidades de herença
use App\Models\Responsavel;
use App\Models\Responsavel_enderecos;
use App\Models\Responsavel_fones;
use Illuminate\Support\Facades\DB;

class ResponsavelController extends Controller
{
    use SystemTrait;

    public function storeNovoResponsavel(Request $request){
        $nome = $request->Nome;
        $cep = $request->Cep;
        $endereco = $request->Endereco;
        $numero = $request->Numero;
        $complemento = $request->Complemento;
        $bairro = $request->Bairro;
        $cidade = $request->Cidade;
        $estado = $request->Estado;
        $telefone_1 = $request->Telefone_1;

        DB::beginTransaction();

        $responsavel = new Responsavel;
        $responsavel->nome = $nome;
        $responsavel->save();

        $this->verificaCRUD($responsavel, "Erro ao Inserir dados");

        $responsavel_inserted_Id = $responsavel->id;

        $responsavel_enderecos = new Responsavel_enderecos;
        $responsavel_enderecos->id_responsavel = $responsavel_inserted_Id;
        $responsavel_enderecos->endereco = $endereco;
        $responsavel_enderecos->numero = $numero;
        $responsavel_enderecos->complemento = $complemento;
        $responsavel_enderecos->bairro = $bairro;
        $responsavel_enderecos->cidade = $cidade;
        $responsavel_enderecos->uf = $estado;
        $responsavel_enderecos->cep = $cep;
        $responsavel_enderecos->save();

        $this->verificaCRUD($responsavel_enderecos, "Erro ao Inserir dados");

        $responsavel_fones = new Responsavel_fones;
        $responsavel_fones->id_responsavel = $responsavel_inserted_Id;
        $responsavel_fones->telefone = $telefone_1;
        $responsavel_fones->save();
        $this->verificaCRUD($responsavel_fones, "Erro ao Inserir dados");

        if(isset($request->Telefone_2)){
            $responsavel_fones = new Responsavel_fones;
            $responsavel_fones->id_responsavel = $responsavel_inserted_Id;
            $responsavel_fones->telefone = $request->Telefone_2;
            $responsavel_fones->save();
            $this->verificaCRUD($responsavel_fones, "Erro ao Inserir dados");
        }

        if(isset($request->Telefone_3)){
            $responsavel_fones = new Responsavel_fones;
            $responsavel_fones->id_responsavel = $responsavel_inserted_Id;
            $responsavel_fones->telefone = $request->Telefone_3;
            $responsavel_fones->save();
            $this->verificaCRUD($responsavel_fones, "Erro ao Inserir dados");
        }

        $data['success'] = true;
        $data['message'] = 'Dados Inseridos com Sucesso';
        DB::commit();
        echo json_encode($data);
        return;

    }//fim função

}
