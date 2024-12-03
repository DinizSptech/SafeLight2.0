var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/ver-endereco/:endereco", function (req, res) {
    dashboardController.verEndereco(req, res);
});

// router.get("/buscar-endereco", function (req, res) {
//     dashboardController.buscarEndereco(req, res);
// });

router.get("/obterSensores/:idGerente", function (req, res) {
    dashboardController.obterDadosSensores(req, res);
});

router.get("/pegarIndividual/:idEndereco/:idSensor/:data", function (req, res) {
    dashboardController.obterDadosSensoresIndividual(req, res);
});

router.get("/pegarKPI/:idEndereco/:data/:idSensor", function (req, res) {
    dashboardController.obterDadosKPI(req, res);
});

module.exports = router;