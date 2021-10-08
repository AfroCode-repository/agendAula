
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

{{--Modal para Alterar agendamento--}}
<div id="modalAlterarAgendamento" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" role="dialog" aria-labelledby="modalAlterarAgendamentoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-info">
                <h4 class="modal-title" id="modalAlterarAgendamentoLabel">Alteração no Agendamento Empresa</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>

            <form class="form-post-ClienteServico" autocomplete="off" name="novoServico">
                @csrf
            <div class="modal-body">
                <div id="basicwizard">
                    <ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
                        <li class="nav-item">
                            <a href="#responsavelDataTabAlteracao" id="navResponsavelDataAlteracao" data-bs-toggle="tab" data-toggle="tab"  class="nav-link rounded-0 pt-2 pb-2 active">
                                <i class="far fa-calendar-alt"></i>
                                <span class="d-none d-sm-inline">Responsável e Data</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#agendamentoServicesTabAlteracao" id="navAgendamentoServicesAlteracao" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                <i class="fas fa-hammer"></i>
                                <span class="d-none d-sm-inline">Serviços</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#resumoAgendamentoTabAlteracao" id="navResumoAgendamentoAlteracao" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                <i class="fas fa-address-card"></i>
                                <span class="d-none d-sm-inline">Resumo e Revisão</span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content b-0 mb-0">
                        <div class="tab-pane active" id="responsavelDataTabAlteracao">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row mb-3">
                                        <input type="hidden" class="form-control" id="addressAgendamentoAlteracao" value="">
                                        <input type="hidden" class="form-control" id="clientAgendamentoAlteracao" value="">
                                        <label class="col-md-3 col-form-label" for="nomeAgendamentoAlteracao">Nome do responsável</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="nomeAgendamentoAlteracao" name="nomeAgendamentoAlteracao" value="">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="dataAlteracao"> Data do Agendamento ({{ App\Http\Traits\SystemTrait::datePadraoText() }})</label>
                                        <div class="col-md-9">
                                            <input type='text' id="dataAgendamentoAlteracao" class='form-control datepicker-here' data-timepicker="true" data-language='pt-BR' data-toggle="input-mask" data-mask-format="00-00-0000 00:00:00" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label class="col-md-3 col-form-label" for="obsAlteracao"> Observação</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="obsAgendamentoAlteracao" name="obsAgendamentoAlteracao" value="">
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
                        </div>

                        <div class="tab-pane" id="agendamentoServicesTabAlteracao">
                            <div class="row">
                                <div class="row">
                                    <div class="col-md-8 spaceForm">
                                        <label for="novoServicoAgendamentoAlteracao" class="form-label">Adicionar um serviço</label>
                                        <select class="form-control" id="novoServicoAgendamentoAlteracao" name="novoServicoAgendamentoAlteracao">
                                            <option value="" >selecione uma opção</option>
                                            {{--@foreach ($servicesCliente as $servicesCliente)
                                                <option value="{{ $servicesCliente->id }}">{{ $servicesCliente->name}}</option>
                                            @endforeach--}}
                                        </select>
                                    </div>
                                    <div class="col-md-4 spaceForm">
                                        <div class="class"></div>
                                        <label for="novoPrecoAgendamentoAlteracao" class="form-label">Adicionar um Preço (US$)</label>
                                        <input type="text" name="novoPrecoAgendamentoAlteracao" id="novoPrecoAgendamentoAlteracao" class="form-control price" data-toggle="input-mask" data-mask-format="000.000.000.000,00" data-reverse="true">
                                    </div>
                                    <div class="spaceForm"></div>
                                    <div class="col-md-12">
                                        <button type="button" id="adicionarServicoAgendamentoAlteracao" value="" class="btn btn-info">adicionar serviço</button>
                                    </div>
                                    <div class="col-md-12 spaceForm">
                                        <hr>
                                        <h4>Lista de Serviços do Agendamento</h4>
                                        <table id="tblListaServicoAgendamentoAlteracao" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        </table>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
                        </div>

                        <div class="tab-pane" id="resumoAgendamentoTabAlteracao">
                            <div class="row">
                                <div class="col-12">
                                    <div class="text-center">
                                        <h2 class="mt-0"><i class="fas fa-exclamation-circle"></i></h2>
                                        <h3 class="mt-0">Reveja as Informações</h3>

                                        <div class="row" id="resumeHTMLAgendamentoAlteracao">

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
                <button type="button" id="salvaAlterarAgendamento" value="" class="btn btn-info">Salvar Alteração no Agendamento</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{{--fim Modal para novo Alterar--}}

{{--Modal para muda status Agendamento--}}
<div id="modalMudaStatusAgendamento" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalMudaStatusAgendamentoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info modal-colored-header">
                <h4 class="modal-title" id="modalMudaStatusAgendamentoLabel">Atribuir Status para o Agendamento</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <form class="form-post-ClienteServico" autocomplete="off" name="novoServico">
                @csrf
            <div class="modal-body">
                <div class="row" id="verHTMLmodalMudaStatusAgendamento">
                    <div class="col-md-12">
                        <label for="statusMudaAgendamento" class="form-label">Selecione um Status</label>
                        <select class="form-control" id="valorAlterarStatusAgendamento" name="valorAlterarStatusAgendamento">
                            <option value="" >selecione uma opção</option>
                            @foreach ($status_scheduling as $s)
                                <option value="{{ $s->cod_status }}">{{ $s->status_scheduling}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-12 spaceForm">
                        <label for="obsStatusMudaAgendamento" class="form-label">Acrescente uma observação</label>
                        <input type="text" class="form-control" id="valorAlterarObsAgendamento" value="">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="fecharModalMudaStatusAgendamento" class="btn btn-danger" data-bs-dismiss="modal">Fechar</button>
                <button type="button" id="salvaAlterarStatusAgendamento" value="" class="btn btn-info">Salvar</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{{--fim Modal para muda status Agendamento--}}


{{--Modal para muda status Agendamento--}}
<div id="modalEditarValorServicoAgendamento" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" tabindex="-1" role="dialog" aria-labelledby="modalEditarValorServicoAgendamentoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info modal-colored-header">
                <h4 class="modal-title" id="modalEditarValorServicoAgendamentoLabel">Atribuir Novo Valor para Serviço</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                <div class="row" id="verHTMLmodalEditarValorServicoAgendamento">
                    <div class="col-md-12" id="servicoMudarValor">

                    </div>

                    <div class="col-md-12 spaceForm" id="priceMudarValor">
                        <label for="priceMudarValor" class="form-label">Novo Valor</label>
                        <input type="text" id="novoValorPrecoServicoAgendamento" class="form-control price" data-toggle="input-mask" data-mask-format="000.000.000.000,00" data-reverse="true">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="fecharmodalEditarValorServicoAgendamento" class="btn btn-danger">Fechar</button>
                <button type="button" id="salvaNovoValorServicoAgendamento" value="" class="btn btn-info">Salvar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
{{--fim Modal para muda status Agendamento--}}
