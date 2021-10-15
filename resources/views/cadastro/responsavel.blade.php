@extends('layouts.dashTemplate.master')
@section('content')

@section('CssPersonalizado')
@endsection

@section('JsPersonalizado')

<script src="{{ asset('js/vendor/fullcalendar.min.js') }}"></script>
<script>
    function validPhone (phone) {
        var regex = new RegExp('^\\([0-9]{2}\\)(([2-4][0-9]{3}-[0-9]{4})|(9[0-9]{3}-[0-9]{5}))$');
        return regex.test(phone);
    }

    $(document).ready(function() {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        $("#Cep").change(function(){
            bloquear()
            $.ajax({
                    url: "{{ Route('pesquisa.endereco') }}",
                    type: 'POST',
                    data: {cep:$("#Cep").val(),"_token": "{{ csrf_token() }}",},
                    dataType: 'json',
                    success: function(response){
                        if(true == response.success){
                                    $("#Endereco").val(response.Endereco)
                                    $("#Complemento").val(response.Complemento)
                                    $("#Bairro").val(response.Bairro)
                                    $("#Cidade").val(response.Cidade)
                                    $("#Estado").val(response.Estado)
                            desbloquear()
                        }else{
                            $("#Endereco").val('')
                            $("#Complemento").val('')
                            $("#Bairro").val('')
                            $("#Cidade").val('')
                            $("#Estado").val('')
                            desbloquear()
                        }
                    }
                });//fim ajax
        })

        $('#salvar').click(function (){
            bloquear()

            let Nome = $("#Nome").val()
            let Cep = $("#Cep").val()
            let Endereco = $("#Endereco").val()
            let Numero = $("#Numero").val()
            let Complemento = $("#Complemento").val()
            let Bairro = $("#Bairro").val()
            let Cidade = $("#Cidade").val()
            let Estado = $("#Estado").val()
            let Telefone_1 = $("#Telefone_1").val()
            let Telefone_2 = $("#Telefone_2").val()
            let Telefone_3 = $("#Telefone_3").val()

            $("#Nome").removeClass('is-invalid')
            $("#Cep").removeClass('is-invalid')
            $("#Endereco").removeClass('is-invalid')
            $("#Numero").removeClass('is-invalid')
            $("#Complemento").removeClass('is-invalid')
            $("#Bairro").removeClass('is-invalid')
            $("#Cidade").removeClass('is-invalid')
            $("#Estado").removeClass('is-invalid')
            $("#Telefone_1").removeClass('is-invalid')


            if(!Nome){
                desbloquear()
                $("#Nome").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Nome do Responsável!','warning')
            }else if(!Cep){
                desbloquear()
                $("#Cep").addClass('is-invalid')
                Swal.fire('Atenção!','Informe CEP do Responsável!','warning')
            }else if(!Endereco){
                desbloquear()
                $("#Endereco").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Endereco do Responsável!','warning')
            }else if(!Numero){
                desbloquear()
                $("#Numero").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Número do endereço do Responsável!','warning')
            }else if(!Bairro){
                desbloquear()
                $("#Bairro").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Bairro do endereço do Responsável!','warning')
            }else if(!Cidade){
                desbloquear()
                $("#Cidade").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Cidade do Responsável!','warning')
            }else if(!Estado){
                desbloquear()
                $("#Estado").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Estado do Responsável!','warning')
            }else if(!Telefone_1 || false == validPhone(Telefone_1)){
                desbloquear()
                $("#Telefone_1").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Telefone 1 do Responsável!','warning')
            }else if(false == validPhone(Telefone_2)  && '' != Telefone_2){
                desbloquear()
                $("#Telefone_2").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Telefone 2 Válido!','warning')
            }else if(false == validPhone(Telefone_3) && '' != Telefone_3){
                desbloquear()
                $("#Telefone_3").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Telefone 2 Válido!','warning')
            }else{
                let data = $(this).serializeArray()

                data.push({name: "_token", value: '{{ csrf_token() }}' })

                data.push({name: "Nome", value: Nome })
                data.push({name: "Cep", value: Cep })
                data.push({name: "Endereco", value: Endereco })
                data.push({name: "Numero", value: Numero })
                data.push({name: "Complemento", value: Complemento })
                data.push({name: "Bairro", value: Bairro })
                data.push({name: "Cidade", value: Cidade })
                data.push({name: "Estado", value: Estado })
                data.push({name: "Telefone_1", value: Telefone_1 })

                if(Telefone_2){
                    data.push({name: "Telefone_2", value: Telefone_2 })
                }

                if(Telefone_3){
                    data.push({name: "Telefone_3", value: Telefone_3 })
                }

                $.ajax({
                    url: "{{ route('salvar.novo.responsavel') }}",
                    type: 'POST',
                    data:  $.param(data),
                    dataType: 'json',
                    success: function(response){
                        if(true == response.success){
                            desbloquear()
                            Swal.fire({
                                title: 'Êxito!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Ok'
                                }).then(function () {
                                    bloquear();
                                    window.location = "{{ route('show.novo.responsavel') }}";
                            })
                        }else{
                            desbloquear();
                            Swal.fire(
                                'Atenção!',
                                response.message,
                                'warning'
                            )
                        }
                    }
                });//fim ajax
            }//fim else
        });//fim salvar

        $(".verDados").click(function(){
            let id = $(this).val()
            window.location = base_URL+"/dadosResponsavel/"+id;
        })

})//fim ready

    /*eventos que foram adicionados após o carregamento da pagina*/


    /*fim eventos que foram adicionados após o carregamento da pagina*/
