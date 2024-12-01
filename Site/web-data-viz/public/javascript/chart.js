function redirect(tipo) {
  // Buttons
  var geral = document.getElementById("button_geral");
  var individual = document.getElementById("button_individual");
  var cadastro = document.getElementById("button_cadastro");

  if (tipo == "geral") {
    // Variaveis dos elementos
    var elemento = document.querySelector(".geral");
    var diferente1 = document.querySelector(".individual");
    var diferente2 = document.querySelector(".cadastrar");

    // Muda o display do elemento a ser visualizado
    elemento.style.display = "flex";

    // Realiza a inserção e remoção de classes para transição de opacidade via CSS
    setTimeout(() => {
      elemento.classList.add("show");
      geral.classList.add("agora");
    }, 10);
    // Remove a tag show (tag de transição) dos outros itens
    setTimeout(() => {
      diferente1.classList.remove("show");
      diferente2.classList.remove("show");
      individual.classList.remove("agora");
      cadastro.classList.remove("agora");
    }, 10);

    // Muda o display dos outros elementos para none
    diferente1.style.display = "none";
    diferente2.style.display = "none";

  } else if (tipo == "individual") {
    var elemento = document.querySelector(".individual");
    var diferente1 = document.querySelector(".geral");
    var diferente2 = document.querySelector(".cadastrar");

    elemento.style.display = "flex";

    setTimeout(() => {
      elemento.classList.add("show");
      individual.classList.add('agora')
    }, 10);
    setTimeout(() => {
      diferente1.classList.remove("show");
      diferente2.classList.remove("show");
      geral.classList.remove('agora');
      cadastro.classList.remove('agora');
    }, 10);

    diferente1.style.display = "none";
    diferente2.style.display = "none";
  } else if (tipo == "cadastro") {
    var elemento = document.querySelector(".cadastrar");
    var diferente1 = document.querySelector(".geral");
    var diferente2 = document.querySelector(".individual");

    elemento.style.display = "flex";

    setTimeout(() => {
      elemento.classList.add("show");
      cadastro.classList.add('agora')
    }, 10);
    setTimeout(() => {
      diferente1.classList.remove("show");
      diferente2.classList.remove("show");
      geral.classList.remove('agora');
      individual.classList.remove('agora');
    }, 10);

    diferente1.style.display = "none";
    diferente2.style.display = "none";
  }
}

// Configuração do gráfico de monitoração localizado na Dashboard
var geral1 = document.getElementById("chartGeral");
var salaReuniao = document.getElementById("chartSalaReuniao");
var salaEscritorio = document.getElementById("chartEscritorio");


var idGerente = sessionStorage.ID_USUARIO;

    fetch(`/dashboard/obterSensores/${idGerente}`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            plotarGraficoBarra(data);
        })
        .catch(function(err) {
            console.log(err);
        });

        function plotarGraficoBarra(dados) {
          var luminosidadeAtual = [];
          var luminosidadeIdeal = [];
          var locais = [];
          var andares = [];
      
          var valorLuminosidadeIdeal = 500;
          var intervaloLuminosidade = 100;
          var ambientesAdequados = 0;
          var ambientesInadequados = 0;
      
          for (var i = 0; i < dados.length; i++) {
              var luminosidade = dados[i].luminosidade;
              luminosidadeAtual.push(luminosidade);
              luminosidadeIdeal.push(valorLuminosidadeIdeal);
              locais.push(dados[i].local);
              andares.push(dados[i].andar);
      
              if (luminosidade >= valorLuminosidadeIdeal - intervaloLuminosidade && luminosidade <= valorLuminosidadeIdeal + intervaloLuminosidade) {
                  ambientesAdequados++;
              } else {
                  ambientesInadequados++;
              }
          }
          document.getElementById('kpiAdequados').textContent = `Ambientes Adequados: ${ambientesAdequados}`;
          document.getElementById('kpiInadequados').textContent = `Ambientes Inadequados: ${ambientesInadequados}`;
      
          var ctx = document.getElementById('chartGeral').getContext('2d');
        
          new Chart(ctx, {
              type: 'bar',
              data: {
                  labels: locais.map((local, index) => `${local} - Andar ${andares[index]}`),
                  datasets: [
                      {
                          label: 'Luminosidade Atual',
                          data: luminosidadeAtual,
                          backgroundColor: 'rgba(75, 192, 192, 0.2)', 
                          borderColor: 'rgba(75, 192, 192, 1)',
                          borderWidth: 2,
                      },
                      {
                          label: 'Luminosidade Ideal',
                          data: luminosidadeIdeal,
                          backgroundColor: 'rgba(255, 99, 132, 0.2)', 
                          borderColor: 'rgba(255, 99, 132, 1)', 
                          borderWidth: 2, 
                      }
                  ]
              },
              options: {
                  responsive: true, 
                  plugins: {
                      legend: {
                          position: "top", 
                      },
                  },
                  scales: {
                      y: {
                          suggestedMax: 1000,
                          beginAtZero: true, 
                          title: {
                              display: true,
                              text: "Lux (Nível de Iluminação)",
                          },
                      },
                      x: {
                          title: {
                              display: true,
                              text: "Local e Andar",
                          },
                          ticks: {
                              autoSkip: false, 
                              maxRotation: 90, 
                              minRotation: 90,
                          },
                      },
                  },
              },
          });
      }
      
      

