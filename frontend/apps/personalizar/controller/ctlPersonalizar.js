const axios = require("axios");

const paginaPersonalizar = async (req, res) =>
    (async () => {

        try {

            return res.render("personalizar/view/personalizar.njk", {
                title: 'BG3 Build Finder',
                erro: null,
            });

        } catch (error) {

            let remoteMSG = "Erro ao carregar a pagina.";
            return res.render("personalizar/view/personalizar.njk", {
                title: 'BG3 Build Finder',
                erro: remoteMSG,
            });
        }

    })();

module.exports = {
    paginaPersonalizar,
};
