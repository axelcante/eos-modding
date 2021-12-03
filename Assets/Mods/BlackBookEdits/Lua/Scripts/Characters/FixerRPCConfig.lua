_namespace = "RPC.MOCK_FIXER_AGENCY"
--[[------------------------------------------------------------------------------
DIXIE CHAN - CHARACTER DATA
--------------------------------------------------------------------------------]]
_id = "RPC_61" -- DIXIE CHAN

_includes =
{
    "RPC.BASE_MALE",
    "NPC.BASE_ABILITIES",
    "NPC.TIER_5_FIXER_INVENTORY",
    "AUDIO.GANGSTERS.PACKS.DIXIE",
}

--[[------------------------------------------------------------------------------
DIXIE CHAN - CHARACTER DATA
--------------------------------------------------------------------------------]]
telemetryId = "G61"
characterID = "@dixie_chan"
name = "$CHARACTER_DATA_RPC_61_name" --$ Dixie Chan
firstName = "$CHARACTER_DATA_RPC_61_firstName" --$ Dixie
lastName = "$CHARACTER_DATA_RPC_61_lastName" --$ Chan
gender = "Male"
tier = 1
description = "$CHARACTER_DATA_RPC_61_description" --$ A resident Chicagoan, Dixie is the only son of decent law-abiding parents. Both lawyers, they worked hard to get their son a good education, though, after years of watching them fight injustice to gain nothing more than squalor and early graves, Dixie vowed never to forgo a good payday in favor of doing the right thing. Becoming a lawyer solely for profit, Dixie found his niche representing criminals desperate to avoid prison and willing to pay anything to find a loophole. As the owner of several properties, with several high-profile criminals on his Christmas card list, Dixie has never looked back.
background = "$CHARACTER_DATA_RPC_61_background" --$ The well-educated son of Chinese immigrants, Dixie has a quick mouth and superior knowledge of the justice system and knows how to bend its rules to suit his clients.
age = 42
heritage = "Chinese"
dlcGangster = true

--[[------------------------------------------------------------------------------
DIXIE CHAN - RPC DATA
--------------------------------------------------------------------------------]]
empireTalentGroup = "Speakeasy"
hireCost = 15000
takeFloor = 1000
take = 0.2
rpc = {}
rpc.loyalty = 1
notorietyGate = 620
profession = "Fixer"

--[[------------------------------------------------------------------------------
DIXIE CHAN - INVENTORY DATA
--------------------------------------------------------------------------------]]

startingInventory = {}
startingInventory.primaryWeapon = "ITEM.WEAPON.RARE_RIFLE_05"
startingInventory.secondaryWeapon = "ITEM.WEAPON.RARE_HANDGUN_07"

--[[------------------------------------------------------------------------------
DIXIE CHAN - RELATIONSHIP DATA
--------------------------------------------------------------------------------]]
relationships = {}
relationships.Friends = {}
relationships.Friends[1] = "RPC.ILBILIARDO.RPC_24"
relationships.Friends[2] = "RPC.THE_LODGE.RPC_60"
relationships.Loves = {}
relationships.Loves[1] = "RPC.PAROLE_OFFICE.RPC_35"
relationships.Enemies = {}
relationships.Enemies[1] = "RPC.MOCK_FIXER_AGENCY.RPC_62"

--[[------------------------------------------------------------------------------
DIXIE CHAN - CHARACTER ATTRIBUTES
--------------------------------------------------------------------------------]]
baselineHp = 100
skills = {}
skills.MOVEMENT = 6
skills.INITIATIVE = 72
skills.MARKSMANSHIP = 90
skills.INTIMIDATION = 40
skills.LEADERSHIP = 66
skills.PERSUASION = 30

--[[------------------------------------------------------------------------------
DIXIE CHAN - PROFESSION
--------------------------------------------------------------------------------]]
professions = {}
professions.HiredGun = 40

--[[------------------------------------------------------------------------------
DIXIE CHAN - LOOT CHANCE
--------------------------------------------------------------------------------]]
lootChance = {}
lootChance.Common = 0
lootChance.Uncommon = 0
lootChance.Rare = 0
lootChance.Epic = 100
lootChance.Legendary = 0

--[[------------------------------------------------------------------------------
DIXIE CHAN - COMBAT AI PERSONALITY
--------------------------------------------------------------------------------]]
combatPersonality = {}
combatPersonality.MOVE_MIDFIELD = true
combatPersonality.DEMOLITIONIST_BEHAVIOR = true

