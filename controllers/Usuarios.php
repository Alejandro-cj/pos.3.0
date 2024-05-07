<?php
class Usuarios extends Controller
{
    private $id_usuario;
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['id_usuario'])) {
            header('Location: ' . BASE_URL);
            exit;
        }        
        $this->id_usuario = $_SESSION['id_usuario'];
    }
    public function index()
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        $data['title'] = 'Usuarios';
        $data['script'] = 'usuarios.js';
        $data['roles'] = $this->model->getRoles(1);
        $this->views->getView('usuarios', 'index', $data);
    }
    public function listar()
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        $data = $this->model->getUsuarios(1);
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['id'] == 1) {
                $data[$i]['acciones'] = '';
            } else {
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-danger" type="button" onclick="eliminarUsuario(' . $data[$i]['id'] . ')"><i class="fas fa-times-circle"></i></button>
                <button class="btn btn-info" type="button" onclick="editarUsuario(' . $data[$i]['id'] . ')"><i class="fas fa-edit"></i></button>
                </div>';
            }            
            if ($data[$i]['rol'] == 1) {
                $data[$i]['rol'] = '<span class="badge bg-success">ADMINISTRADOR</span>';
            } else {
                $data[$i]['rol'] = '<span class="badge bg-info">VENDEDOR</span>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    //metodo para registrar y modificar
    public function registrar()
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        if (isset($_POST)) {
            if (empty($_POST['nombres'])) {
                $res = array('msg' => 'EL NOMBRE ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['apellidos'])) {
                $res = array('msg' => 'EL APELLIDO ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['correo'])) {
                $res = array('msg' => 'EL CORREO ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['telefono'])) {
                $res = array('msg' => 'EL TELÉFONO ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['direccion'])) {
                $res = array('msg' => 'LA DIRECCIÓN ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['clave'])) {
                $res = array('msg' => 'LA CLAVE ES REQUERIDO', 'type' => 'warning');
            } else if (empty($_POST['rol'])) {
                $res = array('msg' => 'EL ROL ES REQUERIDO', 'type' => 'warning');
            } else {
                $nombres = strClean($_POST['nombres']);
                $apellidos = strClean($_POST['apellidos']);
                $correo = strClean($_POST['correo']);
                $telefono = strClean($_POST['telefono']);
                $direccion = strClean($_POST['direccion']);
                $clave = strClean($_POST['clave']);
                $rol = strClean($_POST['rol']);
                $id = strClean($_POST['id']);

                if ($id == '') {
                    $hash = password_hash($clave, PASSWORD_DEFAULT);
                    //verificar si existe los datos
                    $verificarCorreo = $this->model->getValidar('correo', $correo, 'registrar', 0);
                    if (empty($verificarCorreo)) {
                        $verificarTel = $this->model->getValidar('telefono', $telefono, 'registrar', 0);
                        if (empty($verificarTel)) {
                            $data = $this->model->registrar(
                                $nombres,
                                $apellidos,
                                $correo,
                                $telefono,
                                $direccion,
                                $hash,
                                $rol
                            );
                            if ($data > 0) {
                                $res = array('msg' => 'USUARIO REGISTRADO', 'type' => 'success');
                            } else {
                                $res = array('msg' => 'ERROR AL REGISTRAR', 'type' => 'error');
                            }
                        } else {
                            $res = array('msg' => 'EL TELÉFONO DEBE SER ÚNICO', 'type' => 'warning');
                        }
                    } else {
                        $res = array('msg' => 'EL CORREO DEBE SER ÚNICO', 'type' => 'warning');
                    }
                } else {
                    //verificar si existe los datos
                    $verificarCorreo = $this->model->getValidar('correo', $correo, 'modificar', $id);
                    if (empty($verificarCorreo)) {
                        $verificarTel = $this->model->getValidar('telefono', $telefono, 'modificar', $id);
                        if (empty($verificarTel)) {
                            $data = $this->model->actualizar(
                                $nombres,
                                $apellidos,
                                $correo,
                                $telefono,
                                $direccion,
                                $rol,
                                $id
                            );
                            if ($data > 0) {
                                $res = array('msg' => 'USUARIO ACTUALIZADO', 'type' => 'success');
                            } else {
                                $res = array('msg' => 'ERROR AL ACTUALIZAR', 'type' => 'error');
                            }
                        } else {
                            $res = array('msg' => 'EL TELÉFONO DEBE SER ÚNICO', 'type' => 'warning');
                        }
                    } else {
                        $res = array('msg' => 'EL CORREO DEBE SER ÚNICO', 'type' => 'warning');
                    }
                }
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }
    //metodo para eliminar registro
    public function eliminar($id)
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        if (isset($_GET)) {
            if (is_numeric($id)) {
                $data = $this->model->eliminar(0, $id);
                if ($data == 1) {
                    $res = array('msg' => 'USUARIO DADO DE BAJA', 'type' => 'success');
                } else {
                    $res = array('msg' => 'ERROR AL ELIMINAR', 'type' => 'error');
                }
            } else {
                $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function editar($id)
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        $data = $this->model->editar($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    //vista inactivos
    public function inactivos()
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        $data['title'] = 'Usuarios Inactivos';
        $data['script'] = 'usuarios-inactivos.js';
        $this->views->getView('usuarios', 'inactivos', $data);
    }
    public function listarInactivos()
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        $data = $this->model->getUsuarios(0);
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['rol'] == 1) {
                $data[$i]['rol'] = '<span class="badge bg-success">ADMINISTRADOR</span>';
            } else {
                $data[$i]['rol'] = '<span class="badge bg-info">VENDEDOR</span>';
            }
            $data[$i]['acciones'] = '<div>
            <button class="btn btn-danger" type="button" onclick="restaurarUsuario(' . $data[$i]['id'] . ')"><i class="fas fa-check-circle"></i></button>
            </div>';
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    //metodo para eliminar registro
    public function restaurar($id)
    {
        if (!verificar('usuarios')){
            header('Location: ' . BASE_URL . 'admin/permisos');
            exit;
        }
        if (isset($_GET)) {
            if (is_numeric($id)) {
                $data = $this->model->eliminar(1, $id);
                if ($data == 1) {
                    $res = array('msg' => 'USUARIO RESTAURADO', 'type' => 'success');
                } else {
                    $res = array('msg' => 'ERROR AL RESTAURAR', 'type' => 'error');
                }
            } else {
                $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
            }
        } else {
            $res = array('msg' => 'ERROR DESCONOCIDO', 'type' => 'error');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    //perfil
    public function profile()
    {
        $data['title'] = 'Datos del usuario';
        $data['script'] = 'profile.js';
        $data['usuario'] = $this->model->editar($this->id_usuario);
        $this->views->getView('usuarios', 'perfil', $data);
    }

    public function modificarDatos()
    {
        $nombre = strClean($_POST['nombrePerfil']);
        $apellidos = strClean($_POST['apellidoPerfil']);
        $correo = strClean($_POST['correoPerfil']);
        $telefono = strClean($_POST['telefonoPerfil']);
        $direccion = strClean($_POST['direccionPerfil']);
        $claveNueva = strClean($_POST['claveNueva']);
        $claveActual = strClean($_POST['claveActual']);

        $foto = $_FILES['fotoPerfil'];
        $name = $foto['name'];
        $tmp = $foto['tmp_name'];

        $verificarPerfil = $this->model->editar($this->id_usuario);
        $destino = $verificarPerfil['perfil'];

        if (!empty($name)) {
            if (file_exists($destino)) {
                unlink($destino);
            }
            $perfil = date('YmdHis') . $correo . '.jpg';
            $destino = 'assets/images/perfil/' . $perfil;
        }

        if (empty($nombre)) {
            $res = array('msg' => 'EL NOMBRE ES REQUERIDO', 'type' => 'warning');
        } else if (empty($apellidos)) {
            $res = array('msg' => 'EL APELLIDO ES REQUERIDO', 'type' => 'warning');
        } else if (empty($correo)) {
            $res = array('msg' => 'EL CORREO ES REQUERIDO', 'type' => 'warning');
        } else if (empty($telefono)) {
            $res = array('msg' => 'EL TELÉFONO ES REQUERIDO', 'type' => 'warning');
        } else if (empty($direccion)) {
            $res = array('msg' => 'LA DIRECCIÓN ES REQUERIDO', 'type' => 'warning');
        } else {
            $verificarClave = $this->model->editar($this->id_usuario);
            if (empty($claveNueva)) {
                $hash =  $verificarClave['clave'];
                $verificarCorreo = $this->model->getValidar('correo', $correo, 'actualizar', $this->id_usuario);
                if (empty($verificarCorreo)) {
                    $verificarTel = $this->model->getValidar('telefono', $telefono, 'actualizar', $this->id_usuario);
                    if (empty($verificarTel)) {
                        $data = $this->model->modificarDatos($nombre, $apellidos, $correo, $telefono, $direccion, $hash, $destino, $this->id_usuario);
                        if ($data == 1) {
                            if (!empty($name)) {
                                move_uploaded_file($tmp, $destino);
                            }
                            $res = array('msg' => 'DATOS MODIFICADO', 'type' => 'success', 'clave' => false);
                        } else {
                            $res = array('msg' => 'ERROR AL MODIFICAR', 'type' => 'error');
                        }
                    } else {
                        $res = array('msg' => 'EL TELEFONO DEBE SER UNICO', 'type' => 'warning');
                    }
                } else {
                    $res = array('msg' => 'EL CORREO DEBE SER UNICO', 'type' => 'warning');
                }
            } else {
                if (password_verify($claveActual, $verificarClave['clave'])) {
                    $verificarCorreo = $this->model->getValidar('correo', $correo, 'actualizar', $this->id_usuario);
                    if (empty($verificarCorreo)) {
                        $verificarTel = $this->model->getValidar('telefono', $telefono, 'actualizar', $this->id_usuario);
                        if (empty($verificarTel)) {
                            $hash = password_hash($claveNueva, PASSWORD_DEFAULT);
                            $data = $this->model->modificarDatos($nombre, $apellidos, $correo, $telefono, $direccion, $hash, $destino, $this->id_usuario);
                            if ($data == 1) {
                                if (!empty($name)) {
                                    move_uploaded_file($tmp, $destino);
                                }
                                $res = array('msg' => 'DATOS MODIFICADO', 'type' => 'success', 'clave' => true);
                            } else {
                                $res = array('msg' => 'ERROR AL MODIFICAR', 'type' => 'error');
                            }
                        } else {
                            $res = array('msg' => 'EL TELEFONO DEBE SER UNICO', 'type' => 'warning');
                        }
                    } else {
                        $res = array('msg' => 'EL CORREO DEBE SER UNICO', 'type' => 'warning');
                    }
                } else {
                    $res = array('msg' => 'CONTRASEÑA ACTUAL INCORRECTA', 'type' => 'warning');
                }
            }
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function salir()
    {
        $evento = 'Cierre de Sesión';
        $ip = $_SERVER['REMOTE_ADDR'];
        $detalle = $_SERVER['HTTP_USER_AGENT'];
        $acceso = $this->model->registrarAcceso($evento, $ip, $detalle);
        if ($acceso > 0) {
            session_destroy();
            header('Location: ' . BASE_URL);
        }
    }
}
