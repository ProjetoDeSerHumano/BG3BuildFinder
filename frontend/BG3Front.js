var nunjucks = require("nunjucks");
var express = require('express');
var path = require('path');

const envFilePath = path.resolve(__dirname, './BG3Front.env');
require('dotenv').config({ path: envFilePath });

const port = process.env.PORT;

var rtIndex = require('./routes/rtIndex');
var rtPersonalizar = require('./routes/rtPersonalizar');
var rtBuilds = require('./routes/rtBuilds');
var rtResultado = require('./routes/rtResultado');

var app = express();

var env = nunjucks.configure('apps', {
    autoescape: true,
    express: app,
    watch: true
});

app.use(express.static(__dirname));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', rtIndex);
app.use('/personalizar',rtPersonalizar);
app.use('/builds',rtBuilds);
app.use('/resultado',rtResultado);


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});