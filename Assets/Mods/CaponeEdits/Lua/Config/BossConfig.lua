local ConfigBuilder = require("Libs.ConfigBuilder")

--[[------------------------------------------------------------------------------
BOSS BASE
--------------------------------------------------------------------------------]]

ConfigBuilder.define( "CHARACTER.BOSS",
{
    BASE =
    {
        _includes = { "CHARACTER.NON_COMBAT_BRAIN_BASE", "CHARACTER.COMBAT_BRAIN_BASE" },
        navigable =
        {
            priority = 25,
            avoidanceLevel = RomeroGames.Navigable.AvoidanceLevel.High,
        },
        tags =
        {
            Boss = true,
            OutlineWhenOccluded = true,
            CanCombat = true,
            RespondsToGlobalHighlight = true,
            HasPriorityAnimations = true,
        },
        profession = "Boss",

        commands =
        {
            Select = 200,
            Talk = 200,
            MoveTo = 190,
            RemoveFromSafehouse = 120,
            UseHealingItem01 = 100,
            UseHealingItem02 = 100,
            UseHealingItem03 = 100,
            UseDoctorHeal = 100,
            Attack = 100,
            AddToGroup = 70,
            RemoveFromGroup = 70,
            CharacterSheet = 10,
            LookAt = 1,
            TheyTalk = 1,
            TheyShout = 1,
        },
        skills =
        {
            INTIMIDATION = 65,
            MEDICAL = 75,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_DefaultTrade_Generous_text",
            great = "$DIPLOMACY_DefaultTrade_Great_text",
            good = "$DIPLOMACY_DefaultTrade_Good_text",
            neutral = "$DIPLOMACY_DefaultTrade_Neutral_text",
            poor = "$DIPLOMACY_DefaultTrade_Poor_text",
            bad = "$DIPLOMACY_DefaultTrade_Bad_text",
            terrible = "$DIPLOMACY_DefaultTrade_Terrible_text",
            greeting = "$DIPLOMACY_DefaultTrade_Greeting_text",
            offer = "$DIPLOMACY_DefaultTrade_Offer_text",
            request = "$DIPLOMACY_DefaultTrade_Request_text",
        },
        -- BASE BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.RAIN_OF_FIRE",

        startingNotoriety = 0,
    },

    BASE_MALE =
    {
        _includes = {"CHARACTER.BASE_MALE", "BASE"},
        audio =
        {
            onSelect = "AUDIO.CHARACTER.MAN_WHAT"
        },
    },

    BASE_FEMALE =
    {
        _includes = {"CHARACTER.BASE_FEMALE", "BASE"},
        audio =
        {
            onSelect = "AUDIO.CHARACTER.WOMAN_YEAH",
        },
    },

--[[------------------------------------------------------------------------------
RAGENCOLTS_BOSS - FRANK_RAGEN
--------------------------------------------------------------------------------]]
    RAGENCOLTS_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.RAGENCOLTS_BOSS",
            "BEHAVIOUR_DATA.RAGENCOLTS_BOSS",
            "INVENTORY_DATA.RAGENCOLTS_BOSS",
            "AUDIO.BOSSES.PACKS.RAGEN",
        },

        -- voiceover suffix
        voLabel = "RAGEN",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.HOME_RUN",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/FrankRagen_Profile",
        prefab = "Models/Characters/Cast/FrankRagen/Prefabs/FrankRagen",
        ragdollPrefab = "Models/Characters/Cast/FrankRagen/Prefabs/FrankRagen_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/FrankRagen/Prefabs/FrankRagen_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/FrankRagen/Prefabs/FrankRagen_Cinematic_SelectScreen",
        sitdownPrefab = "Models/CharactersCinematic/Cast/FrankRagen/Prefabs/FrankRagen_Cinematic_Sitdown",
        introSlate = "INTRO_SLATE.FRANK_RAGEN",
        revealConfigId = "Frank",

        labels =
        {
            FrankRagen = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_RagenTrade_Generous_text",
            great = "$DIPLOMACY_RagenTrade_Great_text",
            good = "$DIPLOMACY_RagenTrade_Good_text",
            neutral = "$DIPLOMACY_RagenTrade_Neutral_text",
            poor = "$DIPLOMACY_RagenTrade_Poor_text",
            bad = "$DIPLOMACY_RagenTrade_Bad_text",
            terrible = "$DIPLOMACY_RagenTrade_Terrible_text",
            greeting = "$DIPLOMACY_RagenTrade_Greeting_text",
            offer = "$DIPLOMACY_RagenTrade_Offer_text",
            request = "$DIPLOMACY_RagenTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
LOSLUCEROS_BOSS - ELVIRA_DUARTE
--------------------------------------------------------------------------------]]

    LOSLUCEROS_BOSS =
    {
        _includes =
        {
            "BASE_FEMALE",
            "CHARACTER_DATA.LOSLUCEROS_BOSS",
            "BEHAVIOUR_DATA.LOSLUCEROS_BOSS",
            "INVENTORY_DATA.LOSLUCEROS_BOSS",
            "AUDIO.BOSSES.PACKS.ELVIRA",
        },

        -- voiceover suffix
        voLabel = "ELVIRA",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.DEVILS_BREATH",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/ElviraDuarte_Profile",
        prefab = "Models/Characters/Cast/ElviraDuarte/Prefabs/ElviraDuarte",
        ragdollPrefab = "Models/Characters/Cast/ElviraDuarte/Prefabs/ElviraDuarte_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/ElviraDuarte/Prefabs/ElviraDuarte_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/ElviraDuarte/Prefabs/ElviraDuarte_Cinematic_SelectScreen",
        sitdownPrefab = "Models/CharactersCinematic/Cast/ElviraDuarte/Prefabs/ElviraDuarte_Cinematic_Sitdown",
        introSlate = "INTRO_SLATE.ELVIRA_DUARTE",
        revealConfigId = "Elvira",

        labels =
        {
            ElviraDuarte = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_ElviraTrade_Generous_text",
            great = "$DIPLOMACY_ElviraTrade_Great_text",
            good = "$DIPLOMACY_ElviraTrade_Good_text",
            neutral = "$DIPLOMACY_ElviraTrade_Neutral_text",
            poor = "$DIPLOMACY_ElviraTrade_Poor_text",
            bad = "$DIPLOMACY_ElviraTrade_Bad_text",
            terrible = "$DIPLOMACY_ElviraTrade_Terrible_text",
            greeting = "$DIPLOMACY_ElviraTrade_Greeting_text",
            offer = "$DIPLOMACY_ElviraTrade_Offer_text",
            request = "$DIPLOMACY_ElviraTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
VICEKINGS_BOSS - DANIEL_MCKEE_JACKSON
--------------------------------------------------------------------------------]]

    VICEKINGS_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.VICEKINGS_BOSS",
            "BEHAVIOUR_DATA.VICEKINGS_BOSS",
            "INVENTORY_DATA.VICEKINGS_BOSS",
            "AUDIO.BOSSES.PACKS.MCKEE",
        },

        -- voiceover suffix
        voLabel = "MCKEE",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.LAST_RITES",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/DanielMcKeeJackson_Profile",
        prefab = "Models/Characters/Cast/DanielMcKeeJackson/Prefabs/DanielMcKeeJackson",
        ragdollPrefab = "Models/Characters/Cast/DanielMcKeeJackson/Prefabs/DanielMcKeeJackson_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/DanielMcKeeJackson/Prefabs/DanielMcKeeJackson_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/DanielMcKeeJackson/Prefabs/DanielMcKeeJackson_Cinematic_SelectScreen",
        introSlate = "INTRO_SLATE.DANIEL_MCKEE_JACKSON",
        revealConfigId = "Daniel",

        labels =
        {
            DanielMcKeeJackson = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_DanielTrade_Generous_text",
            great = "$DIPLOMACY_DanielTrade_Great_text",
            good = "$DIPLOMACY_DanielTrade_Good_text",
            neutral = "$DIPLOMACY_DanielTrade_Neutral_text",
            poor = "$DIPLOMACY_DanielTrade_Poor_text",
            bad = "$DIPLOMACY_DanielTrade_Bad_text",
            terrible = "$DIPLOMACY_DanielTrade_Terrible_text",
            greeting = "$DIPLOMACY_DanielTrade_Greeting_text",
            offer = "$DIPLOMACY_DanielTrade_Offer_text",
            request = "$DIPLOMACY_DanielTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
OUTFIT_BOSS - ALPHONSE_CAPONE
--------------------------------------------------------------------------------]]

    OUTFIT_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.OUTFIT_BOSS",
            "BEHAVIOUR_DATA.OUTFIT_BOSS",
            "INVENTORY_DATA.OUTFIT_BOSS",
            "AUDIO.BOSSES.PACKS.CAPONE",
        },

        -- voiceover suffix
        voLabel = "CAPONE",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.BOLSTER_THE_RANKS",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/AlCapone_Profile",
        prefab = "Models/Characters/Cast/AlCapone/Prefabs/AlCapone",
        ragdollPrefab = "Models/Characters/Cast/AlCapone/Prefabs/AlCapone_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/AlCapone/Prefabs/AlCapone_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/AlCapone/Prefabs/AlCapone_Cinematic_SelectScreen",
        sitdownPrefab = "Models/CharactersCinematic/Cast/AlCapone/Prefabs/AlCapone_Cinematic",
        introSlate = "INTRO_SLATE.AL_CAPONE",
        revealConfigId = "Capone",

        labels =
        {
            AlphonseCapone = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_CaponeTrade_Generous_text",
            great = "$DIPLOMACY_CaponeTrade_Great_text",
            good = "$DIPLOMACY_CaponeTrade_Good_text",
            neutral = "$DIPLOMACY_CaponeTrade_Neutral_text",
            poor = "$DIPLOMACY_CaponeTrade_Poor_text",
            bad = "$DIPLOMACY_CaponeTrade_Bad_text",
            terrible = "$DIPLOMACY_CaponeTrade_Terrible_text",
            greeting = "$DIPLOMACY_CaponeTrade_Greeting_text",
            offer = "$DIPLOMACY_CaponeTrade_Offer_text",
            request = "$DIPLOMACY_CaponeTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
NORTHSIDE_BOSS - DION_OBANION
--------------------------------------------------------------------------------]]

    NORTHSIDE_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.NORTHSIDE_BOSS",
            "BEHAVIOUR_DATA.NORTHSIDE_BOSS",
            "INVENTORY_DATA.NORTHSIDE_BOSS",
            "AUDIO.BOSSES.PACKS.OBANION",
        },

        -- voiceover suffix
        voLabel = "OBANION",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.BLASTPHEMY",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/DeanOBanion_Profile",
        prefab = "Models/Characters/Cast/DeanOBanion/Prefabs/DeanOBanion",
        ragdollPrefab = "Models/Characters/Cast/DeanOBanion/Prefabs/DeanOBanion_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/DeanOBanion/Prefabs/DeanOBanion_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/DeanOBanion/Prefabs/DeanOBanion_Cinematic_SelectScreen",
        introSlate = "INTRO_SLATE.DEAN_O_BANION",
        revealConfigId = "Dion",

        labels =
        {
            DionOBanion = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_OBanionTrade_Generous_text",
            great = "$DIPLOMACY_OBanionTrade_Great_text",
            good = "$DIPLOMACY_OBanionTrade_Good_text",
            neutral = "$DIPLOMACY_OBanionTrade_Neutral_text",
            poor = "$DIPLOMACY_OBanionTrade_Poor_text",
            bad = "$DIPLOMACY_OBanionTrade_Bad_text",
            terrible = "$DIPLOMACY_OBanionTrade_Terrible_text",
            greeting = "$DIPLOMACY_OBanionTrade_Greeting_text",
            offer = "$DIPLOMACY_OBanionTrade_Offer_text",
            request = "$DIPLOMACY_OBanionTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
WHITECITY_BOSS - MAGGIE_DYER
--------------------------------------------------------------------------------]]

    WHITECITY_BOSS =
    {
        _includes =
        {
            "BASE_FEMALE",
            "CHARACTER_DATA.WHITECITY_BOSS",
            "BEHAVIOUR_DATA.WHITECITY_BOSS",
            "INVENTORY_DATA.WHITECITY_BOSS",
            "AUDIO.BOSSES.PACKS.MAGGIE",
        },

        -- voiceover suffix
        voLabel = "MAGGIE",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.LION_TAMER",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/MaggieDyer_Profile",
        prefab = "Models/Characters/Cast/MaggieDyer/Prefabs/MaggieDyer",
        ragdollPrefab = "Models/Characters/Cast/MaggieDyer/Prefabs/MaggieDyer_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/MaggieDyer/Prefabs/MaggieDyer_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/MaggieDyer/Prefabs/MaggieDyer_Cinematic_SelectScreen",
        sitdownPrefab = "Models/CharactersCinematic/Cast/MaggieDyer/Prefabs/MaggieDyer_Cinematic_Sitdown",
        introSlate = "INTRO_SLATE.MAGGIE_DYER",
        revealConfigId = "Maggie",

        labels =
        {
            MaggieDyer = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_MaggieTrade_Generous_text",
            great = "$DIPLOMACY_MaggieTrade_Great_text",
            good = "$DIPLOMACY_MaggieTrade_Good_text",
            neutral = "$DIPLOMACY_MaggieTrade_Neutral_text",
            poor = "$DIPLOMACY_MaggieTrade_Poor_text",
            bad = "$DIPLOMACY_MaggieTrade_Bad_text",
            terrible = "$DIPLOMACY_MaggieTrade_Terrible_text",
            greeting = "$DIPLOMACY_MaggieTrade_Greeting_text",
            offer = "$DIPLOMACY_MaggieTrade_Offer_text",
            request = "$DIPLOMACY_MaggieTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
DONOVANS_BOSS - FRANKIE_DONOVAN
--------------------------------------------------------------------------------]]

    DONOVANS_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.DONOVANS_BOSS",
            "BEHAVIOUR_DATA.DONOVANS_BOSS",
            "INVENTORY_DATA.DONOVANS_BOSS",
            "AUDIO.BOSSES.PACKS.DONOVAN",
        },

        -- voiceover suffix
        voLabel = "DONOVAN",

        -- BOSS ABILITY CARD
        bonusAbilityCard = "ITEM.ABILITY.UNLEASH_FURY",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/FrankieDonovan_Profile",
        prefab = "Models/Characters/Cast/FrankieDonovan/Prefabs/FrankieDonovan",
        ragdollPrefab = "Models/Characters/Cast/FrankieDonovan/Prefabs/FrankieDonovan_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/FrankieDonovan/Prefabs/FrankieDonovan_Cinematic",
        selectionScreenPrefab = "Models/CharactersCinematic/Cast/FrankieDonovan/Prefabs/FrankieDonovan_Cinematic_SelectScreen",
        sitdownPrefab = "Models/CharactersCinematic/Cast/FrankieDonovan/Prefabs/FrankieDonovan_Cinematic_Sitdown",
        introSlate = "INTRO_SLATE.FRANKIE_DONOVAN",
        revealConfigId = "Frankie",

        labels =
        {
            FrankieDonovan = true,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_DonovanTrade_Generous_text",
            great = "$DIPLOMACY_DonovanTrade_Great_text",
            good = "$DIPLOMACY_DonovanTrade_Good_text",
            neutral = "$DIPLOMACY_DonovanTrade_Neutral_text",
            poor = "$DIPLOMACY_DonovanTrade_Poor_text",
            bad = "$DIPLOMACY_DonovanTrade_Bad_text",
            terrible = "$DIPLOMACY_DonovanTrade_Terrible_text",
            greeting = "$DIPLOMACY_DonovanTrade_Greeting_text",
            offer = "$DIPLOMACY_DonovanTrade_Offer_text",
            request = "$DIPLOMACY_DonovanTrade_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
SALTIS_BOSS - JOSEPH_SALTIS
--------------------------------------------------------------------------------]]

