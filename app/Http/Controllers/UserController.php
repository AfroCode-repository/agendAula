<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use App\Models\UserCompany;

use App\Http\Traits\SystemTrait;

class UserController extends Controller
{
    use SystemTrait;

    public function createUser(Request $request){
        $verificaEmail = User::where('email', $request->email)->get();
        $valida = false;

        if(!$verificaEmail->isEmpty()){
            $data['success'] = false;
            $data['message'] = "O $request->email Email pertence a outro usuário!";
            echo json_encode($data);
            return;
            exit();
        }

        $companies = explode(",",$request->company);
        $qtd_companies = count($companies);

        if('true' == $request->passwordDefault){
            $user = new User;
            $user->id_group = $request->group;
            $user->id_language = 2;
            $user->id_company = 0;
            $user->name = trim($request->name);
            $user->email = trim($request->email);
            $user->password = Hash::make('SYSC#1234');
            $user->status = 2;
            $user->save();

            $this->verificaCRUD($user,'Erro ao Inserir Dados');
            $this->addLogUpdates($user->id,'users','id',$user->id,'','INSERT','Cadastro novo Usuário');

            $user_id = $user->id;

            for($i = 0;$i < $qtd_companies;$i++){
                $userCompany = new UserCompany;
                $userCompany->id_user = $user_id;
                $userCompany->id_company = $companies[$i];
                $userCompany->save();

                $this->verificaCRUD($userCompany,'Erro ao Inserir Dados');
                $this->addLogUpdates($userCompany->id,'user_companies','id',$userCompany->id,'','INSERT','Cadastro novo Usuário compania');
            }

            $valida = true;

        }else{
            if(strlen($request->password) < 8){
                $data['success'] = false;
                $data['message'] = 'A senha deve conter pelo menos 8 digitos!';
                echo json_encode($data);
                return;
                exit();
            }else if($request->password != $request->confirmPassword){
                $data['success'] = false;
                $data['message'] = 'Senhas não Batem, por favor revise!';
                echo json_encode($data);
                return;
                exit();
            }else{
                $user = new User;
                $user->id_group = $request->group;
                $user->id_language = 2;
                $user->id_company = 0;
                $user->name = $request->name;
                $user->email = $request->email;
                $user->password = Hash::make($request->password);
                $user->save();

                $this->verificaCRUD($user,'Erro ao Inserir Dados');
                $this->addLogUpdates($user->id,'users','id',$user->id,'','INSERT','Cadastro novo Usuário');

                $user_id = $user->id;

                for($i = 0;$i < $qtd_companies;$i++){
                    $userCompany = new UserCompany;
                    $userCompany->id_user = $user_id;
                    $userCompany->id_company = $companies[$i];
                    $userCompany->save();

                    $this->verificaCRUD($userCompany,'Erro ao Inserir Dados');
                    $this->addLogUpdates($userCompany->id,'user_companies','id',$userCompany->id,'','INSERT','Cadastro novo Usuário compania');
                }
            $valida = true;

            }
        }

        if(false === $valida){
            $data['success'] = false;
            $data['message'] = 'Erro ao Inserir dados usuário!';
            DB::rollBack();
        }else{
            $data['success'] = true;
            $data['message'] = 'Usuário Inseridos com Sucesso';
            DB::commit();
            echo json_encode($data);
            return;
        }
    }//fim função

