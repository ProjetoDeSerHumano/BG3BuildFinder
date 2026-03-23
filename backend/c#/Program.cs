using System.Text.Json;
using System.Xml;

namespace BG3Extractor
{
    class Program
    {
        static void Main(string[] args)
        {
            //variavel que recebe caminho da areao de trabalho
            string desktopPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            //pega o arquvio globals ja traduzido
            string globalsPath = Path.Combine(desktopPath, "globals.lsx");
            //devolve as informacoes em json
            string outputPath = Path.Combine(desktopPath, "build_party.json");

            //codigo dos companions
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

            //variavel que armazena um dicionario com o local dos npc e os itens atrelados a ele pela posição
            var mapPosicaoParaItens = new Dictionary<string, List<ItemData>>();
            //uma lista completa de todos os pesonagens encontrados no arquivo(usada para filtrar os npcs n identificados futuramente)
            var listaHeroisAtivos = new List<PersonagemBuild>();

            //usando uma ferramenta da biblioteca propria para ler esse tipo de arquivo
            using (var reader = XmlReader.Create(globalsPath))
            {
                while (reader.Read())
                {
                    //se o reader achar um elemntento com o nome "node" 
                    if (reader.NodeType == XmlNodeType.Element && reader.Name == "node")
                    {
                        //pega o id do node caso exista
                        string nodeId = reader.GetAttribute("id") ?? "";
                        //se o id for character
                        if (nodeId == "Character")
                        {
                            string translate = "", template = "";
                            bool hasPlayerData = false;

                            //usa a ferramenta para ler toda as informacões do no atual(as subtrees)
                            using (XmlReader inner = reader.ReadSubtree())
                            {
                                //passa todas as informacoes por aqui
                                while (inner.Read())
                                {
                                    //confirma que esse no tem a informação do player oq exclui muitas das entidades n desejadas
                                    if (inner.Name == "node" && inner.GetAttribute("id") == "PlayerData")
                                        hasPlayerData = true;
                                    //coleta os atributos do nó, traslate é o local da entidade no mapa e current template e o codigo que é usado para identificar os npcs
                                    if (inner.Name == "attribute")
                                    {
                                        string attrId = inner.GetAttribute("id") ?? "";
                                        string val = inner.GetAttribute("value") ?? "";
                                        if (attrId == "Translate") translate = val;
                                        if (attrId == "CurrentTemplate") template = val;
                                    }
                                }
                            }

                            // FILTRO CRUCIAL: Só entra se tiver posição e for da party (PlayerData)
                            if (hasPlayerData && !string.IsNullOrEmpty(translate))
                            {
                                //atribui o nome dos companions e caso n acha considera como tav
                                string nome = companionsConhecidos.ContainsKey(template) ? companionsConhecidos[template] : "Protagonista (Tav)";
                                //adiciona na lista os dados encontrados
                                listaHeroisAtivos.Add(new PersonagemBuild
                                {
                                    Nome = nome,
                                    TemplateID = template,
                                    Position = translate,

                                });
                            }
                        }
                        else if (nodeId == "Item")
                        {
                            string translate = "", template = "", stats = "";
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
                                        if (attrId == "Stats") stats = val;
                                    }
                                }
                            }
                            if (!string.IsNullOrEmpty(translate))
                            {
                                //se o item não possui uma lista no local que ele está
                                if (!mapPosicaoParaItens.ContainsKey(translate))
                                {
                                    //cria uma nova lista para a posicao
                                    mapPosicaoParaItens[translate] = new List<ItemData>();
                                }
                                //adiciona o item na lista criada
                                mapPosicaoParaItens[translate].Add(new ItemData { TemplateID = template, Stats = stats });
                            }
                        }
                    }
                }
            }

            // Cruzamento final com um filtro extra: Pegar apenas os personagens que REALMENTE possuem itens na posição
            // E se houver mais de um "Tav", priorizar o que tem a flag IsMain ou o que tem mais itens (inventário real)
            var buildFinal = listaHeroisAtivos
                .Where(p => mapPosicaoParaItens.ContainsKey(p.Position))
                .Select(p => new
                {
                    p.Nome,
                    p.TemplateID,
                    p.IsMain,
                    Itens = mapPosicaoParaItens[p.Position]
                })
                .OrderByDescending(p => p.IsMain) // Garante que o Protagonista real venha primeiro
                .ThenByDescending(p => p.Itens.Count) // Em caso de dúvida, o herói com mais itens é o ativo
                .Take(10) // Limita aos 4 membros da party ativa
                .ToList();

            File.WriteAllText(outputPath, JsonSerializer.Serialize(buildFinal, new JsonSerializerOptions { WriteIndented = true }));
            Console.WriteLine($"Sucesso! Party de {buildFinal.Count} membros exportada.");
        }
    }

    public class ItemData { public string TemplateID { get; set; } = ""; public string Stats { get; set; } = ""; }
    public class PersonagemBuild
    {
        public string Nome { get; set; } = "";
        public string TemplateID { get; set; } = "";
        public string Position { get; set; } = "";
        public bool IsMain { get; set; }
    }
}