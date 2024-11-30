var usuarioModel = require("../models/usuarioModel");
// var aquarioModel = require("../models/aquarioModel");
var id = 0;

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String
                    
                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);
                                    
                        res.json({
                                        id: resultadoAutenticar[0].idGerenciador,
                                        email: resultadoAutenticar[0].email,
                                        nome: resultadoAutenticar[0].nome,
                                        senha: resultadoAutenticar[0].senha
                                    });

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Recupere os valores enviados pelo frontend
    var nome = req.body.nomeServer;
    var cpf = req.body.cpfServer;
    var celular = req.body.celularServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var fkEndereco = req.body.fkEnderecoServer;  // Agora recebendo o código de acesso do endereço
  
    console.log('Estou no Controller', nome, cpf, celular, email, senha, fkEndereco);
  
    // Validação dos campos
    if (nome == undefined) {
      res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
      res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
      res.status(400).send("Sua senha está undefined!");
    } else if (fkEndereco == undefined) {
      res.status(400).send("O código de acesso do endereço está undefined!");
    } else if (cpf == undefined) {
      res.status(400).send("Seu CPF está undefined!");
    } else if (celular == undefined) {
      res.status(400).send("Seu celular está undefined!");
    } else {
      // Passe os valores para o Model
      usuarioModel.cadastrar(nome, cpf, celular, email, senha, fkEndereco)
        .then(function (resultado) {
          res.json(resultado);
        })
        .catch(function (erro) {
          console.log(erro);
          res.status(500).json(erro.sqlMessage);
        });
    }
  }

  function listarEnderecos(req, res) {
    usuarioModel.listarEnderecos()
        .then(function (enderecos) {
            res.json(enderecos);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro);
        });
}
module.exports = {
    autenticar,
    cadastrar,
    listarEnderecos
}