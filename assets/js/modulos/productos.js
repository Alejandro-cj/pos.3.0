let tblProductos;
const formulario = document.querySelector('#formulario');
const btnAccion = document.querySelector('#btnAccion');
const btnNuevo = document.querySelector('#btnNuevo');

const id = document.querySelector('#id');
const codigo = document.querySelector('#codigo');
const nombre = document.querySelector('#nombre');
const precio_compra = document.querySelector('#precio_compra');
const precio_venta = document.querySelector('#precio_venta');
const id_medida = document.querySelector('#id_medida');
const id_categoria = document.querySelector('#id_categoria');
const foto = document.querySelector('#foto');
const foto_actual = document.querySelector('#foto_actual');
const containerPreview = document.querySelector('#containerPreview');

const errorCodigo = document.querySelector('#errorCodigo');
const errorNombre = document.querySelector('#errorNombre');
const errorCompra = document.querySelector('#errorCompra');
const errorVenta = document.querySelector('#errorVenta');
const errorMedida = document.querySelector('#errorMedida');
const errorCategoria = document.querySelector('#errorCategoria');

document.addEventListener('DOMContentLoaded', function () {
    //cargar datos con el plugin datatables
    tblProductos = $('#tblProductos').DataTable({
        ajax: {
            url: base_url + 'productos/listar',
            dataSrc: ''
        },
        columns: [
            { data: 'codigo' },
            { data: 'descripcion' },
            { data: 'precio_compra' },
            { data: 'precio_venta' },
            { data: 'cantidad' },
            { data: 'medida' },
            { data: 'categoria' },
            { data: 'imagen' },
            { data: 'acciones' }
        ],
        language: {
            url: base_url + 'assets/js/espanol.json'
        },
        dom,
        buttons,
        responsive: true,
        order: [[0, 'asc']],
    });
    //vista Previa
    foto.addEventListener('change', function (e) {
        foto_actual.value = '';
        if (e.target.files[0].type == 'image/png' ||
            e.target.files[0].type == 'image/jpg' ||
            e.target.files[0].type == 'image/jpeg') {
            const url = e.target.files[0];
            const tmpUrl = URL.createObjectURL(url);
            containerPreview.innerHTML = `<img class="img-thumbnail" src="${tmpUrl}" width="200">
            <button class="btn btn-danger" type="button" onclick="deleteImg()"><i class="fas fa-trash"></i></button>`;
        } else {
            foto.value = '';
            alertaPersonalizada('warning', 'SOLO SE PERMITEN IMG DE TIPO PNG-JPG-JPEG');
        }
    })
    //limpiar campos
    btnNuevo.addEventListener('click', function () {
        id.value = '';
        btnAccion.textContent = 'Registrar';
        formulario.reset();
        deleteImg();
        limpiarCampos();
    })
    //registrar Productos
    formulario.addEventListener('submit', function (e) {
        e.preventDefault();
        limpiarCampos();
        if (codigo.value == '') {
            errorCodigo.textContent = 'EL CODIGO ES REQUERIDO';
        } else if (nombre.value == '') {
            errorNombre.textContent = 'EL NOMBRE ES REQUERIDO';
        } else if (precio_compra.value == '') {
            errorCompra.textContent = 'EL PRECIO COMPRA ES REQUERIDO';
        } else if (precio_venta.value == '') {
            errorVenta.textContent = 'EL PRECIO VENTA ES REQUERIDO';
        } else if (id_medida.value == '') {
            errorMedida.textContent = 'SELECCIONA LA MEDIDA';
        } else if (id_categoria.value == '') {
            errorCategoria.textContent = 'SELECCIONA LA CATEGORIA';
        } else {
            const url = base_url + 'productos/registrar';
            insertarRegistros(url, this, tblProductos, btnAccion, false);
            limpiarCampos()
        }
    })
})

function deleteImg() {
    foto.value = '';
    containerPreview.innerHTML = '';
    foto_actual.value = '';
}

function eliminarProducto(idProducto) {
    const url = base_url + 'productos/eliminar/' + idProducto;
    eliminarRegistros(url, tblProductos);
}

function editarProducto(idProducto) {
    limpiarCampos();
    const url = base_url + 'productos/editar/' + idProducto;
    //hacer una instancia del objeto XMLHttpRequest 
    const http = new XMLHttpRequest();
    //Abrir una Conexion - POST - GET
    http.open('GET', url, true);
    //Enviar Datos
    http.send();
    //verificar estados
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            id.value = res.id;
            codigo.value = res.codigo;
            nombre.value = res.descripcion;
            precio_compra.value = res.precio_compra;
            precio_venta.value = res.precio_venta;
            id_medida.value = res.id_medida;
            id_categoria.value = res.id_categoria;
            foto_actual.value = res.foto;
            containerPreview.innerHTML = `<img class="img-thumbnail" src="${base_url + res.foto}" width="200">
            <button class="btn btn-danger" type="button" onclick="deleteImg()"><i class="fas fa-trash"></i></button>`;
            btnAccion.textContent = 'Actualizar';
            firstTab.show()
        }
    }
}

function limpiarCampos() {
    errorCodigo.textContent = '';
    errorNombre.textContent = '';
    errorCompra.textContent = '';
    errorVenta.textContent = '';
    errorMedida.textContent = '';
    errorCategoria.textContent = '';
    deleteImg()
}