const axios = require("axios");

const paginaInicial = async (req, res) =>
    (async () => {

        try {

            return res.render("home/view/index.njk", {
                title: 'BG3 Build Finder',
                erro: null,
            });

        } catch (error) {

            let remoteMSG = "Erro ao carregar a pagina.";
            return res.render("home/view/index.njk", {
                title: 'BG3 Build Finder',
                erro: remoteMSG,
            });
        }

    })();

module.exports = {
    paginaInicial,
};
