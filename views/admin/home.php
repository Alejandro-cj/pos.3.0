<?php include_once 'views/templates/header.php'; ?>

<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
    <div class="col">
        <div class="card radius-10 border-start border-0 border-3 border-info">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Usuarios</p>
                        <h4 class="my-1 text-info"><?php echo $data['usuarios']['total']; ?></h4>
                        <a class="mb-0 font-13" href="<?php echo BASE_URL . 'usuarios'; ?>">Detalle</a>
                    </div>
                    <div class="widgets-icons-2 rounded-circle bg-gradient-scooter text-white ms-auto">
                        <i class='fas fa-user'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10 border-start border-0 border-3 border-danger">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Clientes</p>
                        <h4 class="my-1 text-info"><?php echo $data['clientes']['total']; ?></h4>
                        <a class="mb-0 font-13" href="<?php echo BASE_URL . 'clientes'; ?>">Detalle</a>
                    </div>
                    <div class="widgets-icons-2 rounded-circle bg-gradient-bloody text-white ms-auto"><i class='fas fa-users'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10 border-start border-0 border-3 border-success">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Proveedores</p>
                        <h4 class="my-1 text-info"><?php echo $data['proveedores']['total']; ?></h4>
                        <a class="mb-0 font-13" href="<?php echo BASE_URL . 'proveedores'; ?>">Detalle</a>
                    </div>
                    <div class="widgets-icons-2 rounded-circle bg-gradient-ohhappiness text-white ms-auto">
                        <i class='fas fa-home'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10 border-start border-0 border-3 border-warning">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Productos</p>
                        <h4 class="my-1 text-info"><?php echo $data['productos']['total']; ?></h4>
                        <a class="mb-0 font-13" href="<?php echo BASE_URL . 'productos'; ?>">Detalle</a>
                    </div>
                    <div class="widgets-icons-2 rounded-circle bg-gradient-blooker text-white ms-auto">
                        <i class='fas fa-list'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end row-->

<div class="row">
    <div class="col-12 col-lg-8">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-0">Compras y Ventas</h6>
                    </div>
                    <div class="form-group">
                        <label for="anio">Año</label>
                        <select id="anio" onchange="comparacion()">
                            <?php
                            $fecha = date('Y');
                            for ($i = 2010; $i <= $fecha; $i++) { ?>
                                <option value="<?php echo $i; ?>" <?php echo ($fecha == $i) ? 'selected' : ''; ?>><?php echo $i; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="d-flex align-items-center ms-auto font-13 gap-2 my-3">
                    <span class="border px-1 rounded cursor-pointer"><i class="bx bxs-circle me-1" style="color: #14abef"></i>Ventas</span>
                    <span class="border px-1 rounded cursor-pointer"><i class="bx bxs-circle me-1" style="color: #ffc107"></i>Compras</span>
                </div>
                <div class="chart-container-1">
                    <canvas id="comparacion"></canvas>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-2 g-0 row-group text-center border-top">
                <div class="col">
                    <div class="p-3">
                        <h5 class="mb-0" id="totalVentas">00</h5>
                        <small class="mb-0">Total Ventas</small>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3">
                        <h5 class="mb-0" id="totalCompras">00</h5>
                        <small class="mb-0">Total Compras</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-lg-4">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <h6 class="mb-0">Top Productos</h6>
                    </div>
                    <div class="dropdown ms-auto">
                        <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown"><i class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/topProductosPdf'; ?>" target="_blank"><i class="fas fa-file-pdf text-danger"></i> Reporte PDF</a>
                            </li>
                            <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/topProductosExcel'; ?>"><i class="fas fa-file-excel text-success"></i> Reporte Excel</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="chart-container-2 mt-4">
                    <canvas id="topProductos"></canvas>
                </div>
            </div>
            <ul class="list-group list-group-flush">
                <?php foreach ($data['top'] as $top) { ?>
                    <li class="list-group-item d-flex bg-transparent justify-content-between align-items-center">
                        <?php echo $top['descripcion']; ?> <span class="badge bg-info rounded-pill"><?php echo $top['ventas']; ?></span>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<!--end row-->

<div class="card radius-10">
    <div class="card-body">
        <div class="d-flex align-items-center">
            <div>
                <h6 class="mb-0">Productos Recientes</h6>
            </div>
            <div class="dropdown ms-auto">
                <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown"><i class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/recientesPdf'; ?>" target="_blank"><i class="fas fa-file-pdf text-danger"></i> Reporte PDF</a>
                    </li>
                    <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/recientesExcel'; ?>"><i class="fas fa-file-excel text-success"></i> Reporte Excel</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Producto</th>
                        <th>Foto</th>
                        <th>Precio Compra</th>
                        <th>Precio Venta</th>
                        <th>Fecha</th>
                        <th>Categoria</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data['nuevos'] as $nuevo) {
                        if ($nuevo['foto'] == null) {
                            $foto = BASE_URL . 'assets/images/productos/default.png';
                        } else {
                            $foto = BASE_URL . $nuevo['foto'];
                        }
                    ?>
                        <tr>
                            <td><?php echo $nuevo['descripcion']; ?></td>
                            <td><img src="<?php echo $foto; ?>" class="product-img-2" alt="product img"></td>
                            <td><span class="badge bg-primary text-white shadow-sm w-100"><?php echo $nuevo['precio_compra']; ?></span>
                            </td>
                            <td><span class="badge bg-success text-white shadow-sm w-100"><?php echo $nuevo['precio_venta']; ?></span></td>
                            <td><?php echo $nuevo['fecha']; ?></td>
                            <td>
                                <?php echo $nuevo['categoria']; ?>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--end row-->

<div class="row row-cols-1 row-cols-lg-2">
    <div class="col d-flex">
        <div class="card radius-10 w-100">
            <div class="card-body">
                <div class="d-flex justify-content-between">
                    <p class="font-weight-bold mb-1 text-secondary">Gastos por Mes</p>
                    <div class="form-group">
                        <label for="anioGasto">Año</label>
                        <select id="anioGasto" onchange="reporteGastos()">
                            <?php
                            $fecha = date('Y');
                            for ($i = 2010; $i <= $fecha; $i++) { ?>
                                <option value="<?php echo $i; ?>" <?php echo ($fecha == $i) ? 'selected' : ''; ?>><?php echo $i; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <div class="chart-container-0">
                    <canvas id="gastos"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col d-flex">
        <div class="card radius-10 w-100">
            <div class="card-header bg-transparent">
                <div class="d-flex align-items-center">
                    <div>
                        <h6 class="mb-0">Productos con Stock Mínimo</h6>
                    </div>
                    <div class="dropdown ms-auto">
                        <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown"><i class='bx bx-dots-horizontal-rounded font-22 text-option'></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/stockMinimoPdf'; ?>" target="_blank"><i class="fas fa-file-pdf text-danger"></i> Reporte PDF</a>
                            </li>
                            <li><a class="dropdown-item" href="<?php echo BASE_URL . 'admin/stockMinimoExcel'; ?>"><i class="fas fa-file-excel text-success"></i> Reporte Excel</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-container-1">
                    <canvas id="stockMinimo"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end row-->

<?php include_once 'views/templates/footer.php'; ?>