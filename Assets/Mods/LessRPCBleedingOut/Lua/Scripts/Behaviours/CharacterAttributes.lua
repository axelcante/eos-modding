-- --------------------------------------------------
-- CharacterAttributes.lua
-- --------------------------------------------------
_namespace = "BEHAVIOURS"
_id = "ATTRIBUTES"
_name = "CharacterAttributes"
_interface = "attributes"

function Modifier.marksmanship()
    return thisActor.skills:get("marksmanship"), "$Modifier_BaseMarksmanship" --$ Base Marksmanship
end

function Modifier.defense()
    return thisActor.skills:get("defense"), "$Modifier_BaseDefense" --$ Base Defense
end

function Modifier.intimidation()
    return thisActor.skills:get("intimidation"), "$Modifier_BaseIntimidation" --$ Base Intimidation
end

function Modifier.leadership()
    return thisActor.skills:get("leadership"), "$Modifier_BaseLeadership" --$ Base Leadership
end

function Modifier.passiveHealing()

    local difficulty = WorldUtils:getWorldDifficulty() or 3
    local mod = Config.WORLD.DIFFICULTY.passiveHealingMod[difficulty] or 0

    return mod, "$Modifier_Passive_Healing" --$ Passive Healing
end

function Modifier.initiative()
    return thisActor.skills:get("initiative"), "$Modifier_BaseInitiative" --$ Base Initiative
end

function Modifier.movement()
    return thisActor.skills:get("movement"), "$Modifier_BaseMovement" --$ Base Movement
end

function Modifier.persuasion()
    return thisActor.skills:get("persuasion"), "$Modifier_BasePersuasion" --$ Base Persuasion
end

function Modifier.gunBreakChance()
    return 5, "$Modifier_GunBreakChance" --$ Chance Degraded Gun Breaks
end

function Modifier.throwDistance()
    return 20, "$Modifier_ThrowDistance" --$ Throw Distance
end

function Modifier.halfCover()
    local thisActor = thisActor
    if thisActor.isRPCOrBoss and thisActor.faction.isPlayerFaction and not thisActor:hatesPlayer() then
        return Config.COMBAT.DEFAULTS.playerHalfCoverBonus, "$Modifier_HalfCover" --$ Half Cover
    else
        return Config.COMBAT.DEFAULTS.halfCoverBonus, "$Modifier_HalfCover"
    end
end

function Modifier.fullCover()
    local thisActor = thisActor
    if thisActor.isRPCOrBoss and thisActor.faction.isPlayerFaction and not thisActor:hatesPlayer() then
        return Config.COMBAT.DEFAULTS.playerFullCoverBonus, "$Modifier_FullCover" --$ Full Cover
    else
        return Config.COMBAT.DEFAULTS.fullCoverBonus, "$Modifier_FullCover"
    end
end

function Modifier.factionLootRolls(context)
    local fled = context:getContextVariable("fled")
    return fled and 0 or 1
end

function Modifier.actionPoints()
    return 2, "$Modifier_BaseActionPoints" --$ Base Action Points
end

function Modifier.bleedOutChance()
    if thisActor:isBoss() then
        return Config.DEFAULTS.CHARACTER.baseBossBleedOutChance
    elseif thisActor.isRPC then
        -- Mod: wasn't sure if the fortitude value was used anywhere else so instead of changing it directly in RPC.lua
        -- I decided to remove the +50 arbitrary value here
        print("thisActor.fortitude - 50 = ", math.ceil(thisActor.fortitude - 50))
        return math.ceil(thisActor.fortitude - 50)
    end
    return Config.DEFAULTS.CHARACTER.baseBleedOutChance
end

function Modifier.flipChance()
    return 100, "$BaseFlipChance" --$ Base Flip Chance
end

function Modifier.leaveWhenDemotedChance()
    return 100, "$BaseLeaveWhenDemotedChance" --$ Base Chance to Leave when Demoted
end

function Modifier.critChance()
    -- Bonus Crit Chance is added when a character's marksmanship goes over 100.
    local marksmanship = thisActor:getUncappedModifierValue("marksmanship")
    local bonusCrit = math.round((marksmanship - 100) / 2)
    return math.max(0, bonusCrit), "$MarksmanshipCritBonus" --$ Bonus Crit
end

-- TODO: THIS SHOULD BE REMOVED WHEN SKILLS ARE FULLY REMOVED
function Modifier.thievery()
    return thisActor.skills:get("thievery"), "$Modifier_Thievery" --$ Thievery
end

function get(key)
    return thisActor:getModifierValue(key)
end