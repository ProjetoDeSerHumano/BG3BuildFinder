const express = require('express');
const cors = require('cors');
const router = require('./routes/router'); 

const app = express();

//Configure o CORS (Libera para o front-end específico)
app.use(cors({
    origin: 'http://localhost:40100',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

app.use(router);

const PORT = 40000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});