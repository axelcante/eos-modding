-- --------------------------------------------------
-- BolsterTheRanks.lua
-- --------------------------------------------------

local reinforcementConfigs =
{
    { notorietyRequirement = 0, configs = {"NPC.MAXIM_ZELNICK_ENFORCER_BODYGUARD_TIER_1", "NPC.MAXIM_ZELNICK_SNIPER_BODYGUARD_TIER_1"}},
    { notorietyRequirement = 200, configs = {"NPC.MAXIM_ZELNICK_ENFORCER_BODYGUARD_TIER_2", "NPC.MAXIM_ZELNICK_SNIPER_BODYGUARD_TIER_2"}},
    { notorietyRequirement = 400, configs = {"NPC.MAXIM_ZELNICK_ENFORCER_BODYGUARD_TIER_3", "NPC.MAXIM_ZELNICK_SNIPER_BODYGUARD_TIER_3"}},
    { notorietyRequirement = 600, configs = {"NPC.MAXIM_ZELNICK_ENFORCER_BODYGUARD_TIER_4", "NPC.MAXIM_ZELNICK_SNIPER_BODYGUARD_TIER_4"}},
    { notorietyRequirement = 800, configs = {"NPC.MAXIM_ZELNICK_ENFORCER_BODYGUARD_TIER_5", "NPC.MAXIM_ZELNICK_SNIPER_BODYGUARD_TIER_5"}},
}

local scenarioParams = {}

-- --------------------------------------------------
-- Ability card
-- --------------------------------------------------
_namespace = "ABILITY_CARDS"
_id = "BOLSTER_THE_RANKS"
inventoryID = "Bolster_The_Ranks"
name = "$ABILITY_CARDS_BOLSTER_THE_RANKS_name"
item = {}
item.type = "BossAbility"
item.slotType = "Ability"
--writingtodo double check the strings on this file.
actionPanelDesc = "$ABILITY_CARDS_BOLSTER_THE_RANKS_actionPanelDesc"

-- --------------------------------------------------
-- Ability Item
-- --------------------------------------------------
_namespace = "ITEM.ABILITY"
_id = "BOLSTER_THE_RANKS"
_includes = {"BASE", "ABILITY_CARDS.BOLSTER_THE_RANKS"}
hudIcon = "Sprites/Icons/Abilities/Boss/Icon_BolsterRanks"
largeIcon = "Sprites/Icons/Abilities_Large/Boss/Icon_BolsterRanks_Large"
combatAbility = "BolsterTheRanks"

-- --------------------------------------------------
-- Ability
-- --------------------------------------------------
_namespace = "BEHAVIOURS"
_id = "BOLSTER_THE_RANKS"
_includes = {"ABILITY_BASE", "BOSS_ABILITY"}
_name = "BolsterTheRanks"

item = nil

execute = "BolsterTheRanks"
aiScript = "BolsterTheRanks"

uiOrder = 742

targetSelectionMode = "SELF_SELECT"
maxPerTurn = 1
killsCooldown = 3
endsTurn = false
function onActivate()
    abilityIcon = item:get("hudIcon")
    tooltipName = item:get("name")
    actionVerb = tooltipName
end

-- ------------------------------------------
-- Scenario
-- ------------------------------------------

_namespace = "SCENARIOS"
_id = "BOLSTER_THE_RANKS"
_name = "BolsterTheRanks"
_includes = {"COMBAT_CAMERA_UTILS"}

function onStart(source, target, ability, attackInfo)
    -- Find the nearest exit points for combat.
    local combatContext = WorldUtils:getCombatContext()
    local fleeLocations = combatContext.fleeLocations
    local targetFleeLoc = fleeLocations[1]
    local spawnRot = source:getRot()
    if not targetFleeLoc then
        -- We haven't found a valid flee location so try a new spot near the player, it's very rare that this will happen.
        targetFleeLoc = source:getPos()
    end
    local sx, sy = source:getGridPosXY()
    local bestDistSqr = Utils:calcDistanceSqr(sx, sy, targetFleeLoc.x, targetFleeLoc.y)
    for i = 2, #fleeLocations do
        local loc = fleeLocations[i]
        if loc then
            local fleeDistSqr = Utils:calcDistanceSqr(sx, sy, loc.x, loc.y)
            if fleeDistSqr < bestDistSqr then
                targetFleeLoc = loc
                bestDistSqr = fleeDistSqr
            end
        end
    end
    local faction = source.faction
    local notoriety = faction:getNotoriety()
    local reinforcements
    for i = 1, #reinforcementConfigs do
        local entry = reinforcementConfigs[i]
        if entry.notorietyRequirement <= notoriety then
            reinforcements = entry.configs
        else
            break
        end
    end

    clearTable(scenarioParams)

    scenarioParams.actorSpawnList = reinforcements
    scenarioParams.faction = faction
    scenarioParams.focusPos = targetFleeLoc
    scenarioParams.maxReinforcements = #reinforcements
    scenarioParams.bolsterTheRanks = true
    scenarioParams.spawnRot = spawnRot

    step(BeginCombatCamera, source, source)
    step(PlayAnims, source)
    addWait(1)
    step(EndCombatCamera)
    step(Utils:scenario("CombatReinforcement"), scenarioParams)
end

function PlayAnims(source)
    source.anims:setAnimTrigger("BossAbility_Bolstertheranks")

    -- play boss VO
    if source:doesCharacterSoundExist( "onUseBossAbility" ) then
        Utils:playOneShotWithDelay("AUDIO.COMBAT.WHISTLE", 0)
        Utils:getWorldAudio().queueCharacterSound( "onUseBossAbility", 1.0, source, true, false )
    end
end

_namespace = "BATTLE_SCRIPTS"
_id = "BOLSTER_THE_RANKS"
_battleScript = "BolsterTheRanks"

-- We don't want target priority to be considered for this action
_ignoreTargetPriority = true

function gatherTargetInformation(agent)
    return 10
end

function selectAction(target)
    local action = thisAction
    action:clearPotentialInfoObject()
    action:createAbilityInfoObjectWithTarget(target)
    action:confirmTarget(target)
    return action
end