SALTIS_BOSS =
{
    _includes =
    {
        "BASE_MALE",
        "CHARACTER_DATA.SALTIS_BOSS",
        "BEHAVIOUR_DATA.SALTIS_BOSS",
        "INVENTORY_DATA.SALTIS_BOSS",
        "AUDIO.BOSSES.PACKS.SALTIS",
    },

    -- voiceover suffix
    voLabel = "SALTIS",

    -- BOSS ABILITY CARD
    bonusAbilityCard = "ITEM.ABILITY.STAMPEDE",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/JosephSaltis_Profile",
    prefab = "Models/Characters/Cast/JosephSaltis/Prefabs/JosephSaltis",
    ragdollPrefab = "Models/Characters/Cast/JosephSaltis/Prefabs/JosephSaltis_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/JosephSaltis/Prefabs/JosephSaltis_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/JosephSaltis/Prefabs/JosephSaltis_Cinematic_SelectScreen",
    introSlate = "INTRO_SLATE.JOSEPH_SALTIS",
    revealConfigId = "Saltis",

    labels =
    {
        JosephSaltis = true,
    },

    tradeResponses =
    {
        generous = "$DIPLOMACY_SaltisTrade_Generous_text",
        great = "$DIPLOMACY_SaltisTrade_Great_text",
        good = "$DIPLOMACY_SaltisTrade_Good_text",
        neutral = "$DIPLOMACY_SaltisTrade_Neutral_text",
        poor = "$DIPLOMACY_SaltisTrade_Poor_text",
        bad = "$DIPLOMACY_SaltisTrade_Bad_text",
        terrible = "$DIPLOMACY_SaltisTrade_Terrible_text",
        greeting = "$DIPLOMACY_SaltisTrade_Greeting_text",
        offer = "$DIPLOMACY_SaltisTrade_Offer_text",
        request = "$DIPLOMACY_SaltisTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
FORTUNETELLERS_BOSS - GOLDIE GARNEAU
--------------------------------------------------------------------------------]]

