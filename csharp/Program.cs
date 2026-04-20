using System.Text.Json;
using System.Xml;



namespace BG3Extractor
{
    class Program
    {
        static void Main(string[] args)
        {
            // Validação da Entrada
            if (args.Length == 0)
            {
                // Devolve um JSON de erro via saída padrão para que o Node consiga ler e repassar ao front-end.
                Console.WriteLine("{\"status\": \"Erro\", \"msg\": \"Nenhum arquivo de save foi enviado para o processador Arcana.\"}");
                return;
            }

            // O args[0] captura o primeiro argumento passado na execução (o caminho absoluto do arquivo no servidor).
            string globalsPath = args[0];

            // Verifica se o arquivo realmente existe no caminho especificado antes de tentar abri-lo.
            if (!File.Exists(globalsPath))
            {
                Console.WriteLine("{\"status\": \"Erro\", \"msg\": \"Arquivo de save não encontrado no servidor.\"}");
                return;
            }

            // Dicionário para mapear os UUIDs (CurrentTemplate) internos do jogo para os nomes legíveis dos Companions.
            var companionsConhecidos = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                { "ad9af97d-75da-406a-ae13-7071c563f604", "Gale" },
                { "3ed74f06-3c60-42dc-83f6-f034cb47c679", "Shadowheart" },
                { "c7c13742-bacd-460a-8f65-f864fe41f255", "Astarion" },
                { "c774d764-4a17-48dc-b470-32ace9ce447d", "Wyll" },
                { "58a69333-40bf-8358-1d17-fff240d7fb12", "Lae'zel" },
                { "25721313-0c15-4935-8176-9f134385451b", "Minthara" },
                { "7628bc0e-52b8-42a7-856a-13a6fd413323", "Halsin" },
                { "0de603c5-42e2-4811-9dad-f652de080eba", "Minsc" },
                { "91b6b200-7d00-4d62-8dc9-99e8339dfa1a", "Jaheira" },
                { "2c76687d-93a2-477b-8b18-8a14b549304c", "Karlach" }
            };

            // Mapeia a posição ("Translate") no mundo do jogo para uma lista de itens. 
            // No XML de save, os itens de um personagem geralmente compartilham a mesma raiz de coordenada/posição.
            var mapPosicaoParaItens = new Dictionary<string, List<ItemData>>();

            // Lista para armazenar os personagens (heróis) encontrados no save.
            var listaHeroisAtivos = new List<PersonagemBuild>();

