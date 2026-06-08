drop table Build_Itens; 
drop table builds;
drop table itens ;
-- INSERTS
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
-- INSERTS
 
/*
	RARIDADES
	#FFFFFF - COMUM
	#32E432 - INCOMUM
	#00BBFF - RARO
	#D1017B - MUITO RARO
	#ED7C01 - LENDÁRIO
	#FF6600 - ITEM DE HISTÓRIA
*/
 
-- ==========================================
-- TABELA: ITENS
-- ==========================================
 
-- ITENS ATO 1
INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
	(1, 1, '#32E432', 'Holy Lance Helm', 'https://bg3.wiki/w/images/c/c5/Holy_Lance_Helm_Icon.png', 'https://bg3.wiki/wiki/Holy_Lance_Helm', '5b3c40c5-b0c0-44b5-9b75-e642069fd2cc'),
	(2, 1, '#32E432', 'Luminous Armour', 'https://bg3.wiki/w/images/8/83/Luminous_Armour_Icon.png', 'https://bg3.wiki/wiki/Luminous_Armour', 'a2cbaf4f-3eb8-4362-9f2e-d325a0d47a36'),
	(3, 1, '#32E432', 'Gloves of Belligerent Skies', 'https://bg3.wiki/w/images/e/e4/Gloves_of_Belligerent_Skies_Icon.png', 'https://bg3.wiki/wiki/Gloves_of_Belligerent_Skies', 'c987b6e4-adcb-47d6-8dfd-6d4d2f15a381'),
	(4, 1, '#32E432', 'Boots of Stormy Clamour',  'https://bg3.wiki/w/images/0/0b/Boots_of_Stormy_Clamour_Icon.png', 'https://bg3.wiki/wiki/Boots_of_Stormy_Clamour', '3908725d-29d1-4c9a-be46-4e03c8c65238'),
	(5, 1, '#00BBFF', 'Phalar Aluve', 'https://bg3.wiki/w/images/8/89/Longsword_%2B1_Icon.png', 'https://bg3.wiki/wiki/Phalar_Aluve', '6d0d3206-50b5-48ed-af92-a146ed6b98f2'),
	(6, 1, '#32E432', 'Glowing Shield', 'https://bg3.wiki/w/images/1/1f/Glowing_Shield_Icon.png', 'https://bg3.wiki/wiki/Glowing_Shield', '3374ad91-ddcf-430a-bddd-f48e8699ade9'),
	(7, 1, '#32E432', 'Bow of Awareness' , 'https://bg3.wiki/w/images/d/dd/Shortbow_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Bow_of_Awareness', 'c57ba806-b340-4307-9c37-170792052b8d'),
	(8, 1, '#00BBFF', 'Amulet of Restoration', 'https://bg3.wiki/w/images/b/bf/Amulet_Necklace_F_Silver_A_1_Faded.png', 'https://bg3.wiki/wiki/Amulet_of_Restoration', 'b648ee98-f648-411b-be7e-6c50ca9b463c'),
	(9, 1, '#00BBFF', 'Diadem of Arcane Synergy', 'https://bg3.wiki/w/images/9/92/Diadem_of_Arcane_Synergy_Icon.png', 'https://bg3.wiki/wiki/Diadem_of_Arcane_Synergy', 'f6585fc7-22bb-4e58-b4a6-bbb56e48a86f'),
	(10, 1, '#00BBFF', 'Spidersilk Armour', 'https://bg3.wiki/w/images/8/85/Spidersilk_Armour_Faded.webp', 'https://bg3.wiki/wiki/Spidersilk_Armour', 'c0c0534c-b7fc-4d0b-a335-b8f4c548852d'),
	(11, 1, '#D1017B', 'Gloves of Dexterity', 'https://bg3.wiki/w/images/2/27/Gloves_Leather_2_Faded.png', 'https://bg3.wiki/wiki/Gloves_of_Dexterity', 'f3775096-0055-4d35-8cc0-f5765284bc7d'),
	(12, 1, '#00BBFF', 'Springstep Boots', 'https://bg3.wiki/w/images/6/6a/Springstep_Boots_Icon.png', 'https://bg3.wiki/wiki/Springstep_Boots', '1a6825cb-95d5-4542-b018-deb48d936b73'),
	(13, 1, '#D1017B', 'Adamantine Scale Mail', 'https://bg3.wiki/w/images/e/e0/Adamantine_Scale_Mail_Icon.png', 'https://bg3.wiki/wiki/Adamantine_Scale_Mail', '5427c806-5565-421f-a00f-a8282a9f504f'),
	(14, 1, '#32E432', 'Hellrider‘s Pride', 'https://bg3.wiki/w/images/4/47/Gloves_Metal_1_Faded.png', 'https://bg3.wiki/wiki/Hellrider%27s_Pride', 'db4d4560-dc72-4d64-b552-5caf442c0927'),
	(15, 1, '#32E432', 'Boots of Striding', 'https://bg3.wiki/w/images/f/f0/Boots_Metal_F_Faded.png', 'https://bg3.wiki/wiki/Boots_of_Striding', '8770f821-38bc-41cc-aae9-02988d46df02'),
	(16, 1, '#32E432', 'Xyanyde', 'https://bg3.wiki/w/images/5/51/Mace_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Xyanyde', '4b0131e0-875a-4f3c-8b41-dbf653857d00'),
	(17, 1, '#FFFFFF', 'Studded Shield', 'https://bg3.wiki/w/images/9/9d/Studded_Shield_Icon.png', 'https://bg3.wiki/wiki/Studded_Shield', 'd2af60ea-1b72-4d25-a188-6d8bc4fe255b'),
	(18, 1, '#32E432', 'Broodmother''s Revenge', 'https://bg3.wiki/w/images/4/48/Amulet_Necklace_F_Bronze_A_1_Faded.png', 'https://bg3.wiki/wiki/Broodmother%27s_Revenge', '21abc023-343a-4693-b63f-3ba07a231864'),
	(19, 1, '#32E432', 'The Whispering Promise', 'https://bg3.wiki/w/images/a/aa/Ring_F_1_Faded.png', 'https://bg3.wiki/wiki/The_Whispering_Promise', '4aef9bb0-38a8-428e-8b87-6e462d612dd6'),
	(20, 1, '#00BBFF', 'Shadow of Menzoberranzan', 'https://bg3.wiki/w/images/b/bb/Frayed_Drow_Hood_Icon.png', 'https://bg3.wiki/wiki/Shadow_of_Menzoberranzan', 'd46206c9-fb4f-44a4-a4f4-f70f8cd2a64c'),
	(21, 1, '#32E432', 'Gloves of Power', 'https://bg3.wiki/w/images/c/cb/Gloves_Leather_1_Faded.png', 'https://bg3.wiki/wiki/Gloves_of_Power', 'd22e2679-aff0-4244-9ed2-7aac981b82cf'),
	(22, 1, '#FF6600', 'Disintegrating Night Walkers', 'https://bg3.wiki/w/images/4/4f/Disintegrating_Nightwalkers_Icon.png', 'https://bg3.wiki/wiki/Disintegrating_Night_Walkers', 'e7f24f6d-4d73-4f04-94ef-d8e7042ce6a2'),
	(23, 1, '#32E432', 'Shortsword of First Blood', 'https://bg3.wiki/w/images/8/86/Shortsword_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Shortsword_of_First_Blood', '1e172d76-3433-4ee7-ae1a-9e7d8ae0f12b'),
	(24, 1, '#00BBFF', 'Haste Helm', 'https://bg3.wiki/w/images/0/07/Haste_Helm_Icon.png', 'https://bg3.wiki/wiki/Haste_Helm', '94cc605d-e407-408d-acb6-9e2e31dfb283'),
	(25, 1, '#00BBFF', 'The Graceful Cloth', 'https://bg3.wiki/w/images/2/2e/The_Graceful_Cloth_Icon.png', 'https://bg3.wiki/wiki/The_Graceful_Cloth', 'b18ef236-44dc-43cd-8f6e-51ae785fae4d'),
	(26, 1, '#00BBFF', 'Bracers of Defence', 'https://bg3.wiki/w/images/0/05/Bracers_of_Defence_Icon.png', 'https://bg3.wiki/wiki/Bracers_of_Defence', '58315437-f06a-4797-a26a-6bbcff80c4fe'),
	(27, 1, '#00BBFF', 'Bow of the Banshee', 'https://bg3.wiki/w/images/d/dd/Shortbow_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Bow_of_the_Banshee', 'c040d1fc-4804-4774-8367-6dfa397e27e2'),
	(28, 1, '#D1017B', 'The Spectator Eyes', 'https://bg3.wiki/w/images/7/7f/Amulet_Necklace_A_Bronze_A_1_Faded.png', 'https://bg3.wiki/wiki/The_Spectator_Eyes', '6fe3b3f6-22f4-4745-9be0-25d0e36a1a4f'),
	(29, 1, '#00BBFF', 'Ring of Protection', 'https://bg3.wiki/w/images/e/e1/Ring_of_Protection_Icon.png', 'https://bg3.wiki/wiki/Ring_of_Protection', '1352a999-76cc-46c5-a67a-26edc2011911'),
	(33, 1, '#00BBFF', 'The Deathstalker Mantle', 'https://bg3.wiki/w/images/thumb/2/2d/The_Deathstalker_Mantle_Faded.png/300px-The_Deathstalker_Mantle_Faded.png.webp', 'https://bg3.wiki/wiki/The_Deathstalker_Mantle', 'dff731f7-d6da-403d-80cf-7f3d9cc7345b'),
	(41, 1, '#D1017B', 'Knife of the Undermountain King', 'https://bg3.wiki/w/images/thumb/2/21/Knife_of_the_Undermountain_King_Faded.webp/300px-Knife_of_the_Undermountain_King_Faded.webp', 'https://bg3.wiki/wiki/Knife_of_the_Undermountain_King', '025e162a-45ec-4f4c-89da-04d8e8dfe606'),
	(43, 1, '#00BBFF', 'Titanstring Bow', 'https://bg3.wiki/w/images/thumb/3/36/Longbow_PlusOne_Icon.png/300px-Longbow_PlusOne_Icon.png.webp', 'https://bg3.wiki/wiki/Titanstring_Bow', '13236988-83df-4bf2-8005-b4ac31f21ff4'),
	(45, 1, '#00BBFF', 'Periapt of Wound Closure', 'https://bg3.wiki/w/images/thumb/3/36/Periapt_of_Wound_Closure_Icon.png/300px-Periapt_of_Wound_Closure_Icon.png.webp', 'https://bg3.wiki/wiki/Periapt_of_Wound_Closure', '716e94de-130b-4f54-84d9-a14fc60adcfb'),
	(47, 1, '#32E432', 'Winter''s Clutches', 'https://bg3.wiki/w/images/thumb/9/95/Gloves_Leather_F_Faded.png/300px-Gloves_Leather_F_Faded.png.webp', 'https://bg3.wiki/wiki/Winter%27s_Clutches', '7e6bb26ab-2987-4061-9c5c-764b377f91b8'),
	(49, 1, '#32E432', 'Hoarfrost Boots', 'https://bg3.wiki/w/images/thumb/8/8b/Hoarfrost_Boots_Icon.png/300px-Hoarfrost_Boots_Icon.png.webp', 'https://bg3.wiki/wiki/Hoarfrost_Boots', '6ca10a61-07d8-478c-a6e7-8e43072233cf'),
	(51, 1, '#32E432', 'Necklace of Elemental Augmentation', 'https://bg3.wiki/w/images/thumb/2/22/Amulet_Necklace_F_Gold_A_1_Faded.png/300px-Amulet_Necklace_F_Gold_A_1_Faded.png.webp', 'https://bg3.wiki/wiki/Necklace_of_Elemental_Augmentation', 'a92cec2f-3a86-4aa1-a7e9-1d6dc9e12957'),
	(53, 1, '#D1017B', 'Mourning Frost', 'https://bg3.wiki/w/images/thumb/3/36/Mourning_Frost_Icon.png/300px-Mourning_Frost_Icon.png.webp', 'https://bg3.wiki/wiki/Mourning_Frost', 'cab10a42-8c85-459a-9d68-b4836388c022'),
	(55, 1, '#32E432', 'Melf''s First Staff', 'https://bg3.wiki/w/images/thumb/0/08/Magic_Staff_B_Icon.png/300px-Magic_Staff_B_Icon.png.webp', 'https://bg3.wiki/wiki/Melf%27s_First_Staff', '1e8e2d4d-904d-4367-ad28-30012915f458'),
	(56, 1, '#00BBFF', 'The Sparkle Hands', 'https://bg3.wiki/w/images/thumb/c/ca/The_Sparkle_Hands_Icon.png/300px-The_Sparkle_Hands_Icon.png.webp', 'https://bg3.wiki/wiki/The_Sparkle_Hands', 'a0bbe602-ffc1-45f1-9a09-de7d11575465'),
	(57, 1, '#00BBFF', 'Sentient Amulet', 'https://bg3.wiki/w/images/thumb/f/f7/Sentient_Amulet_Icon.png/300px-Sentient_Amulet_Icon.png.webp', 'https://bg3.wiki/wiki/Sentient_Amulet', '086ae8fd-c44e-43a7-b8be-777b551a06d6'),
	(58, 1, '#00BBFF', 'Ring of Flinging', 'https://bg3.wiki/w/images/thumb/d/da/Ring_C_Silver_A_Faded.png/300px-Ring_C_Silver_A_Faded.png.webp', 'https://bg3.wiki/wiki/Ring_of_Flinging', '4aba2198-98f9-4ec8-8a1b-bbd9ed864856'),
	(59, 1, '#D1017B', 'Grymskull Helm', 'https://bg3.wiki/w/images/thumb/d/dd/Grymskull_Helm_Icon.png/300px-Grymskull_Helm_Icon.png.webp', 'https://bg3.wiki/wiki/Grymskull_Helm', '6b1c4d55-e0d1-4b58-a26d-57d807bca488'),
	(60, 1, '#32E432', 'Crusher''s Ring', 'https://bg3.wiki/w/images/thumb/6/63/Crushers_Ring_Icon.png/300px-Crushers_Ring_Icon.png.webp', 'https://bg3.wiki/wiki/Crusher%27s_Ring', '3023d5a5-14f0-4549-8ff2-1f34336c243c'),
	(61, 1, '#00BBFF', 'Soulbreaker Greatsword', 'https://bg3.wiki/w/images/thumb/b/bc/Githyanki_Greatsword_Red_Faded.png/300px-Githyanki_Greatsword_Red_Faded.png.webp', 'https://bg3.wiki/wiki/Soulbreaker_Greatsword', '523a959d-4101-4beb-9a8e-276c3f687c02'),
	(34, 1, '#32E432', 'Club of Hill Giant Strength', 'https://bg3.wiki/w/images/thumb/5/5b/Club_Icon.png/300px-Club_Icon.png.webp', 'https://bg3.wiki/wiki/Club_of_Hill_Giant_Strength', '46e7d280-a9e2-47bb-88f2-0f9098e15b93'),
	(62, 1, '#00BBFF', 'Giantbreaker', 'https://bg3.wiki/w/images/thumb/b/bf/Heavy_Crossbow_PlusOne_Icon.png/300px-Heavy_Crossbow_PlusOne_Icon.png.webp', 'https://bg3.wiki/wiki/Giantbreaker', '260a44f7-9ce6-4c8c-bcc8-2eb018c00590');


 
