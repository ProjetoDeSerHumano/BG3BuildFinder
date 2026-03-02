var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('home/view/index.njk', { title: 'BG3 Build Finder' });
});

module.exports = router;