</script>

@endsection
<!-- Start Content-->

    <div class="row">
        <div class="col-12">

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <form class="form-post-Cliente" autocomplete="off" name="formCreate">
                            @csrf
                            <h4 class="header-title">Informe os dados do Novo Responsável</h4>
                            <p class="text-muted font-14">
                            </p>
                            <div class="row">

                                <div class="col-md-4 spaceForm">
                                    <label for="Nome" class="form-label">Nome</label>
                                    <input type="text" name="Nome" id="Nome" class="form-control Nome">
                                </div>

                                <div class="col-md-3 spaceForm">
                                    <label for="Cep" class="form-label">CEP</label>
                                    <input type="text" name="Cep" id="Cep" class="form-control Cep" data-toggle="input-mask" data-mask-format="00000-000">
                                </div>

                                <div class="col-md-3 spaceForm">
                                    <label for="Endereco" class="form-label">Endereço</label>
                                    <input type="text" name="Endereco" id="Endereco" class="form-control Endereco">
                                </div>

                                <div class="col-md-2 spaceForm">
                                    <label for="Numero" class="form-label">Número</label>
                                    <input type="text" name="Numero" id="Numero" class="form-control Numero">
                                </div>

                                <div class="col-md-3 spaceForm">
                                    <label for="Complemento" class="form-label">Complemento</label>
                                    <input type="text" name="Complemento" id="Complemento" class="form-control Complemento">
                                    <small>*não obrigatório</small>
                                </div>

                                <div class="col-md-3 spaceForm">
                                    <label for="Bairro" class="form-label">Bairro</label>
                                    <input type="text" name="Bairro" id="Bairro" class="form-control Bairro">
                                </div>

                                <div class="col-md-3 spaceForm">
                                    <label for="Cidade" class="form-label">Cidade</label>
                                    <input type="text" name="Cidade" id="Cidade" class="form-control Cidade">
                                </div>
                                <div class="col-md-3 spaceForm">
                                    <label for="Estado" class="form-label">Estado</label>
                                    <input type="text" name="Estado" id="Estado" class="form-control Estado">
                                </div>
                                @for ($i = 1; $i < 4; $i++)
                                    <div class="col-md-4 spaceForm">
                                        <label for="Telefone_{{$i}}" class="form-label">Telefone {{$i}}</label>
                                        <input type="text" name="Telefone_{{$i}}" id="Telefone_{{$i}}" class="form-control Telefone_{{$i}}" data-toggle="input-mask" data-mask-format="(00)0000-00009">
                                        @if ($i > 1)
                                            <small>*não obrigatório</small>
                                        @endif
                                    </div>
                                @endfor
                                <!--div class="col-md-6 spaceForm">
                                    <label for="price" class="form-label">Parentesco</label>
                                    <select class="form-control select2" id="parentesco" name="parentesco">
                                        <option value="">selecione uma opção</option>
                                        <option value="Pai">Pai</option>
                                        <option value="Mãe">Mãe</option>
                                        <option value="Irmão(a)">Irmão(a)</option>
                                        <option value="Primo">Primo</option>
                                        <option value="Tio(a)">Tio(a)</option>
                                        <option value="Avô(a)">Avô(a)</option>
                                    </select>
                                </div-->
                                <div class="spaceForm"></div>
                                <hr>
                                <div class="form-group col-md-12">
                                    <center><a type="button" id="salvar" class="btn btn-success"><i class="far fa-save"></i> salvar</a></center>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- end col-12 -->
    </div> <!-- end row -->

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="header-title">Lista de Responsáveis Cadastrados</h4>
                    <table class="table dataTables table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Ativo</th>
                            <th>Ação</th>
                        </tr>
                        </thead>
                        @foreach ($responsaveis as $r)
                            <td>{{ $r->id }}</td>
                            <td>{{ $r->nome }}</td>
                            @if (1 == $r->status)
                                <td><i class='fas fa-check text-success'></i> Ativo</td>
                            @else
                                <td><i class='fas fa-check text-success'></i> Ativo</td>
                            @endif
                            <td>
                                <button type="button" value="{{ $r->id }}" class="btn btn-info verDados"><i class="fas fa-user-edit"></i> Ver Dados</button>
                            </td>
                        @endforeach
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
