const axios = require("axios");

const listarBuilds = async (req, res) =>
    (async () => {
        const apiUrl = process.env.SERVIDOR_BG3Back + "/GetAllBuilds";

        try {
            const resp = await axios.get(apiUrl);

            return res.render("resultado/view/resultado.njk", {
                title: 'BG3 Build Finder',
                data: resp.data.registro,
                erro: null,
            });

        } catch (error) {
            console.error('Erro:', error.message);

            let remoteMSG = "Erro ao conectar com o servidor de dados.";
            if (error.code === "ECONNREFUSED") {
                remoteMSG = "O servidor Backend está offline.";
            }
            return res.render("resultado/view/resultado.njk", {
                title: 'BG3 Build Finder',
                erro: remoteMSG,
            });
        }

    })();

module.exports = {
    listarBuilds,
};
