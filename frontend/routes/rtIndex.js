var express = require('express');
var router = express.Router();
var homeApp = require("../apps/home/controller/ctlIndex");

router.get('/', homeApp.paginaInicial);

module.exports = router;