var express = require('express');
var router = express.Router();
var resultadoApp = require("../apps/personalizar/controller/ctlPersonalizar");

router.get('/', resultadoApp.paginaPersonalizar);

module.exports = router;