const dropZone = document.getElementById('dropZone');

//impede o navegar de executar o procedimento padrão de abrir o arquivo em outra guia
window.addEventListener("dragover", e => e.preventDefault());
window.addEventListener("drop", e => e.preventDefault());

//função que reconhece o arquivo sendo colocado
dropZone.addEventListener("drop", async e => {
    //garantia que o navegador n abrira o arquivo
    e.preventDefault();
    //guarda o arquivo do save em uma variavel que virará uma formdata para facilitar a manipulação
    const file = e
        .dataTransfer
        .files[0];
    const formData = new FormData();
    formData.append("file", file);

    try {
        //envia o arquivo para a porta que esta rodando o processo de descriptografia e espera o retorno do arquivo
        const res = await fetch("http://localhost:5105/processar-save", {
            method: "POST",
            body: formData
        });
        
    } catch (err) {
        console.error("Erro na requisição:", err);
    }
});

// Isso impede que o navegador abra o arquivo em qualquer lugar da tela
window.addEventListener("dragover", function (e) {
    e.preventDefault();
}, false);

window.addEventListener("drop", function (e) {
    e.preventDefault();
}, false);

//executa o código após a página carregar 100%
window.onload = function () {

    document.querySelectorAll(".dropZoneInput").forEach(inputElement => {
        const dropZoneElement = inputElement.closest(".dropZone");

        // Clique para selecionar manual
        dropZoneElement.addEventListener("click", () => inputElement.click());

        // Evento quando o arquivo está SOBRE a zona
        dropZoneElement.addEventListener("dragover", e => {
            e.preventDefault(); // CANCELA o comportamento de abrir
            e.stopPropagation(); // PARA o evento de subir para o navegador
            dropZoneElement.classList.add("dropZoneOver");
        });

        // Evento quando o arquivo sai da zona
        ["dragleave", "dragend"].forEach(type => {
            dropZoneElement.addEventListener(type, e => {
                dropZoneElement.classList.remove("dropZoneOver");
            });
        });

        // Evento quando o arquivo é SOLTO
        dropZoneElement.addEventListener("drop", e => {
            e.preventDefault(); // CANCELA o comportamento de abrir definitivamente
            e.stopPropagation();

            if (e.dataTransfer.files.length) {
                inputElement.files = e.dataTransfer.files;
                console.log("Arquivo capturado com sucesso:", e.dataTransfer.files[0].name);
                updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
            }

            dropZoneElement.classList.remove("dropZoneOver");
        });
    });
};
//função estetica para facilitar o uso
function updateThumbnail(dropZoneElement, file) {
    let thumbnailElement = dropZoneElement.querySelector(".dropZoneThumb");
    const prompt = dropZoneElement.querySelector(".dropZonePrompt");
    if (prompt) prompt.remove();

    if (!thumbnailElement) {
        thumbnailElement = document.createElement("div");
        thumbnailElement.classList.add("dropZoneThumb");
        dropZoneElement.appendChild(thumbnailElement);
    }

    thumbnailElement.dataset.label = file.name;
}