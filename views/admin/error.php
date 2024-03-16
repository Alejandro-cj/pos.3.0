<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags requeridos -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página no Encontrada</title>
    <!-- Estilos CSS -->
    <link href="PATH_TO_BOOTSTRAP_CSS" rel="stylesheet">
    <link href="PATH_TO_FONTAWESOME_CSS" rel="stylesheet">
    <link href="PATH_TO_CUSTOM_CSS" rel="stylesheet">
</head>

<body>
    <?php include_once 'views/templates/header.php'; ?>

    <div class="error-404 d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="card py-5">
                <div class="row g-0">
                    <div class="col col-xl-5">
                        <div class="card-body p-4">
                            <h1 class="display-1"><span class="text-primary">4</span><span class="text-danger">0</span><span class="text-success">4</span></h1>
                            <h4 class="font-weight-bold display-4">Página no Encontrada</h4>
                            <p>You have reached the edge of the universe.
                                <br>The page you requested could not be found.
                                <br>Don't worry and return to the previous page.
                            </p>
                            <div class="mt-5">
                                <a href="PATH_TO_ADMIN_PAGE" class="btn btn-primary btn-lg px-md-5 radius-30">Regresar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-7">
                        <img src="https://cdn.searchenginejournal.com/wp-content/uploads/2019/03/shutterstock_1338315902.png" class="img-fluid" alt="">
                    </div>
                </div>
                <!--end row-->
            </div>
        </div>
    </div>

    <?php include_once 'views/templates/footer.php'; ?>
    <!-- Scripts JS -->
    <script src="PATH_TO_JQUERY_JS"></script>
    <script src="PATH_TO_BOOTSTRAP_JS"></script>
    <script src="PATH_TO_CUSTOM_JS"></script>
</body>

</html>
