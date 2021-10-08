<!-- ========== Left Sidebar Start ========== -->
            <div class="leftside-menu">

                <!-- LOGO -->
                <a href="/" class="logo text-center logo-light">
                    <span class="logo-lg">
                        <img src="{{ asset('images/teacher.png') }}" alt="" height="40">
                    </span>
                    <span class="logo-sm">
                        <img src="{{ asset('images/teacher.png') }}" alt="" height="40">
                    </span>
                </a>

                <!-- LOGO -->
                <a href="index.html" class="logo text-center logo-dark">
                    <span class="logo-lg">
                        <img src="{{ asset('images/logo-dark.png') }}" alt="" height="16">
                    </span>
                    <span class="logo-sm">
                        <img src="{{ asset('images/logo_sm_dark.png') }}" alt="" height="16">
                    </span>
                </a>

                <div class="h-100" id="leftside-menu-container" data-simplebar>

                    <!--- Sidemenu -->
                    <ul class="side-nav">
                        <li class="side-nav-item">
                            <a href="{{ route('show.Home') }}" class="side-nav-link">
                                <i class="fas fa-home"></i>
                                <span> Agendamentos </span>
                            </a>
                        </li>


                        <li class="side-nav-title side-nav-item">Aluno</li>

                        <li class="side-nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarClient" aria-expanded="false" aria-controls="sidebarClient" class="side-nav-link">
                                <i class="far fa-address-card"></i>
                                <span> Aluno </span>
                                {{--<span class="menu-arrow"><i class="fas fa-sort-down"></i></span>--}}
                                <span class="badge float-end"><i class="fas fa-sort-down"></i></span>
                            </a>
                            <div class="collapse" id="sidebarClient">
                                <ul class="side-nav-second-level">
                                    <li>
                                        <a href="123">Novo Aluno</a>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="modal" data-bs-keyboard="false" data-bs-backdrop="static" data-bs-target="#lista-cliente-modal">ver dados do Aluno</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    </ul>

                    <!-- End Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->

            <!--modais sidebar-->
            <div id="lista-cliente-modal" class="modal fade" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="modalClientServices" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header modal-colored-header bg-info">
                            <h4 class="modal-title" id="modalClientServices">Dados do Cliente e Agendamento</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-md-12">
                                <label for="listaAluno" class="form-label">Selecione um Cliente</label>
                                <select class="form-control select2modal" id="listaAluno">
                                    <option value="" >selecione uma opção</option>
                                    @foreach ($listaAlunos as $listaAluno)
                                        <option value="{{ $listaAluno->id }}">{{ $listaAluno->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <hr>
                            <div class="form-group col-md-12">
                                    <center><a id="listarClienteServico" value="0" class="btn btn-info"><i class="far fa-file-alt"></i> listar</a></center>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