--[[------------------------------------------------------------------------------
DIXIE CHAN - CHARACTER ART
--------------------------------------------------------------------------------]]
characterFullbody = "Sprites/Images/Characters/FullBody/Gangsters/61_DixieChan_Pose"
characterIcon = "Sprites/Images/Characters/Profile/Gangsters/61_DixieChan_Profile"
prefab = "Models/Characters/Gangsters/61_DixieChan/Prefabs/DixieChan"
ragdollPrefab = "Models/Characters/Gangsters/61_DixieChan/Prefabs/DixieChan_Ragdoll"

--[[------------------------------------------------------------------------------
DIXIE CHAN - BEHAVIOURS
--------------------------------------------------------------------------------]]
behaviours = {}
behaviours.SecondGeneration = true
behaviours.Beautiful = true
behaviours.StayedInSchool = true
behaviours.AmazingWhatTalkingCanAchieve = true


--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - CHARACTER DATA
--------------------------------------------------------------------------------]]
_id = "RPC_62" -- ADA SANTOS SOUZA

_includes =
{
    "RPC.BASE_FEMALE",
    "NPC.BASE_ABILITIES",
    "NPC.TIER_4_FIXER_INVENTORY",
    "AUDIO.GANGSTERS.PACKS.ADA",
}

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - CHARACTER DATA
--------------------------------------------------------------------------------]]
telemetryId = "G62"
characterID = "@ada_santos"
name = "$CHARACTER_DATA_RPC_62_name" --$ Ada Santos Souza
firstName = "$CHARACTER_DATA_RPC_62_firstName" --$ Ada
lastName = "$CHARACTER_DATA_RPC_62_lastName" --$ Santos Souza
gender = "Female"
tier = 2
description = "$CHARACTER_DATA_RPC_62_description" --$ Doctor Ada Santos Souza grew up in Sao Paulo to a wealthy family that fell on hard times. But though her circumstances changed, her tastes did not, and Doctor Souza used her high class connections to commit high class crimes, selling museum artifacts on the black market. But she found a taste for adventure that pushed her to take even greater risks. This resulted in one of her co-conspirators turning her in to save their own skin, and she tumbled down into the underground where her circle of influence only grew larger.
background = "$CHARACTER_DATA_RPC_62_background" --$ Growing up privileged with a top class education, Souza's missteps have nevertheless taken her into Chicago's criminal underworld. But with the thrill of high-stakes adventure attached, she has found she may be exactly where she belongs.
age = 46
heritage = "Brazilian"
dlcGangster = true

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - RPC DATA
--------------------------------------------------------------------------------]]
empireTalentGroup = "Speakeasy"
hireCost = 12000
takeFloor = 800
take = 0.16
rpc = {}
rpc.loyalty = 1
notorietyGate = 530
profession = "Fixer"

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - INVENTORY DATA
--------------------------------------------------------------------------------]]

startingInventory = {}
startingInventory.primaryWeapon = "ITEM.WEAPON.UNCOMMON_RIFLE_05"
startingInventory.secondaryWeapon = "ITEM.WEAPON.UNCOMMON_HANDGUN_07"

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - RELATIONSHIP DATA
--------------------------------------------------------------------------------]]
relationships = {}
relationships.Friends = {}
relationships.Friends[1] = "RPC.PAROLE_OFFICE.RPC_40"
relationships.Friends[2] = "RPC.SILVER_LINING_CLUB.RPC_41"
relationships.Loves = {}
relationships.Loves[1] = "RPC.COURTS_CHOIR.RPC_12"
relationships.Loves[2] = "RPC.DUNBARBROTHERS.RPC_19"
relationships.Enemies = {}
relationships.Enemies[1] = "RPC.MOCK_FIXER_AGENCY.RPC_61"

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - CHARACTER ATTRIBUTES
--------------------------------------------------------------------------------]]
baselineHp = 100
skills = {}
skills.MOVEMENT = 6
skills.INITIATIVE = 68
skills.MARKSMANSHIP = 85
skills.INTIMIDATION = 40
skills.LEADERSHIP = 76
skills.PERSUASION = 30

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - PROFESSION
--------------------------------------------------------------------------------]]
professions = {}
professions.HiredGun = 40
professions.ConArtist = 76

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - LOOT CHANCE
--------------------------------------------------------------------------------]]
lootChance = {}
lootChance.Common = 0
lootChance.Uncommon = 0
lootChance.Rare = 0
lootChance.Epic = 100
lootChance.Legendary = 0

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - COMBAT AI PERSONALITY
--------------------------------------------------------------------------------]]
combatPersonality = {}
combatPersonality.MID_RANGE_SHOOTER = true
combatPersonality.MOVE_MIDFIELD = true

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - CHARACTER ART
--------------------------------------------------------------------------------]]
characterFullbody = "Sprites/Images/Characters/FullBody/Gangsters/62_AdaSantosSouza_Pose"
characterIcon = "Sprites/Images/Characters/Profile/Gangsters/62_AdaSantosSouza_Profile"
prefab = "Models/Characters/Gangsters/62_AdaSantosSouza/Prefabs/AdaSantosSouza"
ragdollPrefab = "Models/Characters/Gangsters/62_AdaSantosSouza/Prefabs/AdaSantosSouza_Ragdoll"

