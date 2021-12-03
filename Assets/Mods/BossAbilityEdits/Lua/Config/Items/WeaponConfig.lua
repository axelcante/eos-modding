 --$$ General

local ConfigBuilder = require("Libs.ConfigBuilder")

ConfigBuilder.define("ITEM.WEAPON",
{
    BASE =
    {
        _abstract = true,
        _includes = "ITEM.BASE",
        abilities =
        {
            ItemDamage = true,
        },
        name = "BaseWeapon",
        desc = "This is the base class for all Weapons",
        score = 10,
        startsCombat = true,
        chanceToCrit = 0,
        isWeapon = true,
    },

    --[[---------------------------------------------
          -- WEAPON TYPES START
    -----------------------------------------------]]

    MELEE =
    {
        _abstract = true,
        _includes = {"BASE"},
        abilities =
        {
            -- TODO: Remove this once the new character sheet has been implemented
            ItemWeapon = true,
            ItemMelee = true,
        },
        damageTypes =
        {
            melee = true,
        },
        name = "BaseMelee",
        desc = "$Default_Melee_Weapon_Description", --$ DEFAULT MELEE WEAPON DESCRIPTION
        score  = 10,
        range = 1.5,
        audio = {},

        combatAbility = "GeneralMelee",
    },

    GUN =
    {
        _abstract = true,
        _includes = {"BASE"},
        abilities =
        {
            -- TODO: Remove this once the new character sheet has been implemented
            ItemWeapon = true,
            ItemDurability = true,
            ItemGun = true,
        },
        damageTypes =
        {
            gun = true,
        },

        name = "BaseGun",
        desc = "This is the base class for all guns",
        score = 10,
        audio = {
            onFire = "AUDIO.COMBAT.PISTOL_SHOT",
            onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
            onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
            onBroken = "AUDIO.COMBAT.GUN_BROKEN"
        },
        ammoPerShot = 1,
        burstFireMarksmanshipPenalty = -10,
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_Cult1911",
    },

    HAND_GUN =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Handgun", --$ Handgun
        combatAbility = {"GeneralShoot", "PistolDoubleShot"},
        damageTypes =
        {
            handgun = true,
        }
    },

    SUBMACHINE_GUN =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Submachine_Gun", --$ Submachine Gun
        combatAbility = {"GeneralBurstFire", "WeaponSweep"},
        damageTypes =
        {
            submachineGun = true,
        }
    },

    SHOTGUN =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Shotgun", --$ Shotgun
        combatAbility = {"GeneralShoot", "GeneralShotgun"},
        damageTypes =
        {
            shotgun = true,
        }
    },

    RIFLE =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Rifle", --$ Rifle
        combatAbility = "GeneralShoot",
        damageTypes =
        {
            rifle = true,
        }
    },

    SNIPER_RIFLE =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Sniper_Rifle", --$ Sniper Rifle
        combatAbility = "GeneralShoot",
        damageTypes =
        {
            sniperRifle = true,
        },
    },

    MACHINE_GUN =
    {
        _abstract = true,
        _includes = {"GUN"},
        weaponType = "$Weapon_Type_Machine_Gun", --$ Machine Gun
        combatAbility = {"GeneralBurstFire", "WeaponSweep"},
        damageTypes =
        {
            machineGun = true,
        },
        cost = 2,
    },

    THROWN =
    {
        _abstract = true,
        _includes = "BASE",
        abilities =
        {
            ItemProjectile = true,
            ItemMissileInfo = true,
        },
        name = "ThrownWeapon",
        parabolic = false,
        score = 7,
        combatAction = "COMBAT_ACTION.WEAPON.MISSILE",
        cursor = "Sprites/Cursors/Cursor_Attack",
        audio = {
            onThrow = "AUDIO.COMBAT.KNIFE_THROW",
            onImpact = "AUDIO.COMBAT.KNIFE_STAB",
            onMiss = "AUDIO.COMBAT.KNIFE_MISS",
        }
    },

    EXPLOSIVE =
    {
        _includes = "THROWN",
        _abstract = true,
        actionCost = 1,
        consumable = true,
        parabolic = true,
        shortThrowDistance = 5,
        abilities =
        {
            ItemMissileInfo = false,
            ItemGrenadeInfo = true,
        },
        damageTypes =
        {
            explosive = true,
        },

        combatAbility = "ItemGrenade",

        combatAction = "COMBAT_ACTION.WEAPON.GRENADE",
        cursor = "Sprites/Cursors/Cursor_Attack",
        audio =
        {
            onThrow = { "AUDIO.COMBAT.GRENADE_THROW_1", "AUDIO.COMBAT.GRENADE_THROW_2", "AUDIO.COMBAT.GRENADE_THROW_3", "AUDIO.COMBAT.GRENADE_THROW_4", "AUDIO.COMBAT.GRENADE_THROW_5",
                    "AUDIO.COMBAT.GRENADE_THROW_6", "AUDIO.COMBAT.GRENADE_THROW_7", "AUDIO.COMBAT.GRENADE_THROW_8", "AUDIO.COMBAT.GRENADE_THROW_9", "AUDIO.COMBAT.GRENADE_THROW_10", },
            onImpact = "AUDIO.COMBAT.GRENADE_LAND",
        }
    },

    EXPLOSIVE_1 =
    {
        _abstract = true,
        _includes = "EXPLOSIVE",
        audio =
        {
            onThrow = { "AUDIO.COMBAT.GRENADE_THROW_1", "AUDIO.COMBAT.GRENADE_THROW_2", "AUDIO.COMBAT.GRENADE_THROW_3", "AUDIO.COMBAT.GRENADE_THROW_4", "AUDIO.COMBAT.GRENADE_THROW_5",
                    "AUDIO.COMBAT.GRENADE_THROW_6", "AUDIO.COMBAT.GRENADE_THROW_7", "AUDIO.COMBAT.GRENADE_THROW_8", "AUDIO.COMBAT.GRENADE_THROW_9", "AUDIO.COMBAT.GRENADE_THROW_10", },
            onImpact = "AUDIO.COMBAT.EXPLOSION_1"
        }
    },
    EXPLOSIVE_2 =
    {
        _abstract = true,
        _includes = "EXPLOSIVE",
        audio =
        {
            onThrow = { "AUDIO.COMBAT.GRENADE_THROW_1", "AUDIO.COMBAT.GRENADE_THROW_2", "AUDIO.COMBAT.GRENADE_THROW_3", "AUDIO.COMBAT.GRENADE_THROW_4", "AUDIO.COMBAT.GRENADE_THROW_5",
                    "AUDIO.COMBAT.GRENADE_THROW_6", "AUDIO.COMBAT.GRENADE_THROW_7", "AUDIO.COMBAT.GRENADE_THROW_8", "AUDIO.COMBAT.GRENADE_THROW_9", "AUDIO.COMBAT.GRENADE_THROW_10", },
            onImpact = "AUDIO.COMBAT.EXPLOSION_2"
        }
    },
    EXPLOSIVE_3 =
    {
        _abstract = true,
        _includes = "EXPLOSIVE",
        audio =
        {
            onThrow = { "AUDIO.COMBAT.GRENADE_THROW_1", "AUDIO.COMBAT.GRENADE_THROW_2", "AUDIO.COMBAT.GRENADE_THROW_3", "AUDIO.COMBAT.GRENADE_THROW_4", "AUDIO.COMBAT.GRENADE_THROW_5",
                    "AUDIO.COMBAT.GRENADE_THROW_6", "AUDIO.COMBAT.GRENADE_THROW_7", "AUDIO.COMBAT.GRENADE_THROW_8", "AUDIO.COMBAT.GRENADE_THROW_9", "AUDIO.COMBAT.GRENADE_THROW_10", },
            onImpact = "AUDIO.COMBAT.EXPLOSION_3"
        }
    },
    EXPLOSIVE_4 =
    {
        _abstract = true,
        _includes = "EXPLOSIVE",
        audio =
        {
            onThrow = { "AUDIO.COMBAT.GRENADE_THROW_1", "AUDIO.COMBAT.GRENADE_THROW_2", "AUDIO.COMBAT.GRENADE_THROW_3", "AUDIO.COMBAT.GRENADE_THROW_4", "AUDIO.COMBAT.GRENADE_THROW_5",
                    "AUDIO.COMBAT.GRENADE_THROW_6", "AUDIO.COMBAT.GRENADE_THROW_7", "AUDIO.COMBAT.GRENADE_THROW_8", "AUDIO.COMBAT.GRENADE_THROW_9", "AUDIO.COMBAT.GRENADE_THROW_10", },
            onImpact = "AUDIO.COMBAT.EXPLOSION_4"
        }
    },

    --[[---------------------------------------------
          -- WEAPON TYPES END
    -----------------------------------------------]]

--[[------------------------------------------------------------------------------
FISTS
--------------------------------------------------------------------------------]]
DEFAULT_FISTS =
{
    _includes = {"MELEE"},
    name = "$DEFAULT_FISTS_name", --$ Fists
    desc = "$DEFAULT_FISTS_desc", --$ For when you want to get up close and personal.
    inventoryTooltip = "$DEFAULT_FISTS_desc",
    minDamage = 9,
    maxDamage = 10,
    minCrit = 15,
    maxCrit = 20,
    score = 0,
    baseCritChance = 10,

    audio =
    {
        onFire = { "AUDIO.COMBAT.PUNCH_1", "AUDIO.COMBAT.PUNCH_2", "AUDIO.COMBAT.PUNCH_3", },
        onMiss = { "AUDIO.COMBAT.FIST_SWING" },
        onCrit = { "AUDIO.COMBAT.PUNCH_CRIT_1", "AUDIO.COMBAT.PUNCH_CRIT_2", "AUDIO.COMBAT.PUNCH_CRIT_3", },
    },
    damageTypes =
    {
        punch = true,
    },

    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Unarmed",
    receiverAnimation_Die = "Receiver_Melee_Fists_Die",
    receiverAnimation_Live = "Receiver_Melee_Fists_Live",

    item = {
        rarity = "Common",
        type = "Melee",
        slotType = "Melee",
    }
},

--[[------------------------------------------------------------------------------
BASE HANDGUN CONFIGS
--------------------------------------------------------------------------------]]

BASE_HANDGUN_01 = --
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_01_WeaponImageCaption",  --$ .38 Revolver
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_M1911_SHOT",
        onReload = "AUDIO.COMBAT.REVOLVER_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultPolicePositiveSpecial",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultPolicePositiveSpecial",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_CultPolicePositiveSpecial",
},

BASE_HANDGUN_02 = --
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_02_WeaponImageCaption",  --$ SH Revolver
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_SINGLE_SHOT",
        onReload = "AUDIO.COMBAT.REVOLVER_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_SW38",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_SW38",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_SW38",
},

BASE_HANDGUN_03 = --
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_03_WeaponImageCaption",  --$ M1911 Pistol
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_M1911_SHOT",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Cult1911",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Cult1911",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_Cult1911",
},

BASE_HANDGUN_04 =
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_04_WeaponImageCaption",  --$ Model 1915 Pistol
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_SINGLE_SHOT",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Vendetta1915",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Vendetta1915",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_Vendetta1915",
},

BASE_HANDGUN_05 =
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_05_WeaponImageCaption",  --$ Mauser C96
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_M1911_SHOT",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_MauserC96",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_MauserC96",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_MauserC96",
},

BASE_HANDGUN_06 =
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Handgun_06_WeaponImageCaption",  --$ New Service Revolver
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_HANDGUN_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_SINGLE_SHOT",
        onReload = "AUDIO.COMBAT.REVOLVER_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultNewService",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultNewService",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_CultNewService",
},

--[[------------------------------------------------------------------------------
COMMON HANDGUNS
--------------------------------------------------------------------------------]]

COMMON_HANDGUN_01 = --
{
    _includes = {"BASE_HANDGUN_01", "WEAPON_STATS.COMMON_HANDGUN_01"},
},

