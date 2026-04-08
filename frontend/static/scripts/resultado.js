// ARQUIVO: resultado.js
document.addEventListener("DOMContentLoaded", () => {
    
    // Chama os dados salvos no navegador (SessionStorage)
    const dadosSalvos = sessionStorage.getItem('saveDataBG3');

    // Faz uma verificação de segurança
    if (dadosSalvos) {
        // Você puxa o save que o usuário enviou na tela anterior
        const saveExtraido = JSON.parse(dadosSalvos);

        // Você lê as builds que vieram do banco através da ponte
        console.log("Save do Jogador:", saveExtraido);
        console.log("Builds do Banco de Dados:", buildsDoBanco);

        // O seu algoritmo de cruzamento de dados começa aqui!

    } else {
        console.warn("Nenhum dado de save foi encontrado na sessão.");
        // Volta para a pagina de inserção
        window.location.href = "/personalizar";
    }
});