    public function updatePassword(Request $request){

        if($request->id){ //caso existe é porque quem está atualizando é o Admin
            $id_user = $request->id;
        }else{//caso contratio é o proprio usuario que solicitou a alteração
            $id_user = Auth::user()->id;
        }

        if ($request->password != $request->confirmPassword) {

            $data['success'] = false;
            $data['message'] = 'Senhas não Batem, por favor confirme!';
            echo json_encode($data);
            return;
            exit();

        } else {
            DB::beginTransaction();
                $user = User::find($id_user);
                $_user_password = $user->password;
                $obs = '';

            if($id_user == Auth::user()->id){
                if (Hash::check($request->oldPassword, $_user_password)) {
                    if(strlen($request->password) < 8){
                        $data['success'] = false;
                        $data['message'] = 'A nova senha deve conter pelo menos 8 digitos!';
                        echo json_encode($data);
                        return;
                        exit();
                    }else if(Hash::check($request->oldPassword, $request->password)){
                        $data['success'] = false;
                        $data['message'] = 'A nova senha informada é Igual a Atual!';
                        echo json_encode($data);
                        return;
                        exit();
                    }else{
                        $user->password = Hash::make($request->password);
                        $_novaSenha = $user->password;//variavel para criação do log
                        if(2 == $user->status){
                            $user->status = 1;
                            $this->addLogUpdates($user->id,'users','status',1,2,'UPDATE','Ativado pela troca de senha padrão pelo proprio usuário');
                        }
                        $user->save();
                        $obs = 'Senha Atualizada pelo Proprio Usuario';
                    }
                }else{
                    $data['success'] = false;
                    $data['message'] = 'Senha Atual Invalida!';
                    DB::rollBack();
                    echo json_encode($data);
                    return;
                }
            }else if(Auth::user()->id_group < 3){
                    if(strlen($request->password) < 8){
                        $data['success'] = false;
                        $data['message'] = 'A nova senha deve conter pelo menos 8 digitos!';
                        echo json_encode($data);
                        return;
                        exit();
                    }else{
                        $user->password = Hash::make($request->password);
                        $_novaSenha = $user->password;
                        if(2 == $user->status){
                            $user->status = 1;
                            $this->addLogUpdates($user->id,'users','status',1,2,'UPDATE','Ativado pela troca de senha padrão pelo Admin');
                        }
                        $user->save();
                        $obs = 'Senha Atualizada pelo Admin';
                    }
            }else{
                $data['success'] = false;
                $data['message'] = 'Erro ao tentar atualizar senha!';
                DB::rollBack();
                echo json_encode($data);
                return;
            }//fim else

            $validaCRUD = $this->verificaCRUD($user,'Erro ao Atualizar Dados');
            $validaLog = $this->addLogUpdates($user->id,'users','password',$_novaSenha,$_user_password,'UPDATE',$obs);

            if(false === $validaCRUD || false === $validaLog){
                $data['success'] = false;
                $data['message'] = 'Erro ao Inserir dados usuário!';
                DB::rollBack();
            }else{
                $data['success'] = true;
                $data['message'] = 'Senha Atualizada com sucesso';
                DB::commit();
                echo json_encode($data);
                return;
            }
        }//fim else
    }//fim função

    public function resetPassword(Request $request){
        $passwordDefault = 'SYSC#1234';
        DB::beginTransaction();
            $user = User::find($request->id);
            $_user_password = $user->password;

        if(Auth::user()->id_group < 3){
            $user->password = Hash::make($passwordDefault);
            $user->status = 2;
            $user->save();

            $validaCRUD = $this->verificaCRUD($user,'Erro ao Atualizar Dados');
            $validaLog = $this->addLogUpdates($user->id,'users','password',$passwordDefault,$_user_password,'UPDATE','Senha resetada pelo Admin');

            if(false === $validaCRUD || false === $validaLog){
                $data['success'] = false;
                $data['message'] = 'Erro ao Resetar a Senha do usuário!';
                DB::rollBack();
            }else{
                $data['success'] = true;
                $data['message'] = 'Senha resetada com Sucesso: SYSC#1234';
                DB::commit();
                echo json_encode($data);
                return;
            }
        }else{
            $data['success'] = false;
            $data['message'] = 'Você não tem Permissão para realizar essa Ação!';
            DB::rollBack();
            echo json_encode($data);
            return;
        }
    }

