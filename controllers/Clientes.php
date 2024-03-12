<?php
class Clientes extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['id_usuario'])) {
            header('Location: ' . BASE_URL);
            exit;
        }
    }
    public function index()
    {
        $data['title'] = 'Clientes';
        $data['script'] = 'clientes.js';
        $this->views->getView('clientes', 'index', $data);
    }
    public function listar()
    {
        $data = $this->model->getClientes(1);
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['acciones'] = '<div>
            <button class="btn btn-danger" type="button" onclick="eliminarCliente(' . $data[$i]['id'] . ')"><i class="fas fa-trash"></i></button>
            <button class="btn btn-info" type="button" onclick="editarCliente(' . $data[$i]['id'] . ')"><i class="fas fa-edit"></i></button>
            </div>';
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrar()
    {
        if (isset($_POST['identidad']) && isset($_POST['num_identidad'])) {
            $id = strClean($_POST['id']);
            $identidad = strClean($_POST['identidad']);
            $num_identidad = strClean($_POST['num_identidad']);
            $nombre = strClean($_POST['nombre']);
            $telefono = strClean($_POST['telefono']);
            $correo = (empty($_POST['correo'])) ? null : strClean($_POST['correo']);
            $direccion = strClean($_POST['direccion']);
            if (empty($identidad)) {
                $res = array('msg' => 'LA IDENTIDAD ES REQUERIDO', 'type' => 'warning');
            } else if (empty($num_identidad)) {
                $res = array('msg' => 'LA N° DE IDENTIDAD ES REQUERIDO', 'type' => 'warning');
            } else if (empty($nombre)) {
                $res = array('msg' => 'EL NOMBRE ES REQUERIDO', 'type' => 'warning');
            } else if (empty($telefono)) {
                $res = array('msg' => 'EL TELEFONO ES REQUERIDO', 'type' => 'warning');
            } else if (empty($direccion)) {
                $res = array('msg' => 'LA DIRECCION ES REQUERIDO', 'type' => 'warning');
            } else {
                if ($id == '') {
                    $verificarIdentidad = $this->model->getValidar('num_identidad', $num_identidad, 'registrar', 0);
                    if (empty($verificarIdentidad)) {
                        $verificarTelefono = $this->model->getValidar('telefono', $telefono, 'registrar', 0);
                        if (empty($verificarTelefono)) {
                            if ($correo != null) {
                                $verificarCorreo = $this->model->getValidar('correo', $correo, 'registrar', 0);
                                if (!empty($verificarCorreo)) {
                                    $res = array('msg' => 'EL CORREO DEBE SER UNICO', 'type' => 'warning');
                                    echo json_encode($res);
                                    die();
                                }
                            }
                            $data = $this->model->registrar(
                                $identidad,
                                $num_identidad,
                                $nombre,
                                $telefono,
                                $correo,
                                $direccion
                            );
                            if ($data > 0) {
                                $res = array('msg' => 'CLIENTE REGISTRADO', 'type' => 'success');
                            } else {
                                $res = array('msg' => 'ERROR AL REGISTRAR', 'type' => 'error');
                            }
                        } else {
                            $res = array('msg' => 'EL TELEFONO DEBE SER UNICO', 'type' => 'warning');
                        }
                    } else {
                        $res = array('msg' => 'LA IDENTIDAD DEBE SER UNICO', 'type' => 'warning');
                    }
                } else {
                    $verificarIdentidad = $this->model->getValidar('num_identidad', $num_identidad, 'actualizar', $id);
                    if (empty($verificarIdentidad)) {
                        $verificarTelefono = $this->model->getValidar('telefono', $telefono, 'actualizar', $id);
                        if (empty($verificarTelefono)) {
                            if ($correo != null) {
                                $verificarCorreo = $this->model->getValidar('correo', $correo, 'actualizar', $id);
                                if (!empty($verificarCorreo)) {
                                    $res = array('msg' => 'EL CORREO DEBE SER UNICO', 'type' => 'warning');
                                    echo json_encode($res);
                                    die();
                                }
                            }
                            $data = $this->model->actualizar(
                                $identidad,
                                $num_identidad,
                                $nombre,
                                $telefono,
                                $correo,
                                $direccion,
                                $id
                            );
                            if ($data > 0) {
                                $res = array('msg' => 'CLIENTE MODIFICADO', 'type' => 'success');
                            } else {
                                $res = array('msg' => 'ERROR AL MODIFICAR', 'type' => 'error');
                            }
                        } else {
                            $res = array('msg' => 'EL TELEFONO DEBE SER UNICO', 'type' => 'warning');
                        }
                    } else {
                        $res = array('msg' => 'LA IDENTIDAD DEBE SER UNICO', 'type' => 'warning');
                    }
                }
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res);
        die();
    }

    public function eliminar($idCliente)
    {
        if (isset($_GET) && is_numeric($idCliente)) {
            $data = $this->model->eliminar(0, $idCliente);
            if ($data > 0) {
                $res = array('msg' => 'CLIENTE DADO DE BAJA', 'type' => 'success');
            } else {
                $res = array('msg' => 'ERROR AL ELIMINAR', 'type' => 'error');
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function editar($idCliente)
    {
        $data = $this->model->editar($idCliente);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function inactivos()
    {
        $data['title'] = 'Clientes  Inactivos';
        $data['script'] = 'clientes-inactivos.js';
        $this->views->getView('clientes', 'inactivos', $data);
    }
    public function listarInactivos()
    {
        $data = $this->model->getClientes(0);
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['acciones'] = '<div>
            <button class="btn btn-danger" type="button" onclick="restaurarCliente(' . $data[$i]['id'] . ')"><i class="fas fa-check-circle"></i></button>
            </div>';
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function restaurar($idCliente)
    {
        if (isset($_GET) && is_numeric($idCliente)) {
            $data = $this->model->eliminar(1, $idCliente);
            if ($data > 0) {
                $res = array('msg' => 'CLIENTE RESTAURADO', 'type' => 'success');
            } else {
                $res = array('msg' => 'ERROR AL RESTUARAR', 'type' => 'error');
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    //buscar clientes para la venta
    public function buscar()
    {
        $array = array();
        $valor = strClean($_GET['term']);
        $data = $this->model->buscarPorNombre($valor);
        foreach ($data as $row) {
            $result['id'] = $row['id'];
            $result['label'] = $row['nombre'];
            $result['telefono'] = $row['telefono'];
            $result['direccion'] = $row['direccion'];
            array_push($array, $result);
        }
        echo json_encode($array, JSON_UNESCAPED_UNICODE);
        die();
    }
}
