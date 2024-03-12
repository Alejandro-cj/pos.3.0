<?php
require 'vendor/autoload.php';

use Dompdf\Dompdf;

class Compras extends Controller
{
    private $id_usuario, $caja;
    public function __construct()
    {
        parent::__construct();
        require_once 'controllers/Cajas.php';
        $this->caja = new Cajas();
        if (empty($_SESSION['id_usuario'])) {
            header('Location: ' . BASE_URL);
            exit;
        }
        $this->id_usuario = $_SESSION['id_usuario'];
    }
    public function index()
    {
        $data['title'] = 'Compras';
        $data['script'] = 'compras.js';
        $data['busqueda'] = 'busqueda.js';
        $data['carrito'] = 'posCompra';
        $this->views->getView('compras', 'index', $data);
    }
    public function registrarCompra()
    {
        $json = file_get_contents('php://input');
        $datos = json_decode($json, true);
        $array['productos'] = array();
        $total = 0;
        if (!empty($datos['productos'])) {
            $indice = $datos['serie'];
            $numberSerie = $this->generate_numbers($indice, 1, 8);
            $fecha = date('Y-m-d');
            $hora = date('H:i:s');
            $serie = $numberSerie[0];
            $idproveedor = $datos['idProveedor'];
            if (empty($idproveedor)) {
                $res = array('msg' => 'EL PROVEEDOR ES REQUERIDO', 'type' => 'warning');
            } else if (empty($serie)) {
                $res = array('msg' => 'LA SERIE ES REQUERIDO', 'type' => 'warning');
            } else {
                $saldo = $this->caja->getDatos();
                foreach ($datos['productos'] as $producto) {
                    $result = $this->model->getProducto($producto['id']);
                    $data['id'] = $result['id'];
                    $data['nombre'] = $result['descripcion'];
                    $data['precio'] = $result['precio_compra'];
                    $data['cantidad'] = $producto['cantidad'];
                    $subTotal = $result['precio_compra'] * $producto['cantidad'];
                    array_push($array['productos'], $data);
                    $total += $subTotal;
                }
                if ($saldo['saldo'] >= $total) {
                    $datosProductos = json_encode($array['productos']);
                    $compra = $this->model->registrarCompra($datosProductos, $total, $fecha, $hora, $serie, $idproveedor, $this->id_usuario);
                    if ($compra > 0) {
                        foreach ($datos['productos'] as $producto) {
                            $result = $this->model->getProducto($producto['id']);
                            //actualizar stock
                            $nuevaCantidad = $result['cantidad'] + $producto['cantidad'];
                            $this->model->actualizarStock($nuevaCantidad, $result['id']);
                            $movimiento = 'Compra N°: ' . $compra;
                            $this->model->registrarMovimiento($movimiento, 'entrada', $producto['cantidad'], $nuevaCantidad, $producto['id'], $this->id_usuario);
                        }
                        $res = array('msg' => 'COMPRA GENERADA', 'type' => 'success', 'idCompra' => $compra);
                    } else {
                        $res = array('msg' => 'ERROR AL CREAR COMPRA', 'type' => 'error');
                    }
                } else {
                    $res = array('msg' => 'SALDO DISPONIBLE: ' . MONEDA . $saldo['saldo'], 'type' => 'warning');
                }
            }
        } else {
            $res = array('msg' => 'CARRITO VACIO', 'type' => 'warning');
        }
        echo json_encode($res);
        die();
    }

    public function reporte($datos)
    {
        ob_start();
        $array = explode(',', $datos);
        $tipo = $array[0];
        $idCompra = $array[1];

        $data['title'] = 'Reporte';
        $data['empresa'] = $this->model->getEmpresa();
        $data['compra'] = $this->model->getCompra($idCompra);
        if (empty($data['compra'])) {
            echo 'Pagina no Encontrada';
            exit;
        }
        $this->views->getView('compras', $tipo, $data);
        $html = ob_get_clean();
        $dompdf = new Dompdf();
        $options = $dompdf->getOptions();
        $options->set('isJavascriptEnabled', true);
        $options->set('isRemoteEnabled', true);
        $dompdf->setOptions($options);
        $dompdf->loadHtml($html);

        if ($tipo == 'ticked') {
            $dompdf->setPaper(array(0, 0, 222, 841), 'portrait');
        } else {
            $dompdf->setPaper('A4', 'vertical');
        }

        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser
        $dompdf->stream('ticked.pdf', array('Attachment' => false));
    }

    public function listar()
    {
        $data = $this->model->getCompras();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['acciones'] = '<div>
                <a class="btn btn-warning" href="#" onclick="anularCompra(' . $data[$i]['id'] . ')"><i class="fas fa-trash"></i></a>
                <a class="btn btn-danger" href="#" onclick="verReporte(' . $data[$i]['id'] . ')"><i class="fas fa-file-pdf"></i></a>
                </div>';
            } else {
                $data[$i]['acciones'] = '<div>
                <span class="badge bg-info">Anulado</span>
                <a class="btn btn-danger" href="#" onclick="verReporte(' . $data[$i]['id'] . ')"><i class="fas fa-file-pdf"></i></a>
                </div>';
            }
        }
        echo json_encode($data);
        die();
    }

    public function anular($idCompra)
    {
        if (isset($_GET) && is_numeric($idCompra)) {
            $data = $this->model->anular($idCompra);
            if ($data == 1) {
                $resultCompra = $this->model->getCompra($idCompra);
                $compraProducto = json_decode($resultCompra['productos'], true);
                foreach ($compraProducto as $producto) {
                    $result = $this->model->getProducto($producto['id']);
                    $nuevaCantidad = $result['cantidad'] - $producto['cantidad'];
                    $this->model->actualizarStock($nuevaCantidad, $producto['id']);
                    //movimientos
                    $movimiento = 'Devolución Compra N°: ' . $idCompra;
                    $this->model->registrarMovimiento($movimiento, 'salida', $producto['cantidad'], $nuevaCantidad, $producto['id'], $this->id_usuario);
                }
                $res = array('msg' => 'COMPRA ANULADO', 'type' => 'success');
            } else {
                $res = array('msg' => 'ERROR AL ANULAR', 'type' => 'error');
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res);
        die();
    }

    function generate_numbers($start, $count, $digits)
    {
        $result = array();
        for ($n = $start; $n < $start + $count; $n++) {
            $result[] = str_pad($n, $digits, "0", STR_PAD_LEFT);
        }
        return $result;
    }
}
