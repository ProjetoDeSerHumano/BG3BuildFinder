//nunjucks é usado para montar os templates html
var nunjucks = require("nunjucks");
//express é um framework manipula as rotas do site
var express = require('express');
//ferramenta do node que lida com caminhos de pastas e arquivos
var path = require('path');

//constante usada para puxar as informações do arquivo .env do frontend
const envFilePath = path.resolve(__dirname, './BG3Front.env');
//ferramenta usada para ler arquivos .env
require('dotenv').config({ path: envFilePath });

//constante que armazena o numero da porta que está no arquivo env
const port = process.env.PORT;

//importação das rotas do site
var rtIndex = require('./routes/rtIndex');
var rtPersonalizar = require('./routes/rtPersonalizar');
var rtBuilds = require('./routes/rtBuilds');
var rtResultado = require('./routes/rtResultado');

//instaciando a ferramenta express
var app = express();

//configurando a ferramenta de nunjucks para buscar as paginas na pasta apps e atualizar mudanças automaticamente 
var env = nunjucks.configure('apps', {
    autoescape: true,
    express: app,
    watch: true
});

//Cada linha dessa comanda o servidor a:
//pertimitir que as páginas acessem arquivos estáticos
app.use(express.static(__dirname));
//prepara o servidor para lidar com dados json
app.use(express.json());
//prepara o servidor para lidar com formularios html com dados complexos
app.use(express.urlencoded({ extended: true }));

//caminho que direciona as urls para as rotas 
app.use('/', rtIndex);
app.use('/personalizar',rtPersonalizar);
app.use('/builds',rtBuilds);
app.use('/resultado',rtResultado);

//inicia o servidor
app.listen(port, () => {
    console.log(`Aplicação rodando na porta ${port}`);
});