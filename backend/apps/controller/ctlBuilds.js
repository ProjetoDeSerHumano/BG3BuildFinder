const mdlBuilds = require("../model/mdlBuilds");

const getAllBuilds = async (req, res) => {
    try {
        const registro = await mdlBuilds.getAllBuilds();

        //Verifica se retornou algo
        if (!registro || registro.length === 0) {
            return res.status(200).json({
                status: "ok",
                registro: [],
                message: "Nenhum registro encontrado"
            });
        }

        res.json({
            status: "ok",
            registro: registro,
            erro: null
        });
        
    } catch (error) {
        console.error("Erro em getAllBuilds:", error);
        res.status(500).json({
            status: "error",
            registro: null,
            erro: "Erro interno ao buscar builds" 
        });
    }
};



// Função para passar os dados para o router.js
const getBuildsParaRender = async () => {
    try {
        const registro = await mdlBuilds.getAllBuilds();
        return registro || []; // Garante que retorne um array, mesmo se o bd estiver vazio
    } catch (error) {
        console.error("Erro em getBuildsParaRender:", error);
        return []; 
    }
};


module.exports = {
    getAllBuilds,
    getBuildsParaRender
};