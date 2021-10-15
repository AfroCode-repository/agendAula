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
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">

                <h3 class="header-title mb-3">Responsavel: FULANO</h3>

                <form>
                    <div id="basicwizard">

                        <ul class="nav nav-pills nav-justified form-wizard-header mb-4">
                            <li class="nav-item">
                                <a href="#basictab1" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active">
                                    <i class="mdi mdi-account-circle me-1"></i>
                                    <span class="d-none d-sm-inline">Alunos</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#basictab2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                    <i class="mdi mdi-face-profile me-1"></i>
                                    <span class="d-none d-sm-inline">Enderecos</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#basictab3" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                    <i class="mdi mdi-checkbox-marked-circle-outline me-1"></i>
                                    <span class="d-none d-sm-inline">Telefones</span>
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content b-0 mb-0">
                            <div class="tab-pane active" id="basictab1">
                                <div class="row">
                                    <div class="col-12">
                                        <h4 class="header-title">Lista de Alunos Cadastrados</h4>
                                        <table class="table dataTables table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Nome</th>
                                                <th>Ativo</th>
                                                <th>Ação</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div> <!-- end col -->
                                </div> <!-- end row -->
                            </div>

                            <div class="tab-pane" id="basictab2">
                                <div class="row">
                                    <div class="col-12">
                                        <h4 class="header-title">Lista de Endereço Cadastrados</h4>
                                        <table class="table dataTables table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Nome</th>
                                                <th>Ativo</th>
                                                <th>Ação</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div> <!-- end col -->
                                </div> <!-- end row -->
                            </div>

                            <div class="tab-pane" id="basictab3">
                                <div class="row">
                                    <div class="col-12">
                                        <h4 class="header-title">Lista de Telefones Cadastrados</h4>
                                        <table class="table dataTables table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Nome</th>
                                                <th>Ativo</th>
                                                <th>Ação</th>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div> <!-- end col -->
                                </div> <!-- end row -->
                            </div>

                        </div> <!-- tab-content -->
                    </div> <!-- end #basicwizard-->
                </form>

            </div> <!-- end card-body -->
        </div> <!-- end card-->
    </div>
</div>
<!-- End Content-->

@endsection