    public function recuperaDadosUsuario(Request $request){
        $user = User::where('id',$request->id)->get();

        if($user->isEmpty()){
            $data['success'] = false;
            $data['message'] = "Erro ao recuperar os dados do usuário!";
            echo json_encode($data);
            return;
            exit();
        }

        foreach ($user as $u) {
            $id = $u->id;
            $group = $u->id_group;
            $name = $u->name;
            $email = $u->email;
        }

        $data['success'] = true;
        $data['id'] = $id;
        $data['group'] = $group;
        $data['name'] = $name;
        $data['email'] = $email;

        echo json_encode($data);
        return;
        exit();
    }

    public function updateUser(Request $request){

        if($request->id){
            $id = $request->id;
        }else{
            $id = Auth::user()->id;
        }

        $nameAlterar = trim($request->nameAlterar);
        $emailAlterar = trim($request->emailAlterar);

        if($request->groupAlterar){
            $groupAlterar = $request->groupAlterar; //seta apenas se foi alterado pelo adm
        }else{ //caso contrario ele seta false pois quando é alterado pele proprio usuario ele não manda id grupo
            $groupAlterar = false;
        }

        DB::beginTransaction();
        $user = User::find($id);

        if(!$user){
            $data['success'] = false;
            $data['message'] = "Erro ao recuperar os dados do usuário!";
            echo json_encode($data);
            return;
            exit();
        }

        //verifica se email existe em outro usuario
        $VerificaEmail = User::where('id',"!=",$id)->where('email',$emailAlterar)->get();

        $_VerificaEmail = (count($VerificaEmail) > 0) ? true : false ;

        if(true == $_VerificaEmail){
            $data['success'] = false;
            $data['message'] = "O $emailAlterar Email pertence a outro usuário!";
            echo json_encode($data);
            return;
            exit();
        }

        //verifica mudanças
        if($nameAlterar == $user->name && $emailAlterar == $user->email && ($groupAlterar == $user->id_group || false === $groupAlterar)){
            $data['success'] = false;
            $data['message'] = "Não houve mudanças!";
            echo json_encode($data);
            return;
            exit();
        }else{
            if($nameAlterar != $user->name){
                $this->addLogUpdates($user->id,'users','name',$nameAlterar,$user->name,'UPDATE','Alteração de nome de usuario');
                $user->name = $nameAlterar;
            }

            if($emailAlterar != $user->email){
                $this->addLogUpdates($user->id,'users','email',$emailAlterar,$user->email,'UPDATE','Alteração de email de usuario');
                $user->email = $emailAlterar;
            }

            if(false != $groupAlterar){
                if($groupAlterar != $user->id_group){
                    $this->addLogUpdates($user->id,'users','id_group',$groupAlterar,$user->id_group,'UPDATE','Alteração de Grupo de usuario');
                    $user->id_group = $groupAlterar;
                }
            }

            $user->save();

            $validaCRUD = $this->verificaCRUD($user,'Erro ao Atualizar Dados');

            if(false === $validaCRUD){
                $data['success'] = false;
                $data['message'] = 'Erro ao Resetar a Senha do usuário!';
                DB::rollBack();
            }else{
                $data['success'] = true;
                $data['message'] = 'Usuário atualizado com sucesso';
                DB::commit();
                echo json_encode($data);
                return;
            }
        }

    }//fim função

    public function mudarStatusUser(Request $request){
        $status = 0;
        $text = '';

        if("A" == $request->tipo){
            $status = 1;
            $text = 'Ativado';
        }else if("E" == $request->tipo){
            $status = 0;
            $text = 'Excluido';
        }else if("R" == $request->tipo){
            $status = 1;
            $text = 'Reativado';
        }else{
            $data['success'] = false;
            $data['message'] = 'Erro ao mudar o status do usuário!';
            echo json_encode($data);
            return;
        }

        DB::beginTransaction();
        $user = User::find($request->id);

        $this->addLogUpdates($user->id,'users','status',$status,$user->status,'UPDATE',"Usuario $text");

        $user->status = $status;
        $user->save();

        $validaCRUD = $this->verificaCRUD($user,'Erro ao Atualizar Dados');

        if(false === $validaCRUD){
            $data['success'] = false;
            $data['message'] = 'Erro ao Mudar o status do usuário!';
            DB::rollBack();
        }else{
            $data['success'] = true;
            $data['message'] = "Usuário $text com Sucesso!";
            DB::commit();
            echo json_encode($data);
            return;
        }

    }  //fim função

