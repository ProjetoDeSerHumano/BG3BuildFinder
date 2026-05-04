const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');

const appBuilds = require("../apps/controller/ctlBuilds.js");

router.use((req, res, next) => {
  next();
});

router.get("/", (req, res) => {
  res.send("API do Sistema BG3 Build Finder (Backend) está online.");
});

router.get("/getAllBuilds", appBuilds.getAllBuilds);


//Configura o Multer para criar uma pasta temporária e salvar o save do jogo
const uploadDir = path.resolve(__dirname, '../../temp_saves');
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}
const upload = multer({ dest: uploadDir });

//A rota que o seu 'fetch' do JavaScript está chamando
router.post('/personalizar/analisar-save', upload.single('saveFile'), (req, res) => {
    
    // Se não chegou nenhum arquivo, avisa o erro
    if (!req.file) {
        return res.status(400).json({ status: "Erro", msg: "Nenhum save recebido pelo backend." });
    }

    const savePath = req.file.path; // Caminho do arquivo invisível salvo pelo multer
    
    //Caminho exato do seu executável C# (Saindo da pasta backend/routes até csharp/bin)
    const exePath = path.resolve(__dirname, '../../csharp/bin/Debug/net9.0/csharp.exe'); 
    
    const command = `"${exePath}" "${savePath}"`;

    //Executa o programa C#
    exec(command, (error, stdout, stderr) => {
        
        // Apaga o save temporário para não lotar o HD do servidor
        fs.unlink(savePath, () => {}); 

        if (error) {
            console.error("Erro interno do C#:", error);
            return res.status(500).json({ status: "Erro", msg: "Falha ao analisar o save." });
        }

        //Lê a resposta do C# (o JSON que ele imprimiu no Console) e devolve pro Frontend
        try {
            const jsonDoCSharp = JSON.parse(stdout);
            res.json(jsonDoCSharp); // Envia o Sucesso e os Dados de volta pro navegador!
        } catch (e) {
            console.error("Erro ao ler resposta do C#:", stdout);
            res.status(500).json({ status: "Erro", msg: "O C# não devolveu um JSON válido." });
        }
    });
});

module.exports = router;