var dashboardModel = require("../models/dashboardModel");

function verEndereco(req, res) {
  console.log('verEndereco')
        dashboardModel.ver_endereco()
            .then( function (resultadoAutenticar) {
                res.json({
                  lista_enderecos: resultadoAutenticar
                });
            }).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao pegar os endereços! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

    function buscarEndereco(req, res) {
        console.log('buscarEndereco')
              dashboardModel.buscar_endereco()
                  .then( function (resultadoAutenticar) {
                      res.json({
                        busca_enderecos: resultadoAutenticar
                      });
                  }).catch(
                      function (erro) {
                          console.log(erro);
                          console.log("\nHouve um erro ao buscar os endereços! Erro: ", erro.sqlMessage);
                          res.status(500).json(erro.sqlMessage);
                      }
                  );
          }

          function obterDadosSensores(req, res) {
            var idGerente = req.params.idGerente;
            console.log('obterDadosSensores - Gerente ID:', idGerente);
        
            dashboardModel.obterDadosSensores(idGerente)
                .then(function (resultado) {
                    res.json(resultado);
                })
                .catch(function (erro) {
                    console.log("\nHouve um erro ao buscar os dados dos sensores! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                });
        }
        

module.exports = {
    verEndereco,
    buscarEndereco,
    obterDadosSensores
}