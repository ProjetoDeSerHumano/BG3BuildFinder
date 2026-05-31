//Essas linhas comandam o navegador a não realizar o procedimento padrão de abrir os arquivos em outra aba 
window.addEventListener("dragover", e => e.preventDefault(), false);
window.addEventListener("drop", e => e.preventDefault(), false);

//DOMContentLoaded garante que a função só carregue após a pagina ser carregada
document.addEventListener("DOMContentLoaded", () => {
    //Carlos
    const formUpload = document.getElementById('formUploadSave');
    const promptTexto = document.querySelector('.dropZonePrompt span');
    //Heitor
    const dropZone = document.getElementById("dropZone");
    const fileInput = document.querySelector(".dropZoneInput");
    const btnIniciar = document.getElementById("btnIniciar");

    // Clique para seleção manual
    dropZone.addEventListener("click", () => fileInput.click());

    // Efeito visual ao arrastar
    dropZone.addEventListener("dragover", e => {
        e.preventDefault();
        e.stopPropagation();
        dropZone.classList.add("dropZoneOver");
    });
    //Remove o efeito após o arquivo ser inserido ou largado
    ["dragleave", "dragend", "drop"].forEach(type => {
        dropZone.addEventListener(type, () => dropZone.classList.remove("dropZoneOver"));
    });

    // Evento de soltar
    dropZone.addEventListener("drop", e => {
        e.preventDefault();
        e.stopPropagation();
        if (e.dataTransfer.files.length === 1) {
            fileInput.files = e.dataTransfer.files;
            exibirArquivoNaTela(dropZone, e.dataTransfer.files[0]);
        } else {
            alert("Muitos arquivos detectados! Envie apenas um save por vez.");
        }
    });

    // Evento de Seleção Manual
    fileInput.addEventListener("change", () => {
        if (fileInput.files.length > 0) {
            exibirArquivoNaTela(dropZone, fileInput.files[0]);
        }
    });

    // Evento quando o usuario aperta o botão
    // Adicionei o formUpload com submit
    formUpload.addEventListener("submit", async (event) => {
        // ESSENCIAL: Impede que a página recarregue ao apertar o botão
        event.preventDefault();

        //Caso o arquivo não tenha sido inserido 
        if (fileInput.files.length === 0) {
            alert("Selecione um arquivo de save antes de iniciar.");
            return;
        }

        //cria um formulario para enviar o arquivo de save para o programa c#
        //Acrescentado formUpload
        const formData = new FormData(formUpload);
        //formData.append("saveFile", fileInput.files[0]);

        try {
            btnIniciar.innerText = "⌛ Extraindo Dados...";
            btnIniciar.disabled = true;
            btnIniciar.style.cursor = "wait";

            //envia os dados para a o endereço do c# e armazena a resposta no const
            const response = await fetch("http://localhost:40000/personalizar/analisar-save", {
                method: "POST",
                body: formData
            });

            // Verifica se a resposta foi bem sucedida ANTES de tentar ler o result
            if (!response.ok) {
                //Caso o Node retorne um codigo de erro ele é transformado em texto e mostrado
                const errorText = await response.text();
                throw new Error(`Erro no servidor (${response.status}): ${errorText}`);
            }

            //declaração da variavel result que guardara o conteudo desejado
            const result = await response.json();

            if (result.status === "Sucesso") {
                console.log("Extração concluída:", result.data);

                // Salva os dados na memória do navegador e muda de tela
                sessionStorage.setItem('saveDataBG3', JSON.stringify(result.data));
                window.location.href = "/resultado";
            } else {
                throw new Error(result.msg || "Erro no processamento da Extração Arcana");
            }

        } catch (error) {
            console.error("Falha na conexão:", error);
            alert("Erro ao processar o arquivo.");
            
        } finally {
            // O finally vai garantir que o botão volte ao normal algo der errado
            btnIniciar.innerText = "Iniciar Extração Arcana";
            btnIniciar.disabled = false;
            btnIniciar.style.cursor = "pointer";
        }
    });
});

//funcão estetica para mostrar que o arquivo foi recebido
function exibirArquivoNaTela(container, file) {
    const prompt = container.querySelector(".dropZonePrompt");
    if (prompt) prompt.style.display = "none";

    let thumb = container.querySelector(".dropZoneThumb");
    if (!thumb) {
        thumb = document.createElement("div");
        thumb.classList.add("dropZoneThumb");
        container.appendChild(thumb);
    }
    thumb.dataset.label = file.name;
    thumb.innerHTML = `<div style="font-size: 2rem;">✔️</div>`;
}