FORTUNETELLERS_BOSS =
{
    _includes =
    {
        "BASE_FEMALE",
        "CHARACTER_DATA.FORTUNETELLERS_BOSS",
        "BEHAVIOUR_DATA.FORTUNETELLERS_BOSS",
        "INVENTORY_DATA.FORTUNETELLERS_BOSS",
        "AUDIO.BOSSES.PACKS.GOLDIE",
    },

    -- voiceover suffix
    voLabel = "GOLDIE",

    -- BOSS ABILITY CARD
    bonusAbilityCard = "ITEM.ABILITY.KILLER_QUEEN",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/GoldieGarneau_Profile",
    prefab = "Models/Characters/Cast/GoldieGarneau/Prefabs/GoldieGarneau",
    ragdollPrefab = "Models/Characters/Cast/GoldieGarneau/Prefabs/GoldieGarneau_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/GoldieGarneau/Prefabs/GoldieGarneau_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/GoldieGarneau/Prefabs/GoldieGarneau_Cinematic_SelectScreen",
    introSlate = "INTRO_SLATE.GOLDIE_GARNEAU",
    revealConfigId = "Goldie",

    labels =
    {
        GoldieGarneau = true,
    },

    tradeResponses =
    {
        generous = "$DIPLOMACY_GoldieTrade_Generous_text",
        great = "$DIPLOMACY_GoldieTrade_Great_text",
        good = "$DIPLOMACY_GoldieTrade_Good_text",
        neutral = "$DIPLOMACY_GoldieTrade_Neutral_text",
        poor = "$DIPLOMACY_GoldieTrade_Poor_text",
        bad = "$DIPLOMACY_GoldieTrade_Bad_text",
        terrible = "$DIPLOMACY_GoldieTrade_Terrible_text",
        greeting = "$DIPLOMACY_GoldieTrade_Greeting_text",
        offer = "$DIPLOMACY_GoldieTrade_Offer_text",
        request = "$DIPLOMACY_GoldieTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
HIPSINGTONG_BOSS - SAI_WING_MOCK
--------------------------------------------------------------------------------]]
HIPSINGTONG_BOSS =
{
    _includes =
    {
        "BASE_MALE",
        "CHARACTER_DATA.HIPSINGTONG_BOSS",
        "BEHAVIOUR_DATA.HIPSINGTONG_BOSS",
        "INVENTORY_DATA.HIPSINGTONG_BOSS",
        "AUDIO.BOSSES.PACKS.MOCK",
    },

    -- voiceover suffix
    voLabel = "MOCK",

     -- BOSS ABILITY CARD
     bonusAbilityCard = "ITEM.ABILITY.DEATH_BLOSSOM_BOMBS",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/SaiWingMock_Profile",
    prefab = "Models/Characters/Cast/SaiWingMock/Prefabs/SaiWingMock",
    ragdollPrefab = "Models/Characters/Cast/SaiWingMock/Prefabs/SaiWingMock_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/SaiWingMock/Prefabs/SaiWingMock_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/SaiWingMock/Prefabs/SaiWingMock_Cinematic_SelectScreen",
    sitdownPrefab = "Models/CharactersCinematic/Cast/SaiWingMock/Prefabs/SaiWingMock_Cinematic_Sitdown",
    introSlate = "INTRO_SLATE.SAI_WING_MOCK",
    revealConfigId = "SaiWing",

    labels =
    {
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,

    tradeResponses =
    {
        generous = "$DIPLOMACY_SaiWingTrade_Generous_text",
        great = "$DIPLOMACY_SaiWingTrade_Great_text",
        good = "$DIPLOMACY_SaiWingTrade_Good_text",
        neutral = "$DIPLOMACY_SaiWingTrade_Neutral_text",
        poor = "$DIPLOMACY_SaiWingTrade_Poor_text",
        bad = "$DIPLOMACY_SaiWingTrade_Bad_text",
        terrible = "$DIPLOMACY_SaiWingTrade_Terrible_text",
        greeting = "$DIPLOMACY_SaiWingTrade_Greeting_text",
        offer = "$DIPLOMACY_SaiWingTrade_Offer_text",
        request = "$DIPLOMACY_SaiWingTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
CARDSHARKS_BOSS - STEPHANIE_ST_CLAIR
--------------------------------------------------------------------------------]]
CARDSHARKS_BOSS =
{
    _includes =
    {
        "BASE_FEMALE",
        "CHARACTER_DATA.CARDSHARKS_BOSS",
        "BEHAVIOUR_DATA.CARDSHARKS_BOSS",
        "INVENTORY_DATA.CARDSHARKS_BOSS",
        "AUDIO.BOSSES.PACKS.STEPHANIE",
    },

    -- voiceover suffix
    voLabel = "STEPHANIE",

     -- BOSS ABILITY CARD
     bonusAbilityCard = "ITEM.ABILITY.FIRING_SQUAD",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/StephanieStClair_Profile",
    prefab = "Models/Characters/Cast/StephanieStClair/Prefabs/StephanieStClair",
    ragdollPrefab = "Models/Characters/Cast/StephanieStClair/Prefabs/StephanieStClair_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/StephanieStClair/Prefabs/StephanieStClair_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/StephanieStClair/Prefabs/StephanieStClair_Cinematic_SelectScreen",
    introSlate = "INTRO_SLATE.STEPHANIE_ST_CLAIR",
    revealConfigId = "Stephanie",

    labels =
    {
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,

    tradeResponses =
    {
        generous = "$DIPLOMACY_StClairTrade_Generous_text",
        great = "$DIPLOMACY_StClairTrade_Great_text",
        good = "$DIPLOMACY_StClairTrade_Good_text",
        neutral = "$DIPLOMACY_StClairTrade_Neutral_text",
        poor = "$DIPLOMACY_StClairTrade_Poor_text",
        bad = "$DIPLOMACY_StClairTrade_Bad_text",
        terrible = "$DIPLOMACY_StClairTrade_Terrible_text",
        greeting = "$DIPLOMACY_StClairTrade_Greeting_text",
        offer = "$DIPLOMACY_StClairTrade_Offer_text",
        request = "$DIPLOMACY_StClairTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
GENNA_BOSS - ANGELO_GENNA
--------------------------------------------------------------------------------]]
GENNA_BOSS =
{
    _includes =
    {
        "BASE_MALE",
        "CHARACTER_DATA.GENNA_BOSS",
        "BEHAVIOUR_DATA.GENNA_BOSS",
        "INVENTORY_DATA.GENNA_BOSS",
        "AUDIO.BOSSES.PACKS.GENNA",
    },

    -- voiceover suffix
    voLabel = "GENNA",

     -- BOSS ABILITY CARD
     bonusAbilityCard = "ITEM.ABILITY.FAN_OF_KNIVES",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/AngeloGenna_Profile",
    prefab = "Models/Characters/Cast/AngeloGenna/Prefabs/AngeloGenna",
    ragdollPrefab = "Models/Characters/Cast/AngeloGenna/Prefabs/AngeloGenna_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/AngeloGenna/Prefabs/AngeloGenna_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/AngeloGenna/Prefabs/AngeloGenna_Cinematic_SelectScreen",
    sitdownPrefab = "Models/CharactersCinematic/Cast/AngeloGenna/Prefabs/AngeloGenna_Cinematic_Sitdown",
    introSlate = "INTRO_SLATE.ANGELO_GENNA",
    revealConfigId = "Genna",


    labels =
    {
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,

    tradeResponses =
    {
        generous = "$DIPLOMACY_GennaTrade_Generous_text",
        great = "$DIPLOMACY_GennaTrade_Great_text",
        good = "$DIPLOMACY_GennaTrade_Good_text",
        neutral = "$DIPLOMACY_GennaTrade_Neutral_text",
        poor = "$DIPLOMACY_GennaTrade_Poor_text",
        bad = "$DIPLOMACY_GennaTrade_Bad_text",
        terrible = "$DIPLOMACY_GennaTrade_Terrible_text",
        greeting = "$DIPLOMACY_GennaTrade_Greeting_text",
        offer = "$DIPLOMACY_GennaTrade_Offer_text",
        request = "$DIPLOMACY_GennaTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
LOSHIJOS - SALAZAR_REYNA
--------------------------------------------------------------------------------]]
LOSHIJOS_BOSS =
{
    _includes =
    {
        "BASE_MALE",
        "CHARACTER_DATA.LOSHIJOS_BOSS",
        "BEHAVIOUR_DATA.LOSHIJOS_BOSS",
        "INVENTORY_DATA.LOSHIJOS_BOSS",
        "AUDIO.BOSSES.PACKS.REYNA",
    },

    -- voiceover suffix
    voLabel = "REYNA",

    -- BOSS ABILITY CARD
    bonusAbilityCard = "ITEM.ABILITY.SANTA_MUERTE",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/SalazarReyna_Profile",
    prefab = "Models/Characters/Cast/SalazarReyna/Prefabs/SalazarReyna",
    ragdollPrefab = "Models/Characters/Cast/SalazarReyna/Prefabs/SalazarReyna_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/SalazarReyna/Prefabs/SalazarReyna_Cinematic",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/SalazarReyna/Prefabs/SalazarReyna_Cinematic_SelectScreen",
    introSlate = "INTRO_SLATE.SALAZAR_REYNA",
    revealConfigId = "Salazar",

    labels =
    {
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,

    tradeResponses =
    {
        generous = "$DIPLOMACY_SalazarTrade_Generous_text",
        great = "$DIPLOMACY_SalazarTrade_Great_text",
        good = "$DIPLOMACY_SalazarTrade_Good_text",
        neutral = "$DIPLOMACY_SalazarTrade_Neutral_text",
        poor = "$DIPLOMACY_SalazarTrade_Poor_text",
        bad = "$DIPLOMACY_SalazarTrade_Bad_text",
        terrible = "$DIPLOMACY_SalazarTrade_Terrible_text",
        greeting = "$DIPLOMACY_SalazarTrade_Greeting_text",
        offer = "$DIPLOMACY_SalazarTrade_Offer_text",
        request = "$DIPLOMACY_SalazarTrade_Request_text",
    },
},

--[[------------------------------------------------------------------------------
ALLEYCATS_BOSS	MABEL RYLEY
--------------------------------------------------------------------------------]]

ALLEYCATS_BOSS =
{
    _includes =
    {
        "BASE_FEMALE",
        "CHARACTER_DATA.ALLEYCATS_BOSS",
        "BEHAVIOUR_DATA.ALLEYCATS_BOSS",
        "INVENTORY_DATA.ALLEYCATS_BOSS",
        "AUDIO.BOSSES.PACKS.MABEL",
    },

    -- voiceover suffix
    voLabel = "MABEL",

    -- BOSS ABILITY CARD
    bonusAbilityCard = "ITEM.ABILITY.SWINDLERS_SHOT",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/MabelRyley_Profile",
    prefab = "Models/Characters/Cast/MabelRyley/Prefabs/MabelRyley",
    ragdollPrefab = "Models/Characters/Cast/MabelRyley/Prefabs/MabelRyley_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/MabelRyley/Prefabs/MabelRyley_Cinematic",
    sitdownPrefab = "Models/CharactersCinematic/Cast/MabelRyley/Prefabs/MabelRyley_Cinematic_Sitdown",
    selectionScreenPrefab = "Models/CharactersCinematic/Cast/MabelRyley/Prefabs/MabelRyley_Cinematic_SelectScreen",
    introSlate = "INTRO_SLATE.MABEL_RYLEY",
    revealConfigId = "Mabel",

    labels =
    {
        MabelRiley = true,
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,

    tradeResponses =
    {
        generous = "$DIPLOMACY_Mabel_Generous_text",
        great = "$DIPLOMACY_Mabel_Great_text",
        good = "$DIPLOMACY_Mabel_Good_text",
        neutral = "$DIPLOMACY_Mabel_Neutral_text",
        poor = "$DIPLOMACY_Mabel_Poor_text",
        bad = "$DIPLOMACY_Mabel_Bad_text",
        terrible = "$DIPLOMACY_Mabel_Terrible_text",
        greeting = "$DIPLOMACY_Mabel_Greeting_text",
        offer = "$DIPLOMACY_Mabel_Offer_text",
        request = "$DIPLOMACY_Mabel_Request_text",
    },
},


--[[------------------------------------------------------------------------------
MURDER BOSS MAXIM ZELNICK

This may be found in MaximZelnickConfig.lua  (DLC)
--------------------------------------------------------------------------------]]


--[[------------------------------------------------------------------------------
NON-PLAYABLE BOSSES:
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
MEATPACKERS_BOSS - RONNIE_ONEILL
--------------------------------------------------------------------------------]]

    MEATPACKERS_BOSS =
    {
        _includes =
        {
            "BASE_MALE",
            "CHARACTER_DATA.MEATPACKERS_BOSS",
            "BEHAVIOUR_DATA.MEATPACKERS_BOSS",
            "INVENTORY_DATA.MEATPACKERS_BOSS",
            "AUDIO.GUARD.PACKS.GUARD_MALE",
        },

        -- voiceover suffix
        voLabel = "ONEILL",

        -- SPRITES & PREFAB
        characterIcon = "Sprites/Images/Characters/Profile/Cast/LittleBoss_Profile",
        prefab = "Models/Characters/Cast/LittleBoss/Prefabs/LittleBoss",
        ragdollPrefab = "Models/Characters/Cast/LittleBoss/Prefabs/LittleBoss_Ragdoll",
        cinematicPrefab = "Models/CharactersCinematic/Cast/LittleBoss/Prefabs/LittleBoss_Cinematic",
        sitdownPrefab = "Models/CharactersCinematic/Cast/LittleBoss/Prefabs/LittleBoss_Cinematic_Sitdown",
        revealConfigId = "Ronnie",

        labels =
        {
            RonnieOneill = true,
            LittleBoss = true,
        },

        tags =
        {
            CanCombat = true,
        },

        level = 10,

        commands =
        {
            Talk = 200,
            LookAt = 170,
            Attack = 100,
        },

        tradeResponses =
        {
            generous = "$DIPLOMACY_LittleBoss_Generous_text",
            great = "$DIPLOMACY_LittleBoss_Great_text",
            good = "$DIPLOMACY_LittleBoss_Good_text",
            neutral = "$DIPLOMACY_LittleBoss_Neutral_text",
            poor = "$DIPLOMACY_LittleBoss_Poor_text",
            bad = "$DIPLOMACY_LittleBoss_Bad_text",
            terrible = "$DIPLOMACY_LittleBoss_Terrible_text",
            greeting = "$DIPLOMACY_LittleBoss_Greeting_text",
            offer = "$DIPLOMACY_LittleBoss_Offer_text",
            request = "$DIPLOMACY_LittleBoss_Request_text",
        },
    },

--[[------------------------------------------------------------------------------
BOSSES THAT HAVE NOT YET BEEN IMPLEMENTED
--------------------------------------------------------------------------------]]

--[[------------------------------------------------------------------------------
ROOKE_BROTHERS_BOSS - D_ROOKE
--------------------------------------------------------------------------------]]
ROOKE_BROTHERS_BOSS =
{
    _includes =
    {
        "BASE_MALE",
        "CHARACTER_DATA.ROOKE_BROTHERS_BOSS",
        "BEHAVIOUR_DATA.ROOKE_BROTHERS_BOSS",
        "INVENTORY_DATA.ROOKE_BROTHERS_BOSS",
        "AUDIO.CREW.PACKS.MALE_4",
    },

    -- BOSS ABILITY CARD
    bonusAbilityCard = "ITEM.ABILITY.RAIN_OF_FIRE",

    -- SPRITES & PREFAB
    characterIcon = "Sprites/Images/Characters/Profile/Cast/LittleBoss_Profile",
    prefab = "Models/Characters/Cast/LittleBoss/Prefabs/LittleBoss",
    ragdollPrefab = "Models/Characters/Cast/LittleBoss/Prefabs/LittleBoss_Ragdoll",
    cinematicPrefab = "Models/CharactersCinematic/Cast/LittleBoss/Prefabs/LittleBoss_Cinematic",

    labels =
    {
    },

    tags =
    {
        CanCombat = true,
    },

    level = 10,
},

})
