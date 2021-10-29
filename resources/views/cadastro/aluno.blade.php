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

            let nome = $("#nome").val()
            let cor = $("#cor").val()
            let responsavel = $("#responsavel").val()
            let parentesco = $("#parentesco").val()

            $("#nome").removeClass('is-invalid')
            $("#cor").removeClass('is-invalid')
            $("#responsavel").removeClass('is-invalid')
            $("#parentesco").removeClass('is-invalid')


            if(!nome){
                desbloquear()
                $("#nome").addClass('is-invalid')
                Swal.fire('Atenção!','Informe Nome do Responsável!','warning')
            }else if(!cor){
                desbloquear()
                $("#cor").addClass('is-invalid')
                Swal.fire('Atenção!','Informe cor do para o Calendário!','warning')
            }else if(!responsavel){
                desbloquear()
                $("#responsavel").addClass('is-invalid')
                Swal.fire('Atenção!','Selecione um responsável para o Aluno!','warning')
            }else if(!parentesco){
                desbloquear()
                $("#Numero").addClass('is-invalid')
                Swal.fire('Atenção!','Selecione o Parentesco do responsável!','warning')
            }else{
                let data = $(this).serializeArray()

                data.push({name: "_token", value: '{{ csrf_token() }}' })

                data.push({name: "nome", value: nome })
                data.push({name: "cor", value: cor })
                data.push({name: "responsavel", value: responsavel })
                data.push({name: "parentesco", value: parentesco })

                $.ajax({
                    url: "{{ route('salvar.novo.aluno') }}",
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
            window.location = base_URL+"/dadosAluno/"+id;
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
                            <h4 class="header-title">Informe os dados para o Novo Aluno</h4>
                            <p class="text-muted font-14">
                            </p>
                            <div class="row">

                                <div class="col-md-6 spaceForm">
                                    <label for="nome" class="form-label">Nome</label>
                                    <input type="text" name="nome" id="nome" class="form-control nome">
                                </div>

                                <div class="col-md-6 spaceForm">
                                    <label for="cor" class="form-label">Selecione uma Cor para o Calendario</label>
                                    <select class="form-control" id="cor" name="cor">
                                        <option value="">selecione uma cor</option>
                                        <option selected value="bg-primary" style="background-color: #727cf5;color:#FFF">Roxo</option>
                                        <option value="bg-success" style="background-color: #0acf97;color:#FFF">Verde</option>
                                        <option value="bg-info" style="background-color: #39afd1;color:#FFF">Azul</option>
                                        <option value="bg-warning" style="background-color: #ffbc00;color:#FFF">Laranja</option>
                                        <option value="bg-danger" style="background-color: #fa5c7c;color:#FFF">Vermelho</option>
                                        <option value="bg-secondary" style="background-color: #6c757d;color:#FFF">Cinza</option>
                                        <option value="bg-dark" style="background-color: #313a46;color:#FFF">Preto</option>
                                    </select>
                                </div>

                                <div class="col-md-6 spaceForm">
                                    <label for="responsavel" class="form-label">Responsável</label>
                                    <select class="form-control select2" id="responsavel" name="responsavel">
                                        <option value="">selecione uma opção</option>
                                        @foreach ($listaResponsaveis as $a)
                                            <option value="{{ $a->id }}">{{ $a->nome }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-6 spaceForm">
                                    <label for="parentesco" class="form-label">Grau de Parentesco</label>
                                    <select class="form-control select2" id="parentesco" name="parentesco">
                                        <option value="">selecione uma opção</option>
                                        <option value="Pai">Pai</option>
                                        <option value="Mãe">Mãe</option>
                                        <option value="Irmão(a)">Irmão(a)</option>
                                        <option value="Primo">Primo</option>
                                        <option value="Tio(a)">Tio(a)</option>
                                        <option value="Avô(a)">Avô(a)</option>
                                    </select>
                                </div>

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
                    <h4 class="header-title">Lista de Alunos Cadastrados</h4>
                    <table class="table dataTables table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome do aluno</th>
                            <th>Ativo</th>
                            <th>Ação</th>
                        </tr>
                        </thead>
                        <tbody>
                            @foreach ($alunos as $a)
                            <tr>
                                <td>{{ $a->id }}</td>
                                <td>{{ $a->name }}</td>
                                @if (1 == $a->status)
                                    <td><i class='fas fa-check text-success'></i> Ativo</td>
                                @else
                                    <td><i class='fas fa-check text-success'></i> Ativo</td>
                                @endif
                                <td>
                                    <button type="button" value="{{ $a->id }}" class="btn btn-info verDados"><i class="fas fa-user-edit"></i> Ver Dados</button>
                                </td>
                            <tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
