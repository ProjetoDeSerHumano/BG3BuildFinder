var express = require('express');
var router = express.Router();
var buildsApp = require("../apps/builds/controller/ctlBuilds");

router.get('/', buildsApp.listarBuilds);

router.get('/listarBuilds', buildsApp.listarBuilds);


module.exports = router;