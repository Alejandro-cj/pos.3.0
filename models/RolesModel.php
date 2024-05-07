<?php
class RolesModel extends Query{
    public function __construct() {
        parent::__construct();
    }
    public function getPermisos()
    {
        $sql = "SELECT * FROM permisos";
        return $this->selectAll($sql);
    }
    public function getRoles($estado)
    {
        $sql = "SELECT * FROM roles WHERE estado = $estado";
        return $this->selectAll($sql);
    }
    public function registrar($nombre, $permisos)
    {
        $sql = "INSERT INTO roles (nombre, permisos) VALUES (?,?)";
        $array = array($nombre, $permisos);
        return $this->insertar($sql, $array);
    }
    public function getValidar($campo, $valor, $accion, $id)
    {
        if ($accion == 'registrar' && $id == 0) {
            $sql = "SELECT id FROM roles WHERE $campo = '$valor'";
        }else{
            $sql = "SELECT id FROM roles WHERE $campo = '$valor' AND id != $id";
        }
        return $this->select($sql);
    }
    public function eliminar($estado, $idRol)
    {
        $sql = "UPDATE roles SET estado = ? WHERE id = ?";
        $array = array($estado, $idRol);
        return $this->save($sql, $array);
    }

    public function editar($idRol)
    {
        $sql = "SELECT * FROM roles WHERE id = $idRol";
        return $this->select($sql);
    }
    public function actualizar($nombre, $permisos, $id)
    {
        $sql = "UPDATE roles SET nombre=?, permisos=? WHERE id=?";
        $array = array($nombre, $permisos, $id);
        return $this->save($sql, $array);
    }
}

?>