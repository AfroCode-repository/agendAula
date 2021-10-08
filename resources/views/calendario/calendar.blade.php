@extends('layouts.dashTemplate.master')
@section('content')

@php
    /*dados de agendamento total*/
$lista_eventos = [];

foreach ($agendamentos as $a) {
        $lista_eventos[] = "{ id:'$a->id_client_scheduling', title: '$a->name_cliente', start: '$a->data_agendamento', className: '$a->btnClass',timeFormat: 'H(:mm)' }";
}
$lista_eventos = implode(',',$lista_eventos);
/*fim dados de agendamento total*/
@endphp

@section('CssPersonalizado')
<link href="{{ asset('css/vendor/fullcalendar.min.css') }}" rel="stylesheet" type="text/css"/>
@endsection

@section('JsPersonalizado')

<script src="{{ asset('js/vendor/fullcalendar.min.js') }}"></script>
<script>
    $(document).ready(function() {
        excluirTodosServicoAgendamento()
        resumoServicoAgendamentos()

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

        //functions controle de tabs adicionar Agendamento
        if("navResponsavelData" == sessionStorage.getItem("tabActiveAgendamento")){
            removeClassTabsAgendamento()

            $('#navResponsavelData').addClass('active')
            $('#responsavelDataTab').addClass('active')

        }else if("navAgendamentoServices" == sessionStorage.getItem("tabActiveAgendamento")){
            removeClassTabsAgendamento()

            $('#navAgendamentoServices').addClass('active')
            $('#agendamentoServicesTab').addClass('active')

        }else if("navResumoAgendamento" == sessionStorage.getItem("tabActiveAgendamento")){
            removeClassTabsAgendamento()

            $('#navResumoAgendamento').addClass('active')
            $('#resumoAgendamentoTab').addClass('active')

        }else {
            removeClassTabsAgendamento()

            $('#navResponsavelData').addClass('active')
            $('#responsavelDataTab').addClass('active')
        }

        $("#navResponsavelData").click(function(){
            removeClassTabsAgendamento()

            $('#navResponsavelData').addClass('active')
            $('#responsavelDataTab').addClass('active')

            sessionStorage.setItem("tabActiveAgendamento", "navResponsavelData");
        })

        $("#navAgendamentoServices").click(function(){
            removeClassTabsAgendamento()

            $('#navAgendamentoServices').addClass('active')
            $('#agendamentoServicesTab').addClass('active')

            sessionStorage.setItem("tabActiveAgendamento", "navAgendamentoServices");
        })

        $("#navResumoAgendamento").click(function(){
            resumoServicoAgendamentos()
            removeClassTabsAgendamento()

            $('#navResumoAgendamento').addClass('active')
            $('#resumoAgendamentoTab').addClass('active')

            sessionStorage.setItem("tabActiveAgendamento", "navResumoAgendamento");
        })
        //functions controle de tabs adicionar Agendamento fim

        /*functions*/
        function removeClassTabsDadosCadastrados(){
            $('#navPhone').removeClass('active')
            $('#navAddress').removeClass('active')
            $('#navEmail').removeClass('active')
            $('#navService').removeClass('active')
            $('#navAgendamento').removeClass('active')

            $('#phoneTab').removeClass('active')
            $('#addressTab').removeClass('active')
            $('#emailTab').removeClass('active')
            $('#serviceTab').removeClass('active')
            $('#agendamentoTab').removeClass('active')
        }

        function removeClassTabsAgendamento(){
            $('#navResponsavelData').removeClass('active');
            $('#navAgendamentoServices').removeClass('active');
            $('#navResumoAgendamento').removeClass('active');

            $('#responsavelDataTab').removeClass('active');
            $('#agendamentoServicesTab').removeClass('active');
            $('#resumoAgendamentoTab').removeClass('active');
        }


        var indice_selecionado_servico = -1; //Índice do item selecionado na lista
        var tblCadServAgend = sessionStorage.getItem("tblCadServAgend");// Recupera os dados armazenados
        tblCadServAgend = JSON.parse(tblCadServAgend); // Converte string para objeto
        if(tblCadServAgend == null) // Caso não haja conteúdo, iniciamos um vetor vazio
        tblCadServAgend = []

        function adicionarServicoNovoAgendamento(){
            bloquear()
            let valPreco = $("#novoPrecoAgendamento").val()
            let valServico = $("#novoServicoAgendamento").val()
            let valServicoText = $("#novoServicoAgendamento option:selected").text()

            if('' == valServico || null == valServico || false == valServico){
                Swal.fire('Atenção','Por Favor, Selecione um serviço!','warning')
                desbloquear()
                return false
            }else if('' == valPreco || null == valPreco || false == valPreco){
                Swal.fire('Atenção','Por Favor, Informe o Preço!','warning')
                desbloquear()
                return false
            }

            //verifica se ja existe cadastro do tipo de documento
            let verificaExiste = JSON.parse(sessionStorage.getItem("tblCadServAgend"));//no brackets

            if(verificaExiste){
                for(let j = 0; j < verificaExiste.length; j++){
                    var data = JSON.parse(tblCadServAgend[j]);
                    if(data.servico == valServico){
                        Swal.fire('Atenção!','Já Existe cadastrado na lista o serviço!: '+valServicoText,'warning')
                        desbloquear()
                        return false
                    }
                }// fim for
            }//fim if*/

            preco = valPreco.replace('.','')
            preco = preco.replace(',','.')

            let novoServicoAgendamento = JSON.stringify({
                preco   : preco,
                servico   : valServico,
                servicoText     : valServicoText
            });

            tblCadServAgend.push(novoServicoAgendamento)
            sessionStorage.setItem("tblCadServAgend", JSON.stringify(tblCadServAgend))

            Toast.fire({
                icon: 'success',
                title: 'Serviço adicionado'
            })

            $("#novoPrecoAgendamento").val('')
            $("#novoServicoAgendamento").val('')
            desbloquear()
            return true
        }// fim adiciona novo documento

        function listarServicoAgendamentos(){
            bloquear()
            let htmlTable = ''

            $("#tblListaServicoAgendamento").html("")

            htmlTable = "<thead>"+
            "   <tr>"+
            "   <th>#</th>"+
            "   <th>Serviço</th>"+
            "   <th>Preço</th>"+
            "   <th>Ação</th>"+
            "   </tr>"+
            "</thead>"+
            "<tbody>"

            for(var i in tblCadServAgend){
                let serv = JSON.parse(tblCadServAgend[i]);

                let preco = parseFloat(serv.preco)

                htmlTable += "<tr>"
                htmlTable += "<td>"+i+"</td>"
                htmlTable += "<td>"+serv.servicoText+"</td>"
                htmlTable += "<td>US$ "+preco+"</td>"
                htmlTable += "<td><a alt='"+i+"' class='btn btn-danger btnExcluirServicoAgendamento'><i class='far fa-trash-alt'></i></a></td>"
                htmlTable += "</tr>"

            }

            htmlTable += "</tbody>"

            $("#tblListaServicoAgendamento").html(htmlTable)
            $('#tblListaServicoAgendamento').DataTable()
            desbloquear()
        }//fim função listar

        function excluirServicoAgendamento(){
            tblCadServAgend.splice(indice_selecionado_servico, 1);
            sessionStorage.setItem("tblCadServAgend", JSON.stringify(tblCadServAgend));
            Swal.fire('Serviço excluído!','','success')
        }//fim exclui documento

        function excluirTodosServicoAgendamento(){
            tblCont = []
            sessionStorage.setItem("tblCadServAgend", tblCadServAgend)
            sessionStorage.removeItem("tblCadServAgend")
        }// fim exclui todos os Contato

        function resumoServicoAgendamentos(){
            bloquear()
            let htmlTable
            let totalServico = 0;

            htmlTable = '<h4 style="text-align:left" class="spaceForm">Responsável e Data:</h4>'
            htmlTable += '<p style="text-align:left"><strong>Cliente: </strong> '+$("#id_client option:selected").text();+'</p>'
            htmlTable += '<p style="text-align:left"><strong>nome: </strong> '+$("#nomeAgendamento").val()+'</p>'
            htmlTable += '<p style="text-align:left"><strong>Endereço: </strong> '+$("#novoEnderecoAgendamento option:selected").text();+'</p>'
            htmlTable += '<p style="text-align:left"><strong>Tipo Agendamento: </strong> '+$("#novoTipoAgendamento option:selected").text();+'</p>'
            htmlTable += '<p style="text-align:left"><strong>Data Agendamento: </strong> '+$("#dataAgendamento").val()+'    {{ (Auth::user()->id_language > 1) ? "(dia/mês/ano hrs:min)" : "(mês/dia/ano hrs:min)"  }} </p>'
            htmlTable += '<p style="text-align:left"><strong>Observação: </strong> '+$("#obsAgendamento").val()+'</p>'
            htmlTable += '<h4 style="text-align:left" class="spaceForm">Serviços:</h4>'

            for(var i in tblCadServAgend){
                let serv = JSON.parse(tblCadServAgend[i]);
                let preco = parseFloat(serv.preco)

                htmlTable += '<p style="text-align:left"><strong>'+serv.servicoText+': </strong>US$ '+preco+'</p>'

                totalServico += preco
            }


            htmlTable += '<hr>'


            htmlTable += '<h4 style="text-align:left">Total: US$ '+totalServico+'</h4>'

            $("#resumeHTMLAgendamento").html(htmlTable)
            desbloquear()
        }

        /***********************************
        *****     fim functions        *****
        ***********************************/

        $('#adicionarServicoAgendamento').click(function (){
            adicionarServicoNovoAgendamento()
            listarServicoAgendamentos()
            resumoServicoAgendamentos()
        })

        $("#tblListaServicoAgendamento").on("click", ".btnExcluirServicoAgendamento",function(){
            indice_selecionado_servico = parseInt($(this).attr("alt"))
            excluirServicoAgendamento()
            listarServicoAgendamentos()
            resumoServicoAgendamentos()
        })

        //onchange resume
        $("#novoEnderecoAgendamento").change(function(){resumoServicoAgendamentos()})
        $("#nomeAgendamento").change(function(){resumoServicoAgendamentos()})
        $("#dataAgendamento").change(function(){resumoServicoAgendamentos()})
        $("#novoTipoAgendamento").change(function(){resumoServicoAgendamentos()})
        $("#obsAgendamento").change(function(){resumoServicoAgendamentos()})
        $("#adicionarServicoAgendamento").change(function(){resumoServicoAgendamentos()})

        $("#salvaNovoAgendamento").click(function (){
            bloquear()
            let nome = $("#nomeAgendamento").val()
            let address = $("#novoEnderecoAgendamento").val()
            let tipoAgendamento = $("#novoTipoAgendamento").val()
            let dataAgendamento = $("#dataAgendamento").val()
            let obsAgendamento = $("#obsAgendamento").val()
            let tblServico =  sessionStorage.getItem("tblCadServAgend")
            let client =  $('#id_client').val()

            if(!client){
                $("#id_client").removeClass('is-invalid')
                $("#id_client").addClass('is-invalid')

                Swal.fire('Atenção!','Selecione um Cliente!','warning')
                $("#navResponsavelData").trigger('click')
                desbloquear()
            }else if(!nome){

                $("#nomeAgendamento").removeClass('is-invalid')
                $("#nomeAgendamento").addClass('is-invalid')

                Swal.fire('Atenção!','Pencha o campo nome do Responsavel!','warning')
                $("#navResponsavelData").trigger('click')
                desbloquear()

            }else if(!address){

                $("#novoEnderecoAgendamento").removeClass('is-invalid')
                $("#novoEnderecoAgendamento").addClass('is-invalid')

                Swal.fire('Atenção!','Selecione um Endereço!','warning')
                $("#navResponsavelData").trigger('click')
                desbloquear()

                }else if(!tipoAgendamento){

                $("#novoTipoAgendamento").removeClass('is-invalid')
                $("#novoTipoAgendamento").addClass('is-invalid')

                Swal.fire('Atenção!','Selecione um Tipo de Agendamento!','warning')
                $("#navResponsavelData").trigger('click')
                desbloquear()

            }else if(!dataAgendamento){
                $("#nomeAgendamento").removeClass('is-invalid')
                $("#dataAgendamento").removeClass('is-invalid')
                $("#dataAgendamento").addClass('is-invalid')

                Swal.fire('Atenção!','Pencha o campo Data de Agendamento!','warning')
                $("#navResponsavelData").trigger('click')
                desbloquear()

            }else if(!tblServico || 0 == JSON.parse(tblServico).length){
                $("#nomeAgendamento").removeClass('is-invalid')
                $("#dataAgendamento").removeClass('is-invalid')

                Swal.fire('Atenção!','Inseira pelo menos um Serviço!','warning')
                $("#navAgendamentoServices").trigger('click')
                desbloquear()
            }else if(!$("#checkResumo").is(':checked')){
                $("#checkResumo").removeClass('is-invalid')
                $("#checkResumo").addClass('is-invalid')

                Swal.fire('Atenção!','Confirme o campo do Resumo!','warning')
                $("#navResumoAgendamento").trigger('click')
                desbloquear()
            }else{

                let data = $(this).serializeArray()

                data.push({name: "dataServico", value:  tblServico})
                data.push({name: "cliente", value:  client})
                data.push({name: "nome", value:  nome})
                data.push({name: "dataAgendamento", value:  dataAgendamento})
                data.push({name: "tipoAgendamento", value:  tipoAgendamento})
                data.push({name: "address", value:  address})
                data.push({name: "obs", value:  obsAgendamento})
                data.push({name: "_token", value: '{{ csrf_token() }}' })

                $.ajax({
                    url: "{{ route('insere.agendamento') }}",
                    type: 'POST',
                    data: $.param(data),
                    dataType: 'json',
                    success: function(response){
                        desbloquear()
                        if(true == response.success){
                            excluirTodosServicoAgendamento()
                            desbloquear()
                            Swal.fire({
                                title: 'Êxito!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Ok'
                                }).then(function () {
                                    bloquear()
                                    window.location.reload()
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
            }
        })

        $("#id_client").change(function(){
        let id = $("#id_client").val()
        if(id){
            $("#novoEnderecoAgendamento").removeAttr('disabled')
            $("#nomeAgendamento").removeAttr('disabled')
            $("#dataAgendamento").removeAttr('disabled')
            $("#novoTipoAgendamento").removeAttr('disabled')
            $("#obsAgendamento").removeAttr('disabled')
            $("#novoServicoAgendamento").removeAttr('disabled')
            $("#novoPrecoAgendamento").removeAttr('disabled')
            $("#adicionarServicoAgendamento").removeAttr('disabled')

            bloquear();
                $.ajax({
                    url: "{{ Route('recupera.dados.novoAgendamento') }}",
                    type: 'POST',
                    data: {id:id,"_token": "{{ csrf_token() }}",},
                    dataType: 'json',
                    success: function(response){
                        if(true == response.success){

                            sessionStorage.removeItem("tblCadServAgend")
                            $("#tblListaServicoAgendamento").html('')
                            resumoServicoAgendamentos()

                            $("#novoEnderecoAgendamento").html(response.htmlEndereco)
                            $("#novoServicoAgendamento").html(response.htmlService)
                            desbloquear()
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

        }else{

            sessionStorage.removeItem("tblCadServAgend")
            resumoServicoAgendamentos()

            $("#novoEnderecoAgendamento").removeAttr('disabled')
            $("#nomeAgendamento").removeAttr('disabled')
            $("#dataAgendamento").removeAttr('disabled')
            $("#novoTipoAgendamento").removeAttr('disabled')
            $("#obsAgendamento").removeAttr('disabled')
            $("#novoServicoAgendamento").removeAttr('disabled')
            $("#novoPrecoAgendamento").removeAttr('disabled')
            $("#adicionarServicoAgendamento").removeAttr('disabled')

            $("#novoEnderecoAgendamento").attr('disabled',true)
            $("#nomeAgendamento").attr('disabled',true)
            $("#dataAgendamento").attr('disabled',true)
            $("#novoTipoAgendamento").attr('disabled',true)
            $("#obsAgendamento").attr('disabled',true)
            $("#novoServicoAgendamento").attr('disabled',true)
            $("#novoPrecoAgendamento").attr('disabled',true)
            $("#adicionarServicoAgendamento").attr('disabled',true)

            $("#novoEnderecoAgendamento").html('')
            $("#nomeAgendamento").html('')
            $("#dataAgendamento").html('')
            $("#novoTipoAgendamento").html('')
            $("#obsAgendamento").html('')
            $("#novoServicoAgendamento").html('')
            $("#novoPrecoAgendamento").html('')
        }
      })//fim função on change apra novo agendamento

})//fim ready

    /*eventos que foram adicionados após o carregamento da pagina*/


    /*fim eventos que foram adicionados após o carregamento da pagina*/
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem: "bootstrap",
            bootstrapFontAwesome: !1,
            buttonText: { today: "Today", month: "Month", week: "Week", day: "Day", list: "List", prev: "Prev", next: "Next" },
            initialView: 'dayGridMonth',
            handleWindowResize: !0,
            //height: l(window).height() - 200,
            headerToolbar: { left: "prev,next today", center: "title", right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth" },
            editable: false,
            events:[{!! $lista_eventos !!}],
            eventClick: function(info) {
                bloquear();
                $.ajax({
                    url: "{{ Route('ver.agendamento') }}",
                    type: 'POST',
                    data: {status:'ativo',agendamento:info.event.id,"_token": "{{ csrf_token() }}",},
                    dataType: 'json',
                    success: function(response){
                        if(true == response.success){
                            $("#verHTMLAgendamento").html(response.message)
                            $("#mostraAlterarAgendamento").val(response.id)
                            $("#mudarAtribuirStatusAgendamento").val(response.id)
                            $("#mudarStatusConcluirAgendamento").val(response.id)
                            $("#mudarStatusExcluirAgendamento").val(response.id)
                            $("#verCliente").val(response.id_client)
                            $("#adicionarServicoAgendamentoAlteracao").val(response.id)
                            $("#valorAlterarObsAgendamento").val(response.obs)
                            $("#salvaAlterarStatusAgendamento").val(response.id)
                            desbloquear()
                            $("#modalVerAgendamento").modal('show')
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
            }//fim event
        });
        calendar.render();
      });

      $(document).on('click', '#verCliente', function(){
        let client = $('#verCliente').val()
        bloquear();
        window.location =  base_URL+'/dadosCliente/'+client
      })

</script>
@endsection
<!-- Start Content-->

    <div class="row">
        <div class="col-12">

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-success"
                                data-bs-toggle="modal"
                                data-bs-target="#modalNovoAgendamento">
                                <i class="mdi mdi-plus-circle-outline"></i> Criar Agendamento</button>
                            </div>
                            <div id="external-events" class="m-t-20">
                                <br>
                                <p class="text-muted"><h4>Legenda</h4>
                                </p>
                                <div class="legend-calendar bg-success-lighten text-success"
                                    data-class="bg-success">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Scheduled e To Reschedule
                                </div>
                                <div class="legend-calendar bg-secondary-lighten text-secondary"
                                    data-class="bg-secondary">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Budgeted
                                </div>
                                <div class="legend-calendar bg-info-lighten text-info"
                                    data-class="bg-info">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Non Billable
                                </div>
                                <div class="legend-calendar bg-warning-lighten text-warning"
                                    data-class="bg-warning">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Partial / Unacceptable
                                </div>
                                <div class="legend-calendar bg-primary-lighten text-primary"
                                    data-class="bg-primary">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Post Confirmed
                                </div>
                                <div class="legend-calendar bg-danger-lighten text-danger"
                                    data-class="bg-danger">
                                    <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Scheduled e To Reschedule Atrasado
                                </div>
                            </div>


                            <div class="mt-5 d-none d-xl-block">
                                <h5 class="text-center">Como Funciona essa Página ?</h5>

                                <ul class="ps-3">
                                    <li class="text-muted mb-3">
                                        Aqui você poderá visualizar todos os Agendamentos Ativos, com exceção dos Concluidos!
                                    </li>
                                    <li class="text-muted mb-3">
                                        Você Também podera visualizar os dados Clicando no Agendamento.
                                    </li>
                                    <li class="text-muted mb-3">
                                        E por fim poderá Criar Agendamentos A partir dessa dela!
                                    </li>
                                </ul>
                            </div>

                        </div> <!-- end col-->

                        <div class="col-lg-10">
                            <div class="mt-4 mt-lg-0">
                                <div id="calendar"></div>
                            </div>
                        </div> <!-- end col -->

                    </div> <!-- end row -->
                </div> <!-- end card body-->
            </div> <!-- end card -->

            <!-- Add New Event MODAL -->
            {{--Modal para ver agendamento--}}
            <div id="modalVerAgendamento" class="modal fade" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalVerAgendamentoLabel" aria-hidden="true">
                <div class="modal-dialog  modal-lg">
                    <div class="modal-content">
                        <div class="modal-header modal-colored-header bg-info">
                            <h4 class="modal-title" id="modalVerAgendamentoLabel">Resumo de Agendamento</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12">
                                <div class="text-center">
                                    <h2 class="mt-0"><i class="fas fa-exclamation-circle"></i></h2>
                                    <h3 class="mt-0">Informações do Agendamento!</h3>

                                    <div class="row" id="verHTMLAgendamento">

                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-rounded" value="" id="verCliente" data-bs-dismiss="modal"><i class="fab fa-searchengin"></i> Visualizar Cliente</button>
                            <button type="button" class="btn btn-primary btn-rounded" value="" id="mostraAlterarAgendamento" data-bs-dismiss="modal"><i class="fas fa-sync-alt"></i> Alterar agendamento</button>
                            <button type="button" class="btn btn-info btn-rounded" value="" id="mudarAtribuirStatusAgendamento"><i class="fas fa-broom"></i> Atribuir Status</button>
                            <button type="button" class="btn btn-success btn-rounded" value="" id="mudarStatusConcluirAgendamento"><i class="fas fa-check"></i> Concluir</button>
                            <button type="button" class="btn btn-warning btn-rounded"  value="" id="mudarStatusExcluirAgendamento"><i class="fas fa-trash"></i> Excluir</button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Fechar</button>
                            {{--<button type="button" id="salvaNovoClienteServico" class="btn btn-success">Salvar</button>--}}
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            {{--fim Modal para ver agendamento--}}
            <!-- end modal-->
        </div>
        <!-- end col-12 -->
    </div> <!-- end row -->

    {{--Modal para novo agendamento--}}
<div id="modalNovoAgendamento" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" role="dialog" aria-labelledby="modalNovoAgendamentoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-success">
                <h4 class="modal-title" id="modalNovoAgendamentoLabel">Criar Novo Agendamento</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>

            <form class="form-post-ClienteServico" autocomplete="off" name="novoServico">
                @csrf
            <div class="modal-body">
                <div id="basicwizard">
                    <ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
                        <li class="nav-item">
                            <a href="#responsavelDataTab" id="navResponsavelData" data-bs-toggle="tab" data-toggle="tab"  class="nav-link rounded-0 pt-2 pb-2 active">
                                <i class="far fa-calendar-alt"></i>
                                <span class="d-none d-sm-inline">Responsável e Data</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#agendamentoServicesTab" id="navAgendamentoServices" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                <i class="fas fa-hammer"></i>
                                <span class="d-none d-sm-inline">Serviços</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#resumoAgendamentoTab" id="navResumoAgendamento" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                <i class="fas fa-address-card"></i>
                                <span class="d-none d-sm-inline">Resumo e Revisão</span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content b-0 mb-0">
                        <div class="tab-pane active" id="responsavelDataTab">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="clienteAgendamento"> Cliente:</label>
                                        <div class="col-md-9">
                                            <select class="form-control select2Cliente" id="id_client" name="id_client">
                                                <option value="" >selecione uma opção</option>
                                                @foreach ($clients as $c)
                                                    <option value="{{ $c->id }}"> {{ $c->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="enderecoAgendamento"> Endereço:</label>
                                        <div class="col-md-9">
                                            <select class="form-control select2enderecoCliente" disabled id="novoEnderecoAgendamento" name="novoEnderecoAgendamento">
                                                <option value="" >selecione uma opção</option>
                                                {{--@foreach ($addressCliente as $a)
                                                    <option value="{{ $a->id }}">Area manager: {{ $a->area_manager }} - {{ $a->address}}</option>
                                                @endforeach--}}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="nomeAgendamento">Nome do responsável</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" disabled id="nomeAgendamento" name="nomeAgendamento" value="">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="data"> Data do Agendamento ({{ App\Http\Traits\SystemTrait::datePadraoText() }})</label>
                                        <div class="col-md-9">
                                            <input type='text' id="dataAgendamento" disabled class='form-control datepicker-here' data-timepicker="true" data-language='pt-BR' data-toggle="input-mask" data-mask-format="00-00-0000 00:00:00" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="enderecoAgendamento"> Tipo de Agendamento:</label>
                                        <div class="col-md-9">
                                            <select class="form-control" disabled id="novoTipoAgendamento" name="novoTipoAgendamento">
                                                <option value="" >selecione uma opção</option>
                                                @foreach ($status_scheduling as $ss)
                                                    @if (in_array($ss->cod_status,[1,2,3]))
                                                        <option value="{{ $ss->cod_status }}">{{ $ss->status_scheduling}}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="obs"> Observação</label>
                                        <div class="col-md-9">
                                            <input type="text" disabled class="form-control" id="obsAgendamento" name="obsAgendamento" value="">
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
                        </div>

                        <div class="tab-pane" id="agendamentoServicesTab">
                            <div class="row">
                                <div class="row">
                                    <div class="col-md-8 spaceForm">
                                        <label for="novoServicoAgendamento" class="form-label">Adicionar um serviço</label>
                                        <select class="form-control select2ServiceCliente" disabled id="novoServicoAgendamento" name="novoServicoAgendamento">
                                            <option value="" >selecione uma opção</option>
                                            {{--@foreach ($servicesCliente as $s)
                                                <option value="{{ $s->id }}">{{ $s->name}}</option>
                                            @endforeach--}}
                                        </select>
                                    </div>
                                    <div class="col-md-4 spaceForm">
                                        <div class="class"></div>
                                        <label for="novoPrecoAgendamento" class="form-label">Adicionar um Preço (US$)</label>
                                        <input type="text" name="novoPrecoAgendamento" disabled id="novoPrecoAgendamento" class="form-control price" data-toggle="input-mask" data-mask-format="000.000.000.000,00" data-reverse="true">
                                    </div>
                                    <div class="spaceForm"></div>
                                    <div class="col-md-12">
                                        <button type="button" disabled id="adicionarServicoAgendamento" class="btn btn-info">adicionar serviço</button>
                                    </div>
                                    <div class="col-md-12 spaceForm">
                                        <hr>
                                        <h4>Lista de Serviços para o Agendamento</h4>
                                        <table id="tblListaServicoAgendamento" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        </table>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
                        </div>

                        <div class="tab-pane" id="resumoAgendamentoTab">
                            <div class="row">
                                <div class="col-12">
                                    <div class="text-center">
                                        <h2 class="mt-0"><i class="fas fa-exclamation-circle"></i></h2>
                                        <h3 class="mt-0">Reveja as Informações</h3>

                                        <div class="row" id="resumeHTMLAgendamento">

                                        </div>

                                        <div class="mb-3">
                                            <div class="form-check d-inline-block">
                                                <input type="checkbox" class="form-check-input" id="checkResumo">
                                                <label class="form-check-label" for="checkResumo">Confirmo o Informações!</label>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
                        </div>

                    </div> <!-- tab-content -->
                </div>
                <!-- end #basicwizard-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Fechar</button>
                <button type="button" id="salvaNovoAgendamento" class="btn btn-success">Salvar Agendamento</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{{--fim Modal para novo agendamento--}}

@endsection