-- ITENS ATO 2
INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
	(30, 2, '#00BBFF', 'Yuan-Ti Scale Mail', 'https://bg3.wiki/w/images/thumb/4/4d/Scale_Mail_PlusTwo_Icon.png/300px-Scale_Mail_PlusTwo_Icon.png.webp', 'https://bg3.wiki/wiki/Yuan-Ti_Scale_Mail', '14ebeea8-7d0a-47a9-ba79-b1168c21f8d4'),
	(31, 2, '#00BBFF', 'Risky Ring', 'https://bg3.wiki/w/images/thumb/2/22/Ring_E_Gold_A_1_Faded.png/300px-Ring_E_Gold_A_1_Faded.png.webp', 'https://bg3.wiki/wiki/Risky_Ring', '6fa51fb6-0c99-4e2e-bf3c-f4fe18fd64a7'),
	(32, 2, '#32E432', 'Eversight Ring', 'https://bg3.wiki/w/images/thumb/9/9d/Ring_I_Silver_A_1_Faded.png/300px-Ring_I_Silver_A_1_Faded.png.webp', 'https://bg3.wiki/wiki/Eversight_Ring', '0661eb9b-0924-450d-923b-1e371de444ae'),
	
	(36, 2, '#32E432', 'Helmet of Arcane Acuity', 'https://bg3.wiki/w/images/thumb/d/d6/Helmet_of_Arcane_Acuity_Icon.png/300px-Helmet_of_Arcane_Acuity_Icon.png.webp', 'https://bg3.wiki/wiki/Helmet_of_Arcane_Acuity', 'df71a665-a179-43b3-89ee-2e355166fa9b'),
	(38, 2, '#32E432', 'Cloak of Protection', 'https://bg3.wiki/w/images/thumb/2/2a/Cloak_Of_Protection_Faded.png/300px-Cloak_Of_Protection_Faded.png.webp', 'https://bg3.wiki/wiki/Cloak_of_Protection', '602f62dd-0fba-4438-ad68-b846f17ac538'),
	(40, 2, '#00BBFF', 'Flawed Helldusk Armour', 'https://bg3.wiki/w/images/thumb/6/60/Flawed_Helldusk_Armour_Icon.png/300px-Flawed_Helldusk_Armour_Icon.png.webp', 'https://bg3.wiki/wiki/Flawed_Helldusk_Armour', 'd9863839-e955-47a2-8a06-070f5c3c9541'),
	(42, 2, '#00BBFF', 'Flawed Helldusk Gloves', 'https://bg3.wiki/w/images/thumb/e/e7/Flawed_Helldusk_Gloves_Faded.png/300px-Flawed_Helldusk_Gloves_Faded.png.webp', 'https://bg3.wiki/wiki/Flawed_Helldusk_Gloves', 'b673f1dc-d925-4811-a78e-53adcce847e8'),
	(44, 2, '#00BBFF', 'Evasive Shoes', 'https://bg3.wiki/w/images/thumb/f/f8/Shoes_G_Magic_Faded.png/300px-Shoes_G_Magic_Faded.png.webp', 'https://bg3.wiki/wiki/Evasive_Shoes', '119f753a-8b06-44d8-bb9a-8a307f6032da'),
	(46, 2, '#D1017B', 'Killer''s Sweetheart', 'https://bg3.wiki/w/images/thumb/6/69/Ring_I_Gold_A_1_Faded.png/300px-Ring_I_Gold_A_1_Faded.png.webp', 'https://bg3.wiki/wiki/Killer%27s_Sweetheart', '2f2d4bf3-6a14-43f5-81fe-e14aa9871215'),
	(48, 2, '#D1017B', 'Halberd of Vigilance', 'https://bg3.wiki/w/images/thumb/f/f0/Halberd_PlusTwo_Icon.png/300px-Halberd_PlusTwo_Icon.png.webp', 'https://bg3.wiki/wiki/Halberd_of_Vigilance', '187691ba-7027-49a8-ba74-d0dc5cafbe12'),
	(50, 2, '#32E432', 'Coldbrim Hat', 'https://bg3.wiki/w/images/thumb/f/f2/Wizard_Hat_Icon.png/300px-Wizard_Hat_Icon.png.webp', 'https://bg3.wiki/wiki/Coldbrim_Hat', 'd8ef5f3c-cada-42f8-a947-c3a3f62e569d'),
	(52, 2, '#D1017B', 'Potent Robe', 'https://bg3.wiki/w/images/thumb/7/70/Potent_Robe_Icon.png/300px-Potent_Robe_Icon.png.webp', 'https://bg3.wiki/wiki/Potent_Robe', '1e64badf-4898-4169-9b02-3910518dc73d'),
	(54, 2, '#32E432', 'Snowburst Ring', 'https://bg3.wiki/w/images/thumb/d/d2/Ring_A_Gem_A_Gold_1_Faded.png/300px-Ring_A_Gem_A_Gold_1_Faded.png.webp', 'https://bg3.wiki/wiki/Snowburst_Ring', 'ee8d0bb8-ee1c-437c-b8e0-a9671b865c48');

INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES 
    (35, 2, '#00BBFF', 'Fistbreaker Helm', 'https://bg3.wiki/w/images/7/74/Fistbreaker_Helm_Icon.png', 'https://bg3.wiki/wiki/Fistbreaker_Helm', '8eece655-bd99-4451-8ce0-f763edec09a4'),
    (37, 2, '#00BBFF', 'Ring of Free Action', 'https://bg3.wiki/w/images/d/d9/Ring_of_Free_Action_Icon.png', 'https://bg3.wiki/wiki/Ring_of_Free_Action', '50379f58-7892-44cb-be6e-146a60070055');

INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (63, 2, '#32E432', 'Callous Glow Ring', 'https://bg3.wiki/w/images/2/22/Ring_E_Gold_A_1_Faded.png', 'https://bg3.wiki/wiki/Callous_Glow_Ring', 'afdcde80-f976-4781-86be-75a5fb0ae05e');

INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (86, 2, '#ED7C01', 'Shar‘s Spear of Evening', 'https://bg3.wiki/w/images/9/96/Sel%C3%BBne%27s_Spear_of_Night_Icon.png', 'https://bg3.wiki/wiki/Shar%27s_Spear_of_Evening', '61f31bf6-47ec-41e1-9385-2f6c26facc87'),
    (87, 2, '#32E432', 'Shadow-Cloaked Ring', 'https://bg3.wiki/w/images/e/e0/Ring_B_Gem_B_Gold_1_Faded.png', 'https://bg3.wiki/wiki/Shadow-Cloaked_Ring', '9297096d-98d6-4637-9b7c-843af752505e');



