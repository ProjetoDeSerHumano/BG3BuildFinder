var express = require('express');
var router = express.Router();
const multer = require('multer');
const ctlPersonalizar = require('../controllers/ctlPersonalizar'); // Ajuste o caminho conforme seu projeto

// Configura o multer para usar a memória (RAM) e não o disco
const upload = multer({ storage: multer.memoryStorage() });

// Rota GET: Apenas abre a página de upload
router.get('/', function(req, res, next) {
    res.render('personalizar/view/personalizar.njk', { title: 'BG3 Build Finder' });
});

// Rota POST: Recebe o arquivo, trata com Multer e manda pro Controller
// O nome 'saveFile' deve ser o mesmo usado no formData.append do HTML
router.post("/analisar-save", upload.single('saveFile'), ctlPersonalizar.enviarArquivoParaCSharp);

module.exports = router;