--[[------------------------------------------------------------------------------
ADA SANTOS SOUZA - BEHAVIOURS
--------------------------------------------------------------------------------]]
behaviours = {}
behaviours.Privileged = true
behaviours.FledToAmerica = true
behaviours.StayedInSchool = true
behaviours.EasyComeEasyGo = true
behaviours.HairTrigger = true
behaviours.Reckless = true
behaviours.Brave = true


--[[------------------------------------------------------------------------------
JUDGE MA MILLER - CHARACTER DATA
--------------------------------------------------------------------------------]]
_id = "RPC_63" -- JUDGE MA MILLER

_includes =
{
    "RPC.BASE_FEMALE",
    "NPC.BASE_ABILITIES",
    "NPC.TIER_1_FIXER_INVENTORY",
    "AUDIO.GANGSTERS.PACKS.JUDGE",
}

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - CHARACTER DATA
--------------------------------------------------------------------------------]]
telemetryId = "G63"
characterID = "@ma_miller"
name = "$CHARACTER_DATA_RPC_63_name" --$ Judge Ma Miller
firstName = "$CHARACTER_DATA_RPC_63_firstName" --$ Ma
lastName = "$CHARACTER_DATA_RPC_63_lastName" --$ Miller
nickName = "$CHARACTER_DATA_RPC_63_nickName" --$ The Pillar
gender = "Female"
tier = 5
description = "$CHARACTER_DATA_RPC_63_description" --$ A judge from Arkansas, Judge Miller earned the nickname "The Pillar" for being such a pivotal part of her community. Little did the public know, but she was a pillar of the criminal underworld, too, using her legal connections to enrich herself and her criminal compatriots. After being run out of Arkansas by a crusading, idealistic young lawyer, she's come to Chicago to get back up to her old ways.
background = "$CHARACTER_DATA_RPC_63_background" --$ The child of a privileged, religious upbringing, Miller's small stature belies her cunning. She believes she can get anywhere with slick talk, and the life she's made for herself has proven it.
age = 52
heritage = "American"
dlcGangster = true

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - RPC DATA
--------------------------------------------------------------------------------]]
empireTalentGroup = "Speakeasy"
hireCost = 2900
takeFloor = 200
take = 0.04
rpc = {}
rpc.loyalty = 1
notorietyGate = 10
profession = "Fixer"

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - INVENTORY DATA
--------------------------------------------------------------------------------]]

