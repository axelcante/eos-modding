-- --------------------------------------------------
-- WeaponProficiencyManager.lua
-- --------------------------------------------------
_namespace = "BEHAVIOURS"
_id = "WEAPON_PROFICIENCY_MANAGER"
_name = "WeaponProficiencyManager"
_interface = "weaponProficiencyManager"

local WeaponTypes =
{
    "Handgun",
    "Melee",
    "Shotgun",
    "SubGun",
    "Rifle",
    "Sniper",
    "MachineGun",
}

local _weaponTypeToWeaponCategory =
{
    Handgun = "HANDGUN",
    Melee = "MELEE_WEAPON",
    Rifle = "RIFLE",
    Sniper = "SNIPER_RIFLE",
    Shotgun = "SHOTGUN",
    SubGun = "SUBMACHINE_GUN",
    MachineGun = "MACHINE_GUN",
}

local _damageTypeToWeaponCategory =
{
    handgun = "HANDGUN",
    melee = "MELEE_WEAPON",
    blade = "MELEE_WEAPON",
    rifle = "RIFLE",
    sniperRifle = "SNIPER_RIFLE",
    shotgun = "SHOTGUN",
    submachineGun = "SUBMACHINE_GUN",
    machineGun = "MACHINE_GUN",
}

local _weaponCategoryToPluralStringKey =
{
    HANDGUN = "$WeaponPlural_Handgun",              --$ Handguns
    MELEE_WEAPON = "$WeaponPlural_MeleeWeapon",     --$ Melee Weapons
    RIFLE = "$WeaponPlural_Rifle",                  --$ Rifles
    SNIPER_RIFLE = "$WeaponPlural_SniperRifle",     --$ Sniper Rifles
    SHOTGUN = "$WeaponPlural_Shotgun",              --$ Shotguns
    SUBMACHINE_GUN = "$WeaponPlural_SubmachineGun", --$ Submachine Guns
    MACHINE_GUN = "$WeaponPlural_MachineGun",       --$ Machine Guns
}

local _weaponCategoryToSingularStringKey =
{
    HANDGUN = "$Weapon_Type_Handgun",
    MELEE_WEAPON = "$Melee_Action_Verb",
    RIFLE = "$Weapon_Type_Rifle",
    SNIPER_RIFLE = "$Weapon_Type_Sniper_Rifle",
    SHOTGUN = "$Weapon_Type_Shotgun",
    SUBMACHINE_GUN = "$Weapon_Type_Submachine_Gun",
    MACHINE_GUN = "$Weapon_Type_Machine_Gun",
}

-- In the format: killsTracker["HANDGUN"][character.iid] = numberOfKills
persist{}
killsTracker =
{
    HANDGUN = {},
    MELEE_WEAPON = {},
    RIFLE = {},
    SNIPER_RIFLE = {},
    SHOTGUN = {},
    SUBMACHINE_GUN = {},
    MACHINE_GUN = {},
}

-- In the format: bleedOutTracker[character.iid] = {source = source, weaponCategory = "HANDGUN"}
-- Doesn't need to be saved
bleedOutTracker =
{
}

function addProficiencyTrait(source, weaponCategory, trait, showMessage, count, tierNum)
    local traitConfig = Utils:getBehaviourConfig(trait)
    local traitName = traitConfig._name

    if source:hasState(traitName) then
        return
    end

    source:addState(traitName)

    if showMessage then
        local title = "$Weapon_Proficiency_Achieved" --$ Weapon Proficiency Achieved
        local pluralStringKey = _weaponCategoryToPluralStringKey[weaponCategory]
        local singularStringKey = _weaponCategoryToSingularStringKey[weaponCategory]
        source:showCharacterMessage(title, "$Weapon_Proficiency_Text", count, pluralStringKey, source, singularStringKey, tierNum) --$ After getting {0} kills with {1}, {2:name} has unlocked {3} Proficiency Tier {4}.
    end
end

function processKill(attacker, weaponCategory)
    local count = (killsTracker[weaponCategory][attacker.iid] or 0) + 1
    killsTracker[weaponCategory][attacker.iid] = count

    local config = Config.PROFICIENCY_KILL_REWARDS[weaponCategory]
    local trait
    local tierNum
    for level, killRequirement in next, Config.DEFAULTS.CHARACTER.weaponProficiencyKillRequirement do
        if level <= attacker.weaponProficiencyMaxTier then
            if count == killRequirement then
                trait = config.traits[level]
                tierNum = level
            end
        end
    end

    if trait ~= nil and trait ~= "none" then
        addProficiencyTrait(attacker, weaponCategory, trait, true, count, tierNum)
    end
