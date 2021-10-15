<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>{{ $title_page }} | System Control</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="{{ asset('images/teacher.png') }}">

        <!-- third party css -->
        <link href="{{ asset('css/vendor/jquery-jvectormap-1.2.2.css') }}" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="{{ asset('css/fontawesome.all.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/app.min.css') }}" rel="stylesheet" type="text/css" id="light-style" />
        <link href="{{ asset('css/app-dark.min.css') }}" rel="stylesheet" type="text/css" id="dark-style" />
        <link href="{{ asset('css/vendor/sweetalert2.min.css') }}" rel="stylesheet" type="text/css"/>
        <link href="{{ asset('css/vendor/dataTables.bootstrap5.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/vendor/responsive.bootstrap5.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/vendor/buttons.bootstrap5.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/vendor/select.bootstrap5.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/vendor/datepicker.min.css') }}" rel="stylesheet" type="text/css" />
        {{--link href="está usando do App.min.css, mas tem o arquivo original" rel="stylesheet" type="text/css"--}}
        <link href="{{ asset('css/style.css') }}" rel="stylesheet" type="text/css"/>

        <!-- css Personalizado-->
        @yield('CssPersonalizado')
        <!-- end css Personalizado-->

    </head>
     {{-- leftSidebarCondensed":true esse comando recua a sidebar, caso false ela é exibida por completa --}}
    <body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
        <div id="preloader" class="center">
            <div class="loadingio-spinner-ripple-kpzf7g4rqf"><div class="ldio-s13gk5kbh9a"><div></div><div></div></div></div>
          </div>
        <!-- Begin page -->
        <div class="wrapper">
            @include('layouts.dashTemplate.sidebar')
            <!-- ========== Header Start ========== -->
            @include('layouts.dashTemplate.navbar')
            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title">{{ $title_page }}</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                @yield('content')

            </div><!--end container-fluid-->

        </div>
        <!-- content -->

        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>document.write(new Date().getFullYear())</script> © AfroCode
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->


        <!-- bundle -->
        <script src="{{ asset('js/vendor.min.js') }}"></script>
        <script src="{{ asset('js/app.min.js') }}"></script>
        <script src="{{ asset('js/fontawesome.all.min.js') }}"></script>
        <script src="{{ asset('js/vendor/blockUI.js') }}"></script>
        <script src="{{ asset('js/vendor/jquery.inputmask.min.js') }}"></script>
        <script src="{{ asset('js/vendor/inputmask.binding.js') }}"></script>
        <script src="{{ asset('js/vendor/sweetalert2.all.min.js') }}"></script>

        <!-- third party js -->
        <!-- DataTables js -->
        <script src="{{ asset('js/vendor/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('js/vendor/dataTables.bootstrap5.js') }}"></script>
        <script src="{{ asset('js/vendor/dataTables.responsive.min.js') }}"></script>
        <script src="{{ asset('js/vendor/dataTables.buttons.min.js') }}"></script>
        <script src="{{ asset('js/vendor/dataTables.keyTable.min.js') }}"></script>
        <script src="{{ asset('js/vendor/dataTables.select.min.js') }}"></script>
        <!-- end DataTables js -->

        <script src="{{ asset('js/vendor/responsive.bootstrap5.min.js') }}"></script>
        <script src="{{ asset('js/vendor/buttons.bootstrap5.min.js') }}"></script>
        <script src="{{ asset('js/vendor/buttons.html5.min.js') }}"></script>
        <script src="{{ asset('js/vendor/buttons.flash.min.js') }}"></script>
        <script src="{{ asset('js/vendor/buttons.print.min.js') }}"></script>
        <script src="{{ asset('js/vendor/select2.min.js') }}"></script>
        <script src="{{ asset('js/vendor/datepicker.min.js') }}"></script>
        <script src="{{ asset('js/vendor/datepicker.pt-BR.js') }}"></script>
        <script src="{{ asset('js/vendor/datepicker.en.js') }}"></script>
        <script src="{{ asset('js/vendor/datepicker.es.js') }}"></script>
        <!-- third party js ends -->

        <!-- ferramentas JS  -->
        @yield('toolsJs')
        <script>
            const base_URL = '{{ env("APP_URL") }}'
            function bloquear() {
                $.blockUI({
                    css: {
                        border: "none",
                        padding: "15px",
                        backgroundColor: "transparent",
                        color: "#fff",
                        "z-index": 9999
                    },
                    message:
                        '<div class="loadingio-spinner-ripple-kpzf7g4rqf"><div class="ldio-s13gk5kbh9a"><div></div><div></div></div></div>'
                })
            }

            function desbloquear() {
                $.unblockUI();
            }

            !(function(t) {
                t(window).on("load", function() {
                    t("#status").fadeOut(),
                        t("#preloader")
                            .delay(350)
                            .fadeOut("slow");
                })
            })

            $(document).ready( function () {

                $('.dataTables').DataTable({
                    "order": [],
                    "language":{
                        "url": base_URL+'/js/language/dataTables.Portuguese-Brasil.json'
                    }
                });
                $('.select2').select2();

                /*sidebar functions*/
                $(".select2modal").select2({
                    dropdownParent: $("#lista-cliente-modal")
                });
                /*fim sidebar functions*/

                $('#listarAluno').click(function(){
                    let aluno = $('#listaAluno').val()

                    if (0 == aluno || '' == aluno || null == aluno) {
                        Swal.fire(
                            'Atenção!',
                            'Por Favor Selecione um Aluno',
                            'info'
                        )
                    } else {
                        bloquear();
                        window.location =  base_URL+'/dadosAluno/'+aluno
                    }
                })

                $('#listarResponsavel').click(function(){
                    let responsavel = $('#listaResponsavel').val()

                    if (0 == responsavel || '' == responsavel || null == responsavel) {
                        Swal.fire(
                            'Atenção!',
                            'Por Favor Selecione um responsável',
                            'info'
                        )
                    } else {
                        bloquear();
                        window.location =  base_URL+'/dadosResponsavel/'+responsavel
                    }
                })
            });


                    /*$.post(base_URL+'/dicionaryDataTables',{
                        id_pagina:4
                    }, function (response){
                        dicionary = $.parseJSON(response)
                    })*/


        </script>
        @yield('formJs')
        <!-- end sys app js-->

        <!-- js Personalizado-->
        @yield('JsPersonalizado')
        <!-- end js Personalizado-->
        </body>
        </html>