COMMON_HANDGUN_02 = --
{
    _includes = {"BASE_HANDGUN_02", "WEAPON_STATS.COMMON_HANDGUN_02"},
},

COMMON_HANDGUN_03 = --
{
    _includes = {"BASE_HANDGUN_03", "WEAPON_STATS.COMMON_HANDGUN_03"},
},

COMMON_HANDGUN_04 = --
{
    _includes = {"BASE_HANDGUN_04", "WEAPON_STATS.COMMON_HANDGUN_04"},
},

COMMON_HANDGUN_05 = --
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.COMMON_HANDGUN_05"},
},

COMMON_HANDGUN_06 = --
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.COMMON_HANDGUN_06"},
},

--[[------------------------------------------------------------------------------
UNCOMMON HANDGUNS
--------------------------------------------------------------------------------]]

UNCOMMON_HANDGUN_01 = --
{
    _includes = {"BASE_HANDGUN_01", "WEAPON_STATS.UNCOMMON_HANDGUN_01"},
},

UNCOMMON_HANDGUN_02 = --
{
    _includes = {"BASE_HANDGUN_02", "WEAPON_STATS.UNCOMMON_HANDGUN_02"},
},

UNCOMMON_HANDGUN_03 = --
{
    _includes = {"BASE_HANDGUN_03", "WEAPON_STATS.UNCOMMON_HANDGUN_03"},
},

UNCOMMON_HANDGUN_04 = --
{
    _includes = {"BASE_HANDGUN_04", "WEAPON_STATS.UNCOMMON_HANDGUN_04"},
},

UNCOMMON_HANDGUN_05 = --
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.UNCOMMON_HANDGUN_05"},
},

UNCOMMON_HANDGUN_06 = --
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.UNCOMMON_HANDGUN_06"},
},

--[[------------------------------------------------------------------------------
RARE HANDGUNS
--------------------------------------------------------------------------------]]

RARE_HANDGUN_01 = --
{
    _includes = {"BASE_HANDGUN_01", "WEAPON_STATS.RARE_HANDGUN_01"},
},

RARE_HANDGUN_02 = --
{
    _includes = {"BASE_HANDGUN_02", "WEAPON_STATS.RARE_HANDGUN_02"},
},

RARE_HANDGUN_03 = --
{
    _includes = {"BASE_HANDGUN_03", "WEAPON_STATS.RARE_HANDGUN_03"},
},

RARE_HANDGUN_04 = --
{
    _includes = {"BASE_HANDGUN_04", "WEAPON_STATS.RARE_HANDGUN_04"},
},

RARE_HANDGUN_05 = --
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.RARE_HANDGUN_05"},
},

RARE_HANDGUN_06 = --
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.RARE_HANDGUN_06"},
},

--[[------------------------------------------------------------------------------
EPIC HANDGUNS
--------------------------------------------------------------------------------]]

EPIC_HANDGUN_01 = --
{
    _includes = {"BASE_HANDGUN_01", "WEAPON_STATS.EPIC_HANDGUN_01"},
},

EPIC_HANDGUN_02 = --
{
    _includes = {"BASE_HANDGUN_02", "WEAPON_STATS.EPIC_HANDGUN_02"},
},

EPIC_HANDGUN_03 = --
{
    _includes = {"BASE_HANDGUN_03", "WEAPON_STATS.EPIC_HANDGUN_03"},
},

EPIC_HANDGUN_04 = --
{
    _includes = {"BASE_HANDGUN_04", "WEAPON_STATS.EPIC_HANDGUN_04"},
},

EPIC_HANDGUN_05 = --
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.EPIC_HANDGUN_05"},
},

EPIC_HANDGUN_06 = --
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.EPIC_HANDGUN_06"},
},

--[[------------------------------------------------------------------------------
BASE ZIPGUN CONFIG
--------------------------------------------------------------------------------]]

BASE_ZIPGUN_01 = --
{
    _includes = {"HAND_GUN"},
    _abstract=true,
    imageCaption = "$Zipgun_01_WeaponImageCaption", --$ Zip Pistol
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_ZIPGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CULT_SINGLE_SHOT",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_ZipGun",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_ZipGun",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_ZipGun",
},

--[[------------------------------------------------------------------------------
ZIPGUNS
--------------------------------------------------------------------------------]]

COMMON_ZIPGUN_01 = --
{
    _includes = {"BASE_ZIPGUN_01", "WEAPON_STATS.COMMON_ZIPGUN_01"},
},

UNCOMMON_ZIPGUN_01 = --
{
    _includes = {"BASE_ZIPGUN_01", "WEAPON_STATS.UNCOMMON_ZIPGUN_01"},
},

RARE_ZIPGUN_01 = --
{
    _includes = {"BASE_ZIPGUN_01", "WEAPON_STATS.RARE_ZIPGUN_01"},
},

EPIC_ZIPGUN_01 = --
{
    _includes = {"BASE_ZIPGUN_01", "WEAPON_STATS.EPIC_ZIPGUN_01"},
},

--[[------------------------------------------------------------------------------
BASE SHOTGUN CONFIGS
--------------------------------------------------------------------------------]]

BASE_SHOTGUN_01 = --
{
    _includes = {"SHOTGUN"},
    _abstract=true,
    imageCaption = "$Shotgun_01_WeaponImageCaption", --$ Short Barreled Shotgun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SHOTGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SHOTGUN_SHOT",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD_SINGLE",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_ShortBarreled",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_ShortBarreled",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_ShortBarreled",
},

BASE_SHOTGUN_02 = --
{
    _includes = {"SHOTGUN"},
    _abstract=true,
    imageCaption = "$Shotgun_02_WeaponImageCaption", --$ Model 10 Shotgun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SHOTGUN_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SHOTGUN_SHOT",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Remmy10",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Remmy10",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_Remmy10",
},

BASE_SHOTGUN_03 =
{
    _includes = {"SHOTGUN"},
    _abstract=true,
    imageCaption = "$Shotgun_03_WeaponImageCaption", --$ Auto-5 Shotgun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SHOTGUN_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SHOTGUN_SHOT",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_BrownAuto5",
},

BASE_SHOTGUN_04 =
{
    _includes = {"SHOTGUN"},
    _abstract=true,
    imageCaption = "$Shotgun_04_WeaponImageCaption", --$ Model 1912 Shotgun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SHOTGUN_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SHOTGUN_SHOT",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_WinstonModel12",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_WinstonModel12",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_WinstonModel12",
},

BASE_SHOTGUN_05 =
{
    _includes = {"SHOTGUN"},
    _abstract=true,
    imageCaption = "$Shotgun_05_WeaponImageCaption", --$ Sjögren Inertia
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SHOTGUN_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SHOTGUN_SHOT",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Sjogren",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Sjogren",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_Sjogren",
},

--[[------------------------------------------------------------------------------
COMMON SHOTGUNS
--------------------------------------------------------------------------------]]

COMMON_SHOTGUN_01 = --
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.COMMON_SHOTGUN_01"},
},

COMMON_SHOTGUN_02 = --
{
    _includes = {"BASE_SHOTGUN_02", "WEAPON_STATS.COMMON_SHOTGUN_02"},
},

COMMON_SHOTGUN_03 = --
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.COMMON_SHOTGUN_03"},
},

COMMON_SHOTGUN_04 = --
{
    _includes = {"BASE_SHOTGUN_04", "WEAPON_STATS.COMMON_SHOTGUN_04"},
},

COMMON_SHOTGUN_05 = --
{
    _includes = {"BASE_SHOTGUN_05", "WEAPON_STATS.COMMON_SHOTGUN_05"},
},

--[[------------------------------------------------------------------------------
UNCOMMON SHOTGUNS
--------------------------------------------------------------------------------]]

UNCOMMON_SHOTGUN_01 = --
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.UNCOMMON_SHOTGUN_01"},
},

UNCOMMON_SHOTGUN_02 = --
{
    _includes = {"BASE_SHOTGUN_02", "WEAPON_STATS.UNCOMMON_SHOTGUN_02"},
},

UNCOMMON_SHOTGUN_03 = --
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.UNCOMMON_SHOTGUN_03"},
},

UNCOMMON_SHOTGUN_04 = --
{
    _includes = {"BASE_SHOTGUN_04", "WEAPON_STATS.UNCOMMON_SHOTGUN_04"},
},

UNCOMMON_SHOTGUN_05 = --
{
    _includes = {"BASE_SHOTGUN_05", "WEAPON_STATS.UNCOMMON_SHOTGUN_05"},
},

--[[------------------------------------------------------------------------------
RARE SHOTGUNS
--------------------------------------------------------------------------------]]

RARE_SHOTGUN_01 = --
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.RARE_SHOTGUN_01"},
},

RARE_SHOTGUN_02 = --
{
    _includes = {"BASE_SHOTGUN_02", "WEAPON_STATS.RARE_SHOTGUN_02"},
},

RARE_SHOTGUN_03 = --
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.RARE_SHOTGUN_03"},
},

RARE_SHOTGUN_04 = --
{
    _includes = {"BASE_SHOTGUN_04", "WEAPON_STATS.RARE_SHOTGUN_04"},
},

RARE_SHOTGUN_05 = --
{
    _includes = {"BASE_SHOTGUN_05", "WEAPON_STATS.RARE_SHOTGUN_05"},
},

--[[------------------------------------------------------------------------------
EPIC SHOTGUNS
--------------------------------------------------------------------------------]]

EPIC_SHOTGUN_01 = --
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.EPIC_SHOTGUN_01"},
},

EPIC_SHOTGUN_02 = --
{
    _includes = {"BASE_SHOTGUN_02", "WEAPON_STATS.EPIC_SHOTGUN_02"},
},

EPIC_SHOTGUN_03 = --
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.EPIC_SHOTGUN_03"},
},

EPIC_SHOTGUN_04 = --
{
    _includes = {"BASE_SHOTGUN_04", "WEAPON_STATS.EPIC_SHOTGUN_04"},
},

EPIC_SHOTGUN_05 = --
{
    _includes = {"BASE_SHOTGUN_05", "WEAPON_STATS.EPIC_SHOTGUN_05"},
},

--[[------------------------------------------------------------------------------
BASE SUBMACHINE CONFIGS
--------------------------------------------------------------------------------]]

