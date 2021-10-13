@extends('layouts.dashTemplate.master')
@section('content')

@php
    /*dados de agendamento total*/
$lista_eventos = [];

foreach ($agendamentos as $a) {
        $lista_eventos[] = "{ id:'$a->id_agendamento', title: '$a->nome', start: '$a->data_agendamento', className: '$a->btnClass',timeFormat: 'H(:mm)' }";
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
            locale: 'pt-br',
            buttonText: {
                prev: 'Anterior',
                next: 'Próximo',
                today: 'Hoje',
                month: 'Mês',
                week: 'Semana',
                day: 'Hoje',
                list: 'Lista'
            },
            events:[{!! $lista_eventos !!}],
            eventClick: function(info) {
                bloquear();
                /*$.ajax({
                    url: "Route('ver.agendamento')",
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
                });//fim ajax*/
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
                        <div class="col-lg-4">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-success"
                                data-bs-toggle="modal"
                                data-bs-target="#modalNovoAgendamento">
                                <i class="mdi mdi-plus-circle-outline"></i> Criar</button>
                            </div>
                        </div> <!-- end col-->
                        <div class="col-lg-4">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-info"
                                data-bs-toggle="modal"
                                data-bs-target="#modalFiltro">
                                <i class="fas fa-filter"></i> Filtrar por Aluno</button>
                            </div>
                        </div> <!-- end col-->
                        <div class="col-lg-4">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-warning"
                                data-bs-toggle="modal"
                                data-bs-target="#modalRecibo">
                                <i class="far fa-file-alt"></i> Recibo por Aluno</button>
                            </div>
                        </div> <!-- end col-->
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
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
@endsection
