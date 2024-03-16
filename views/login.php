<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--favicon-->
    <link rel="shortcut icon" type="image/x-icon" href="PATH_TO_YOUR_FAVICON">
    <!--plugins-->
    <link href="PATH_TO_SIMPLEBAR_CSS" rel="stylesheet">
    <link href="PATH_TO_PERFECT_SCROLLBAR_CSS" rel="stylesheet">
    <link href="PATH_TO_METISMENU_CSS" rel="stylesheet">
    <!-- loader-->
    <link href="PATH_TO_PACE_CSS" rel="stylesheet">
    <script src="PATH_TO_PACE_JS"></script>
    <!-- Bootstrap CSS -->
    <link href="PATH_TO_BOOTSTRAP_CSS" rel="stylesheet">
    <link href="PATH_TO_BOOTSTRAP_EXTENDED_CSS" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="PATH_TO_APP_CSS" rel="stylesheet">
    <link href="PATH_TO_ICONS_CSS" rel="stylesheet">
    <title>TITLE - TITLE VARIABLE HERE</title>
</head>

<body class="bg-login">
    <!--wrapper-->
    <div class="wrapper">
        <div class="section-authentication-signin d-flex align-items-center justify-content-center my-5 my-lg-0">
            <div class="container-fluid">
                <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
                    <div class="col mx-auto">
                        <div class="mb-4 text-center">
                            <img src="PATH_TO_YOUR_LOGO" width="180" alt="" />
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="border p-4 rounded">
                                    <div class="text-center">
                                        <h3 class="">Iniciar Sesión</h3>
                                    </div>
                                    <div class="login-separater text-center mb-4">
                                        <span>OR SIGN IN WITH EMAIL</span>
                                        <hr />
                                    </div>
                                    <div class="form-body">
                                        <form class="row g-3" id="formulario" method="POST" autocomplete="off">
                                            <div class="col-12">
                                                <label for="correo" class="form-label">Correo Electrónico</label>
                                                <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo Electrónico">
                                                <span id="errorCorreo" class="text-danger"></span>
                                            </div>
                                            <div class="col-12">
                                                <label for="clave" class="form-label">Contraseña</label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input type="password" class="form-control border-end-0" id="clave" name="clave" placeholder="Contraseña">
                                                    <a href="javascript:;" class="input-group-text bg-transparent"><i class='bx bx-hide'></i></a>
                                                </div>
                                                <span id="errorClave" class="text-danger"></span>
                                            </div>
                                            <div class="col-md-12 text-end">
                                                <a href="PATH_TO_FORGOT_PASSWORD">Olvidaste tu contraseña?</a>
                                            </div>
                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary"><i class="bx bxs-lock-open"></i>Acceso</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end row-->
            </div>
        </div>
    </div>
    <!--end wrapper-->
    <!-- Bootstrap JS -->
    <script src="PATH_TO_BOOTSTRAP_BUNDLE_JS"></script>
    <!--plugins-->
    <script src="PATH_TO_JQUERY_JS"></script>
    <script src="PATH_TO_SIMPLEBAR_JS"></script>
    <script src="PATH_TO_METISMENU_JS"></script>
    <script src="PATH_TO_PERFECT_SCROLLBAR_JS"></script>
    <!--Password show & hide js -->
    <script>
        $(document).ready(function() {
            $("#show_hide_password a").on('click', function(event) {
                event.preventDefault();
                if ($('#show_hide_password input').attr("type") == "text") {
                    $('#show_hide_password input').attr('type', 'password');
                    $('#show_hide_password i').addClass("bx-hide");
                    $('#show_hide_password i').removeClass("bx-show");
                } else if ($('#show_hide_password input').attr("type") == "password") {
                    $('#show_hide_password input').attr('type', 'text');
                    $('#show_hide_password i').removeClass("bx-hide");
                    $('#show_hide_password i').addClass("bx-show");
                }
            });
        });
    </script>
    <!--app JS-->
    <script src="PATH_TO_APP_JS"></script>
    <script src="PATH_TO_SWEETALERT_JS"></script>
    <script>
        const base_url = 'BASE_URL_HERE';
    </script>
    <script src="PATH_TO_LOGIN_JS"></script>
</body>

</html>