BASE_SUBGUN_01 = --
{
    _includes = {"SUBMACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Subgun_01_WeaponImageCaption", --$ M1921 Tommy Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SUBGUN_01", "desc"},
    burstFire = 3,
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.TOMMY_GUN_BURST",
        onBurstFire = "AUDIO.COMBAT.TOMMY_GUN_BURST",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    damageTypes =
    {
        tommyGun = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_Thompson1921",
},

BASE_SUBGUN_02 = --
{
    _includes = {"SUBMACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Subgun_02_WeaponImageCaption", --$ M1921AC Tommy Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SUBGUN_02", "desc"},
    burstFire = 3,
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.TOMMY_GUN_BURST",
        onBurstFire = "AUDIO.COMBAT.TOMMY_GUN_BURST",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    damageTypes =
    {
        tommyGun = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_Thompson1921AC",
},

BASE_SUBGUN_03 =
{
    _includes = {"SUBMACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Subgun_03_WeaponImageCaption", --$ OVP M1918 Submachine Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SUBGUN_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SUBMACHINE_BURST",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.SUBMACHINE_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_OVP1918",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_OVP1918",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_OVP1918",
},

BASE_SUBGUN_04 = --
{
    _includes = {"SUBMACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Subgun_04_WeaponImageCaption", --$ MP 18 Submachine Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SUBGUN_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.TOMMY_GUN_BURST",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_MP18",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_MP18",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_MP18",
},

BASE_SUBGUN_05 =
{
    _includes = {"SUBMACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Subgun_05_WeaponImageCaption", --$ BM-1918
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SUBGUN_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SUBMACHINE_BURST",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.SUBMACHINE_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_VendettaM1918",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_VendettaM1918",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_VendettaM1918",
},

--[[------------------------------------------------------------------------------
COMMON SUBMACHINE GUNS
--------------------------------------------------------------------------------]]

COMMON_SUBGUN_01 = --
{
    _includes = {"BASE_SUBGUN_01", "WEAPON_STATS.COMMON_SUBGUN_01"},
},

COMMON_SUBGUN_02 = --
{
    _includes = {"BASE_SUBGUN_02", "WEAPON_STATS.COMMON_SUBGUN_02"},
},

COMMON_SUBGUN_03 = --
{
    _includes = {"BASE_SUBGUN_03", "WEAPON_STATS.COMMON_SUBGUN_03"},
},

COMMON_SUBGUN_04 = --
{
    _includes = {"BASE_SUBGUN_04", "WEAPON_STATS.COMMON_SUBGUN_04"},
},

COMMON_SUBGUN_05 = --
{
    _includes = {"BASE_SUBGUN_05", "WEAPON_STATS.COMMON_SUBGUN_05"},
},

--[[------------------------------------------------------------------------------
UNCOMMON SUBMACHINE GUNS
--------------------------------------------------------------------------------]]

UNCOMMON_SUBGUN_01 = --
{
    _includes = {"BASE_SUBGUN_01", "WEAPON_STATS.UNCOMMON_SUBGUN_01"},
},

UNCOMMON_SUBGUN_02 = --
{
    _includes = {"BASE_SUBGUN_02", "WEAPON_STATS.UNCOMMON_SUBGUN_02"},
},

UNCOMMON_SUBGUN_03 = --
{
    _includes = {"BASE_SUBGUN_03", "WEAPON_STATS.UNCOMMON_SUBGUN_03"},
},

UNCOMMON_SUBGUN_04 = --
{
    _includes = {"BASE_SUBGUN_04", "WEAPON_STATS.UNCOMMON_SUBGUN_04"},
},

UNCOMMON_SUBGUN_05 = --
{
    _includes = {"BASE_SUBGUN_05", "WEAPON_STATS.UNCOMMON_SUBGUN_05"},
},

--[[------------------------------------------------------------------------------
RARE SUBMACHINE GUNS
--------------------------------------------------------------------------------]]

RARE_SUBGUN_01 = --
{
    _includes = {"BASE_SUBGUN_01", "WEAPON_STATS.RARE_SUBGUN_01"},
},

RARE_SUBGUN_02 = --
{
    _includes = {"BASE_SUBGUN_02", "WEAPON_STATS.RARE_SUBGUN_02"},
},

RARE_SUBGUN_03 = --
{
    _includes = {"BASE_SUBGUN_03", "WEAPON_STATS.RARE_SUBGUN_03"},
},

RARE_SUBGUN_04 = --
{
    _includes = {"BASE_SUBGUN_04", "WEAPON_STATS.RARE_SUBGUN_04"},
},

RARE_SUBGUN_05 = --
{
    _includes = {"BASE_SUBGUN_05", "WEAPON_STATS.RARE_SUBGUN_05"},
},
--[[------------------------------------------------------------------------------
EPIC SUBMACHINE GUNS
--------------------------------------------------------------------------------]]

EPIC_SUBGUN_01 = --
{
    _includes = {"BASE_SUBGUN_01", "WEAPON_STATS.EPIC_SUBGUN_01"},
},

EPIC_SUBGUN_02 = --
{
    _includes = {"BASE_SUBGUN_02", "WEAPON_STATS.EPIC_SUBGUN_02"},
},

EPIC_SUBGUN_03 = --
{
    _includes = {"BASE_SUBGUN_03", "WEAPON_STATS.EPIC_SUBGUN_03"},
},

EPIC_SUBGUN_04 = --
{
    _includes = {"BASE_SUBGUN_04", "WEAPON_STATS.EPIC_SUBGUN_04"},
},

EPIC_SUBGUN_05 = --
{
    _includes = {"BASE_SUBGUN_05", "WEAPON_STATS.EPIC_SUBGUN_05"},
},

--[[------------------------------------------------------------------------------
BASE RIFLES CONFIG
--------------------------------------------------------------------------------]]

BASE_RIFLE_01 = --
{
    _includes = {"RIFLE"},
    _abstract=true,
    imageCaption = "$Rifle_01_WeaponImageCaption", --$ SM-99 Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_RIFLE_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.SM99_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Salvage99",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Salvage99",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Salvage99",
},

BASE_RIFLE_02 = --
{
    _includes = {"RIFLE"},
    _abstract=true,
    imageCaption = "$Rifle_02_WeaponImageCaption", --$ Model 1895 Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_RIFLE_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.MODEL1895_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Winston1895",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Winston1895",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Winston1895",
},

BASE_RIFLE_03 =
{
    _includes = {"RIFLE"},
    _abstract=true,
    imageCaption = "$Rifle_03_WeaponImageCaption", --$ Model 8
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_RIFLE_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.MODEL8_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Remmy8",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Remmy8",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Remmy8",
},

BASE_RIFLE_04 =
{
    _includes = {"RIFLE"},
    _abstract=true,
    imageCaption = "$Rifle_04_WeaponImageCaption", --$ Gewehr 98
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_RIFLE_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.GEWEHR98_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Gewehr98",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Gewehr98",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Gewehr98",
},

--[[------------------------------------------------------------------------------
COMMON RIFLES
--------------------------------------------------------------------------------]]

COMMON_RIFLE_01 = --
{
    _includes = {"BASE_RIFLE_01", "WEAPON_STATS.COMMON_RIFLE_01"},
},

COMMON_RIFLE_02 = --
{
    _includes = {"BASE_RIFLE_02", "WEAPON_STATS.COMMON_RIFLE_02"},
},

COMMON_RIFLE_03 = --
{
    _includes = {"BASE_RIFLE_03", "WEAPON_STATS.COMMON_RIFLE_03"},
},

COMMON_RIFLE_04 = --
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.COMMON_RIFLE_04"},
},

--[[------------------------------------------------------------------------------
UNCOMMON RIFLES
--------------------------------------------------------------------------------]]

UNCOMMON_RIFLE_01 = --
{
    _includes = {"BASE_RIFLE_01", "WEAPON_STATS.UNCOMMON_RIFLE_01"},
},

UNCOMMON_RIFLE_02 = --
{
    _includes = {"BASE_RIFLE_02", "WEAPON_STATS.UNCOMMON_RIFLE_02"},
},

UNCOMMON_RIFLE_03 = --
{
    _includes = {"BASE_RIFLE_03", "WEAPON_STATS.UNCOMMON_RIFLE_03"},
},

UNCOMMON_RIFLE_04 = --
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.UNCOMMON_RIFLE_04"},
},

--[[------------------------------------------------------------------------------
RARE RIFLES
--------------------------------------------------------------------------------]]

RARE_RIFLE_01 = --
{
    _includes = {"BASE_RIFLE_01", "WEAPON_STATS.RARE_RIFLE_01"},
},

RARE_RIFLE_02 = --
{
    _includes = {"BASE_RIFLE_02", "WEAPON_STATS.RARE_RIFLE_02"},
},

RARE_RIFLE_03 = --
{
    _includes = {"BASE_RIFLE_03", "WEAPON_STATS.RARE_RIFLE_03"},
},

RARE_RIFLE_04 = --
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.RARE_RIFLE_04"},
},

--[[------------------------------------------------------------------------------
EPIC RIFLES
--------------------------------------------------------------------------------]]

EPIC_RIFLE_01 = --
{
    _includes = {"BASE_RIFLE_01", "WEAPON_STATS.EPIC_RIFLE_01"},
},

EPIC_RIFLE_02 = --
{
    _includes = {"BASE_RIFLE_02", "WEAPON_STATS.EPIC_RIFLE_02"},
},

EPIC_RIFLE_03 = --
{
    _includes = {"BASE_RIFLE_03", "WEAPON_STATS.EPIC_RIFLE_03"},
},

EPIC_RIFLE_04 = --
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.EPIC_RIFLE_04"},
},

--[[------------------------------------------------------------------------------
BASE SNIPER CONFIGS
--------------------------------------------------------------------------------]]

BASE_SNIPER_01 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_01_WeaponImageCaption", --$ M1903 Sniper Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_SpringfieldM1903",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_SpringfieldM1903",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_SpringfieldM1903",
},

BASE_SNIPER_02 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_02_WeaponImageCaption", --$ M1917 Sniper Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Enfield1917_Scope",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Enfield1917_Scope",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Enfield1917_Scope",
},

BASE_SNIPER_03 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_03_WeaponImageCaption", --$ SMLE Sniper Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS -- PLACEHOLDER
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_SMLE",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_SMLE",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_SMLE",
},

BASE_SNIPER_04 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_04_WeaponImageCaption", --$ SM-99 Scoped
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Salvage99_Scope",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Salvage99_Scope",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Salvage99_Scope",
},

BASE_SNIPER_05 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_05_WeaponImageCaption", --$ Model 1895 Scoped Rifle
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Winston1895_Scope",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Winston1895_Scope",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Winston1895_Scope",
},

BASE_SNIPER_06 =
{
    _includes = {"SNIPER_RIFLE"},
    _abstract=true,
    imageCaption = "$Sniper_06_WeaponImageCaption", --$ Mosin–Nagant
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_SNIPER_06", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.THOMPSON_M1921_SHOT",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_MosinM91",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_MosinM91",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_MosinM91",
},

--[[------------------------------------------------------------------------------
COMMON SNIPER RIFLES
--------------------------------------------------------------------------------]]

COMMON_SNIPER_01 = --
{
    _includes = {"BASE_SNIPER_01", "WEAPON_STATS.COMMON_SNIPER_01"},
},

COMMON_SNIPER_02 = --
{
    _includes = {"BASE_SNIPER_02", "WEAPON_STATS.COMMON_SNIPER_02"},
},

COMMON_SNIPER_03 = --
{
    _includes = {"BASE_SNIPER_03", "WEAPON_STATS.COMMON_SNIPER_03"},
},

COMMON_SNIPER_04 = --
{
    _includes = {"BASE_SNIPER_04", "WEAPON_STATS.COMMON_SNIPER_04"},
},

COMMON_SNIPER_05 = --
{
    _includes = {"BASE_SNIPER_05", "WEAPON_STATS.COMMON_SNIPER_05"},
},

COMMON_SNIPER_06 = --
{
    _includes = {"BASE_SNIPER_06", "WEAPON_STATS.COMMON_SNIPER_06"},
},

--[[------------------------------------------------------------------------------
UNCOMMON SNIPER RIFLES
--------------------------------------------------------------------------------]]

UNCOMMON_SNIPER_01 = --
{
    _includes = {"BASE_SNIPER_01", "WEAPON_STATS.UNCOMMON_SNIPER_01"},
},

UNCOMMON_SNIPER_02 = --
{
    _includes = {"BASE_SNIPER_02", "WEAPON_STATS.UNCOMMON_SNIPER_02"},
},

UNCOMMON_SNIPER_03 = --
{
    _includes = {"BASE_SNIPER_03", "WEAPON_STATS.UNCOMMON_SNIPER_03"},
},

UNCOMMON_SNIPER_04 = --
{
    _includes = {"BASE_SNIPER_04", "WEAPON_STATS.UNCOMMON_SNIPER_04"},
},

UNCOMMON_SNIPER_05 = --
{
    _includes = {"BASE_SNIPER_05", "WEAPON_STATS.UNCOMMON_SNIPER_05"},
},

UNCOMMON_SNIPER_06 = --
{
    _includes = {"BASE_SNIPER_06", "WEAPON_STATS.UNCOMMON_SNIPER_06"},
},

--[[------------------------------------------------------------------------------
RARE SNIPER RIFLES
--------------------------------------------------------------------------------]]

RARE_SNIPER_01 = --
{
    _includes = {"BASE_SNIPER_01", "WEAPON_STATS.RARE_SNIPER_01"},
},

