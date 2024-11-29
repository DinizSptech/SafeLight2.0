var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/ver-endereco", function (req, res) {
    dashboardController.verEndereco(req, res);
});

router.get("/buscar-endereco", function (req, res) {
    dashboardController.buscarEndereco(req, res);
});

module.exports = router;