document.addEventListener("DOMContentLoaded", () => {

        //Chama os dados salvos no navegador e os colaca na variavel para serem usados
        const dadosSalvos = sessionStorage.getItem('saveDataBG3');

        //Faz uma verificação de segurança se o usuário acessou a página direto sem enviar o save
        if (dadosSalvos) {

            // O dado estava guardado como um texto simples.
            // Aqui ele volta em um Objeto JavaScript
            const personagensExtraidos = JSON.parse(dadosSalvos);

            console.log("Dados recuperados com sucesso:", personagensExtraidos);

        } else {
            console.warn("Nenhum dado de save foi encontrado na sessão.");
            //volta para a pagina de inserção
            window.location.href = "/personalizar";
        }
    });