startingInventory = {}
startingInventory.primaryWeapon = "ITEM.WEAPON.COMMON_RIFLE_05"
startingInventory.secondaryWeapon = "ITEM.WEAPON.COMMON_HANDGUN_07"

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - RELATIONSHIP DATA
--------------------------------------------------------------------------------]]
relationships = {}
relationships.Friends = {}
relationships.Friends[1] = "RPC.SILVER_LINING_CLUB.RPC_44"
relationships.Friends[2] = "RPC.SILVER_LINING_CLUB.RPC_45"
relationships.Loves = {}
relationships.Loves[1] = "RPC.THE_LODGE.RPC_57"
relationships.Enemies = {}
relationships.Enemies[1] = "RPC.MOCK_FIXER_AGENCY.RPC_64"
relationships.Enemies[2] = "RPC.PAROLE_OFFICE.RPC_38"

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - CHARACTER ATTRIBUTES
--------------------------------------------------------------------------------]]
baselineHp = 80
skills = {}
skills.MOVEMENT = 4
skills.INITIATIVE = 58
skills.MARKSMANSHIP = 70
skills.INTIMIDATION = 40
skills.LEADERSHIP = 79
skills.PERSUASION = 30

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - PROFESSION
--------------------------------------------------------------------------------]]
professions = {}
professions.HiredGun = 40

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - LOOT CHANCE
--------------------------------------------------------------------------------]]
lootChance = {}
lootChance.Common = 0
lootChance.Uncommon = 0
lootChance.Rare = 0
lootChance.Epic = 100
lootChance.Legendary = 0

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - COMBAT AI PERSONALITY
--------------------------------------------------------------------------------]]
combatPersonality = {}
combatPersonality.MOVE_MIDFIELD = true
combatPersonality.ENFORCER_BEHAVIOR = true

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - CHARACTER ART
--------------------------------------------------------------------------------]]
characterFullbody = "Sprites/Images/Characters/FullBody/Gangsters/63_JudgeMaMiller_Pose"
characterIcon = "Sprites/Images/Characters/Profile/Gangsters/63_JudgeMaMiller_Profile"
prefab = "Models/Characters/Gangsters/63_JudgeMaMiller/Prefabs/JudgeMaMiller"
ragdollPrefab = "Models/Characters/Gangsters/63_JudgeMaMiller/Prefabs/JudgeMaMiller_Ragdoll"

--[[------------------------------------------------------------------------------
JUDGE MA MILLER - BEHAVIOURS
--------------------------------------------------------------------------------]]
behaviours = {}
behaviours.Privileged = true
behaviours.Religious = true
behaviours.StayedInSchool = true
behaviours.Small = true
behaviours.AChainIsOnlyAsStrongAsItsWeakestLink = true
behaviours.Happy = true
behaviours.Cunning = true


--[[------------------------------------------------------------------------------
GERTRUD BRANDT - CHARACTER DATA
--------------------------------------------------------------------------------]]
_id = "RPC_64" -- GERTRUD BRANDT

_includes =
{
    "RPC.BASE_FEMALE",
    "NPC.BASE_ABILITIES",
    "NPC.TIER_2_FIXER_INVENTORY",
    "AUDIO.GANGSTERS.PACKS.GERTRUD",
}

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - CHARACTER DATA
--------------------------------------------------------------------------------]]
telemetryId = "G64"
characterID = "@gertrud_brandt"
name = "$CHARACTER_DATA_RPC_64_name" --$ Gertrud Brandt
firstName = "$CHARACTER_DATA_RPC_64_firstName" --$ Gertrud
lastName = "$CHARACTER_DATA_RPC_64_lastName" --$ Brandt
gender = "Female"
tier = 4
description = "$CHARACTER_DATA_RPC_64_description" --$ The daughter of a Herero government official and a German artist, Gertrud's family came to America when she was young. A trans woman, she flourished in New York's underground scene. Used to creating spaces for her and her chosen family through less than legal means, she is a skilled organizer. Brandt has a warm, open heart, matched by her cold ruthlessness in dealing with those who threaten her and those she cares for.
background = "$CHARACTER_DATA_RPC_64_background" --$ Having fled to America with her family as a child, Brandt spent her childhood skipping school and getting into fights with anyone who crossed her and her friends. The strong community she found fostered a sense of kindness in her, as well as a belief in finding one's tribe.
age = 35
heritage = "Jewish - German"
dlcGangster = true

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - RPC DATA
--------------------------------------------------------------------------------]]
empireTalentGroup = "Speakeasy"
hireCost = 3000
takeFloor = 200
take = 0.04
rpc = {}
rpc.loyalty = 1
notorietyGate = 10
profession = "Fixer"

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - INVENTORY DATA
--------------------------------------------------------------------------------]]

