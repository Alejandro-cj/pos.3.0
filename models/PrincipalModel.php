<?php
class PrincipalModel extends Query{
    public function __construct() {
        parent::__construct();
    }
    //datos para login
    public function getDatos($correo)
    {
        $sql = "SELECT u.id, u.nombre, u.correo, u.perfil, u.clave, u.rol, u.estado, r.nombre, r.permisos FROM usuarios u INNER JOIN roles r ON u.rol = r.id WHERE u.correo = '$correo'";
        return $this->select($sql);
    }
    public function verificarCorreo($correo)
    {
        $sql = "SELECT id FROM usuarios WHERE correo = '$correo'";
        return $this->select($sql);
    }

    public function registrarToken($token, $correo)
    {
        $sql = "UPDATE usuarios SET token = ? WHERE correo = ?";
        $array = array($token, $correo);
        return $this->save($sql, $array);
    }

    public function verificarToken($token)
    {
        $sql = "SELECT id, token FROM usuarios WHERE token = '$token'";
        return $this->select($sql);
    }

    public function modificarClave($clave, $token)
    {
        $sql = "UPDATE usuarios SET clave = ?, token = ? WHERE token = ?";
        $array = array($clave, null, $token);
        return $this->save($sql, $array);
    }

    //registrar log
    public function registrarAcceso($evento, $ip, $detalle)
    {
        $sql = "INSERT INTO acceso (evento, ip, detalle) VALUES (?,?,?)";
        $array = array($evento, $ip, $detalle);
        return $this->insertar($sql, $array);
    }
}

?>