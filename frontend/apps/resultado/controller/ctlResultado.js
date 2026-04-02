const axios = require("axios");

const paginaResultado= async (req, res) =>
    (async () => {

        try {

            return res.render("resultado/view/resultado.njk", {
                title: 'BG3 Build Finder',
                erro: null,
            });

        } catch (error) {

            let remoteMSG = "Erro ao carregar a pagina.";
            return res.render("resultado/view/resultado.njk", {
                title: 'BG3 Build Finder',
                erro: remoteMSG,
            });
        }

    })();

module.exports = {
    paginaResultado,
};
