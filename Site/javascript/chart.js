    function redirect(tipo){ 

      if(tipo == "geral"){
        var elemento = document.querySelector(".geral");
        var diferente = document.querySelector(".individual");

        elemento.style.display = "flex"

        setTimeout(() => { elemento.classList.add("show"); }, 10);
        setTimeout(() => { diferente.classList.remove("show"); }, 10);
        
        diferente.style.display = "none"
        
      } else if (tipo == "individual"){
        var elemento = document.querySelector(".individual");
        var diferente = document.querySelector(".geral");

        elemento.style.display = "flex"
        
        setTimeout(() => { elemento.classList.add("show"); }, 10);
        setTimeout(() => { diferente.classList.remove("show"); }, 10);
        
        diferente.style.display = "none"
        
      }

    }
// Configuração do gráfico de monitoração localizado na Dashboard
const geral1 = document.getElementById("chartGeral");
const salaReuniao = document.getElementById("chartSalaReuniao");
const salaEscritorio = document.getElementById("chartEscritorio")

new Chart(geral1, {
  type: "bar",
  data: {
    labels: [
      "Escritório 1",
      "Sala de Conferência",
      "Escritório 2",
      "Sala de Reunião",
      "Cozinha",
    ],
    datasets: [
      {
        label: "Lux",
        data: [475, 481, 511, 650, 800],
        borderWidth: 2,
        backgroundColor: 'rgba(75, 192, 192, 0.2)', 
        borderColor: 'rgba(75, 192, 192, 1)'
      },
      {
        label: "Ideal",
        data: [500, 600, 500, 500, 300],
        borderWidth: 2,
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderColor: "rgba(255, 99, 132, 1)"
      },
    ],
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'Iluminação por Ambiente'
      }
    },
    scales: {
      y: {
        suggestedMax: 1000, // Ajusta a escala máxima
        beginAtZero: true,
        title: {
          display: true,
          text: 'Lux (Nível de Iluminação)'
        }
      },
      x: {
        title: {
          display: true,
          text: 'Ambientes'
        }
      }
    },
  },
});


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