-- ITENS ATO 3
INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES 
    (39, 2, '#D1017B', 'Reaper‘s Embrace', 'https://bg3.wiki/w/images/5/59/Reaper%27s_Embrace_Icon.png', 'https://bg3.wiki/wiki/Reaper%27s_Embrace', 'adae74e9-c103-4ddc-b7d2-1fa24b527f83');

INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (64, 3, '#ED7C01', 'Helm of Balduran', 'https://bg3.wiki/w/images/1/1b/Helm_of_Balduran_Icon.png', 'https://bg3.wiki/wiki/Helm_of_Balduran', '0a64283a-1fc4-45cd-9e5e-f463f6b762ea'),
    (65, 3, '#00BBFF', 'Cloak of Displacement', 'https://bg3.wiki/w/images/f/fe/Cloak_of_Displacement_Faded.png', 'https://bg3.wiki/wiki/Cloak_of_Displacement', '257aed3e-370d-40b3-b464-de10257dd82b'),
    (66, 3, '#ED7C01', 'Helldusk Armour', 'https://bg3.wiki/w/images/c/cb/Helldusk_Armour_Icon.png', 'https://bg3.wiki/wiki/Helldusk_Armour', '7ae705fd-1cfd-4482-a584-d2e68f9c1262'),
    (67, 3, '#D1017B', 'Legacy of the Masters', 'https://bg3.wiki/w/images/b/b0/Gloves_Metal_C_Faded.png', 'https://bg3.wiki/wiki/Legacy_of_the_Masters', 'c9ea7679-d30a-481f-b45b-c0427d569ec7'),
    (68, 3, '#D1017B', 'Boots of Persistence', 'https://bg3.wiki/w/images/a/ae/Boots_of_Persistence_Icon.png', 'https://bg3.wiki/wiki/Boots_of_Persistence', 'f3d8ff49-eaac-4c10-9421-3fd2180c7b39'),
    (69, 3, '#ED7C01', 'Balduran’s Giantslayer', 'https://bg3.wiki/w/images/f/f1/Balduran_Giantslayer_Icon.png', 'https://bg3.wiki/wiki/Balduran%27s_Giantslayer', '7219fca3-5f41-43a0-8253-f4c09d8b6308'),
    (70, 3, '#D1017B', 'Amulet of Greater Health', 'https://bg3.wiki/w/images/2/27/Amulet_of_Greater_Health_Icon.png', 'https://bg3.wiki/wiki/Amulet_of_Greater_Health', '5ed63342-30c9-456d-9a57-a88c8596c0c9');



INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (71, 3, '#D1017B', 'Bonespike Garb', 'https://bg3.wiki/w/images/2/2a/Bonespike_Garb_Icon.png', 'https://bg3.wiki/wiki/Bonespike_Garb', '7cca51a5-bfa6-4c65-b2d9-ef0167762a19'),
    (72, 3, '#D1017B', 'Bonespike Boots', 'https://bg3.wiki/w/images/f/f5/Bonespike_Boots_Faded.png', 'https://bg3.wiki/wiki/Bonespike_Boots', '23806fd3-f5f6-4ff3-826d-054afe03b7c0'),
    (73, 3, '#D1017B', 'Dwarven Thrower', 'https://bg3.wiki/w/images/d/d1/Warhammer_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Dwarven_Thrower', '596202a9-7d6b-4bcf-8748-dbf6aa55b002'),
    (74, 3, '#32E432', 'Hellrider Longbow', 'https://bg3.wiki/w/images/3/36/Longbow_PlusOne_Icon.png', 'https://bg3.wiki/wiki/Hellrider_Longbow', '75c90d55-c262-446d-937c-8adbef1e3e93');
    
INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (76, 3, '#D1017B', 'Birthright', 'https://bg3.wiki/w/images/1/1b/Birthright_Icon.png', 'https://bg3.wiki/wiki/Birthright', '76ce9b38-9203-437f-9962-4be4c4ad1193'),
    (77, 3, '#D1017B', 'Cloak of the Weave', 'https://bg3.wiki/w/images/1/10/Cloak_of_the_Weave_Faded.png', 'https://bg3.wiki/wiki/Cloak_of_the_Weave', '58c9bc94-b0ac-4ab9-a005-28cc445186f8'),
    (78, 3, '#D1017B', 'Spellmight Gloves', 'https://bg3.wiki/w/images/b/b1/Gloves_Leather_D_Faded.png', 'https://bg3.wiki/wiki/Spellmight_Gloves', 'c187103e-7f51-49f7-b3b7-72ec78e4a44f'),
    (79, 3, '#ED7C01', 'Markoheshkir', 'https://bg3.wiki/w/images/8/87/Markoheshkir_Icon.png', 'https://bg3.wiki/wiki/Markoheshkir', '7e39ad11-f8c3-421a-940c-05348c420c7d'),
    (80, 3, '#D1017B', 'Ring of Feywild Sparks', 'https://bg3.wiki/w/images/b/b8/Ring_H_Gold_A_1_Faded.png', 'https://bg3.wiki/wiki/Ring_of_Feywild_Sparks', 'a4813d7b-2ff0-488b-8152-a27cb75e8d8e');

