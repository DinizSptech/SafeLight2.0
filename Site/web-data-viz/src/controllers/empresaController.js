var empresaModel = require("../models/empresaModel");

function cadastrar(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var nome = req.body.nomeEmpresa;
  var cnpj = req.body.cnpjEmpresa;
  var codigo = req.body.codigoEmpresa;

  console.log("Estou no Controller ", nome, cnpj, codigo);
  // Faça as validações dos valores
  if (nome == undefined) {
    res.status(400).send("Nome da Empresa está undefined!");
  } else if (codigo == undefined) {
    res.status(400).send("Codigo da Empresa está undefined!");
  } else if (cnpj == undefined) {
    res.status(400).send("CNPJ a vincular da Empresa está undefined!");
  } else {
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    empresaModel
      .cadastrar(nome, cnpj, codigo)
      .then(function (resultado) {
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

module.exports = {
  cadastrar,
  listar,
};
