using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Xml;

namespace BG3Extractor
{
    class Program
    {
        static void Main(string[] args)
        {
        
            // Agora o programa EXIGE que o Node.js passe o caminho do arquivo temporário que veio do HTML.
            if (args.Length == 0)
            {
                // Devolvemos um JSON de erro caso o Node não mande o arquivo
                Console.WriteLine("{\"status\": \"Erro\", \"msg\": \"Nenhum arquivo de save foi enviado para o processador Arcana.\"}");
                return;
            }

            // O args[0] é o caminho do arquivo que o Node.js recebeu do seu front-end
            string globalsPath = args[0]; 

            if (!File.Exists(globalsPath))
            {
                Console.WriteLine("{\"status\": \"Erro\", \"msg\": \"Arquivo de save não encontrado no servidor.\"}");
                return;
            }

            // --- A PARTIR DAQUI, SUA LÓGICA CONTINUA INTACTA ---
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

            var mapPosicaoParaItens = new Dictionary<string, List<ItemData>>();
            var listaHeroisAtivos = new List<PersonagemBuild>();

            try
            {
                using (var reader = XmlReader.Create(globalsPath))
                {
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "node")
                        {
                            string nodeId = reader.GetAttribute("id") ?? "";
                            if (nodeId == "Character")
                            {
                                string translate = "", template = "";
                                bool hasPlayerData = false;

                                using (XmlReader inner = reader.ReadSubtree())
                                {
                                    while (inner.Read())
                                    {
                                        if (inner.Name == "node" && inner.GetAttribute("id") == "PlayerData")
                                            hasPlayerData = true;
                                        if (inner.Name == "attribute")
                                        {
                                            string attrId = inner.GetAttribute("id") ?? "";
                                            string val = inner.GetAttribute("value") ?? "";
                                            if (attrId == "Translate") translate = val;
                                            if (attrId == "CurrentTemplate") template = val;
                                        }
                                    }
                                }

                                if (hasPlayerData && !string.IsNullOrEmpty(translate))
                                {
                                    string nome = companionsConhecidos.ContainsKey(template) ? companionsConhecidos[template] : "Protagonista (Tav)";
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
                                    if (!mapPosicaoParaItens.ContainsKey(translate))
                                    {
                                        mapPosicaoParaItens[translate] = new List<ItemData>();
                                    }
                                    mapPosicaoParaItens[translate].Add(new ItemData { TemplateID = template, Stats = stats });
                                }
                            }
                        }
                    }
                }

                var buildFinal = listaHeroisAtivos
                    .Where(p => mapPosicaoParaItens.ContainsKey(p.Position))
                    .Select(p => new
                    {
                        p.Nome,
                        p.TemplateID,
                        p.IsMain,
                        Itens = mapPosicaoParaItens[p.Position]
                    })
                    .OrderByDescending(p => p.IsMain)
                    .ThenByDescending(p => p.Itens.Count)
                    .Take(10)
                    .ToList();

                // Em vez de usar File.WriteAllText para criar um arquivo json...
                // Nós transformamos o resultado em string e imprimimos no console.
                string jsonOutput = JsonSerializer.Serialize(new { status = "Sucesso", data = buildFinal });
                Console.WriteLine(jsonOutput);
            }
            catch (Exception ex)
            {
                // Se o XML estiver corrompido, por exemplo, ele avisa o Node sem quebrar o servidor
                var erroObj = new { status = "Erro", msg = $"Falha ao ler o arquivo: {ex.Message}" };
                Console.WriteLine(JsonSerializer.Serialize(erroObj));
            }
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