RARE_SNIPER_02 = --
{
    _includes = {"BASE_SNIPER_02", "WEAPON_STATS.RARE_SNIPER_02"},
},

RARE_SNIPER_03 = --
{
    _includes = {"BASE_SNIPER_03", "WEAPON_STATS.RARE_SNIPER_03"},
},

RARE_SNIPER_04 = --
{
    _includes = {"BASE_SNIPER_04", "WEAPON_STATS.RARE_SNIPER_04"},
},

RARE_SNIPER_05 = --
{
    _includes = {"BASE_SNIPER_05", "WEAPON_STATS.RARE_SNIPER_05"},
},

RARE_SNIPER_06 = --
{
    _includes = {"BASE_SNIPER_06", "WEAPON_STATS.RARE_SNIPER_06"},
},

--[[------------------------------------------------------------------------------
EPIC SNIPER RIFLES
--------------------------------------------------------------------------------]]

EPIC_SNIPER_01 = --
{
    _includes = {"BASE_SNIPER_01", "WEAPON_STATS.EPIC_SNIPER_01"},
},

EPIC_SNIPER_02 = --
{
    _includes = {"BASE_SNIPER_02", "WEAPON_STATS.EPIC_SNIPER_02"},
},

EPIC_SNIPER_03 = --
{
    _includes = {"BASE_SNIPER_03", "WEAPON_STATS.EPIC_SNIPER_03"},
},

EPIC_SNIPER_04 = --
{
    _includes = {"BASE_SNIPER_04", "WEAPON_STATS.EPIC_SNIPER_04"},
},

EPIC_SNIPER_05 = --
{
    _includes = {"BASE_SNIPER_05", "WEAPON_STATS.EPIC_SNIPER_05"},
},

EPIC_SNIPER_06 = --
{
    _includes = {"BASE_SNIPER_06", "WEAPON_STATS.EPIC_SNIPER_06"},
},

--[[------------------------------------------------------------------------------
BASE MACHINEGUN CONFIGS
--------------------------------------------------------------------------------]]

BASE_MACHINEGUN_01 =
{
    _includes = {"MACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Machinegun_01_WeaponImageCaption", --$ BAR M1918
    burstFire = 3,
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_MACHINEGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onBurstFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_BAR1918",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_BAR1918",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_BAR1918",
},

BASE_MACHINEGUN_02 =
{
    _includes = {"MACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Machinegun_02_WeaponImageCaption", --$ Chauchat Machine Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_MACHINEGUN_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.CHAUCHAT_AUTO_SHOT",
        onBurstFire = "AUDIO.COMBAT.CHAUCHAT_AUTO_SHOT",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_Chauchut",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_Chauchut",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_Chauchut",
},

BASE_MACHINEGUN_03 =
{
    _includes = {"MACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Machinegun_03_WeaponImageCaption", --$ Lewis Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_MACHINEGUN_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onBurstFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_LewisGun",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_LewisGun",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_LewisGun",
},

BASE_MACHINEGUN_04 =
{
    _includes = {"MACHINE_GUN"},
    _abstract=true,
    imageCaption = "$Machinegun_04_WeaponImageCaption", --$ Madsen Machine Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_MACHINEGUN_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onBurstFire = "AUDIO.COMBAT.BROWN_1918_AUTO_SHOT",
        onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_Madsen",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_Madsen",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_Madsen",
},

--[[------------------------------------------------------------------------------
COMMON MACHINEGUNS
--------------------------------------------------------------------------------]]

COMMON_MACHINEGUN_01 = --
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.COMMON_MACHINEGUN_01"},
},

COMMON_MACHINEGUN_02 = --
{
    _includes = {"BASE_MACHINEGUN_02", "WEAPON_STATS.COMMON_MACHINEGUN_02"},
},

COMMON_MACHINEGUN_03 = --
{
    _includes = {"BASE_MACHINEGUN_03", "WEAPON_STATS.COMMON_MACHINEGUN_03"},
},

COMMON_MACHINEGUN_04 = --
{
    _includes = {"BASE_MACHINEGUN_04", "WEAPON_STATS.COMMON_MACHINEGUN_04"},
},

--[[------------------------------------------------------------------------------
UNCOMMON MACHINEGUNS
--------------------------------------------------------------------------------]]

UNCOMMON_MACHINEGUN_01 = --
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.UNCOMMON_MACHINEGUN_01"},
},

UNCOMMON_MACHINEGUN_02 = --
{
    _includes = {"BASE_MACHINEGUN_02", "WEAPON_STATS.UNCOMMON_MACHINEGUN_02"},
},

UNCOMMON_MACHINEGUN_03 = --
{
    _includes = {"BASE_MACHINEGUN_03", "WEAPON_STATS.UNCOMMON_MACHINEGUN_03"},
},

UNCOMMON_MACHINEGUN_04 = --
{
    _includes = {"BASE_MACHINEGUN_04", "WEAPON_STATS.UNCOMMON_MACHINEGUN_04"},
},

--[[------------------------------------------------------------------------------
RARE MACHINEGUNS
--------------------------------------------------------------------------------]]

RARE_MACHINEGUN_01 = --
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.RARE_MACHINEGUN_01"},
},

RARE_MACHINEGUN_02 = --
{
    _includes = {"BASE_MACHINEGUN_02", "WEAPON_STATS.RARE_MACHINEGUN_02"},
},

RARE_MACHINEGUN_03 = --
{
    _includes = {"BASE_MACHINEGUN_03", "WEAPON_STATS.RARE_MACHINEGUN_03"},
},

RARE_MACHINEGUN_04 = --
{
    _includes = {"BASE_MACHINEGUN_04", "WEAPON_STATS.RARE_MACHINEGUN_04"},
},

--[[------------------------------------------------------------------------------
EPIC MACHINEGUNS
--------------------------------------------------------------------------------]]

EPIC_MACHINEGUN_01 = --
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.EPIC_MACHINEGUN_01"},
},

EPIC_MACHINEGUN_02 = --
{
    _includes = {"BASE_MACHINEGUN_02", "WEAPON_STATS.EPIC_MACHINEGUN_02"},
},

EPIC_MACHINEGUN_03 = --
{
    _includes = {"BASE_MACHINEGUN_03", "WEAPON_STATS.EPIC_MACHINEGUN_03"},
},

EPIC_MACHINEGUN_04 = --
{
    _includes = {"BASE_MACHINEGUN_04", "WEAPON_STATS.EPIC_MACHINEGUN_04"},
},

--[[------------------------------------------------------------------------------
BASE MELEE WEAPON CONFIGS
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
Base Stiletto
--------------------------------------------------------------------------------]]

MELEE_01 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_01"},
    imageCaption = "$Melee_01_WeaponImageCaption", --$ Stiletto
    inventoryTooltip = link{"WEAPON_STATS.MELEE_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.KNIFE_HIT",
        onCrit = "AUDIO.COMBAT.KNIFE_CRIT",
        onMiss = "AUDIO.COMBAT.KNIFE_MISS",
        onKill = "AUDIO.COMBAT.KNIFE_KILL",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Stiletto",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Stiletto",
    receiverAnimation_Die = "Receiver_Melee_Knife_Die",
    receiverAnimation_Live = "Receiver_Melee_Knife_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Stiletto",
},