INSERT INTO Itens (id_item, ato_item, raridade, nome_item, img_icon, link_wiki, TemplateID) VALUES
    (81, 3, '#D1017B', 'Hood of the Weave', 'https://bg3.wiki/w/images/5/57/Hood_of_the_Weave_Icon.png', 'https://bg3.wiki/wiki/Hood_of_the_Weave', 'c5a627ff-7fc5-4cde-81ca-e4fb57cb38d6'),
    (82, 3, '#D1017B', 'Bhaalist Armour', 'https://bg3.wiki/w/images/0/01/Bhaalist_Armour_Icon.png', 'https://bg3.wiki/wiki/Bhaalist_Armour', '443b2caf-8d36-42cf-b389-d774229ed18c'),
    (83, 3, '#00BBFF', 'Craterflesh Gloves', 'https://bg3.wiki/w/images/b/b0/Gloves_Metal_C_Faded.png', 'https://bg3.wiki/wiki/Craterflesh_Gloves', '556c4071-7d59-4cb7-ad84-9fa0efcd535f'),
    (84, 3, '#ED7C01', 'Viconia‘s Walking Fortress', 'https://bg3.wiki/w/images/8/88/Viconia%27s_Walking_Fortress_Icon.png', 'https://bg3.wiki/wiki/Viconia%27s_Walking_Fortress', '4f313dde-14bb-43a2-abdd-07b2eb38b33a'),
    (85, 3, '#D1017B', 'Amulet of the Devout', 'https://bg3.wiki/w/images/c/c2/Amulet_of_the_devout.png', 'https://bg3.wiki/wiki/Amulet_of_the_Devout', '1acf71e6-6bca-4d9b-9d24-739823e10723');



 
-- ==========================================
-- TABELA: BUILDS
-- ==========================================
 
-- BUILDS ATO 1
INSERT INTO builds VALUES
	(1, 1, 'Clérigo da Luz', '1 Feiticeiro / 3 Clérigo',19,9,14,16,8,17,10, 'Multiclasse feiticeiro e clérigo dominio da luz', 'https://eip.gg/bg3/build-planner/assets/sorcerer_stormsorcery-534749d0.png'),
	(1, 2, 'Emboscador Bruxo', '3 Bruxo / 1 Ladino',16,8,14,15,10,10,17, 'Multiclasse bruxo e ladino para emboscar inimigos misticamente', 'https://eip.gg/bg3/build-planner/assets/warlock_greatoldone-9a07e06f.png'),
	(1, 5, 'Clérigo Necromante', '4 Clérigo',18,12,14,15,8,13,10, 'Clérigo do dominio da Morte', 'https://eip.gg/bg3/build-planner/assets/cleric_death-cbc31604.png'),
	(1, 7, 'Infiltrador Ladino', '2 Ladino / 2 Patrulheiro',15,8,17,15,8,10,14, 'Multiclasse ladino e patrulheiro para abates silenciosos', 'https://eip.gg/bg3/build-planner/assets/rogue_assassin-3f7826f3.png'),
	(1, 9, 'Monge', '4 Monge',18,8,10,15,8,16,10, 'Monge do Caminho da Mão Aberta', 'https://eip.gg/bg3/build-planner/assets/monk_open_hand-cfc81331.png');
 
-- BUILDS ATO 2
INSERT INTO builds VALUES
	(2, 3, 'Stealth Archer', '5 Patrulheiro / 3 Ladino',21,16,10,14,8,10,16, 'Multiclasse patruleiro ladino e guerreiro', 'https://eip.gg/bg3/build-planner/assets/ranger_gloomstalker-efa124aa.png'),
	(2, 4, 'Sorcadin', '6 Vengeance Paladin / 2 Shadow Sorcerer',22,8,17,14,8,16,10, 'Multiclasse paladino e feiticeiro', 'https://eip.gg/bg3/build-planner/assets/paladin_vengeance-892de3de.png'),
	(2, 6, 'Ice Sorcerer', '8 Draconic Sorcerer',17,8,14,16,8,10,17, 'Feiticeiro puro', 'https://eip.gg/bg3/build-planner/assets/sorcerer_draconicbloodline-5317cb11.png');

