var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('resultado/view/resultado.njk', { title: 'BG3 Build Finder' });
});

module.exports = router;