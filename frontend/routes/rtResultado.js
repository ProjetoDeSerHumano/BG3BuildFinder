var express = require('express');
var router = express.Router();
var resultadoApp = require("../apps/resultado/controller/ctlResultado");

router.get('/', resultadoApp.listarBuilds);

module.exports = router;