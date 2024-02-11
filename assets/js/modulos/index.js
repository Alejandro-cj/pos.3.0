let myChart, myChartGasto;
comparacion();
topProductos();
reporteGastos();
stockMinimo();

function comparacion() {
  if (myChart) {
    myChart.destroy();
  }
  const anio = document.querySelector('#anio').value;
  const url = base_url + 'admin/comparacion/' + anio;
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

      document.querySelector('#totalVentas').textContent = res.totalVentas.total;
      document.querySelector('#totalCompras').textContent = res.totalCompras.total;

      var ctx = document.getElementById("comparacion").getContext('2d');

      var gradientStroke1 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke1.addColorStop(0, '#6078ea');
      gradientStroke1.addColorStop(1, '#17c5ea');

      var gradientStroke2 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke2.addColorStop(0, '#ff8359');
      gradientStroke2.addColorStop(1, '#ffdf40');

      myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
          datasets: [{
            label: 'Ventas',
            data: [res.venta.ene, res.venta.feb, res.venta.mar,
            res.venta.abr, res.venta.may, res.venta.jun,
            res.venta.jul, res.venta.ago, res.venta.sep,
            res.venta.oct, res.venta.nov, res.venta.dic],
            borderColor: gradientStroke1,
            backgroundColor: gradientStroke1,
            hoverBackgroundColor: gradientStroke1,
            pointRadius: 0,
            fill: false,
            borderWidth: 0
          }, {
            label: 'Compras',
            data: [res.compra.ene, res.compra.feb, res.compra.mar,
            res.compra.abr, res.compra.may, res.compra.jun,
            res.compra.jul, res.compra.ago, res.compra.sep,
            res.compra.oct, res.compra.nov, res.compra.dic],
            borderColor: gradientStroke2,
            backgroundColor: gradientStroke2,
            hoverBackgroundColor: gradientStroke2,
            pointRadius: 0,
            fill: false,
            borderWidth: 0
          }]
        },

        options: {
          maintainAspectRatio: false,
          legend: {
            position: 'bottom',
            display: false,
            labels: {
              boxWidth: 8
            }
          },
          tooltips: {
            displayColors: false,
          },
          scales: {
            xAxes: [{
              barPercentage: .5
            }]
          }
        }
      });
    }
  }


}

function topProductos() {
  const url = base_url + 'admin/topProductos';
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

      var ctx = document.getElementById("topProductos").getContext('2d');

      var gradientStroke1 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke1.addColorStop(0, '#fc4a1a');
      gradientStroke1.addColorStop(1, '#f7b733');

      var gradientStroke2 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke2.addColorStop(0, '#4776e6');
      gradientStroke2.addColorStop(1, '#8e54e9');


      var gradientStroke3 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke3.addColorStop(0, '#ee0979');
      gradientStroke3.addColorStop(1, '#ff6a00');

      var gradientStroke4 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke4.addColorStop(0, '#42e695');
      gradientStroke4.addColorStop(1, '#3bb2b8');
      let nombre = [];
      let cantidad = [];
      for (let i = 0; i < res.length; i++) {
        nombre.push(res[i].descripcion);
        cantidad.push(res[i].ventas);
      }

      var myChart1 = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: nombre,
          datasets: [{
            backgroundColor: [
              gradientStroke1,
              gradientStroke2,
              gradientStroke3,
              gradientStroke4
            ],
            hoverBackgroundColor: [
              gradientStroke1,
              gradientStroke2,
              gradientStroke3,
              gradientStroke4
            ],
            data: cantidad,
            borderWidth: [1, 1, 1, 1]
          }]
        },
        options: {
          maintainAspectRatio: false,
          cutoutPercentage: 75,
          legend: {
            position: 'bottom',
            display: true,
            labels: {
              boxWidth: 8
            }
          },
          tooltips: {
            displayColors: false,
          }
        }
      });


    }
  }

}

function reporteGastos() {

  if (myChartGasto) {
    myChartGasto.destroy();
  }
  const anio = document.querySelector('#anioGasto').value;
  const url = base_url + 'admin/gastos/' + anio;
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
      var ctx = document.getElementById('gastos').getContext('2d');

      var gradientStroke1 = ctx.createLinearGradient(0, 0, 0, 300);
      gradientStroke1.addColorStop(0, '#008cff');
      gradientStroke1.addColorStop(1, 'rgba(22, 195, 233, 0.1)');

      myChartGasto = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
          datasets: [{
            label: 'Monto',
            data: [res.ene, res.feb, res.mar,
            res.abr, res.may, res.jun,
            res.jul, res.ago, res.sep,
            res.oct, res.nov, res.dic],
            pointBorderWidth: 2,
            pointHoverBackgroundColor: gradientStroke1,
            backgroundColor: gradientStroke1,
            borderColor: gradientStroke1,
            borderWidth: 3
          }]
        },
        options: {
          maintainAspectRatio: false,
          legend: {
            position: 'bottom',
            display: false
          },
          tooltips: {
            displayColors: false,
            mode: 'nearest',
            intersect: false,
            position: 'nearest',
            xPadding: 10,
            yPadding: 10,
            caretPadding: 10
          }
        }
      });
    }
  }


}

function stockMinimo() {
  const url = base_url + 'admin/minimosProductos';
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

      var ctx = document.getElementById("stockMinimo").getContext('2d');

      let nombre = [];
      let cantidad = [];
      for (let i = 0; i < res.length; i++) {
        nombre.push(res[i].descripcion);
        cantidad.push(res[i].cantidad);
      }

      var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: nombre,
          datasets: [{
            backgroundColor: [
              '#0c62e0',
              '#515a62',
              '#128e0a',
              '#e4ad07'
            ],

            hoverBackgroundColor: [
              '#0c62e0',
              '#515a62',
              '#128e0a',
              '#e4ad07'
            ],

            data: cantidad,
            borderWidth: [1, 1, 1]
          }]
        },
        options: {
          maintainAspectRatio: false,
          cutoutPercentage: 0,
          legend: {
            position: 'bottom',
            display: true,
            labels: {
              boxWidth: 8
            }
          },
          tooltips: {
            displayColors: false,
          },
        }
      });

    }
  }


}