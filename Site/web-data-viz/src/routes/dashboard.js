var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/ver-endereco", function (req, res) {
    usuarioController.verEndereco(req, res);
});

module.exports = router;