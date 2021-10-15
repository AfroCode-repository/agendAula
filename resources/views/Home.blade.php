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

        $("#FiltrarPorAluno").click(function(){
            let id = $("#idFiltroAluno").val()
            if('' == id || null == id){
                Swal.fire('Atenção!','Selecione um aluno para o Filtro!','warning')
            }else if(0 == id){
                window.location.href = base_URL+"/home";
            }else{
                bloquear()
                window.location.href = base_URL+"/home/"+id;
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
                                <i class="mdi mdi-plus-circle-outline"></i> Cadastrar Aula</button>
                            </div>
                        </div> <!-- end col-->
                        <div class="col-lg-4">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-info"
                                data-bs-toggle="modal"
                                data-bs-target="#modalCalendarioPorAluno">
                                <i class="fas fa-filter"></i> Filtrar por Aluno</button>
                            </div>
                        </div> <!-- end col-->
                        <div class="col-lg-4">
                            <div class="d-grid">
                                <button class="btn btn-lg font-16 btn-warning"
                                data-bs-toggle="modal"
                                data-bs-target="#modalReciboPorAluno">
                                <i class="far fa-file-alt"></i> Recibo por Aluno</button>
                            </div>
                        </div> <!-- end col-->
                    </div>
                </div>
            </div>

            @if (isset($filtroNome))
                @foreach ($filtroNome as $f)
                    <h4 id="filtradoPor">Filtrado para o Aluno: {{ $f->name }}</h4>
                @endforeach
            @endif


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
        </div>
        <!-- end col-12 -->
    </div> <!-- end row -->

    <!-- Add New Event MODAL -->
    {{--Modal para ver agendamento--}}
    <div id="modalNovoAgendamento" class="modal fade" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalNovoAgendamentoLabel" aria-hidden="true">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-success">
                    <h4 class="modal-title" id="modalNovoAgendamentoLabel">Cadastrar nova aula</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <div class="text-center">
                            <div class="row" id="verHTMLAgendamento">
                                    <div class="col-md-6 spaceForm">
                                        <label class="group" for="enderecoAgendamento"> Aluno:</label>
                                        <select class="form-control" id="novoAluno" name="novoAluno">
                                            <option value="" >selecione uma opção</option>
                                            @foreach ($listaAlunos as $lista)
                                                <option value="{{ $lista->id }}">{{ $lista->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-6 spaceForm">
                                        <label class="group" for="enderecoAgendamento"> Mês de Inicio:</label>
                                        <select class="form-control" id="mesAula" name="mesAula">
                                            <option value="" >selecione uma opção</option>
                                            <option value='01'>Janeiro</option>
                                            <option value='02'>Fevereiro</option>
                                            <option value='03'>Março</option>
                                            <option value='04'>Abril</option>
                                            <option value='05'>Maio</option>
                                            <option value='06'>Junho</option>
                                            <option value='07'>Julho</option>
                                            <option value='08'>Agosto</option>
                                            <option value='09'>Setembro</option>
                                            <option value='10'>Outubro</option>
                                            <option value='11'>Novembro</option>
                                            <option value='12'>Dezembro</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 spaceForm">
                                        <label class="group" for="enderecoAgendamento"> Qtd de meses (1-6)</label>
                                        <select class="form-control" id="qtdMeses" name="qtdMeses">
                                            <option value="" >selecione uma opção</option>
                                            <option selected value='1'>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>
                                            <option value='5'>5</option>
                                            <option value='6'>6</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 spaceForm">
                                        <label class="group" for="enderecoAgendamento"> Hora Inicio</label>
                                        <input type="time" class="form-control" id="horaInicio" name="horaInicio"
                                            min="08:00" max="18:00" required>

                                        <small>Coloque entre 8h as 18h</small>
                                    </div>

                                    <div class="col-md-4 spaceForm">
                                        <label class="group" for="enderecoAgendamento"> Duração da Aula</label>
                                        <input type="time" class="form-control" id="duracaoAula" name="duracaoAula"
                                            min="00:00" max="04:00"  value="01:00" required>

                                        <small>Padrão 1 hora - limite Max. 4 horas</small>
                                    </div>


                                <hr class="spaceForm">
                                <div class="col-md-3">
                                    <label class="group" for="enderecoAgendamento"> Selecione os dias da Semana</label>
                                    <div class="form-check form-checkbox-success mb-2 spaceForm">
                                        <input type="checkbox" class="form-check-input" id="segundaNovo">
                                        <label class="form-check-label" for="segundaNovo">Segunda-Feira</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="tercaNovo">
                                        <label class="form-check-label" for="tercaNovo">Terça-Feira</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="quartaNovo">
                                        <label class="form-check-label" for="quartaNovo">Quarta-Feira</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="quintaNovo">
                                        <label class="form-check-label" for="quintaNovo">Quinta-Feira</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="sextaNovo">
                                        <label class="form-check-label" for="sextaNovo">Sexta-Feira</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="sabadoNovo">
                                        <label class="form-check-label" for="sabadoNovo">Sábado</label>
                                    </div>
                                    <div class="form-check form-checkbox-success mb-2">
                                        <input type="checkbox" class="form-check-input" id="domingoNovo">
                                        <label class="form-check-label" for="domingoNovo">Domingo</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success btn-rounded" value="" id="salvarNovaAula"><i class="fas fa-check"></i> Salvar</button>
                    <button type="button" class="btn btn-danger btn-rounded" data-bs-dismiss="modal">Fechar</button>
                    {{--<button type="button" id="salvaNovoClienteServico" class="btn btn-success">Salvar</button>--}}
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    {{--fim Modal para ver agendamento--}}

    {{--Modal para ver agendamento--}}
    <div id="modalCalendarioPorAluno" class="modal fade" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalCalendarioPorAlunoLabel" aria-hidden="true">
        <div class="modal-dialog  modal-sm">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-info">
                    <h4 class="modal-title" id="modalCalendarioPorAlunoLabel">Filtrar Calendário por Aluno</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <div class="text-center">
                            <div class="row" id="verHTMLAgendamentoFiltro">
                                <div class="col-md-12 spaceForm">
                                    <label class="group" for="enderecoAgendamento"> Aluno:</label>
                                    <select class="form-control" id="idFiltroAluno" name="idFiltroAluno">
                                        <option value="" >selecione uma opção</option>
                                        <option value="0" >Todos</option>
                                        @foreach ($listaAlunos as $listafiltro)
                                            <option value="{{ $listafiltro->id }}">{{ $listafiltro->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info btn-rounded" value="" id="FiltrarPorAluno"><i class="fas fa-check"></i> Filtrar</button>
                    <button type="button" class="btn btn-danger btn-rounded" data-bs-dismiss="modal">Fechar</button>
                    {{--<button type="button" id="salvaNovoClienteServico" class="btn btn-success">Salvar</button>--}}
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    {{--fim Modal para ver agendamento--}}

    {{--Modal para ver agendamento--}}
    <div id="modalReciboPorAluno" class="modal fade" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalReciboPorAlunoLabel" aria-hidden="true">
        <div class="modal-dialog  modal-sm">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-warning">
                    <h4 class="modal-title" id="modalReciboPorAlunoLabel">Criar Recibo para Aluno</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <div class="text-center">
                            <div class="row" id="verHTMLAgendamentoFiltro">
                                <div class="col-md-12 spaceForm">
                                    <label class="group" for="enderecoAgendamento"> Aluno:</label>
                                    <select class="form-control" id="novoAluno" name="novoAluno">
                                        <option value="" >selecione uma opção</option>
                                        @foreach ($listaAlunos as $recibo)
                                            <option value="{{ $recibo->id }}">{{ $recibo->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-12 spaceForm">
                                    <label class="group" for="enderecoAgendamento"> Data (Mês - Ano):</label>
                                    <input type="text"
                                    class="datepicker-here"
                                    data-language='pt-BR'
                                    data-min-view="months"
                                    data-view="months"
                                    data-date-format="mm-yyyy"
                                    placeholder="Selecione um Mês"
                                    />
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning btn-rounded" value="" id="FiltrarPorAluno"><i class="fas fa-check"></i> Criar Recibo</button>
                    <button type="button" class="btn btn-danger btn-rounded" data-bs-dismiss="modal">Fechar</button>
                    {{--<button type="button" id="salvaNovoClienteServico" class="btn btn-success">Salvar</button>--}}
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    {{--fim Modal para ver agendamento--}}
    <!-- end modal-->

@endsection