end

function GameEvent.onCharacterDieFromBleedingOut(e)
    local target = e.target

    local bleedOutEntry = bleedOutTracker[target.iid]
    if not bleedOutEntry then
        return
    end

    processKill(bleedOutEntry.source, bleedOutEntry.weaponCategory)
end

function GameEvent.onPostCharacterAttacked(e)
    local weaponCategory = getWeaponCategory(e.targetData.weapon)
    if not weaponCategory then
        return
    end

    local source = e.source
    if not source or not source.playerFactionMember then
        return
    end

    local bleedingOut = e.target and e.target.hasState and e.target:hasState("BleedingOut")
    if bleedingOut then
        bleedOutTracker[e.target.iid] = {source = source, weaponCategory = weaponCategory}
        return
    end

    if not e.target:isDead() then
        return
    end

    processKill(e.source, weaponCategory)
end

function giveStartingProficiencyTraits(character)
    local numStartingTraits = character.weaponProficiencyStartingTier
    if numStartingTraits > 0 then
        for _, weaponType in ipairs(WeaponTypes) do
            if character.profession:canUseWeaponType(weaponType) then
                local weaponCategory = _weaponTypeToWeaponCategory[weaponType]
                local config = Config.PROFICIENCY_KILL_REWARDS[weaponCategory]
                for i = 1, numStartingTraits do
                    local trait = config.traits[i]
                    if trait ~= nil and trait ~= "none" then
                        addProficiencyTrait(character, weaponCategory, trait, false)
                    end
                end
            end
        end
    end
end

function fixKillTracker(character)
    for _, weaponType in next, WeaponTypes do
        local weaponCategory = _weaponTypeToWeaponCategory[weaponType]
        local currentTier = getWeaponProficiencyTierForCharacter(character, weaponType)
        local numKillsForCurrentTier = Config.DEFAULTS.CHARACTER.weaponProficiencyKillRequirement[currentTier]

        if (killsTracker[weaponCategory][character.iid] or 0) < numKillsForCurrentTier then
            killsTracker[weaponCategory][character.iid] = numKillsForCurrentTier
        end
    end
end

function getWeaponProficiencyTierForCharacter(character, weaponType)
    local weaponCategory = _weaponTypeToWeaponCategory[weaponType]
    if not weaponCategory then
        return Config.DEFAULTS.ITEM.maxRarityValue
    end

    local killRewardsTable = Config.PROFICIENCY_KILL_REWARDS[weaponCategory]
    if not killRewardsTable then
        return Config.DEFAULTS.ITEM.maxRarityValue
    end

    local value = 1

    for i, trait in ipairs(killRewardsTable.traits) do
        if character:hasState(trait) then
            value = i
        end
    end

    return value
end

function getUsableWeaponRarityValueForCharacter(character, weaponType)
    return Config.DEFAULTS.ITEM.maxRarityValue

    -- if not character.isRPCOrBoss then
    --     return Config.DEFAULTS.ITEM.maxRarityValue
    -- end

    -- return getWeaponProficiencyTierForCharacter(character, weaponType)
end


function getWeaponCategory(weapon)
    local damageTypes = weapon and weapon:get("damageTypes")

    if not damageTypes then
        return
    end

    for damageType, v in next, damageTypes do
        if v then
            local category = _damageTypeToWeaponCategory[damageType]
            if category then
                return category
            end
        end
    end
end

function getNumKillsUntilWeaponRarityValueUnlock(character, weaponType, tier)
    local weaponCategory = _weaponTypeToWeaponCategory[weaponType]
    local trait = Config.PROFICIENCY_KILL_REWARDS[weaponCategory].traits[tier]
    return getNumKillsUntilTraitUnlock(character, trait)
end

function getNumKillsUntilTraitUnlock(character, trait)
    if character:hasState(trait) then
        return nil
    end

    for weaponType, weaponCategory in next, _weaponTypeToWeaponCategory do
        for level, curTrait in next, Config.PROFICIENCY_KILL_REWARDS[weaponCategory].traits do
            if trait == curTrait then
                local numKills = killsTracker[weaponCategory][character.iid] or 0
                local requiredKills = Config.DEFAULTS.CHARACTER.weaponProficiencyKillRequirement[level]
                if numKills < requiredKills then
                    return requiredKills - numKills
                end
                return nil
            end
        end
    end
end