startingInventory = {}
startingInventory.primaryWeapon = "ITEM.WEAPON.UNCOMMON_RIFLE_05"
startingInventory.secondaryWeapon = "ITEM.WEAPON.UNCOMMON_HANDGUN_07"

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - RELATIONSHIP DATA
--------------------------------------------------------------------------------]]
relationships = {}
relationships.Friends = {}
relationships.Friends[1] = "RPC.MONKS.RPC_04"
relationships.Friends[2] = "RPC.MONKS.RPC_09"
relationships.Loves = {}
relationships.Loves[1] = "RPC.SWEETS_PARLOUR.RPC_46"
relationships.Enemies = {}
relationships.Enemies[1] = "RPC.MOCK_FIXER_AGENCY.RPC_63"

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - CHARACTER ATTRIBUTES
--------------------------------------------------------------------------------]]
baselineHp = 100
skills = {}
skills.MOVEMENT = 5
skills.INITIATIVE = 62
skills.MARKSMANSHIP = 85
skills.INTIMIDATION = 65
skills.LEADERSHIP = 80
skills.PERSUASION = 30

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - PROFESSION
--------------------------------------------------------------------------------]]
professions = {}
professions.Enforcer = 75

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - LOOT CHANCE
--------------------------------------------------------------------------------]]
lootChance = {}
lootChance.Common = 0
lootChance.Uncommon = 0
lootChance.Rare = 0
lootChance.Epic = 100
lootChance.Legendary = 0

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - COMBAT AI PERSONALITY
--------------------------------------------------------------------------------]]
combatPersonality = {}
combatPersonality.MOVE_MIDFIELD = true
combatPersonality.ENFORCER_BEHAVIOR = true

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - CHARACTER ART
--------------------------------------------------------------------------------]]
characterFullbody = "Sprites/Images/Characters/FullBody/Gangsters/64_GertrudBrandt_Pose"
characterIcon = "Sprites/Images/Characters/Profile/Gangsters/64_GertrudBrandt_Profile"
prefab = "Models/Characters/Gangsters/64_GertrudBrandt/Prefabs/GertrudBrandt"
ragdollPrefab = "Models/Characters/Gangsters/64_GertrudBrandt/Prefabs/GertrudBrandt_Ragdoll"

--[[------------------------------------------------------------------------------
GERTRUD BRANDT - BEHAVIOURS
--------------------------------------------------------------------------------]]
behaviours = {}
behaviours.Immigrant = true
behaviours.FledToAmerica = true
behaviours.Delinquent = true
behaviours.HairTrigger = true
behaviours.BirdsOfAFeatherFlockTogether = true
behaviours.Kind = true



--[[------------------------------------------------------------------------------
RACHEL STEINMAN - CHARACTER DATA
--------------------------------------------------------------------------------]]
_id = "RPC_65" -- RACHEL STEINMAN

_includes =
{
    "RPC.BASE_FEMALE",
    "NPC.BASE_ABILITIES",
    "NPC.TIER_3_FIXER_INVENTORY",
    "AUDIO.GANGSTERS.PACKS.RACHEL",
}

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - CHARACTER DATA
--------------------------------------------------------------------------------]]
telemetryId = "G65"
characterID = "@rachel_steinman"
name = "$CHARACTER_DATA_RPC_65_name" --$ Rachel Steinman
firstName = "$CHARACTER_DATA_RPC_65_firstName" --$ Rachel
lastName = "$CHARACTER_DATA_RPC_65_lastName" --$ Steinman
gender = "Female"
tier = 3
description = "$CHARACTER_DATA_RPC_65_description" --$ Rachel grew up poor and working class in New York's Lower East Side, and was the only Jewish kid in an Italian neighborhood. Before long her shrewd mind and sharp tongue had her working as a teenage drug dealer, loan shark, and numbers runner for a Sicilian crime syndicate. Still, she found that her Jewish heritage made her an outsider among the mafia, but rather than letting this destroy her, she turned it to her advantage and moved to Chicago, using her underworld connections to develop relationships with all of the criminal communities in the city, becoming a friend to all, but loyal to none but herself.
background = "$CHARACTER_DATA_RPC_65_background" --$ A perpetual outsider, Steinman honed a keen eye for human character through an under-privileged childhood into an adolescence in the criminal underworld. As an adult, her ability to read people keeps her one step ahead of enemies and friends alike.
age = 22
heritage = "Jewish"
heightType = "Average"
bodyType = "Average"
dlcGangster = true

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - RPC DATA
--------------------------------------------------------------------------------]]
empireTalentGroup = "Speakeasy"
hireCost = 9000
takeFloor = 600
take = 0.12
rpc = {}
rpc.loyalty = 1
notorietyGate = 310
profession = "Fixer"

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - INVENTORY DATA
--------------------------------------------------------------------------------]]

