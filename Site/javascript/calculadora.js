function calcular() {
  // Captura dos valores de entrada
  var watts = select_watts.value;

  if (watts == "another") {
    watts = Number(input_anotherW.value);
  }

  var horas = Number(ipthrs.value);
  var luzes = Number(iptqtd.value);
  var preco = 0.72;

  // Cálculo de consumo total de energia
  var consumokwh = (watts / 1000) * luzes * (horas * 30);
  var consumokwhano = (watts / 1000) * luzes * (horas * 365);

  // Custo total
  var gastototal = consumokwh * preco;


  // Cálculo de área de floresta necessária com base no valor de 39 kg de CO₂ por m²
  var economiaesperada = consumokwh * 0.4; // Economia de 40%
  var economiafinanceira = economiaesperada * preco;

  // Exibição dos resultados
  divmsg.innerHTML = `O consumo total de energia em 30 dias: ${consumokwh.toFixed()} kWh.<br>
    O consumo anual: ${consumokwhano.toFixed()} kWh.<br>
    Isso representa um gasto de R$${Math.floor(
      gastototal
    )} mensais e R$${Math.floor(gastototal * 12)} anuais.<br>
    A economia financeira esperada com uma redução de 40% é de R$${economiafinanceira} por mês.<br>
    A economia anual estimada é de R$${economiafinanceira * 12}.<br>`;
}

function calcularProdutividade() {
  var qntFuncionario = Number(ipt_qnt_funcionario.value);
  var salario = Number(ipt_salario.value);
  var horasPorDia = Number(ipt_horas_por_dia.value);

  // Cálculo do valor atual por hora
  var valorPorHora = salario / 30 / horasPorDia;

  // Cálculo do valor por hora após aumento de produtividade
  var aumentoMinimo = valorPorHora * 1.15; // Aumento de 15%
  var aumentoMaximo = valorPorHora * 1.3; // Aumento de 30%

  divmsg2.innerHTML = `
  Atualmente, sua empresa tem uma produtividade de R$${Math.floor(valorPorHora * qntFuncionario)} por hora. 
  <br><br> 
  Após a implementação, esperamos um aumento médio de produtividade entre 15% e 30%, resultando em uma produtividade entre R$${Math.floor(aumentoMinimo * qntFuncionario)} e R$${Math.floor(aumentoMaximo * qntFuncionario)} por hora.
`;


//   divmsg2.innerHTML = `Atualmente sua empresa tem a produtividade de R$${Math.floor(
//     valorPorHora * qntFuncionario
//   )} por hora. <br>  Após a implementação, esperamos em média um aumento de     produtividade de 15-30%, ou seja, entre R$${Math.floor(
//     aumentoMinimo * qntFuncionario
//   )} até R$${Math.floor(aumentoMaximo * qntFuncionario)} por hora.`;
}

function checkOutro() {
  var select = document.getElementById("select_watts").value;
  var anotheript = document.getElementById("input_anotherW");
  var section1 = document.getElementById("section1");

  if (select == "another") {
    anotheript.disabled = false;
    anotheript.style.display = 'flex'
  } else {
    anotheript.disabled = true;
    anotheript.style.display = 'none';
  }
}
