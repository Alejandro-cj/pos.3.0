<?php

class MedidasModel extends Database {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getMedidas($estado) {
        $sql = "SELECT * FROM medidas WHERE estado = ?";
        $params = array($estado);
        return $this->query($sql, $params);
    }
    
    public function registrar($nombre, $nombre_corto) {
        $sql = "INSERT INTO medidas (medida, nombre_corto) VALUES (?, ?)";
        $params = array($nombre, $nombre_corto);
        return $this->execute($sql, $params);
    }
    
    public function getValidar($campo, $valor, $accion, $id) {
        $sql = ($accion == 'registrar' && $id == 0) ? 
            "SELECT id FROM medidas WHERE $campo = ?" : 
            "SELECT id FROM medidas WHERE $campo = ? AND id != ?";
        $params = ($id == 0) ? array($valor) : array($valor, $id);
        return $this->query($sql, $params);
    }
    
    public function eliminar($estado, $idMedida) {
        $sql = "UPDATE medidas SET estado = ? WHERE id = ?";
        $params = array($estado, $idMedida);
        return $this->execute($sql, $params);
    }

    public function editar($idMedida) {
        $sql = "SELECT * FROM medidas WHERE id = ?";
        $params = array($idMedida);
        return $this->query($sql, $params);
    }
    
    public function actualizar($nombre, $nombre_corto, $id) {
        $sql = "UPDATE medidas SET medida=?, nombre_corto=? WHERE id=?";
        $params = array($nombre, $nombre_corto, $id);
        return $this->execute($sql, $params);
    }
}
?>