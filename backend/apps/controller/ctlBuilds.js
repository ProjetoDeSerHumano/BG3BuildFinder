const mdlBuilds = require("../model/mdlBuilds");

const getAllBuilds = async (req, res) => {
    try {
        const registro = await mdlBuilds.getAllBuilds();

        // Opcional: Verificar se retornou algo
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
        console.error("Erro em getAllBuilds:", error); // Ajuda no debug
        res.status(500).json({
            status: "error",
            registro: null,
            erro: "Erro interno ao buscar builds" // Evita expor detalhes sensíveis do DB
        });
    }
};


module.exports = {
    getAllBuilds,
    
};