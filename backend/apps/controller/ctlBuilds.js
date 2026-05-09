const mdlBuilds = require("../model/mdlBuilds");

const getAllBuilds = async (req, res) => {
    try {
        const registro = await mdlBuilds.getAllBuilds();

        //Verifica se retornou algo
        if (!registro || registro.length === 0) {
            return res.status(200).json({
                status: "ok",
                registro: [],
                message: "Nenhuma build encontrada"
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


module.exports = {
    getAllBuilds,

};