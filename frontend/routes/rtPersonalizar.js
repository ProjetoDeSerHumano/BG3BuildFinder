var express = require('express');
var router = express.Router();
var personalizarApp = require("../apps/personalizar/controller/ctlPersonalizar");


router.get('/', personalizarApp.paginaPersonalizar);


module.exports = router;