INSERT INTO builds VALUES 
    (2, 11, 'Monge Taberneiro', '8 Monge',21,8,17,15,8,16,8, 'Monge da Mão Aberta com Brigão de Taberna', 'https://eip.gg/bg3/build-planner/assets/monk_drunkenmaster-55413e93.png');

INSERT INTO builds VALUES 
    (2, 13, 'Guerreiro Mestre de Batalha', '8 Guerreiro',23,18,16,14,8,10,8, 'Guerreiro Tático que controla o campo de batalha', 'https://eip.gg/bg3/build-planner/assets/fighter-9d6328ee.png');

-- BUILDS ATO 3
INSERT INTO builds VALUES 
    (3, 15, 'Guerreiro Mestre de Batalha', '12 Guerreiro',22,18,16,14,8,10,8, 'Guerreiro Tático que controla o campo de batalha', 'https://eip.gg/bg3/build-planner/assets/fighter-9d6328ee.png');

INSERT INTO builds VALUES 
    (3, 17, 'Bárbaro Gigante de Gelo', '10 Bárbaro / 2 Guerreiro',21,17,14,16,8,10,8, 'Bárbaro focado em arremessar coisas em seus inimigos', 'https://eip.gg/bg3/build-planner/assets/barbarian_giant-a8b1e073.png');

INSERT INTO builds VALUES 
    (3, 19, 'Ice Sorcerer', '12 Feiticeiro Draconico',17,8,14,16,8,10,17, 'Feiticeiro puro', 'https://eip.gg/bg3/build-planner/assets/sorcerer_draconicbloodline-5317cb11.png');

INSERT INTO builds VALUES 
    (3, 21, 'Sorcadin', '6 Paladino da Vingança / 6 Feiticeiro Sombrio',22,16,10,14,8,10,16, 'Multiclasse paladino e feiticeiro', 'https://eip.gg/bg3/build-planner/assets/paladin_vengeance-892de3de.png');






 
-- ==========================================
-- TABELA: BUILD_ITENS
-- ==========================================
 
-- BUILD_ITENS ATO 1
INSERT INTO build_itens VALUES
	(DEFAULT, 1, 1, 'head'),
	(DEFAULT, 1, 2, 'chest'),
	(DEFAULT, 1, 3, 'gloves'),
	(DEFAULT, 1, 4, 'boots'),
	(DEFAULT, 1, 5, 'melee_main'),
	(DEFAULT, 1, 6, 'melee_off'),
	(DEFAULT, 1, 7, 'ranged_main'),
	(DEFAULT, 1, 8, 'amulet'),
	(DEFAULT, 2, 9, 'head'),
	(DEFAULT, 2, 10, 'chest'),
	(DEFAULT, 2, 11, 'gloves'),
	(DEFAULT, 2, 12, 'boots'),
	(DEFAULT, 5, 13, 'chest'),
	(DEFAULT, 5, 14, 'gloves'),
	(DEFAULT, 5, 15, 'boots'),
	(DEFAULT, 5, 16, 'melee_main'),
	(DEFAULT, 5, 17, 'melee_off'),
	(DEFAULT, 5, 18, 'amulet'),
	(DEFAULT, 5, 19, 'ring1'),
	(DEFAULT, 7, 20, 'head'),
	(DEFAULT, 7, 10, 'chest'),
	(DEFAULT, 7, 21, 'gloves'),
	(DEFAULT, 7, 22, 'boots'),
	(DEFAULT, 7, 23, 'melee_main'),
	(DEFAULT, 9, 24, 'head'),
	(DEFAULT, 9, 25, 'chest'),
	(DEFAULT, 9, 26, 'gloves'),
	(DEFAULT, 9, 22, 'boots'),
	(DEFAULT, 9, 27, 'ranged_main'),
	(DEFAULT, 9, 28, 'amulet'),
	(DEFAULT, 9, 29, 'ring1');

--monge descalço	
INSERT INTO Builds VALUES
	(1, 14, 'Monge Descalço', '4 Monge', 18, 8, 10, 15, 8, 16, 10, 'Monge do Caminho da Mão Aberta sem a utilização de botas', 'https://eip.gg/bg3/build-planner/assets/monk_open_hand-cfc81331.png');

-- 2. Associação dos itens na tabela 'Build_Itens' (Copiando os itens da build 9, exceto a bota)
INSERT INTO Build_Itens VALUES
	(DEFAULT, 14, 24, 'head'),
	(DEFAULT, 14, 25, 'chest'),
	(DEFAULT, 14, 26, 'gloves'),
	(DEFAULT, 14, 27, 'ranged_main'),
	(DEFAULT, 14, 28, 'amulet'),
	(DEFAULT, 14, 29, 'ring1');

 
-- BUILD_ITENS ATO 2
INSERT INTO build_itens VALUES 
--archer	
	(DEFAULT, 3, 9, 'head'),
	(DEFAULT, 3, 33, 'cloak'),
	(DEFAULT, 3, 30, 'chest'),
	(DEFAULT, 3, 3, 'gloves'),
	(DEFAULT, 3, 4, 'boots'),
	(DEFAULT, 3, 18, 'amulet'),
	(DEFAULT, 3, 31, 'ring1'),
	(DEFAULT, 3, 32, 'ring2'),
	(DEFAULT, 3, 41, 'melee_main'),
	(DEFAULT, 3, 34, 'melee_off'),
	(DEFAULT, 3, 43, 'ranged_main'),
	
