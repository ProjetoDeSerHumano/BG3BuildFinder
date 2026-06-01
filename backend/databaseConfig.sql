CREATE TABLE IF NOT EXISTS Builds (
    ato INT,
    id_build SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    classes VARCHAR(100),
    ac INT ,
    str INT ,
    dex INT ,
    con INT ,
    int_stat INT, 
    wis INT,
    cha INT,
    resumo TEXT,
    img_portrait VARCHAR(255)
	
);

CREATE TABLE IF NOT EXISTS Itens (
    id_item SERIAL PRIMARY KEY,
    ato_item INT,
    raridade VARCHAR(20),
    nome_item VARCHAR(150) NOT NULL,
    img_icon VARCHAR(255),
	link_wiki VARCHAR(200),
    /*não colocar ids nos consumiveis*/
    TemplateID VARCHAR(200) UNIQUE 
	
);

CREATE TABLE IF NOT EXISTS Build_Itens (
    id_build_itens SERIAL PRIMARY KEY,
    id_build INT REFERENCES Builds(id_build) ON DELETE CASCADE,
    id_item INT REFERENCES Itens(id_item) ON DELETE CASCADE,
    slot VARCHAR(50) NOT NULL 

);

/*


drop table Build_Itens; 
drop table builds;
drop table itens ;

delete from Build_Itens ;
delete from builds;
DELETE FROM itens;

select * from builds;
select * from itens;
select * from build_itens;*/