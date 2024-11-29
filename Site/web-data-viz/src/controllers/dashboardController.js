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

module.exports = {
    verEndereco,
    buscarEndereco
}