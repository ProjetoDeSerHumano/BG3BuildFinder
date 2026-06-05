const db = require("../../database/databaseconfig");

const getAllBuilds = async () => {
    // Esta query busca a build e agrupa todos os itens em um campo chamado "itens"
    const sql = `
        SELECT 
            b.*, 
            JSON_AGG(
                JSON_BUILD_OBJECT(
                    'slot', bi.slot,
                    'ato_item', i.ato_item,
                    'raridade', i.raridade,
                    'nome_item', i.nome_item,
                    'img_icon', i.img_icon,
                    'link_wiki', i.link_wiki,
                    'TemplateID', i.TemplateID
                )
            ) AS lista_itens
        FROM Builds b
        LEFT JOIN Build_Itens bi ON b.id_build = bi.id_build
        LEFT JOIN Itens i ON bi.id_item = i.id_item
        GROUP BY b.id_build
        ORDER BY b.nome ASC`
    ;
    
    const result = await db.query(sql);
    return result.rows;
};

module.exports = {
    getAllBuilds,
};