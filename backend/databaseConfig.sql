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
insert into builds(id_build, ato, nome, classes, ac, str, dex, con,int_stat,wis, cha, resumo, img_portrait)
	values(1,2,'Stealth Archer','5 Gloom Stalker / 5 Assassin / 2 Fighter', 21, 8, 18, 14, 8, 16, 10,
		   'A build com maior output de dano do jogo, muito recomendada para assasinos no modo honra',
		  	'https://www.coolstuffinc.com/s3_image.php?img=http://s3.gatheringmagic.com/uploads/2024/01/11/ML_15.jpg');
			
insert into itens(id_item,ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) values
	(1, 1,'#008000','Diadem of Arcane Synergy',
		'https://bg3.wiki/w/images/thumb/9/92/Diadem_of_Arcane_Synergy_Icon.png/300px-Diadem_of_Arcane_Synergy_Icon.png.webp',
		'https://bg3.wiki/wiki/Diadem_of_Arcane_Synergy',
	 	'f6585fc7-22bb-4e58-b4a6-bbb56e48a86f'),
	(2,1,'#008000','The Deathstalker Mantle',
		'https://bg3.wiki/w/images/thumb/2/2d/The_Deathstalker_Mantle_Faded.png/300px-The_Deathstalker_Mantle_Faded.png.webp',
		'https://bg3.wiki/wiki/The_Deathstalker_Mantle',
	 	'dff731f7-d6da-403d-80cf-7f3d9cc7345b'),
	(3,1,'#008000', 'Yuan-Ti Scale Mail',
		'https://bg3.wiki/w/images/thumb/4/4d/Scale_Mail_PlusTwo_Icon.png/300px-Scale_Mail_PlusTwo_Icon.png.webp',
		'https://bg3.wiki/wiki/Yuan-Ti_Scale_Mail',
		'1301826f-a496-410a-8672-00109968846c
');

insert into build_itens(id_build_itens,id_build,id_item,slot) values
	(1,1,1,'head'),
	(2,1,2,'cloak');

drop table Build_Itens; 
drop table builds;
drop table itens ;

delete from Build_Itens ;
delete from builds;
DELETE FROM itens;

select * from builds;
select * from itens;
select * from build_itens;*/