// new Chart(geral1, {
//   type: "bar",
//   data: {
//     labels: [
//       "Escritório 1",
//       "Sala de Conferência",
//       "Escritório 2",
//       "Sala de Reunião",
//       "Cozinha",
//     ],
//     datasets: [
//       {
//         label: "Lux",
//         data: [475, 481, 511, 650, 800],
//         borderWidth: 2,
//         backgroundColor: "rgba(75, 192, 192, 0.2)",
//         borderColor: "rgba(75, 192, 192, 1)",
//       },
//       {
//         label: "Ideal",
//         data: [500, 600, 500, 500, 300],
//         borderWidth: 2,
//         backgroundColor: "rgba(255, 99, 132, 0.2)",
//         borderColor: "rgba(255, 99, 132, 1)",
//       },
//     ],
//   },
//   options: {
//     responsive: true,
//     plugins: {
//       legend: {
//         position: "top",
//       },
//       title: {
//         display: true,
//         text: "Iluminação por Ambiente",
//       },
//     },
//     scales: {
//       y: {
//         suggestedMax: 1000, // Ajusta a escala máxima
//         beginAtZero: true,
//         title: {
//           display: true,
//           text: "Lux (Nível de Iluminação)",
//         },
//       },
//       x: {
//         title: {
//           display: true,
//           text: "Ambientes",
//         },
//       },
//     },
//   },
// });

new Chart(salaReuniao, {
  type: "line",
  data: {
    labels: [
      "8:00",
      "9:00",
      "10:00",
      "11:00",
      "12:00",
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
    ],
    datasets: [
      {
        label: "Lux",
        data: [423, 489, 444, 433, 573, 691, 662, 637, 592, 435, 350],
        borderWidth: 2,
        borderColor: "rgba(160, 32, 240, 1)",
        backgroundColor: "rgba(160, 32, 240, 0.2)",
        tension: 0.3, // Suaviza a linha do gráfico
      },
      {
        label: "Máximo",
        data: [500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500],
        borderWidth: 1,
        borderColor: "rgba(255, 99, 132, 1)",
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderDash: [10, 5], // Linha tracejada para diferenciar
      },
      {
        label: "Mínimo",
        data: [300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300],
        borderWidth: 1,
        borderColor: "rgba(54, 162, 235, 1)",
        backgroundColor: "rgba(54, 162, 235, 0.05)",
        borderDash: [10, 5], // Linha tracejada para diferenciar
      },
    ],
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: true,
        suggestedMax: 1000, // Ajusta a escala máxima
      },
    },
    plugins: {
      legend: {
        position: "top", // Move a legenda para o topo
      },
    },
  },
});

new Chart(salaEscritorio, {
  type: "line",
  data: {
    labels: [
      "8:00",
      "9:00",
      "10:00",
      "11:00",
      "12:00",
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
    ],
    datasets: [
      {
        label: "Lux",
        data: [423, 573, 444, 662, 433, 691, 592, 489, 350, 637, 435],
        borderWidth: 2,
        borderColor: "rgba(160, 32, 240, 1)",
        backgroundColor: "rgba(160, 32, 240, 0.2)",
        tension: 0.3, // Suaviza a linha do gráfico
      },
      {
        label: "Máximo",
        data: [600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600],
        borderWidth: 1,
        borderColor: "rgba(255, 99, 132, 1)",
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderDash: [10, 5], // Linha tracejada para diferenciar
      },
      {
        label: "Mínimo",
        data: [500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500],
        borderWidth: 1,
        borderColor: "rgba(54, 162, 235, 1)",
        backgroundColor: "rgba(54, 162, 235, 0.05)",
        borderDash: [10, 5], // Linha tracejada para diferenciar
      },
    ],
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: true,
        suggestedMax: 1000, // Ajusta a escala máxima
      },
    },
    plugins: {
      legend: {
        position: "top", // Move a legenda para o topo
      },
    },
  },
});