startingInventory = {}
startingInventory.primaryWeapon = "ITEM.WEAPON.UNCOMMON_RIFLE_05"
startingInventory.secondaryWeapon = "ITEM.WEAPON.UNCOMMON_HANDGUN_07"

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - RELATIONSHIP DATA
--------------------------------------------------------------------------------]]
relationships = {}
relationships.Friends = {}
relationships.Friends[1] = "RPC.SILVER_LINING_CLUB.RPC_42"
relationships.Friends[2] = "RPC.SWEETS_PARLOUR.RPC_47"
relationships.Loves = {}
relationships.Loves[1] = "RPC.SWEETS_PARLOUR.RPC_49"
relationships.Enemies = {}
relationships.Enemies[1] = "RPC.MOCK_FIXER_AGENCY.RPC_63"

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - CHARACTER ATTRIBUTES
--------------------------------------------------------------------------------]]
baselineHp = 110
skills = {}
skills.MOVEMENT = 5
skills.INITIATIVE = 65
skills.MARKSMANSHIP = 80
skills.INTIMIDATION = 40
skills.LEADERSHIP = 67
skills.PERSUASION = 30

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - PROFESSION
--------------------------------------------------------------------------------]]
professions = {}
professions.HiredGun = 35

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - LOOT CHANCE
--------------------------------------------------------------------------------]]
lootChance = {}
lootChance.Common = 0
lootChance.Uncommon = 0
lootChance.Rare = 0
lootChance.Epic = 100
lootChance.Legendary = 0

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - COMBAT AI PERSONALITY
--------------------------------------------------------------------------------]]
combatPersonality = {}
combatPersonality.MOVE_MIDFIELD = true
combatPersonality.ENFORCER_BEHAVIOR = true

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - CHARACTER ART
--------------------------------------------------------------------------------]]
characterFullbody = "Sprites/Images/Characters/FullBody/Gangsters/65_RachelSteinman_Pose"
characterIcon = "Sprites/Images/Characters/Profile/Gangsters/65_RachelSteinman_Profile"
prefab = "Models/Characters/Gangsters/65_RachelSteinman/Prefabs/RachelSteinman"
ragdollPrefab = "Models/Characters/Gangsters/65_RachelSteinman/Prefabs/RachelSteinman_Ragdoll"

--[[------------------------------------------------------------------------------
RACHEL STEINMAN - BEHAVIOURS
--------------------------------------------------------------------------------]]
behaviours = {}
behaviours.Poverty = true
behaviours.Delinquent = true
behaviours.ThickSkinned = true
behaviours.FortuneFavorsTheBold = true
behaviours.Happy = true
behaviours.ChildLabour = true


_namespace = "AGENCY"

_id = "MOCK_FIXER_AGENCY"
_includes = "BASE"
stringKey = nil
name = nil
desc = nil
imageCaption = nil
rpcs =
{
    "RPC.MOCK_FIXER_AGENCY.RPC_61", -- DIXIE CHAN
    "RPC.MOCK_FIXER_AGENCY.RPC_62", -- ADA SANTOS SOUZA
    "RPC.MOCK_FIXER_AGENCY.RPC_63", -- JUDGE MA MILLER
    "RPC.MOCK_FIXER_AGENCY.RPC_64", -- GERTRUD BRANDT
    "RPC.MOCK_FIXER_AGENCY.RPC_65", -- RACHEL STEINMAN
}
factionRating = {}

_namespace = "WORLD"
_extends = "INIT"

agencies =
{
    ["AGENCY.MOCK_FIXER_AGENCY"] = true,
}

_namespace = "STARTING_TALENTS"

_id = "RPC_61" -- DIXIE CHAN

startingTalents = {}
startingTalents.CROWS_FEET = true
startingTalents.EASY_PICKINGS = true
startingTalents.BOOBY_TRAP = true
startingTalents.POISON_TRAP = true

_id = "RPC_62" -- ADA SANTOS SOUZA

startingTalents = {}
startingTalents.SNAPSHOT = true
startingTalents.BIDE_YOUR_TIME = true
startingTalents.PIERCING_ROUND = true

_id = "RPC_63" -- JUDGE MA MILLER

startingTalents = {}

_id = "RPC_64" -- GERTRUD BRANDT

startingTalents = {}
startingTalents.SNAPSHOT = true

_id = "RPC_65" -- RACHEL STEINMAN

startingTalents = {}
startingTalents.CROWS_FEET = true
startingTalents.POISONED_CROWS_FEET = true