    public function recuperaTabelaListaDadosUsuario(){
        $_id_user = Auth::user()->id;
        $_id_group = Auth::user()->id_group;

        $listaUsuarios = DB::select("SELECT
                                            u.id,
                                            u.name,
                                            u.email,
                                            GROUP_CONCAT(DISTINCT c.name SEPARATOR ', ') as 'company',
                                            u.status
                                            from users as u
                                            inner join user_companies as uc on u.id = uc.id_user and uc.status = 1
                                            inner join companies as c on c.id = uc.id_company
                                            where c.id in (select uc.id_company from user_companies as uc
                                            inner join users as u on u.id = uc.id_user and uc.status = 1
                                            where u.id = $_id_user) and u.id_group >= $_id_group
                                            group by u.id
                                            order by u.name;");
        if(count($listaUsuarios)<=0){
            $data['success'] = false;
            $data['message'] = "Erro ao recuperar a tabela!";
            echo json_encode($data);
            return;
        }

        $htmlTable = '';

        $htmlTable .= '<thead>';
        $htmlTable .= '<tr>';
        $htmlTable .= '<th>Name</th>';
        $htmlTable .= '<th>Email</th>';
        $htmlTable .= '<th>Companias</th>';
        $htmlTable .= '<th>Status</th>';
        $htmlTable .= '<th>Ação</th>';
        $htmlTable .= '</tr>';
        $htmlTable .= '</thead>';

        $htmlTable .= '<tbody>';

        foreach ($listaUsuarios as $lu) {
            if (Auth::user()->id == $lu->id){
                $htmlTable .= '<tr bgcolor="#48dbfb">';
            }else{
                $htmlTable .= '<tr>';
            }

            $htmlTable .= "<td>$lu->name</td>";
            $htmlTable .= "<td>$lu->email</td>";
            $htmlTable .= "<td>$lu->company</td>";

            if (Auth::user()->id == $lu->id){
                $htmlTable .= '<td><i class="fas fa-child text-success"></i> Você mesmo</td>';
                $htmlTable .= '<td>Sem Ação</td>';
            }else{
                if (1 == $lu->status){
                    $htmlTable .= "<td><i class='fas fa-check text-success'></i> Ativo</td>";
                    $htmlTable .= "<td>";
                    $htmlTable .= "<button type='button' value='$lu->id' class='btn btn-info editarUsuario'><i class='fas fa-user-edit'></i> Editar</button>";
                    $htmlTable .= "<button type='button' value='$lu->id' alt='E' class='btn btn-danger mudarStatusUsuario'><i class='far fa-trash-alt'></i> Excluir</button>";
                }else if (2 == $lu->status){
                    $htmlTable .= "<td><i class='fas fa-exclamation text-warning'></i> Trocar Senha Padrao</td>";
                    $htmlTable .= "<td>";
                    $htmlTable .= "<button type='button' value='$lu->id' class='btn btn-info editarUsuario'><i class='fas fa-user-edit'></i> Editar</button>";
                    $htmlTable .= "<button type='button' value='$lu->id' alt='A' class='btn btn-secondary mudarStatusUsuario'><i class='fas fa-clipboard-check'></i> Ativar</button>";
                }else{
                    $htmlTable .= "<td><i class='fas fa-times text-danger'></i> Excluido</td>";
                    $htmlTable .= "<td>";
                    $htmlTable .= "<button type='button' value='$lu->id' alt='R' class='btn btn-success mudarStatusUsuario'><i class='fas fa-recycle'></i> Reativar</button>";
                }
                $htmlTable .= "</td>";
            }
            $htmlTable .= "</tr>";
        }

        $htmlTable .= '</tbody>';

        $data['success'] = true;
        $data['tbListaUser'] = $htmlTable;
        echo json_encode($data);
        return;
    }//fim função

}