--[[------------------------------------------------------------------------------
Stiletto Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_STILETTO = -- Common Stiletto
{
    _includes = {"MELEE_01", "WEAPON_STATS.MELEE_16"},
},

UNCOMMON_MELEE_STILETTO = -- Uncommon Stiletto
{
    _includes = {"MELEE_01", "WEAPON_STATS.MELEE_01"},
},

RARE_MELEE_STILETTO = -- Rare Stiletto
{
    _includes = {"MELEE_01", "WEAPON_STATS.MELEE_17"},
},

EPIC_MELEE_STILETTO = -- Epic Stiletto
{
    _includes = {"MELEE_01", "WEAPON_STATS.MELEE_18"},
},


--[[------------------------------------------------------------------------------
Base Brass Knuckles
--------------------------------------------------------------------------------]]

MELEE_02 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_02"},
    imageCaption = "$Melee_02_WeaponImageCaption", --$ Brass Knuckles
    inventoryTooltip = link{"WEAPON_STATS.MELEE_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_1", "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_2", "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_3", "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_4", "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_5", "AUDIO.COMBAT.BRASS_KNUCKLE_HIT_6", },
        onMiss = "AUDIO.COMBAT.BRASS_KNUCKLE_MISS",
        onCrit = { "AUDIO.COMBAT.BRASS_KNUCKLE_CRIT" },
    },
    damageTypes =
    {
        punch = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BrassKnuckles",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BrassKnuckles",
    receiverAnimation_Die = "Receiver_Melee_Fists_Die",
    receiverAnimation_Live = "Receiver_Melee_Fists_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_BrassKnuckles",
},

--[[------------------------------------------------------------------------------
Brass Knuckles Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_BRASS_KNUCKLES = -- Common Brass Knuckles
{
    _includes = {"MELEE_02", "WEAPON_STATS.MELEE_19"},
},

UNCOMMON_MELEE_BRASS_KNUCKLES = -- Uncommon Brass Knuckles
{
    _includes = {"MELEE_02"},
},

RARE_MELEE_BRASS_KNUCKLES = -- Rare Brass Knuckles
{
    _includes = {"MELEE_02", "WEAPON_STATS.MELEE_20"},
},

EPIC_MELEE_BRASS_KNUCKLES = -- Epic Brass Knuckles
{
    _includes = {"MELEE_02", "WEAPON_STATS.MELEE_21"},
},

--[[------------------------------------------------------------------------------
Base Brass Crowbar
--------------------------------------------------------------------------------]]

MELEE_03 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_03"},
    imageCaption = "$Melee_03_WeaponImageCaption", --$ Crowbar
    inventoryTooltip = link{"WEAPON_STATS.MELEE_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.CROWBAR_HIT_1", "AUDIO.COMBAT.CROWBAR_HIT_2", "AUDIO.COMBAT.CROWBAR_HIT_3", "AUDIO.COMBAT.CROWBAR_HIT_4", "AUDIO.COMBAT.CROWBAR_HIT_5", "AUDIO.COMBAT.CROWBAR_HIT_6", },
        onMiss = "AUDIO.COMBAT.CROWBAR_MISS",
        onCrit = { "AUDIO.COMBAT.CROWBAR_HIT_1", "AUDIO.COMBAT.CROWBAR_HIT_2", "AUDIO.COMBAT.CROWBAR_HIT_3", "AUDIO.COMBAT.CROWBAR_HIT_4", "AUDIO.COMBAT.CROWBAR_HIT_5", "AUDIO.COMBAT.CROWBAR_HIT_6", },
    },
    damageTypes =
    {
        blunt = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Crowbar",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Crowbar",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Crowbar",
},

--[[------------------------------------------------------------------------------
Crowbar Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_CROWBAR = -- Common Crowbar
{
    _includes = {"MELEE_03", "WEAPON_STATS.MELEE_22"},
},

UNCOMMON_MELEE_CROWBAR = -- Uncommon Crowbar
{
    _includes = {"MELEE_03"},
},

RARE_MELEE_CROWBAR = -- Rare Crowbar
{
    _includes = {"MELEE_03", "WEAPON_STATS.MELEE_23"},
},

EPIC_MELEE_CROWBAR = -- Epic Crowbar
{
    _includes = {"MELEE_03", "WEAPON_STATS.MELEE_24"},
},


--[[------------------------------------------------------------------------------
Base Brass Police Baton
--------------------------------------------------------------------------------]]

MELEE_04 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_04"},
    imageCaption = "$Melee_04_WeaponImageCaption", --$ Police Baton
    inventoryTooltip = link{"WEAPON_STATS.MELEE_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.BATON_HIT_1", "AUDIO.COMBAT.BATON_HIT_2", "AUDIO.COMBAT.BATON_HIT_3", },
        onMiss = "AUDIO.COMBAT.BATON_MISS",
        onCrit = { "AUDIO.COMBAT.BATON_CRIT_1" },
    },
    damageTypes =
    {
        blunt = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_PoliceBaton",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_PoliceBaton",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_PoliceBaton",
},

--[[------------------------------------------------------------------------------
Police Baton Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_POLICE_BATON = -- Common Police Baton
{
    _includes = {"MELEE_04", "WEAPON_STATS.MELEE_25"},
},

UNCOMMON_MELEE_POLICE_BATON = -- Uncommon Police Baton
{
    _includes = {"MELEE_04", "WEAPON_STATS.MELEE_26"},
},

RARE_MELEE_POLICE_BATON = -- Rare Police Baton
{
    _includes = {"MELEE_04"},
},

EPIC_MELEE_POLICE_BATON = -- Epic Police Baton
{
    _includes = {"MELEE_04", "WEAPON_STATS.MELEE_27"},
},


--[[------------------------------------------------------------------------------
Base Cut Throat Razor
--------------------------------------------------------------------------------]]

MELEE_05 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_05"},
    imageCaption = "$Melee_05_WeaponImageCaption", --$ Cut Throat Razor
    inventoryTooltip = link{"WEAPON_STATS.MELEE_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.KNIFE_HIT",
        onCrit = "AUDIO.COMBAT.KNIFE_CRIT",
        onMiss = "AUDIO.COMBAT.KNIFE_MISS",
        onKill = "AUDIO.COMBAT.KNIFE_KILL",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_CutThroatRazor",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_CutThroatRazor",
    receiverAnimation_Die = "Receiver_Melee_Knife_Die",
    receiverAnimation_Live = "Receiver_Melee_Knife_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_CutThroatRazor",
},

--[[------------------------------------------------------------------------------
Cut Throat Razor Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_RAZOR = -- Common Cut Throat Razor
{
    _includes = {"MELEE_05", "WEAPON_STATS.MELEE_28"},
},

UNCOMMON_MELEE_RAZOR = -- Uncommon Cut Throat Razor
{
    _includes = {"MELEE_05", "WEAPON_STATS.MELEE_29"},
},

RARE_MELEE_RAZOR = -- Rare Cut Throat Razor
{
    _includes = {"MELEE_05"},
},

EPIC_MELEE_RAZOR = -- Epic Cut Throat Razor
{
    _includes = {"MELEE_05", "WEAPON_STATS.MELEE_30"},
},


--[[------------------------------------------------------------------------------
Base Lead Pipe
--------------------------------------------------------------------------------]]

MELEE_06 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_06"},
    imageCaption = "$Melee_06_WeaponImageCaption", --$ Lead Pipe
    inventoryTooltip = link{"WEAPON_STATS.MELEE_06", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.NAILBAT_HIT_1", "AUDIO.COMBAT.NAILBAT_HIT_2", },
        onCrit = { "AUDIO.COMBAT.NAILBAT_CRIT_1" },
        onMiss = { "AUDIO.COMBAT.NAILBAT_MISS" },
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_LeadPipe",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_LeadPipe",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_LeadPipe",
},

--[[------------------------------------------------------------------------------
Lead Pipe Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_LEAD_PIPE = -- Common Lead Pipe
{
    _includes = {"MELEE_06", "WEAPON_STATS.MELEE_31"},
},

UNCOMMON_MELEE_LEAD_PIPE = -- Uncommon Lead Pipe
{
    _includes = {"MELEE_06"},
},

RARE_MELEE_LEAD_PIPE = -- Rare Lead Pipe
{
    _includes = {"MELEE_06", "WEAPON_STATS.MELEE_32"},
},

EPIC_MELEE_LEAD_PIPE = -- Epic Lead Pipe
{
    _includes = {"MELEE_06", "WEAPON_STATS.MELEE_33"},
},


--[[------------------------------------------------------------------------------
Base Bowie Knife
--------------------------------------------------------------------------------]]

MELEE_07 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_07"},
    imageCaption = "$Melee_07_WeaponImageCaption", --$ Bowie Knife
    inventoryTooltip = link{"WEAPON_STATS.MELEE_07", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.KNIFE_HIT",
        onCrit = "AUDIO.COMBAT.KNIFE_CRIT",
        onMiss = "AUDIO.COMBAT.KNIFE_MISS",
        onKill = "AUDIO.COMBAT.KNIFE_KILL",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BowieKnife",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BowieKnife",
    receiverAnimation_Die = "Receiver_Melee_Knife_Die",
    receiverAnimation_Live = "Receiver_Melee_Knife_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_BowieKnife",
},

--[[------------------------------------------------------------------------------
Bowie Knife Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_BOWIE_KNIFE = -- Common Bowie Knife
{
    _includes = {"MELEE_07", "WEAPON_STATS.MELEE_34"},
},

UNCOMMON_MELEE_BOWIE_KNIFE = -- Uncommon Bowie Knife
{
    _includes = {"MELEE_07", "WEAPON_STATS.MELEE_35"},
},

RARE_MELEE_BOWIE_KNIFE = -- Rare Bowie Knife
{
    _includes = {"MELEE_07"},
},

EPIC_MELEE_BOWIE_KNIFE = -- Epic Bowie Knife
{
    _includes = {"MELEE_07", "WEAPON_STATS.MELEE_36"},
},


--[[------------------------------------------------------------------------------
Base Meat Cleaver
--------------------------------------------------------------------------------]]

MELEE_08 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_08"},
    imageCaption = "$Melee_08_WeaponImageCaption", --$ Meat Cleaver
    inventoryTooltip = link{"WEAPON_STATS.MELEE_08", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.CLEAVER_HIT_1", "AUDIO.COMBAT.CLEAVER_HIT_2", },
        onCrit = { "AUDIO.COMBAT.CLEAVER_CRIT_1" },
        onMiss = "AUDIO.COMBAT.CLEAVER_MISS",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_MeatCleaver",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_MeatCleaver",
    receiverAnimation_Die = "Machete_Receive",
    receiverAnimation_Live = "Machete_Receive",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_MeatCleaver",
},

--[[------------------------------------------------------------------------------
Meat Cleaver Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_MEAT_CLEAVER = -- Common Meat Cleaver
{
    _includes = {"MELEE_08", "WEAPON_STATS.MELEE_37"},
},

UNCOMMON_MELEE_MEAT_CLEAVER = -- Uncommon Meat Cleaver
{
    _includes = {"MELEE_08", "WEAPON_STATS.MELEE_38"},
},

RARE_MELEE_MEAT_CLEAVER = -- Rare Meat Cleaver
{
    _includes = {"MELEE_08"},
},

EPIC_MELEE_MEAT_CLEAVER = -- Epic Meat Cleaver
{
    _includes = {"MELEE_08", "WEAPON_STATS.MELEE_39"},
},


--[[------------------------------------------------------------------------------
Base Sledgehammer
--------------------------------------------------------------------------------]]

MELEE_09 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_09"},
    imageCaption = "$Melee_09_WeaponImageCaption", --$ Sledgehammer
    inventoryTooltip = link{"WEAPON_STATS.MELEE_09", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.SLEDGEHAMMER_HIT_1", "AUDIO.COMBAT.SLEDGEHAMMER_HIT_2", "AUDIO.COMBAT.SLEDGEHAMMER_HIT_3", "AUDIO.COMBAT.SLEDGEHAMMER_HIT_4",
                    "AUDIO.COMBAT.SLEDGEHAMMER_HIT_5", "AUDIO.COMBAT.SLEDGEHAMMER_HIT_6", },
        onCrit = "AUDIO.COMBAT.SLEDGEHAMMER_CRIT",
        onMiss = "AUDIO.COMBAT.SLEDGEHAMMER_MISS",
        onKill = "AUDIO.COMBAT.SLEDGEHAMMER_KILL",
    },
    damageTypes =
    {
        sledgehammer = true
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Sledgehammer",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Sledgehammer",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "SledgeHammer_Swing_Receive",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Sledgehammer",
},

--[[------------------------------------------------------------------------------
Sledgehammer Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_SLEDGEHAMMER = -- Common Sledgehammer
{
    _includes = {"MELEE_09", "WEAPON_STATS.MELEE_40"},
},

UNCOMMON_MELEE_SLEDGEHAMMER = -- Uncommon Sledgehammer
{
    _includes = {"MELEE_09", "WEAPON_STATS.MELEE_41"},
},

RARE_MELEE_SLEDGEHAMMER = -- Rare Sledgehammer
{
    _includes = {"MELEE_09", "WEAPON_STATS.MELEE_42"},
},

EPIC_MELEE_SLEDGEHAMMER = -- Epic Sledgehammer
{
    _includes = {"MELEE_09"},
},

--[[------------------------------------------------------------------------------
Base Machete
--------------------------------------------------------------------------------]]

MELEE_10 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_10"},
    imageCaption = "$Melee_10_WeaponImageCaption", --$ Machete
    inventoryTooltip = link{"WEAPON_STATS.MELEE_10", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.CLEAVER_HIT_1", "AUDIO.COMBAT.CLEAVER_HIT_2", },
        onCrit = { "AUDIO.COMBAT.CLEAVER_CRIT_1" },
        onMiss = "AUDIO.COMBAT.CLEAVER_MISS",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Machete",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Machete",
    receiverAnimation_Die = "Receiver_Melee_Knife_Die",
    receiverAnimation_Live = "Machete_Receive",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Machete",
},

--[[------------------------------------------------------------------------------
Machete Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_MACHETE = -- Common Machete
{
    _includes = {"MELEE_10", "WEAPON_STATS.MELEE_43"},
},

UNCOMMON_MELEE_MACHETE = -- Uncommon Machete
{
    _includes = {"MELEE_10", "WEAPON_STATS.MELEE_44"},
},

RARE_MELEE_MACHETE = -- Rare Machete
{
    _includes = {"MELEE_10", "WEAPON_STATS.MELEE_45"},
},

EPIC_MELEE_MACHETE = -- Epic Machete
{
    _includes = {"MELEE_10"},
},

--[[------------------------------------------------------------------------------
Base Baseball Bat
--------------------------------------------------------------------------------]]

MELEE_11 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_11"},
    imageCaption = "$Melee_11_WeaponImageCaption", --$ Baseball Bat
    inventoryTooltip = link{"WEAPON_STATS.MELEE_11", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.NAILBAT_HIT_1", "AUDIO.COMBAT.NAILBAT_HIT_2", "AUDIO.COMBAT.NAILBAT_HIT_3" },
        onCrit = { "AUDIO.COMBAT.NAILBAT_CRIT_1" },
        onMiss = "AUDIO.COMBAT.NAILBAT_MISS",
    },
    damageTypes =
    {
        blunt = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BaseballBat",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BaseballBat",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_BaseballBat",
},

--[[------------------------------------------------------------------------------
Baseball Bat Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_BASEBALL_BAT = -- Common Baseball Bat
{
    _includes = {"MELEE_11", "WEAPON_STATS.MELEE_46"},
},

UNCOMMON_MELEE_BASEBALL_BAT = -- Uncommon Baseball Bat
{
    _includes = {"MELEE_11"},
},

RARE_MELEE_BASEBALL_BAT = -- Rare Baseball Bat
{
    _includes = {"MELEE_11", "WEAPON_STATS.MELEE_47"},
},

EPIC_MELEE_BASEBALL_BAT = -- Epic Baseball Bat
{
    _includes = {"MELEE_11", "WEAPON_STATS.MELEE_48"},
},

--[[------------------------------------------------------------------------------
Base Nail Bat
--------------------------------------------------------------------------------]]

MELEE_12 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_12"},
    imageCaption = "$Melee_12_WeaponImageCaption", --$ Nail Bat
    inventoryTooltip = link{"WEAPON_STATS.MELEE_12", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.NAILBAT_HIT_1", "AUDIO.COMBAT.NAILBAT_HIT_2", "AUDIO.COMBAT.NAILBAT_HIT_3" },
        onCrit = { "AUDIO.COMBAT.NAILBAT_CRIT_1" },
        onMiss = "AUDIO.COMBAT.NAILBAT_MISS",
    },
    damageTypes =
    {
        blunt = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_NailBat",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_NailBat",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_NailBat",
},

--[[------------------------------------------------------------------------------
Nail Bat Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_NAIL_BAT = -- Common Nail Bat
{
    _includes = {"MELEE_12", "WEAPON_STATS.MELEE_49"},
},

UNCOMMON_MELEE_NAIL_BAT = -- Uncommon Nail Bat
{
    _includes = {"MELEE_12", "WEAPON_STATS.MELEE_50"},
},

RARE_MELEE_NAIL_BAT = -- Rare Nail Bat
{
    _includes = {"MELEE_12"},
},

EPIC_MELEE_NAIL_BAT = -- Epic Nail Bat
{
    _includes = {"MELEE_12", "WEAPON_STATS.MELEE_51"},
},

--[[------------------------------------------------------------------------------
Base Trench Knife
--------------------------------------------------------------------------------]]

MELEE_13 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_13"},
    imageCaption = "$Melee_13_WeaponImageCaption", --$ Trench Knife
    inventoryTooltip = link{"WEAPON_STATS.MELEE_13", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.KNIFE_HIT",
        onCrit = "AUDIO.COMBAT.KNIFE_CRIT",
        onMiss = "AUDIO.COMBAT.KNIFE_MISS",
        onKill = "AUDIO.COMBAT.KNIFE_KILL",
},
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_TrenchKnife",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_TrenchKnife",
    receiverAnimation_Die = "Receiver_Melee_Knife_Die",
    receiverAnimation_Live = "Receiver_Melee_Knife_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_TrenchKnife",
},

--[[------------------------------------------------------------------------------
Trench Knife Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_TRENCH_KNIFE = -- Common Trench Knife
{
    _includes = {"MELEE_13", "WEAPON_STATS.MELEE_52"},
},

UNCOMMON_MELEE_TRENCH_KNIFE = -- Uncommon Trench Knife
{
    _includes = {"MELEE_13", "WEAPON_STATS.MELEE_53"},
},

RARE_MELEE_TRENCH_KNIFE = -- Rare Trench Knife
{
    _includes = {"MELEE_13", "WEAPON_STATS.MELEE_54"},
},

EPIC_MELEE_TRENCH_KNIFE = -- Epic Trench Knife
{
    _includes = {"MELEE_13"},
},

--[[------------------------------------------------------------------------------
Base Axe
--------------------------------------------------------------------------------]]

MELEE_14 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_14"},
    imageCaption = "$Melee_14_WeaponImageCaption", --$ Axe
    inventoryTooltip = link{"WEAPON_STATS.MELEE_14", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.AXE_HIT_1", "AUDIO.COMBAT.AXE_HIT_2", },
        onCrit = "AUDIO.COMBAT.AXE_CRIT_1",
        onMiss = "AUDIO.COMBAT.AXE_MISS",
    },
    damageTypes =
    {
        blade = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Axe",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Axe",
    receiverAnimation_Die = "Machete_Receive",
    receiverAnimation_Live = "Machete_Receive",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Axe",
},

--[[------------------------------------------------------------------------------
Axe Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_AXE = -- Common Axe
{
    _includes = {"MELEE_14", "WEAPON_STATS.MELEE_55"},
},

UNCOMMON_MELEE_AXE = -- Uncommon Axe
{
    _includes = {"MELEE_14", "WEAPON_STATS.MELEE_56"},
},

RARE_MELEE_AXE = -- Rare Axe
{
    _includes = {"MELEE_14"},
},

EPIC_MELEE_AXE = -- Epic Axe
{
    _includes = {"MELEE_14", "WEAPON_STATS.MELEE_57"},
},

--[[------------------------------------------------------------------------------
Base Hammer
--------------------------------------------------------------------------------]]

MELEE_15 =
{
    _includes = {"MELEE", "WEAPON_STATS.MELEE_15"},
    imageCaption = "$Melee_15_WeaponImageCaption", --$ Hammer
    inventoryTooltip = link{"WEAPON_STATS.MELEE_15", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.HAMMER_HIT_1", "AUDIO.COMBAT.HAMMER_HIT_2", },
        onCrit = { "AUDIO.COMBAT.HAMMER_CRIT_1" },
        onMiss = "AUDIO.COMBAT.HAMMER_MISS",
    },
    damageTypes =
    {
        blunt = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Hammer",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Hammer",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Machete_Receive",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Hammer",
},

--[[------------------------------------------------------------------------------
Hammer Rarities
--------------------------------------------------------------------------------]]

COMMON_MELEE_HAMMER = -- Common Hammer
{
    _includes = {"MELEE_15", "WEAPON_STATS.MELEE_58"},
},

UNCOMMON_MELEE_HAMMER = -- Uncommon Hammer
{
    _includes = {"MELEE_15"},
},

RARE_MELEE_HAMMER = -- Rare Hammer
{
    _includes = {"MELEE_15", "WEAPON_STATS.MELEE_59"},
},

EPIC_MELEE_HAMMER = -- Epic Hammer
{
    _includes = {"MELEE_15", "WEAPON_STATS.MELEE_60"},
},

--[[------------------------------------------------------------------------------
EXPLOSIVES
--------------------------------------------------------------------------------]]

EXPLOSIVE_01 =
    {
        _includes = {"EXPLOSIVE_2", "WEAPON_STATS.EXPLOSIVE_01"},
        imageCaption = "$EXPLOSIVE_01_WeaponImageCaption", --$ MK2 Grenade
        hudIcon = "Sprites/Icons/Actions/Icon_MK2Grenade",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_MK2Grenade",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_01", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_MK2Grenade",
    },

EXPLOSIVE_02 =
    {
        _includes = {"EXPLOSIVE_2", "WEAPON_STATS.EXPLOSIVE_02"},
        imageCaption = "$EXPLOSIVE_02_WeaponImageCaption", --$ M17 Stielhandgranate
        hudIcon = "Sprites/Icons/Actions/Icon_Stielhandgranate1917",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_Stielhandgranate1917",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_02", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_Stielhandgranate1917",
    },

EXPLOSIVE_03 =
    {
        _includes = {"EXPLOSIVE_1", "WEAPON_STATS.EXPLOSIVE_03"},
        imageCaption = "$EXPLOSIVE_03_WeaponImageCaption", --$ Dynamite Stick
        hudIcon = "Sprites/Icons/Actions/Icon_Dynamite",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_Dynamite",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_03", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_Dynamite",
    },

EXPLOSIVE_04 =
    {
        _includes = {"EXPLOSIVE_2", "WEAPON_STATS.EXPLOSIVE_04"},
        imageCaption = "$EXPLOSIVE_04_WeaponImageCaption", --$ Dynamite Bundle
        hudIcon = "Sprites/Icons/Actions/Icon_DynamiteBundle",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_DynamiteBundle",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_04", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_DynamiteBundle",
    },

EXPLOSIVE_05 =
    {
        _includes = {"EXPLOSIVE_3", "WEAPON_STATS.EXPLOSIVE_05"},
        imageCaption = "$EXPLOSIVE_05_WeaponImageCaption", --$ Dynamite Stack
        hudIcon = "Sprites/Icons/Actions/Icon_DynamiteStack",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_DynamiteStack",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_05", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_DynamiteStack",
    },

EXPLOSIVE_06 =
    {
        _includes = {"EXPLOSIVE_1", "WEAPON_STATS.EXPLOSIVE_06"},
        imageCaption = "$EXPLOSIVE_06_WeaponImageCaption", --$ Stender Grenade
        hudIcon = "Sprites/Icons/Actions/Icon_StenderGrenade",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_StenderGrenade",
        inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_06", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_StenderGrenade",
    },


EXPLOSIVE_07 =
{
    _includes = {"EXPLOSIVE_1", "WEAPON_STATS.EXPLOSIVE_07"},
    imageCaption = "$EXPLOSIVE_07_WeaponImageCaption", --$ Mills Bomb
    hudIcon = "Sprites/Icons/Actions/Icon_MillsBomb",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_MillsBomb",
    inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_07", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_MillsBomb",
},

EXPLOSIVE_08 =
{
    _includes = {"EXPLOSIVE_1", "WEAPON_STATS.EXPLOSIVE_08"},
    imageCaption = "$EXPLOSIVE_08_WeaponImageCaption", --$ Discus Grenade
    hudIcon = "Sprites/Icons/Actions/Icon_DiscusGrenade",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_DiscusGrenade",
    inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_08", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_DiscusGrenade",
},

EXPLOSIVE_09 =
{
    _includes = {"EXPLOSIVE_1", "WEAPON_STATS.EXPLOSIVE_09"},
    imageCaption = "$EXPLOSIVE_09_WeaponImageCaption", --$ F1 Grenade
    hudIcon = "Sprites/Icons/Actions/Icon_F1Grenade",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_F1Grenade",
    inventoryTooltip = link{"WEAPON_STATS.EXPLOSIVE_09", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_F1Grenade",
},

--[[------------------------------------------------------------------------------
THROWN WEAPONS
--------------------------------------------------------------------------------]]

THROWN_01 =
    {
        _includes = {"THROWN", "WEAPON_STATS.THROWN_01"},
        damageTypes =
        {
            blade = true,
        },
        imageCaption = "$THROWN_01_WeaponImageCaption", --$ Throwing Knife
        hudIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Knife",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Thrown_Knife",
        inventoryTooltip = link{"WEAPON_STATS.THROWN_01", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Knife",
        combatAbility = "KnifeThrow",
        trailEffect = "EFFECTS.TRACERS.KNIFE",
    },

THROWN_02 =
    {
        damageTypes =
        {
            blade = true,
        },
        _includes = {"THROWN", "WEAPON_STATS.THROWN_02"},
        imageCaption = "$THROWN_02_WeaponImageCaption", --$ Throwing Axe
        hudIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Axe",
        prefab = "Models/Items/Weapons/Prefabs/Weapon_Thrown_Axe",
        inventoryTooltip = link{"WEAPON_STATS.THROWN_02", "desc"},
        inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Axe",
        combatAbility = "AxeThrow",
        trailEffect = "EFFECTS.TRACERS.AXE",
    },

--[[------------------------------------------------------------------------------
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

UNBREAKABLE WEAPONS

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--------------------------------------------------------------------------------]]

UNBREAKABLE_WEAPON =
{
    abilities =
    {
        ItemDurability = false
    }
},

--[[------------------------------------------------------------------------------
LEGENDARY ZIP GUN
--------------------------------------------------------------------------------]]

LEGENDARY_ZIPGUN_01 = -- Golden Zip Gun
{
    _includes = {"BASE_ZIPGUN_01", "WEAPON_STATS.LEGENDARY_ZIPGUN_01", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Zipgun_01_WeaponImageCaption", --$ Golden Zip Gun
    inventoryTooltip = link{"WEAPON_STATS.UNCOMMON_ZIPGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_ZIPGUN_01",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_ZipGun",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_ZipGun",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_ZipGun",
},

--[[------------------------------------------------------------------------------
LEGENDARY HANDGUNS
--------------------------------------------------------------------------------]]
LEGENDARY_HANDGUN_05 = -- Golden Mauser C96
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.LEGENDARY_HANDGUN_05", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Handgun_05_WeaponImageCaption",  --$Golden Mauser C96
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_HANDGUN_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_HANDGUN_05",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_MauserC96_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_MauserC96_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_MauserC96_Legendary",
},

LEGENDARY_HANDGUN_06 = -- Golden Service Revolver
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.LEGENDARY_HANDGUN_06", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Handgun_06_WeaponImageCaption",  --$ Golden Service Revolver
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_HANDGUN_06", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_HANDGUN_06",
        onReload = "AUDIO.COMBAT.PISTOL_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultNewService_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_CultNewService_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_CultNewService_Legendary",
},

--[[------------------------------------------------------------------------------
LEGENDARY SHOTGUNS
--------------------------------------------------------------------------------]]

LEGENDARY_SHOTGUN_01 = -- Golden Short Barreled Shotgun
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.LEGENDARY_SHOTGUN_01", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Shotgun_01_WeaponImageCaption", --$ Golden Short Barreled Shotgun
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_SHOTGUN_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_SHOTGUN_01",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_ShortBarreled_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_ShortBarreled_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_ShortBarreled_Legendary",
},

LEGENDARY_SHOTGUN_03 = -- Golden Auto-5 Shotgun
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.LEGENDARY_SHOTGUN_03", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Shotgun_03_WeaponImageCaption", --$ Golden Auto-5 Shotgun
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_SHOTGUN_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_SHOTGUN_03",
        onReload = "AUDIO.COMBAT.SHOTGUN_RELOAD",
    },
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_BrownAuto5_Legendary",
},

--[[------------------------------------------------------------------------------
LEGENDARY SUBGUNS
--------------------------------------------------------------------------------]]

LEGENDARY_SUBGUN_01 = -- Golden Tommy Gun
{
    _includes = {"SUBMACHINE_GUN", "WEAPON_STATS.LEGENDARY_SUBGUN_01", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Subgun_01_WeaponImageCaption", --$ Golden Tommy Gun
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_SUBGUN_01", "desc"},
    validForAITrade = true,
    -- AUDIO ELEMENTS
    audio =
    {
        onFire      = "AUDIO.COMBAT.GOLDEN_TOMMY_GUN",
        onBurstFire = "AUDIO.COMBAT.GOLDEN_TOMMY_GUN",
        onReload    = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
        onSuppress  = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
    },
    damageTypes =
    {
        tommyGun = true,
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_Thompson1921AC_Legendary",
},

--[[------------------------------------------------------------------------------
LEGENDARY RIFLES
--------------------------------------------------------------------------------]]

LEGENDARY_RIFLE_04 = -- Golden Gewehr 98
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.LEGENDARY_RIFLE_04", "UNBREAKABLE_WEAPON"},
    imageCaption = "$Legendary_Rifle_04_WeaponImageCaption", --$ Golden Gewehr 98
    inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_RIFLE_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = "AUDIO.COMBAT.LEGENDARY_RIFLE_04",
        onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Gewehr98_Legendary",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Gewehr98_Legendary",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Gewehr98_Legendary",
},

--[[------------------------------------------------------------------------------
LEGENDARY SNIPER
--------------------------------------------------------------------------------]]

LEGENDARY_SNIPER_06 = -- Golden Mosin–Nagant
{
     _includes = {"BASE_SNIPER_06", "WEAPON_STATS.LEGENDARY_SNIPER_06", "UNBREAKABLE_WEAPON"},
     imageCaption = "$Legendary_Sniper_06_WeaponImageCaption", --$ Golden Mosin–Nagant
     inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_SNIPER_06", "desc"},
     -- AUDIO ELEMENTS
     audio =
     {
         onFire = "AUDIO.COMBAT.LEGENDARY_SNIPER_06",
         onReload = "AUDIO.COMBAT.RIFLE_RELOAD",
     },
     -- VISUAL ELEMENTS
     hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_MosinM91_Legendary",
     inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_MosinM91_Legendary",
     prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_MosinM91_Legendary",
},

--[[------------------------------------------------------------------------------
LEGENDARY MACHINEGUNS
--------------------------------------------------------------------------------]]

LEGENDARY_MACHINEGUN_03 = -- Golden Lewis Gun
{
     _includes = {"BASE_MACHINEGUN_03", "WEAPON_STATS.LEGENDARY_MACHINEGUN_03", "UNBREAKABLE_WEAPON"},
     imageCaption = "$Legendary_Machinegun_03_WeaponImageCaption", --$ Golden Lewis Gun
     inventoryTooltip = link{"WEAPON_STATS.LEGENDARY_MACHINEGUN_03", "desc"},
     -- AUDIO ELEMENTS
     audio =
     {
         onFire = "AUDIO.COMBAT.LEGENDARY_MACHINEGUN_03",
         onBurstFire = "AUDIO.COMBAT.LEGENDARY_MACHINEGUN_03",
         onReload = "AUDIO.COMBAT.TOMMY_GUN_RELOAD",
         onSuppress = "AUDIO.COMBAT.THOMPSON_SUPPRESSION",
     },
     -- VISUAL ELEMENTS
     hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_LewisGun_Legendary",
     inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_LewisGun_Legendary",
     prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_LewisGun_Legendary",
},

--[[------------------------------------------------------------------------------
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

UNIQUE ABILITY/BOSS WEAPONS

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--------------------------------------------------------------------------------]]

UNIQUE_PROFESSION_01 = -- Meat Hook
{
    _includes = {"MELEE", "WEAPON_STATS.UNIQUE_PROFESSION_01"},
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_PROFESSION_01", "desc"},
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_MeatHookChain_Handle",
},

UNIQUE_PROFESSION_02 = -- Amputation Blade
{
    _includes = {"MELEE", "WEAPON_STATS.UNIQUE_PROFESSION_02"},
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_PROFESSION_02", "desc"},
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_AmputationKnife",
},

UNIQUE_BOSS_01 = -- Maggie Dyer Whip
{
    _includes = {"MELEE", "WEAPON_STATS.UNIQUE_BOSS_01", "UNBREAKABLE_WEAPON"},

    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_LionTamerWhip_Handle",
    receiverAnimation_Die = "Receiver_Melee_Fists_Die",
    receiverAnimation_Live = "Receiver_Melee_Fists_Live",
},

UNIQUE_BOSS_02 = -- Angelo Genna's Throwing Knife
{
    _includes = {"THROWN", "WEAPON_STATS.UNIQUE_BOSS_02", "UNBREAKABLE_WEAPON"},
    damageTypes =
    {
        blade = true,
    },
    imageCaption = "$WEAPON_STATS_UNIQUE_BOSS_02_name",
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Knife",
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_BOSS_02", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Thrown_Knife",
    trailEffect = "EFFECTS.TRACERS.FAN_OF_KNIVES",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Thrown_FanOfKnives",
},

UNIQUE_BOSS_03 = -- Daniel McKee Jackson's Pistol
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.UNIQUE_BOSS_03", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_04 = -- Capone's Tommy Gun
{
    _includes = {"BASE_SUBGUN_02", "WEAPON_STATS.UNIQUE_BOSS_04", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_05 = -- Dean O'Banion's Sawn off shotgun
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.UNIQUE_BOSS_05", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_06 = -- Ragen's Baseball bat
{
    _includes = {"MELEE_11", "WEAPON_STATS.UNIQUE_BOSS_06","UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
    imageCaption = "$UNIQUE_BOSS_06_WeaponImageCaption", --$ Skull Crusher
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_BOSS_06", "desc"},

    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BarbedWireBat",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_BarbedWireBat",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_BarbedWireBat",
},

UNIQUE_BOSS_07 = -- Goldie's Sniper
{
    _includes = {"BASE_SNIPER_02", "WEAPON_STATS.UNIQUE_BOSS_07", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_075 = -- Goldie's Sniper (Mod)
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.UNIQUE_BOSS_075", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_08 = -- Death Blossom Bomb
{
    _includes = {"EXPLOSIVE", "WEAPON_STATS.UNIQUE_BOSS_08", "UNBREAKABLE_WEAPON"},
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_DeathBlossom",
    shortThrowDistance = 0, -- Don't do a short throw.
},

UNIQUE_BOSS_09 = -- Mabel's Rifle
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.UNIQUE_BOSS_09", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_095 = -- Mabel's Rifle (Modded)
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.UNIQUE_BOSS_095", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_10 = -- Salazar's Revolvers
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.UNIQUE_BOSS_10", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_11 = -- Saltis Stampede
{
    _includes = {"DEFAULT_FISTS", "WEAPON_STATS.UNIQUE_BOSS_11", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_12 = -- Dean O'Banion's Explosive Shotgun Round
{
    _includes = {"EXPLOSIVE", "WEAPON_STATS.UNIQUE_BOSS_12", "UNBREAKABLE_WEAPON"},
},

UNIQUE_BOSS_13 =
{
    _includes = {"MELEE","WEAPON_STATS.UNIQUE_BOSS_13","UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
    imageCaption = "$UNIQUE_BOSS_13_WeaponImageCaption", --$ Mo Chara Beag
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_BOSS_13", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire1 = "AUDIO.COMBAT.ABILITY_HURLEY_FURY_HIT_1",
        onFire2 = "AUDIO.COMBAT.ABILITY_HURLEY_FURY_HIT_2",
        onFire3 = "AUDIO.COMBAT.ABILITY_HURLEY_FURY_HIT_3",
        onMiss = "AUDIO.COMBAT.ABILITY_HURLEY_FURY_MISS",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Hurley",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Melee_Hurley",
    receiverAnimation_Die = "Receiver_Melee_Blunt_Die",
    receiverAnimation_Live = "Receiver_Melee_Blunt_Live",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Melee_Hurley",
},


UNIQUE_EXPLOSIVE_01 =
{
    _includes = {"EXPLOSIVE_4", "WEAPON_STATS.UNIQUE_EXPLOSIVE_01"},
    imageCaption = "$UNIQUE_EXPLOSIVE_01_WeaponImageCaption", --$ Shrapnel Bomb
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_ShrapnelBomb",
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_EXPLOSIVE_01", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_ShrapnelBomb",
    combatAbility = "SatchelCharge",
},

UNIQUE_EXPLOSIVE_02 =
{
    _includes = {"EXPLOSIVE_2", "WEAPON_STATS.UNIQUE_EXPLOSIVE_02"},
    imageCaption = "$UNIQUE_EXPLOSIVE_02_WeaponImageCaption", --$ Time Bomb
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_DynamiteBundle", -- Placeholder
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_Timebomb",
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_EXPLOSIVE_02", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_DynamiteBundle", -- Placeholder
    combatAbility = "TimeBomb",
},

UNIQUE_EXPLOSIVE_03 =
{
    _includes = {"EXPLOSIVE_1", "WEAPON_STATS.UNIQUE_EXPLOSIVE_03"},
    imageCaption = "$UNIQUE_EXPLOSIVE_03_WeaponImageCaption", --$ Cluster Grenade
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_StenderGrenade_Small", -- Placeholder
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Explosive_ClusterGrenade",
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_EXPLOSIVE_03", "desc"},
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Explosive_StenderGrenade_Small",
    combatAbility = "ClusterGrenade",
},
--[[------------------------------------------------------------------------------
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

POLICE ISSUE WEAPONS

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
POLICE HANDGUN
--------------------------------------------------------------------------------]]

LAW_HANDGUN_01 = -- Police Issue .38 Revolver
{
    _includes = {"BASE_HANDGUN_01","WEAPON_STATS.LAW_HANDGUN_01"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_SW38_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_SW38_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_SW38_Police",
},

LAW_HANDGUN_02 = -- Police Issue M1911 Pistol
{
    _includes = {"BASE_HANDGUN_03","WEAPON_STATS.LAW_HANDGUN_02"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Cult1911_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_Cult1911_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_Cult1911_Police",
},

--[[------------------------------------------------------------------------------
POLICE SHOTGUN
--------------------------------------------------------------------------------]]

LAW_SHOTGUN_01 = -- Police Issue Model 10 Shotgun
{
    _includes = {"BASE_SHOTGUN_02","WEAPON_STATS.LAW_SHOTGUN_01"},
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Remmy10_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_Remmy10_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_Remmy10_Police",
},

LAW_SHOTGUN_02 = -- Police Issue Auto-5 Shotgun
{
    _includes = {"BASE_SHOTGUN_03","WEAPON_STATS.LAW_SHOTGUN_02"},
     -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_BrownAuto5_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_BrownAuto5_Police",
},

--[[------------------------------------------------------------------------------
POLICE SUBGUN
--------------------------------------------------------------------------------]]

LAW_SUBGUN_01 = -- Police Issue M1921 Tommy Gun
{
    _includes = {"BASE_SUBGUN_01", "WEAPON_STATS.LAW_SUBGUN_01"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_SubmachineGun_Thompson1921AC_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_SubmachineGun_Thompson1921AC_Police",
},

--[[------------------------------------------------------------------------------
POLICE RIFLE
--------------------------------------------------------------------------------]]

LAW_RIFLE_01 = -- Police Issue Model 8 Rifle
{
    _includes = {"BASE_RIFLE_03","WEAPON_STATS.LAW_RIFLE_01"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Remmy8_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Remmy8_Extended",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Remmy8_Extended",
},

--[[------------------------------------------------------------------------------
POLICE SNIPER
--------------------------------------------------------------------------------]]

LAW_SNIPER_01 = -- Police Issue M1917 Enfield
{
    _includes = {"BASE_SNIPER_01", "WEAPON_STATS.LAW_SNIPER_01"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Enfield1917_Scope_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_Enfield1917_Scope_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_Enfield1917_Scope_Police",
},

--[[------------------------------------------------------------------------------
POLICE MACHINEGUN
--------------------------------------------------------------------------------]]

LAW_MACHINEGUN_01 = -- Police Issue BAR M1918
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.LAW_MACHINEGUN_01"},
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_BAR1918_Police",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_BAR1918_Police",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_BAR1918_Police",
},

--[[------------------------------------------------------------------------------
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

SPECIALIST WEAPONS

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
Max Gun 08/15
--------------------------------------------------------------------------------]]
UNIQUE_SPECIALIST_01 = -- Max Gun 08/15
{
    _includes = {"BASE_MACHINEGUN_01","WEAPON_STATS.UNIQUE_SPECIALIST_01"},
    mustDropAsLoot = true,
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_SPECIALIST_01", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.MAX_GUN_08_AUTO_1", "AUDIO.COMBAT.MAX_GUN_08_AUTO_2", "AUDIO.COMBAT.MAX_GUN_08_AUTO_3", "AUDIO.COMBAT.MAX_GUN_08_AUTO_4", },
        onBurstFire = { "AUDIO.COMBAT.MAX_GUN_08_AUTO_1", "AUDIO.COMBAT.MAX_GUN_08_AUTO_2", "AUDIO.COMBAT.MAX_GUN_08_AUTO_3", "AUDIO.COMBAT.MAX_GUN_08_AUTO_4", },
        onReload = "AUDIO.COMBAT.MAX_GUN_08_RELOAD",
        onSuppress = { "AUDIO.COMBAT.MAX_GUN_08_AUTO_1", "AUDIO.COMBAT.MAX_GUN_08_AUTO_2", "AUDIO.COMBAT.MAX_GUN_08_AUTO_3", "AUDIO.COMBAT.MAX_GUN_08_AUTO_4", },
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_MG0815",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_MachineGun_MG0815",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_MachineGun_MG0815",
},

--[[------------------------------------------------------------------------------
Far Hill Rifle
--------------------------------------------------------------------------------]]
UNIQUE_SPECIALIST_02 = -- Far Hill Rifle
{
    _includes = {"BASE_RIFLE_01","WEAPON_STATS.UNIQUE_SPECIALIST_02"},
    mustDropAsLoot = true,
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_SPECIALIST_02", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.FAR_HILL_RIFLE_SHOT_1", "AUDIO.COMBAT.FAR_HILL_RIFLE_SHOT_2", "AUDIO.COMBAT.FAR_HILL_RIFLE_SHOT_3", "AUDIO.COMBAT.FAR_HILL_RIFLE_SHOT_4", },
        onReload = "AUDIO.COMBAT.FAR_HILL_RIFLE_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_FarquharHillRifle",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Rifle_FarquharHillRifle",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Rifle_FarquharHillRifle",
},

--[[------------------------------------------------------------------------------
WL Trench Shotgun
--------------------------------------------------------------------------------]]
UNIQUE_SPECIALIST_03 = -- WL Trench Shotgun
{
    _includes = {"BASE_SHOTGUN_02","WEAPON_STATS.UNIQUE_SPECIALIST_03"},
    mustDropAsLoot = true,
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_SPECIALIST_03", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.WL_TRENCH_SHOTGUN_SHOT_1", "AUDIO.COMBAT.WL_TRENCH_SHOTGUN_SHOT_2", "AUDIO.COMBAT.WL_TRENCH_SHOTGUN_SHOT_3", "AUDIO.COMBAT.WL_TRENCH_SHOTGUN_SHOT_4", },
        onReload = "AUDIO.COMBAT.WL_TRENCH_SHOTGUN_RELOAD",
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_WinstonModel1897",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Shotgun_WinstonModel1897",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Shotgun_WinstonModel1897",
},

--[[------------------------------------------------------------------------------
LP08
--------------------------------------------------------------------------------]]
UNIQUE_SPECIALIST_04 = -- LP08
{
    _includes = {"BASE_HANDGUN_01","WEAPON_STATS.UNIQUE_SPECIALIST_04"},
    mustDropAsLoot = true,
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_SPECIALIST_04", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.LP08_PISTOL_SHOT_1", "AUDIO.COMBAT.LP08_PISTOL_SHOT_2", "AUDIO.COMBAT.LP08_PISTOL_SHOT_3", "AUDIO.COMBAT.LP08_PISTOL_SHOT_4", },
        onBurstFire = "AUDIO.COMBAT.LP08_PISTOL_BURST",
        onReload = { "AUDIO.COMBAT.LP08_PISTOL_RELOAD_1", "AUDIO.COMBAT.LP08_PISTOL_RELOAD_2", },
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_LugerP08",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_LugerP08",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_LugerP08",
    combatAbility = {"GeneralBurstFire", "PistolDoubleShot"},
},

--[[------------------------------------------------------------------------------
Dart Gun
--------------------------------------------------------------------------------]]
UNIQUE_SPECIALIST_05 = -- Dart Gun
{
    _includes = {"BASE_HANDGUN_01","WEAPON_STATS.UNIQUE_SPECIALIST_05"},
    mustDropAsLoot = true,
    inventoryTooltip = link{"WEAPON_STATS.UNIQUE_SPECIALIST_05", "desc"},
    -- AUDIO ELEMENTS
    audio =
    {
        onFire = { "AUDIO.COMBAT.DART_GUN_SHOT_1", "AUDIO.COMBAT.DART_GUN_SHOT_2", "AUDIO.COMBAT.DART_GUN_SHOT_3", "AUDIO.COMBAT.DART_GUN_SHOT_4", },
        onReload = { "AUDIO.COMBAT.DART_GUN_RELOAD_1", "AUDIO.COMBAT.DART_GUN_RELOAD_2", "AUDIO.COMBAT.DART_GUN_RELOAD_3", "AUDIO.COMBAT.DART_GUN_RELOAD_4", },
        onCantFire = "AUDIO.COMBAT.GUN_CANT_FIRE",
    },
    -- VISUAL ELEMENTS
    hudIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_TranquilizerGun",
    inventoryIcon = "Sprites/Images/Items/Weapons/Weapon_Handgun_TranquilizerGun",
    prefab = "Models/Items/Weapons/Prefabs/Weapon_Handgun_TranquilizerGun",
},

--[[------------------------------------------------------------------------------
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

UNIQUE MISSION REWARD WEAPONS

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--------------------------------------------------------------------------------]]

UNIQUE_MISSION_HANDGUN_01 = -- M1911 Pistol -- The Lawmaker
{
    _includes = {"BASE_HANDGUN_03", "WEAPON_STATS.UNIQUE_MISSION_HANDGUN_01"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_HANDGUN_02 = -- Model 1915 Pistol -- Bloodfury
{
    _includes = {"BASE_HANDGUN_04", "WEAPON_STATS.UNIQUE_MISSION_HANDGUN_02"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_HANDGUN_03 = -- Mauser C96 -- Placeholder
{
    _includes = {"BASE_HANDGUN_05", "WEAPON_STATS.UNIQUE_MISSION_HANDGUN_03"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_HANDGUN_04 = -- New Service Revolver -- Placeholder
{
    _includes = {"BASE_HANDGUN_06", "WEAPON_STATS.UNIQUE_MISSION_HANDGUN_04"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SHOTGUN_05 = -- Short-Barreled Shotgun -- Placeholder
{
    _includes = {"BASE_SHOTGUN_01", "WEAPON_STATS.UNIQUE_MISSION_SHOTGUN_05"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SHOTGUN_06 = -- Auto-5 Shotgun -- Placeholder
{
    _includes = {"BASE_SHOTGUN_03", "WEAPON_STATS.UNIQUE_MISSION_SHOTGUN_06"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SHOTGUN_07 = -- Sjögren Inertia -- Placeholder
{
    _includes = {"BASE_SHOTGUN_05", "WEAPON_STATS.UNIQUE_MISSION_SHOTGUN_07"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_RIFLE_08 = -- Model 1895 Rifle-- Placeholder
{
    _includes = {"BASE_RIFLE_02", "WEAPON_STATS.UNIQUE_MISSION_RIFLE_08"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_RIFLE_09 = -- Model 8 Rifle -- Placeholder
{
    _includes = {"BASE_RIFLE_03", "WEAPON_STATS.UNIQUE_MISSION_RIFLE_09"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_RIFLE_10 = -- Gewehr 98 -- Placeholder
{
    _includes = {"BASE_RIFLE_04", "WEAPON_STATS.UNIQUE_MISSION_RIFLE_10"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SUBGUN_11 = -- OVP 1918 -- Placeholder
{
    _includes = {"BASE_SUBGUN_03", "WEAPON_STATS.UNIQUE_MISSION_SUBGUN_11"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SUBGUN_12 = -- BM-1918 -- The Placeholder
{
    _includes = {"BASE_SUBGUN_05", "WEAPON_STATS.UNIQUE_MISSION_SUBGUN_12"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SNIPER_13 = -- SMLE Sniper Rifle -- Placeholder
{
    _includes = {"BASE_SNIPER_03", "WEAPON_STATS.UNIQUE_MISSION_SNIPER_13"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_SNIPER_14 = -- Mosin–Nagant -- Placeholder
{
    _includes = {"BASE_SNIPER_06", "WEAPON_STATS.UNIQUE_MISSION_SNIPER_14"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MACHINEGUN_15 = -- BAR M1918 -- The Brooklyn Handshake
{
    _includes = {"BASE_MACHINEGUN_01", "WEAPON_STATS.UNIQUE_MISSION_MACHINEGUN_15"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MACHINEGUN_16 = -- Madsen Machine Gun -- Street Sweeper
{
    _includes = {"BASE_MACHINEGUN_04", "WEAPON_STATS.UNIQUE_MISSION_MACHINEGUN_16"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MELEE_17 = -- Trench Knife -- Placeholder
{
    _includes = {"MELEE_13", "WEAPON_STATS.UNIQUE_MISSION_MELEE_17", "UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MELEE_18 = -- Machete -- Placeholder
{
    _includes = {"MELEE_10", "WEAPON_STATS.UNIQUE_MISSION_MELEE_18", "UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MELEE_19 = -- Police Baton -- Placeholder
{
    _includes = {"MELEE_04", "WEAPON_STATS.UNIQUE_MISSION_MELEE_19", "UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_MELEE_20 = -- Sledgehammer -- Placeholder
{
    _includes = {"MELEE_09", "WEAPON_STATS.UNIQUE_MISSION_MELEE_20", "UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
},

UNIQUE_MISSION_HANDGUN_21 = -- Smith & Wesson Model 1 1/2 -- Number Cruncher
{
    _includes = {"BASE_HANDGUN_02", "WEAPON_STATS.UNIQUE_MISSION_HANDGUN_21", "UNBREAKABLE_WEAPON"},
    mustDropAsLoot = true,
},


})
