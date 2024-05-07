<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $data['title']; ?></title>
</head>

<body>
    <div class="datos-empresa">
        <p style="text-align: center;"><?php echo $data['empresa']['nombre']; ?></p>
        <p style="text-align: center;"><?php echo $data['empresa']['telefono']; ?></p>
        <p style="text-align: center;"><?php echo $data['empresa']['direccion']; ?></p>
    </div>
    <h5 class="title">Datos del Cliente</h5>
    <div class="datos-info">
        <p><strong><?php echo $data['venta']['identidad']; ?>: </strong> <?php echo $data['venta']['num_identidad']; ?></p>
        <p><strong>Nombre: </strong> <?php echo $data['venta']['nombre']; ?></p>
        <p><strong>Teléfono: </strong> <?php echo $data['venta']['telefono']; ?></p>
    </div>
    <h5 class="title">Detalle de los Productos</h5>
    <table style="width: 100%;">
        <thead style="background-color: black;">
            <tr>
                <th style="color: white;">Cant</th>
                <th style="color: white;">Descripción</th>
                <th style="color: white;">Precio</th>
                <th style="color: white;">SubTotal</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $productos = json_decode($data['venta']['productos'], true);
            foreach ($productos as $producto) { ?>
                <tr>
                    <td><?php echo $producto['cantidad']; ?></td>
                    <td><?php echo $producto['nombre']; ?></td>
                    <td><?php echo number_format($producto['precio'], 2); ?></td>
                    <td><?php echo number_format($producto['cantidad'] * $producto['precio'], 2); ?></td>
                </tr>
            <?php } ?>
            <tr>
                <td class="text-right" colspan="3">Descuento</td>
                <td class="text-right"><?php echo number_format($data['venta']['descuento'], 2); ?></td>
            </tr>
            <tr>
                <td class="text-right" colspan="3">Total con descuento</td>
                <td class="text-right"><?php echo number_format($data['venta']['total'] - $data['venta']['descuento'], 2); ?></td>
            </tr>
            <tr>
                <td class="text-right" colspan="3">Total sin descuento</td>
                <td class="text-right"><?php echo number_format($data['venta']['total'], 2); ?></td>
            </tr>
        </tbody>
    </table>
    <div class="mensaje">
        <h4><?php echo $data['venta']['metodo'] ?></h4>
        <?php echo $data['empresa']['mensaje']; ?>
        <?php if ($data['venta']['estado'] == 0) { ?>
            <h1>Venta Anulado</h1>
        <?php } ?>
    </div>

</body>

</html>