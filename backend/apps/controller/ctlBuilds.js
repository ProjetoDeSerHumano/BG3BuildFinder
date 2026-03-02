const mdlBuilds = require("../model/mdlBuilds");

const getAllBuilds = async (req, res) => {
    try {
        const registro = await mdlBuilds.getAllBuilds();
        
        
        res.json({
            status: "ok",
            registro: registro,
            erro: null
        });
    } catch (error) {
        res.status(500).json({
            status: "error",
            registro: null,
            erro: error.message
        });
    }
};

module.exports = {
    getAllBuilds,
};