            try
            {
                // Utilizamos XmlReader em vez de carregar um XmlDocument inteiro na memória.
                using (var reader = XmlReader.Create(globalsPath))
                {
                    while (reader.Read())
                    {
                        // Procura por elementos XML chamados <node>
                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "node")
                        {
                            string nodeId = reader.GetAttribute("id") ?? "";

                            // Lógica de extração para Personagens
                            if (nodeId == "Character")
                            {
                                string translate = "", template = "";
                                bool hasPlayerData = false;

                                // Lê apenas a sub-árvore deste nó específico ("Character")
                                using (XmlReader inner = reader.ReadSubtree())
                                {
                                    while (inner.Read())
                                    {
                                        // Verifica se o personagem é controlável/pertence ao jogador
                                        if (inner.Name == "node" && inner.GetAttribute("id") == "PlayerData")
                                            hasPlayerData = true;

                                        // Extrai os atributos importantes do personagem
                                        if (inner.Name == "attribute")
                                        {
                                            string attrId = inner.GetAttribute("id") ?? "";
                                            string val = inner.GetAttribute("value") ?? "";

                                            // "Translate" atua como a chave de vínculo entre o personagem e seus itens
                                            if (attrId == "Translate") translate = val;
                                            // "CurrentTemplate" é o UUID que identifica quem é o personagem
                                            if (attrId == "CurrentTemplate") template = val;
                                        }
                                    }
                                }

                                // Se for um personagem do jogador e tiver uma posição válida, adiciona à lista
                                if (hasPlayerData && !string.IsNullOrEmpty(translate))
                                {
                                    // Se o templateID não estiver no dicionário, assumimos que é o personagem customizado do jogador (Tav)
                                    string nome = companionsConhecidos.ContainsKey(template) ? companionsConhecidos[template] : "Protagonista (Tav)";
                                    listaHeroisAtivos.Add(new PersonagemBuild
                                    {
                                        Nome = nome,
                                        TemplateID = template,
                                        Position = translate,
                                    });
                                }
                            }
                            // Lógica de extração para Itens
                            else if (nodeId == "Item")
                            {
                                string translate = "", template = "", stats = "";

                                // Lê a sub-árvore deste nó ("Item")
                                using (XmlReader inner = reader.ReadSubtree())
                                {
                                    while (inner.Read())
                                    {
                                        if (inner.Name == "attribute")
                                        {
                                            string attrId = inner.GetAttribute("id") ?? "";
                                            string val = inner.GetAttribute("value") ?? "";

                                            if (attrId == "Translate") translate = val;
                                            if (attrId == "CurrentTemplate") template = val;
                                            if (attrId == "Stats") stats = val; // Extrai as estatísticas base do item
                                        }
                                    }
                                }

                                // Se o item tiver uma posição (Translate), agrupamos no dicionário usando a posição como chave
                                if (!string.IsNullOrEmpty(translate))
                                {
                                    // Inicializa a lista para esta posição caso ainda não exista
                                    if (!mapPosicaoParaItens.ContainsKey(translate))
                                    {
                                        mapPosicaoParaItens[translate] = new List<ItemData>();
                                    }
                                    // Adiciona o item à lista correspondente àquela posição
                                    mapPosicaoParaItens[translate].Add(new ItemData { TemplateID = template, Stats = stats });
                                }
                            }
                        }
                    }
                }

                // Cruzamento de Dados (LINQ): 
                // Associa os itens aos personagens cruzando a propriedade "Position" (Translate).
                var buildFinal = listaHeroisAtivos
                    .Where(p => mapPosicaoParaItens.ContainsKey(p.Position)) // Pega apenas heróis que têm itens atrelados à sua posição
                    .Select(p => new
                    {
                        p.Nome,
                        p.TemplateID,
                        p.IsMain,
                        Itens = mapPosicaoParaItens[p.Position] // Vincula os itens agrupados anteriormente
                    })
                    .OrderByDescending(p => p.IsMain) // Garante que o personagem principal venha primeiro
                    .ThenByDescending(p => p.Itens.Count) // Em seguida, ordena por quem tem mais itens
                    .Take(10) // Limita aos 10 primeiros personagens (evita sobrecarga com NPCs temporários)
                    .ToList();

                // Montagem da Resposta para o Backend:
                // Em vez de gravar em arquivo, serializamos o objeto anônimo diretamente para uma string JSON.
                string jsonOutput = JsonSerializer.Serialize(new { status = "Sucesso", data = buildFinal });

                // O Console.WriteLine joga essa string no 'stdout'.
                // O Node.js consegue capturar essa saída usando 'child_process' (exec ou spawn).
                Console.WriteLine(jsonOutput);
            }
            catch (Exception ex)
            {
                // Tratamento de Erros de Leitura:
                // Se o XML estiver corrompido ou malformado, o servidor não crasha. 
                // Ele captura a exceção e devolve um JSON de erro de forma elegante para o Node.
                var erroObj = new { status = "Erro", msg = $"Falha ao ler o arquivo: {ex.Message}" };
                Console.WriteLine(JsonSerializer.Serialize(erroObj));
            }
        }
    }

    // Classes de Modelo (Data Transfer Objects)
    public class ItemData
    {
        public string TemplateID { get; set; } = "";
        public string Stats { get; set; } = "";
    }

    public class PersonagemBuild
    {
        public string Nome { get; set; } = "";
        public string TemplateID { get; set; } = "";

        // Propriedade usada internamente para fazer o "Join" entre o personagem e a lista de itens.
        public string Position { get; set; } = "";
        public bool IsMain { get; set; }
    }
}