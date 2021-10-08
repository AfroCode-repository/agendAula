<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Log In | AgendAula</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="{{ asset('images/favicon.png') }}">

        <!-- App css -->
        <link href="{{ asset('css/fontawesome.all.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('css/app.min.css') }}" rel="stylesheet" type="text/css" id="light-style" />
        <link href="{{ asset('css/app-dark.min.css') }}" rel="stylesheet" type="text/css" id="dark-style" />
        <link href="{{ asset('css/vendor/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" id="dark-style" />
        <link href="{{ asset('css/style.css') }}" rel="stylesheet" type="text/css" id="dark-style" />

    </head>

    <body class="loading {{--authentication-bg--}}" style="background: #ffbe76" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
        <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-4 col-lg-5">
                        <div class="card">

                            <!-- Logo -->
                            <div class="card-header pt-4 pb-4 text-center" style="background-color: #f0932b">
                                    <img src="{{ asset('images/teacher.png') }}" alt="" height="80"><h1 style="color: #FFF">AgendAula</h1>

                            </div>

                            <div class="card-body p-4">

                                <div class="text-center w-75 m-auto">
                                    <h4 class="text-dark-50 text-center pb-0 fw-bold">Sign In</h4>
                                    <p class="text-muted mb-4">Entre com seu email e senha para acessar o painel Admin.</p>
                                </div>

                                <form method="POST" autocomplete="off" name="formLogin">
                                    @csrf
                                    @if ($errors->all())
                                        @foreach ($errors->all() as $error)
                                            <hr>
                                            <div class="alert alert-danger" role="alert">
                                                {{ $error }}
                                            </div>
                                        @endforeach
                                    @endif
                                    <div class="mb-3">
                                        <label class="form-label" for="email">{{ __('Email') }}</label>
                                        <!--label for="emailaddress" class="form-label">Email address</label-->
                                        <!--input class="form-control" type="email" id="emailaddress" required="" placeholder="Enter your email"-->
                                        <input id="email" type="text" class="form-control @error('email') is-invalid @enderror" placeholder="Informe seu Email" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <!--a href="pages-recoverpw.html" class="text-muted float-end"><small>Forgot your password?</small></a-->
                                        <!--label for="password" class="form-label">Password</label-->
                                        <label class="form-label" for="password">{{ __('Password') }}</label>
                                        <div class="input-group input-group-merge">
                                            <!--input type="password" id="password" class="form-control" placeholder="Enter your password"-->
                                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" placeholder="Informe sua Senha" name="password" required autocomplete="current-password">
                                            <div class="input-group-text" data-password="false">
                                                <span class="password-eye"></span>
                                            </div>
                                            @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="mb-3 mb-3">
                                        <!--div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="checkbox-signin" checked>
                                            <label class="form-check-label" for="checkbox-signin">Remember me</label>
                                        </div-->
                                    </div>

                                    <div class="mb-3 mb-0 text-center">
                                        <!--button class="btn btn-primary" type="submit"> Log In </button-->
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Entrar') }}
                                        </button>
                                    </div>

                                </form>
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                        <!--div class="row mt-3">
                            <div class="col-12 text-center">
                                <p class="text-muted">Don't have an account? <a href="pages-register.html" class="text-muted ms-1"><b>Sign Up</b></a></p>
                            </div> <-- end col >
                        </div-->
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

        <!--footer class="footer footer-alt">
            {{ date('Y') }} © afro Code
        </footer-->

        <!-- bundle -->
        <script src="{{ asset('js/vendor.min.js') }}"></script>
        <script src="{{ asset('js/app.min.js') }}"></script>
        <script src={{ asset('js/vendor/sweetalert2.all.min.js') }} ></script>
        <script src="{{ asset('js/fontawesome.all.min.js') }}"></script>
        <script src={{ asset('js/vendor/blockUI.js') }} ></script>
        <script src={{ asset('js/sysApp.js') }} ></script>
        <script>
            $(document).ready(function() {
                //action="{{ route('login') }}"
                $('form[name="formLogin"]').submit(function (){
                    event.preventDefault();
                    bloquear();
                    $.ajax({
                        url: "{{ route('realiza.login') }}",
                        type: 'POST',
                        data: $(this).serialize(),
                        dataType: 'json',
                        success: function(response){
                            if(true === response.success){
                                bloquear();
                                window.location = "{{ route('login') }}";
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
                });
            });
        </script>

    </body>
</html>
