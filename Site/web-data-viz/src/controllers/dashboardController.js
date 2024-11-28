var dashboardModel = require("../models/dashboardModel");

function verEndereco(req, res) {
  console.log('verEndereco')
        dashboardModel.ver_endereco()
            .then( function (resultadoAutenticar) {
                res.json({
                  enderecos: resultadoAutenticar
                });
            }).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao procurar os endereços! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

module.exports = {
    ver_endereco
}