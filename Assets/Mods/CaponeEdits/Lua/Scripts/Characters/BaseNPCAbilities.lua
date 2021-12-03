_namespace = "NPC"

--[[------------------------------------------------------------------------------
CORE ABILITIES -- FOR EVERY COMBAT CHARACTER
--------------------------------------------------------------------------------]]
_id = "BASE_ABILITIES"
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.OVERWATCH"
startingInventory.ability2 = "ITEM.ABILITY.HUNKER_DOWN"

--[[------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
PROFESSION ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_HIRED_GUN_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}

--[[------------------------------------------------------------------------------
TIER 2 HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_HIRED_GUN_ABILITIES"
_includes =
{
    "TIER_1_HIRED_GUN_ABILITIES",
}

--[[------------------------------------------------------------------------------
TIER 3 HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_HIRED_GUN_ABILITIES"
_includes =
{
    "TIER_2_HIRED_GUN_ABILITIES",
}
startingTalents = {}
startingTalents.RETURN_FIRE = true
startingTalents.STRIKE_AND_MOVE = true
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.MARK_TARGET"

--[[------------------------------------------------------------------------------
TIER 4 HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_HIRED_GUN_ABILITIES"
_includes =
{
    "TIER_3_HIRED_GUN_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.CAN_OPENER"

--[[------------------------------------------------------------------------------
TIER 5 HIRED GUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_HIRED_GUN_ABILITIES"
_includes =
{
    "TIER_4_HIRED_GUN_ABILITIES",
}
startingInventory = {}
startingInventory.ability7 = "ITEM.ABILITY.GUN_EM_DOWN"

--[[------------------------------------------------------------------------------
ENFORCER ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 ENFORCER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_ENFORCER_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}

--[[------------------------------------------------------------------------------
TIER 2 ENFORCER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_ENFORCER_ABILITIES"
_includes =
{
    "TIER_1_ENFORCER_ABILITIES"
}
startingTalents = {}
startingTalents.BULWARK = true

--[[------------------------------------------------------------------------------
TIER 3 ENFORCER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_ENFORCER_ABILITIES"
_includes =
{
    "TIER_2_ENFORCER_ABILITIES"
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"

--[[------------------------------------------------------------------------------
TIER 4 ENFORCER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_ENFORCER_ABILITIES"
_includes =
{
    "TIER_3_ENFORCER_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true

--[[------------------------------------------------------------------------------
TIER 5 ENFORCER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_ENFORCER_ABILITIES"
_includes =
{
    "TIER_4_ENFORCER_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"

--[[------------------------------------------------------------------------------
CONARTIST ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 CONARTIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_CONARTIST_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.KNIFE_THROW"

--[[------------------------------------------------------------------------------
TIER 2 CONARTIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_CONARTIST_ABILITIES"
_includes =
{
    "TIER_1_CONARTIST_ABILITIES"
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.SUCKER_PUNCH"

--[[------------------------------------------------------------------------------
TIER 3 CONARTIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_CONARTIST_ABILITIES"
_includes =
{
    "TIER_2_CONARTIST_ABILITIES",
}
startingInventory = {}
startingInventory.ability6 = "ITEM.ABILITY.DOUBLE_TAP"

--[[------------------------------------------------------------------------------
TIER 4 CONARTIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_CONARTIST_ABILITIES"
_includes =
{
    "TIER_3_CONARTIST_ABILITIES"
}
startingTalents = {}
startingTalents.LOW_PROFILE = true
startingTalents.LIGHT_FOOTED = true

--[[------------------------------------------------------------------------------
TIER 5 CONARTIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_CONARTIST_ABILITIES"
_includes =
{
    "TIER_4_CONARTIST_ABILITIES",
}
startingInventory = {}
startingInventory.ability7 = "ITEM.ABILITY.KILL_CHAIN"

--[[------------------------------------------------------------------------------
DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_DEMOLITIONIST_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SHRAPNEL_BOMB"

--[[------------------------------------------------------------------------------
TIER 2 DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_DEMOLITIONIST_ABILITIES"
_includes =
{
    "TIER_1_DEMOLITIONIST_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.BREAK_SHOT"
--[[------------------------------------------------------------------------------
TIER 3 DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_DEMOLITIONIST_ABILITIES"
_includes =
{
    "TIER_2_DEMOLITIONIST_ABILITIES",
}
startingInventory = {}
startingInventory.ability7 = "ITEM.ABILITY.TIME_BOMB"
startingTalents = {}
startingTalents.BUNKER_DOWN = true

--[[------------------------------------------------------------------------------
TIER 4 DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_DEMOLITIONIST_ABILITIES"
_includes =
{
    "TIER_3_DEMOLITIONIST_ABILITIES",
}
startingInventory = {}
startingInventory.ability7 = "ITEM.ABILITY.DOUBLE_SHOT"

--[[------------------------------------------------------------------------------
TIER 5 DEMOLITIONIST ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_DEMOLITIONIST_ABILITIES"
_includes =
{
    "TIER_4_DEMOLITIONIST_ABILITIES",
}
startingTalents = {}
startingTalents.BOMB_SUIT = true
startingTalents.EXPLOSIVE_ORDNANCE_TRAINING = true

--[[------------------------------------------------------------------------------
MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_DOCTOR_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.DOCTOR_HEAL"

--[[------------------------------------------------------------------------------
TIER 2 MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_DOCTOR_ABILITIES"
_includes =
{
    "TIER_1_DOCTOR_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.KNEE_CAP"
startingTalents = {}
startingTalents.MALPRACTICE = true

--[[------------------------------------------------------------------------------
TIER 3 MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_DOCTOR_ABILITIES"
_includes =
{
    "TIER_2_DOCTOR_ABILITIES",
}
startingInventory = {}
startingInventory.ability6 = "ITEM.ABILITY.REMEDY"

--[[------------------------------------------------------------------------------
TIER 4 MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_DOCTOR_ABILITIES"
_includes =
{
    "TIER_3_DOCTOR_ABILITIES",
}
startingTalents = {}
startingTalents.COLD_EFFICIENCY = true
startingTalents.SURGICAL_PRECISION = true

--[[------------------------------------------------------------------------------
TIER 5 MOB DOCTOR ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_DOCTOR_ABILITIES"
_includes =
{
    "TIER_4_DOCTOR_ABILITIES",
}
startingInventory = {}
startingInventory.ability7 = "ITEM.ABILITY.BOOSTER_SHOT"

--[[------------------------------------------------------------------------------
BRAWLER ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 BRAWLER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_BRAWLER_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.KNIFE_THROW"

--[[------------------------------------------------------------------------------
TIER 2 BRAWLER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_BRAWLER_ABILITIES"
_includes =
{
    "TIER_1_BRAWLER_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true

--[[------------------------------------------------------------------------------
TIER 3 BRAWLER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_BRAWLER_ABILITIES"
_includes =
{
    "TIER_2_BRAWLER_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.BULL_RUSH"

--[[------------------------------------------------------------------------------
TIER 4 BRAWLER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_BRAWLER_ABILITIES"
_includes =
{
    "TIER_3_BRAWLER_ABILITIES",
}
startingTalents = {}
startingTalents.SLUGGER = true
startingTalents.SHATTERING_IMPACT = true

--[[------------------------------------------------------------------------------
TIER 5 BRAWLER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_BRAWLER_ABILITIES"
_includes =
{
    "TIER_4_BRAWLER_ABILITIES",
}
startingInventory = {}
startingInventory.ability6 = "ITEM.ABILITY.HACK_AND_SLASH"

--[[------------------------------------------------------------------------------
DEADEYE ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 DEADEYE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_DEADEYE_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.MARK_TARGET"

--[[------------------------------------------------------------------------------
TIER 2 DEADEYE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_DEADEYE_ABILITIES"
_includes =
{
    "TIER_1_DEADEYE_ABILITIES",
}
startingTalents = {}
startingTalents.LOW_PROFILE = true

--[[------------------------------------------------------------------------------
TIER 3 DEADEYE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_DEADEYE_ABILITIES"
_includes =
{
    "TIER_2_DEADEYE_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.CAN_OPENER"

--[[------------------------------------------------------------------------------
TIER 4 DEADEYE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_DEADEYE_ABILITIES"
_includes =
{
    "TIER_3_DEADEYE_ABILITIES",
}
startingTalents = {}
startingTalents.SURGICAL_PRECISION = true

--[[------------------------------------------------------------------------------
TIER 5 DEADEYE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_DEADEYE_ABILITIES"
_includes =
{
    "TIER_4_DEADEYE_ABILITIES",
}
startingInventory = {}
startingInventory.ability6 = "ITEM.ABILITY.DOUBLE_SHOT"

--[[------------------------------------------------------------------------------
THUG ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
TIER 1 THUG ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_THUG_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}

--[[------------------------------------------------------------------------------
TIER 2 THUG ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_2_THUG_ABILITIES"
_includes =
{
    "TIER_1_THUG_ABILITIES",
}

--[[------------------------------------------------------------------------------
TIER 3 THUG ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_3_THUG_ABILITIES"
_includes =
{
    "TIER_2_THUG_ABILITIES",
}
startingInventory = {}
startingInventory.ability5 = "ITEM.ABILITY.CAN_OPENER"

--[[------------------------------------------------------------------------------
TIER 4 THUG ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_4_THUG_ABILITIES"
_includes =
{
    "TIER_3_THUG_ABILITIES",
}

--[[------------------------------------------------------------------------------
TIER 5 THUG ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_THUG_ABILITIES"
_includes =
{
    "TIER_4_THUG_ABILITIES",
}
startingInventory = {}
startingInventory.ability6 = "ITEM.ABILITY.MEAT_HOOK"

--[[------------------------------------------------------------------------------
THUG HEAVY MACHINEGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "THUG_HEAVY_MACHINEGUN_ABILITIES"
_includes =
{
    "TIER_1_THUG_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"

--[[------------------------------------------------------------------------------
THUG HEAVY SNIPER ABILITIES
--------------------------------------------------------------------------------]]
_id = "THUG_HEAVY_SNIPER_ABILITIES"
_includes =
{
    "TIER_1_THUG_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.MARK_TARGET"
startingInventory.ability5 = "ITEM.ABILITY.CAN_OPENER"

--[[------------------------------------------------------------------------------
THUG HEAVY SUBGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "THUG_HEAVY_SUBGUN_ABILITIES"
_includes =
{
    "TIER_1_THUG_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.MARK_TARGET"
startingInventory.ability5 = "ITEM.ABILITY.CAN_OPENER"

--[[------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
Outfit Boss - Alphonse Capone
--------------------------------------------------------------------------------]]
_id = "OUTFIT_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.BOLSTER_THE_RANKS"

--[[------------------------------------------------------------------------------
Northside Boss - Dion O'Banion
--------------------------------------------------------------------------------]]
_id = "NORTHSIDE_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.BLASTPHEMY"

--[[------------------------------------------------------------------------------
Whitecity Boss - Maggie Dyer
--------------------------------------------------------------------------------]]
_id = "WHITECITY_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.LION_TAMER"

--[[------------------------------------------------------------------------------
Ragencolts Boss - Frank Ragen
--------------------------------------------------------------------------------]]
_id = "RAGENCOLTS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.HOME_RUN"

--[[------------------------------------------------------------------------------
Donovans Boss - Frankie Donovan
--------------------------------------------------------------------------------]]
_id = "DONOVANS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.UNLEASH_FURY"

--[[------------------------------------------------------------------------------
Vicekings Boss - Daniel McKee Jackson
--------------------------------------------------------------------------------]]
_id = "VICEKINGS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.LAST_RITES"

--[[------------------------------------------------------------------------------
Saltis Boss - Joseph Saltis
--------------------------------------------------------------------------------]]
_id = "SALTIS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.STAMPEDE"

--[[------------------------------------------------------------------------------
Losluceros Boss - Elvira Duarte
--------------------------------------------------------------------------------]]
_id = "LOSLUCEROS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.DEVILS_BREATH"


--[[------------------------------------------------------------------------------
Alleycats Boss - Mabel Ryley
--------------------------------------------------------------------------------]]
_id = "ALLEYCATS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.SWINDLERS_SHOT"

--[[------------------------------------------------------------------------------
Fortunetellers Boss - Goldie Garneau
--------------------------------------------------------------------------------]]
_id = "FORTUNETELLERS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.KILLER_QUEEN"

--[[------------------------------------------------------------------------------
Hipsingtong Boss - Sai Wing Mock
--------------------------------------------------------------------------------]]
_id = "HIPSINGTONG_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.DEATH_BLOSSOM_BOMBS"

--[[------------------------------------------------------------------------------
Cardsharks Boss - Stephanie St. Clair
--------------------------------------------------------------------------------]]
_id = "CARDSHARKS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.FIRING_SQUAD"

--[[------------------------------------------------------------------------------
Genna Boss - Angelo Genna
--------------------------------------------------------------------------------]]
_id = "GENNA_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.FAN_OF_KNIVES"

--[[------------------------------------------------------------------------------
Loshijos Boss - Salazar Reyna
--------------------------------------------------------------------------------]]
_id = "LOSHIJOS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability1 = "ITEM.ABILITY.SANTA_MUERTE"

--[[------------------------------------------------------------------------------
Meatpackers Boss - Ronnie O'Neill
--------------------------------------------------------------------------------]]
_id = "MEATPACKERS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}

--[[------------------------------------------------------------------------------
Rooke Brothers Boss - D. Rooke
--------------------------------------------------------------------------------]]
_id = "ROOKE_BROTHERS_BOSS_ABILITIES"
_abstract = true
_includes =
{
    "BASE_ABILITIES",
}

--[[------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
NPC ROLE ABILITIES
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
MELEE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_MELEE_ABILITIES" -- WEAK MELEE
_includes =
{
    "TIER_1_BRAWLER_ABILITIES",
}

_id = "TIER_2_MELEE_ABILITIES" -- AVERAGE MELEE
_includes =
{
    "TIER_2_BRAWLER_ABILITIES",
}

_id = "TIER_3_MELEE_ABILITIES" -- STRONG MELEE
_includes =
{
    "TIER_3_BRAWLER_ABILITIES",
}

_id = "TIER_4_MELEE_ABILITIES" -- ELITE MELEE
_includes =
{
    "TIER_4_BRAWLER_ABILITIES",
}

_id = "TIER_5_MELEE_ABILITIES" -- LIEUTENANT MELEE
_includes =
{
    "TIER_5_BRAWLER_ABILITIES",
}

--[[------------------------------------------------------------------------------
HANDGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_HANDGUN_ABILITIES" -- WEAK HANDGUN
_includes =
{
    "TIER_1_HIRED_GUN_ABILITIES",
}

_id = "TIER_2_HANDGUN_ABILITIES" -- AVERAGE HANDGUN
_includes =
{
    "TIER_2_HIRED_GUN_ABILITIES",
}

_id = "TIER_3_HANDGUN_ABILITIES" -- STRONG HANDGUN
_includes =
{
    "TIER_3_HIRED_GUN_ABILITIES",
}

_id = "TIER_4_HANDGUN_ABILITIES" -- ELITE HANDGUN
_includes =
{
    "TIER_4_HIRED_GUN_ABILITIES",
}

_id = "TIER_5_HANDGUN_ABILITIES" -- LIEUTENANT HANDGUN
_includes =
{
    "TIER_5_HIRED_GUN_ABILITIES",
}

--[[------------------------------------------------------------------------------
SHOTGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_SHOTGUN_ABILITIES" -- WEAK SHOTGUN
_includes =
{
    "TIER_1_ENFORCER_ABILITIES",
}

_id = "TIER_2_SHOTGUN_ABILITIES" -- AVERAGE SHOTGUN
_includes =
{
    "TIER_2_ENFORCER_ABILITIES",
}

_id = "TIER_3_SHOTGUN_ABILITIES" -- STRONG SHOTGUN
_includes =
{
    "TIER_3_ENFORCER_ABILITIES",
}

_id = "TIER_4_SHOTGUN_ABILITIES" -- ELITE SHOTGUN
_includes =
{
    "TIER_4_ENFORCER_ABILITIES",
}

_id = "TIER_5_SHOTGUN_ABILITIES" -- LIEUTENANT SHOTGUN
_includes =
{
    "TIER_5_ENFORCER_ABILITIES",
}

--[[------------------------------------------------------------------------------
RIFLE ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_RIFLE_ABILITIES" -- WEAK RIFLE
_includes =
{
    "TIER_1_HIRED_GUN_ABILITIES",
}

_id = "TIER_2_RIFLE_ABILITIES" -- AVERAGE RIFLE
_includes =
{
    "TIER_2_HIRED_GUN_ABILITIES",
}

_id = "TIER_3_RIFLE_ABILITIES" -- STRONG RIFLE
_includes =
{
    "TIER_3_HIRED_GUN_ABILITIES",
}

_id = "TIER_4_RIFLE_ABILITIES" -- ELITE RIFLE
_includes =
{
    "TIER_4_HIRED_GUN_ABILITIES",
}

_id = "TIER_5_RIFLE_ABILITIES" -- LIEUTENANT RIFLE
_includes =
{
    "TIER_5_HIRED_GUN_ABILITIES",
}

--[[------------------------------------------------------------------------------
SUBGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_SUBGUN_ABILITIES" -- WEAK SUBGUN
_includes =
{
    "TIER_1_HIRED_GUN_ABILITIES",
}

_id = "TIER_2_SUBGUN_ABILITIES" -- AVERAGE SUBGUN
_includes =
{
    "TIER_2_HIRED_GUN_ABILITIES",
}

_id = "TIER_3_SUBGUN_ABILITIES" -- STRONG SUBGUN
_includes =
{
    "TIER_3_HIRED_GUN_ABILITIES",
}

_id = "TIER_4_SUBGUN_ABILITIES" -- ELITE SUBGUN
_includes =
{
    "TIER_4_HIRED_GUN_ABILITIES",
}

_id = "TIER_5_SUBGUN_ABILITIES" -- LIEUTENANT SUBGUN
_includes =
{
    "TIER_5_HIRED_GUN_ABILITIES",
}

--[[------------------------------------------------------------------------------
MACHINEGUN ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_MACHINEGUN_ABILITIES" -- WEAK MACHINEGUN
_includes =
{
    "TIER_1_ENFORCER_ABILITIES",
}

_id = "TIER_2_MACHINEGUN_ABILITIES" -- AVERAGE MACHINEGUN
_includes =
{
    "TIER_2_ENFORCER_ABILITIES",
}

_id = "TIER_3_MACHINEGUN_ABILITIES" -- STRONG MACHINEGUN
_includes =
{
    "TIER_3_ENFORCER_ABILITIES",
}

_id = "TIER_4_MACHINEGUN_ABILITIES" -- ELITE MACHINEGUN
_includes =
{
    "TIER_4_ENFORCER_ABILITIES",
}

_id = "TIER_5_MACHINEGUN_ABILITIES" -- LIEUTENANT MACHINEGUN
_includes =
{
    "TIER_5_ENFORCER_ABILITIES",
}

--[[------------------------------------------------------------------------------
SNIPER ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_1_SNIPER_ABILITIES" -- WEAK SNIPER
_includes =
{
    "TIER_1_DEADEYE_ABILITIES",
}

_id = "TIER_2_SNIPER_ABILITIES" -- AVERAGE SNIPER
_includes =
{
    "TIER_2_DEADEYE_ABILITIES",
}

_id = "TIER_3_SNIPER_ABILITIES" -- STRONG SNIPER
_includes =
{
    "TIER_3_DEADEYE_ABILITIES",
}

_id = "TIER_4_SNIPER_ABILITIES" -- ELITE SNIPER
_includes =
{
    "TIER_4_DEADEYE_ABILITIES",
}

_id = "TIER_5_SNIPER_ABILITIES" -- LIEUTENANT SNIPER
_includes =
{
    "TIER_5_DEADEYE_ABILITIES",
}

--[[------------------------------------------------------------------------------
LIEUTENANT ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_5_LIEUTENANT_ABILITIES" -- LIEUTENANT ABILITIES
_includes =
{
    "BASE_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true
startingTalents.BULWARK = true
startingTalents.COVERING_FIRE = true
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"
startingInventory.ability6 = "ITEM.ABILITY.MEAT_HOOK"

--[[------------------------------------------------------------------------------
UNDERBOSS ABILITIES
--------------------------------------------------------------------------------]]
_id = "TIER_6_UNDERBOSS_ABILITIES" -- UNDERBOSS ABILITIES
_includes =
{
    "BASE_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true
startingTalents.BULWARK = true
startingTalents.COVERING_FIRE = true
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"
startingInventory.ability6 = "ITEM.ABILITY.MEAT_HOOK"

--[[------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------

MINOR FACTION NPC ABILITIES

--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
MINOR FACTION FOREMAN ABILITIES
--------------------------------------------------------------------------------]]
_id = "MINOR_FACTION_FOREMAN_ABILITIES"
_includes =
{
    "BASE_ABILITIES",
}
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.MARK_TARGET"
startingInventory.ability5 = "ITEM.ABILITY.MEAT_HOOK"
startingInventory.ability6 = "ITEM.ABILITY.KNIFE_THROW"

--[[------------------------------------------------------------------------------
MINOR FACTION  LIEUTENANT ABILITIES
--------------------------------------------------------------------------------]]
_id = "MINOR_FACTION_LIEUTENANT_ABILITIES" -- LIEUTENANT ABILITIES
_includes =
{
    "BASE_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true
startingTalents.BULWARK = true
startingTalents.COVERING_FIRE = true
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"
startingInventory.ability6 = "ITEM.ABILITY.MEAT_HOOK"

--[[------------------------------------------------------------------------------
MINOR FACTION UNDERBOSS ABILITIES
--------------------------------------------------------------------------------]]
_id = "MINOR_FACTION_UNDERBOSS_ABILITIES" -- UNDERBOSS ABILITIES
_includes =
{
    "BASE_ABILITIES",
}
startingTalents = {}
startingTalents.REVENGE = true
startingTalents.BULWARK = true
startingTalents.COVERING_FIRE = true
startingInventory = {}
startingInventory.ability4 = "ITEM.ABILITY.SUPPRESSING_FIRE"
startingInventory.ability5 = "ITEM.ABILITY.BULLET_SHIELD"
startingInventory.ability6 = "ITEM.ABILITY.MEAT_HOOK"