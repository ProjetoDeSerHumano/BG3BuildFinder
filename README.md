Esse Projeto de TCC feito pelos alunos Carlos Eduardo Teles dos Santos e Heitor Pinati Martins.

O projeto propõe um sistema inteligente para a análise, filtragem e recomendação de progressão de personagens no universo do RPG Baldur's Gate 3, aliado ao estudo da arquitetura de arquivos de salvamento do jogo.

## Resumo do Projeto

Gerenciar a progressão de personagens em RPGs complexos exige a manipulação de um volume massivo de variáveis (atributos, classes, feitiços e equipamentos). Este projeto une a teoria de estruturas de dados aplicadas a jogos digitais com uma interface web interativa. 

O objetivo é fornecer uma ferramenta capaz de ler, processar e otimizar *builds* de BG3, processando as informações por meio de algoritmos clássicos de seleção e sistemas de filtragem eficientes.

##Referencial Teórico e Algoritmos

A inteligência por trás do sistema de filtragem do projeto foi estruturada com base nas seguintes metodologias computacionais:

*   **Algoritmo de Pontuação Ponderada (Weighted Scoring):** Utilizado para classificar e ranquear as melhores combinações de habilidades e equipamentos. O algoritmo atribui pesos dinâmicos às variáveis de uma *build*, permitindo ao usuário filtrar os resultados com base em seus objetivos específicos no jogo.
*   **Algoritmo Guloso (Greedy Algorithm):** Implementado no núcleo de tomada de decisão do sistema para calcular a progressão de nível ideal. Ele busca a escolha matemática mais vantajosa (ótimo local) em cada etapa de evolução do personagem, demonstrando eficiência em árvores de habilidades complexas.
*   **Arquitetura de Saves:** Estudo focado no sistema de arquivos de salvamento, mapeando como o estado do jogo e as escolhas do jogador são persistidos e estruturados no código.

## Tecnologias Utilizadas

A aplicação foi desenvolvida focando em um back-end robusto e uma renderização eficiente no lado do servidor (SSR):
*   **Node.js & Express:** Responsáveis pelo roteamento, requisições HTTP e execução dos algoritmos de filtragem no lado do servidor.
*   **Nunjucks:** *Template engine* utilizado para renderizar a interface HTML de forma dinâmica, integrando os resultados dos algoritmos e as respostas diretamente na tela do usuário.
*   **Integração com API de IA (OpenAI):** Utilizada para processar *prompts* e oferecer análises descritivas ou respostas contextuais sobre a progressão sugerida.
*   **CSS3 (Vanilla):** Estilização modular para uma interface limpa e responsiva.
