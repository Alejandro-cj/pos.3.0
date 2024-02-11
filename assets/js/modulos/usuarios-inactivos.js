let tblUsuarios;
document.addEventListener('DOMContentLoaded', function () {
    //cargar datos con el plugin datatables
    tblUsuarios = $('#tblUsuarios').DataTable({
        ajax: {
            url: base_url + 'usuarios/listarInactivos',
            dataSrc: ''
        },
        columns: [
            { data: 'nombres' },
            { data: 'correo' },
            { data: 'telefono' },
            { data: 'direccion' },
            { data: 'rol' },
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
})

//function para elimnar usuario
function restaurarUsuario(idUsuario) {
    const url = base_url + 'usuarios/restaurar/' + idUsuario;
    restaurarRegistros(url, tblUsuarios);
}