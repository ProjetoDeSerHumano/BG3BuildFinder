const axios = require("axios");
const FormData = require("form-data");

const enviarArquivoParaCSharp = async (req, res) => {
    // 1. O arquivo chega aqui via Multer como um Buffer na memória
    const arquivoSave = req.file; 

    if (!arquivoSave) {
        return res.json({ status: "Erro", msg: "Nenhum arquivo recebido pelo servidor Node." });
    }

    try {
        // 2. Criamos um FormData específico para enviar do Node ao C#
        const form = new FormData();
        
        // Repassamos os dados binários e o nome original do arquivo
        form.append("saveFile", arquivoSave.buffer, {
            filename: arquivoSave.originalname,
            contentType: arquivoSave.mimetype
        });

        // 3. Postamos para o Backend C# (DW3Back)
        // Certifique-se que o C# tem o endpoint /AnalisarSave esperando um IFormFile saveFile
        const response = await axios.post(process.env.SERVIDOR_DW3Back + "/AnalisarSave", form, {
            headers: {
                ...form.getHeaders() // Importante: define o boundary do arquivo
            },
            timeout: 30000 // Aumentado para saves grandes
        });

        // 4. Retornamos a resposta do C# diretamente para a tela
        return res.json({
            status: "Sucesso",
            data: response.data 
        });

    } catch (error) {
        console.error("Erro no repasse Node -> C#:", error.message);
        return res.json({ 
            status: "Erro", 
            msg: "O servidor C# não respondeu corretamente." 
        });
    }
};

module.exports = { enviarArquivoParaCSharp };