--sorcadin
	(DEFAULT, 4, 36, 'head'),
	(DEFAULT, 4, 38, 'cloak'),
	(DEFAULT, 4, 45, 'amulet'),
	(DEFAULT, 4, 40, 'chest'),
	(DEFAULT, 4, 42, 'gloves'),
	(DEFAULT, 4, 44, 'boots'),
	(DEFAULT, 4, 46, 'ring2'),
	(DEFAULT, 4, 31, 'ring1'),
	(DEFAULT, 4, 48, 'melee_main'),
	(DEFAULT, 4, 7, 'ranged_main'),
	
--ice sorcerer
	(DEFAULT, 6, 50, 'head'),
	(DEFAULT, 6, 52, 'chest'),
	(DEFAULT, 6, 51, 'amulet'),
	(DEFAULT, 6, 47, 'gloves'),
	(DEFAULT, 6, 49, 'boots'),
	(DEFAULT, 6, 54, 'ring1'),
	(DEFAULT, 6, 53, 'melee_main'),
	(DEFAULT, 6, 55, 'melee_off'),
	(DEFAULT, 6, 7, 'ranged_main');
	

INSERT INTO build_itens VALUES  
--monge
    (DEFAULT, 11, 35, 'head'),
    (DEFAULT, 11, 38, 'cloak'),
	(DEFAULT, 11, 57, 'amulet'),
	(DEFAULT, 11, 25, 'chest'),
	(DEFAULT, 11, 56, 'gloves'),
    (DEFAULT, 11, 44, 'boots'),
	(DEFAULT, 11, 58, 'ring1'),
	(DEFAULT, 11, 29, 'ring2');

INSERT INTO build_itens VALUES  
--guerreiro
 	(DEFAULT, 13, 59, 'head'),
    (DEFAULT, 13, 38, 'cloak'),
	(DEFAULT, 13, 45, 'amulet'),
    (DEFAULT, 13, 39, 'chest'),
    (DEFAULT, 13, 42, 'gloves'),
    (DEFAULT, 13, 44, 'boots'),
    (DEFAULT, 13, 61, 'melee_main'),
	(DEFAULT, 13, 60, 'ring1'),
	(DEFAULT, 13, 29, 'ring2'),
	(DEFAULT, 13, 62, 'ranged_main');

-- BUILD_ITENS ATO 3
--guerreiro
INSERT INTO build_itens VALUES
    (DEFAULT, 15, 64, 'head'),
    (DEFAULT, 15, 65, 'cloak'),
    (DEFAULT, 15, 66, 'chest'),
    (DEFAULT, 15, 67, 'gloves'),
    (DEFAULT, 15, 68, 'boots'),
	(DEFAULT, 15, 62, 'ranged_main'),
    (DEFAULT, 15, 69, 'melee_main'),
    (DEFAULT, 15, 70, 'amulet'),
    (DEFAULT, 15, 60, 'ring1');
--bárbaro de gelo
INSERT INTO build_itens VALUES
    (DEFAULT, 17, 50, 'head'),
    (DEFAULT, 17, 38, 'cloak'),
    (DEFAULT, 17, 71, 'chest'),
    (DEFAULT, 17, 47, 'gloves'),
    (DEFAULT, 17, 72, 'boots'),
    (DEFAULT, 17, 73, 'melee_main'),
    (DEFAULT, 17, 74, 'ranged_main'),
    (DEFAULT, 17, 70, 'amulet'),
    (DEFAULT, 17, 63, 'ring1'),
    (DEFAULT, 17, 54, 'ring2');

--ice sorcerer
INSERT INTO build_itens VALUES
    (DEFAULT, 19, 76, 'head'),
    (DEFAULT, 19, 77, 'cloak'),
    (DEFAULT, 19, 52, 'chest'),
    (DEFAULT, 19, 78, 'gloves'),
    (DEFAULT, 19, 49, 'boots'),
    (DEFAULT, 19, 79, 'melee_main'),
    (DEFAULT, 19, 53, 'melee_off'),
    (DEFAULT, 19, 74, 'ranged_main'),
    (DEFAULT, 19, 51, 'amulet'),
    (DEFAULT, 19, 54, 'ring1'),
    (DEFAULT, 19, 80, 'ring2');

--sorcadin
INSERT INTO build_itens VALUES
    (DEFAULT, 21, 81, 'head'),
    (DEFAULT, 21, 77, 'cloak'),
    (DEFAULT, 21, 82, 'chest'),
    (DEFAULT, 21, 83, 'gloves'),
    (DEFAULT, 21, 68, 'boots'),
    (DEFAULT, 21, 86, 'melee_main'),
    (DEFAULT, 21, 84, 'melee_off'),
    (DEFAULT, 21, 74, 'ranged_main'),
    (DEFAULT, 21, 85, 'amulet'),
    (DEFAULT, 21, 87, 'ring1'),
    (DEFAULT, 21, 80, 'ring2');
