<?php
class ProductosModel extends Query{
    public function __construct() {
        parent::__construct();
    }
    public function getProductos($estado)
    {
        $sql = "SELECT p.*, m.medida, c.categoria FROM productos p INNER JOIN medidas m ON p.id_medida = m.id INNER JOIN categorias c ON p.id_categoria = c.id WHERE p.estado = $estado";
        return $this->selectAll($sql);
    }

    public function getDatos($table)
    {
        $sql = "SELECT * FROM $table WHERE estado = 1";
        return $this->selectAll($sql);
    }

    public function registrar($codigo, $nombre, $precio_compra, $precio_venta,
    $id_medida, $id_categoria, $foto)
    {
        $sql = "INSERT INTO productos (codigo, descripcion, precio_compra, precio_venta, id_medida, id_categoria, foto) VALUES (?,?,?,?,?,?,?)";
        $array = array($codigo, $nombre, $precio_compra, $precio_venta,
        $id_medida, $id_categoria, $foto);
        return $this->insertar($sql, $array);
    }

    public function getValidar($campo, $valor, $accion, $id)
    {
        if ($accion == 'registrar' && $id == 0) {
            $sql = "SELECT id FROM productos WHERE $campo = '$valor'";
        }else{
            $sql = "SELECT id FROM productos WHERE $campo = '$valor' AND id != $id";
        }
        return $this->select($sql);
    }

    public function eliminar($estado, $idProducto)
    {
        $sql = "UPDATE productos SET estado = ? WHERE id = ?";
        $array = array($estado, $idProducto);
        return $this->save($sql, $array);
    }

    public function editar($idProducto)
    {
        $sql = "SELECT * FROM productos WHERE id = $idProducto";
        return $this->select($sql);
    }

    public function actualizar($codigo, $nombre, $precio_compra, $precio_venta,
    $id_medida, $id_categoria, $foto, $id)
    {
        $sql = "UPDATE productos SET codigo=?, descripcion=?, precio_compra=?, precio_venta=?, id_medida=?, id_categoria=?, foto=? WHERE id=?";
        $array = array($codigo, $nombre, $precio_compra, $precio_venta,
        $id_medida, $id_categoria, $foto, $id);
        return $this->save($sql, $array);
    }

    public function buscarPorCodigo($valor)
    {
        $sql = "SELECT id, descripcion, cantidad FROM productos WHERE codigo = '$valor'";
        return $this->select($sql);
    }

    public function buscarPorNombre($valor)
    {
        $sql = "SELECT id, descripcion, cantidad FROM productos WHERE descripcion LIKE '%".$valor."%' AND estado = 1 LIMIT 10";
        return $this->selectAll($sql);
    }

    public function getEmpresa()
    {
        $sql = "SELECT * FROM configuracion";
        return $this->select($sql);
    }

}
