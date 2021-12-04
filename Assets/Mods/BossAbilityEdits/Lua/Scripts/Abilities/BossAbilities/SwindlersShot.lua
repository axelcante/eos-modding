-- --------------------------------------------------
-- SwindlersShot.lua
-- --------------------------------------------------

_namespace = "BEHAVIOURS"
_id = "SWINDLERS_SHOT"
_name = "SwindlersShot"
_includes = {"ABILITY_BASE", "BOSS_ABILITY", "NOT_SELF", "IS_HOSTILE", "NOT_DEAD", "ABILITY_DATA.SWINDLERS_SHOT", "TRAVELLING_SHOT_ATTACK_DATA"}

-- Ability Data
execute = "SwindlersShot"
uiOrder = 735
targetSelectionMode = "CHARACTER_SELECT"
aiScript = "MultiTarget"

attackCount = 1
maxTargets = 3
requiredTargetCount = 3
needsStepOutAssistance = true
useConfirmation = true

-- Ability Vars
confirmedComponents = 1
item = nil
savedWeaponItem = nil
targets = {}
turnContext = nil
weapon = nil

function onActivate()
    abilityIcon = item:get("hudIcon")
    tooltipName = item:get("name")
    actionVerb = tooltipName
    confirmedComponents = 1

    weapon = Utils:createNewItem("ITEM.WEAPON.UNIQUE_BOSS_095")
end

function onDeactivate()
    if weapon then
        weapon:release()
        weapon = nil
    end
end

function getDamageItem()
    return weapon
end

function getHitChecker()
    return Utils:skillCheckAlwaysPass("$Combat_AlwaysHit", "alwaysHit")
end

function getCritChecker()
    return Utils:skillCheckAlwaysFail()
end

function getKnockbackChecker()
    return Utils:skillCheckAlwaysFail()
end

function onAbilityActivated(source, target)
    savedWeaponItem = source.shooter.activeWeapon
    -- source.gunHandler:switchWeapon(weapon) (Mod)
    requiredTargetCount = maxTargets
end

function onAISelected(source)
    onAbilityActivated(source)
end

-- Ability info will be nil when the action is confirmed. TODO: Maybe make this less confusing
function onAbilityDeactivated(source, abilityInfo)
    if abilityInfo then
        for target in abilityInfo:allTargets() do
            target:removeState("SwindlersShotMark")
        end
        if savedWeaponItem then
            -- source.gunHandler:switchWeapon(savedWeaponItem) (Mod)
            savedWeaponItem = nil
        end
        clearTable(targets)
    end
    confirmedComponents = 1
    Utils:playUIError()
end

targetFilter = {
    customSwindlersShotValidTarget_filter = 1,
}
function customSwindlersShotValidTarget_filter(src, tgt)
    local isValidTarget = false
    if isHostile_filter(src, tgt) then
        isValidTarget = true
    end

    local losSource = targets[#targets] or src
    local canSee, reason = canSeeTarget(losSource, tgt)
    return canSee and isValidTarget, reason
end

function canSeeTarget(source, target)
    local sightMap = turnContext and turnContext.sightMap
    if sightMap then
        return sightMap:canSee(source, target) and isValid(), "$CantSeeTarget"
    else
        return source.shooter:canShoot(target), "$CantSeeTarget"
    end
end

function onAddConfirmedTarget(target, abilityInfo)
    targets[#targets + 1] = target
    local interface = target:getState("SwindlersShotMark")
    if interface then
        requiredTargetCount = 0
        return
    else
        interface = target:addState("SwindlersShotMark")
    end
    interface:addMark()
    local cycleTarget = false
    local components = abilityInfo:getAreaOfEffect().components
    local comp = components[confirmedComponents]
    if comp then
        confirmedComponents = confirmedComponents + 1
        comp.confirmed = true
        cycleTarget = true
    end

    local actionInfo = turnContext.actionInformation

    actionInfo:setPreviewPosition(target:getGridPosXY())
    CombatUtils:updateLineOfSightTargets(actionInfo)
    -- Move target to the next guy.
    if cycleTarget then
        if turnContext.cycleAllTargets then
            turnContext:cycleAllTargets()
            removeAttackData(abilityInfo)
        elseif turnContext.cycleAll then
            turnContext:cycleAll()
            removeAttackData(abilityInfo)
        end
    end
end

function onRemoveConfirmedTarget(target, abilityInfo)
    local interface = target:getState("SwindlersShotMark")
    if interface then
        interface:removeMark()
    end
    local components = abilityInfo:getAreaOfEffect().components
    local comp = components[confirmedComponents]
    if comp then
        comp.confirmed = false
        confirmedComponents = confirmedComponents - 1
    end
    targets[#targets] = nil
end

function constructAoE()
    local aoe = CombatUtils:acquireAreaOfEffect()
    return aoe
end

function addAoeLine(aoe, x, y, abilityInfo)
    local components = aoe.components
    local prevComp = components and components[#components]
    local source = (prevComp and prevComp._endPos)
    local sx, sy
    if source then
        sx = source.x
        sy = source.y
    else
        sx, sy = abilityInfo:getActionPosition()
    end
    return aoe:addThroughLine(nil, nil, nil, nil, nil, true) -- Mod: removes the orange floor marker between targets (was bugged and persisted between maps)
end

_id = "SWINDLERS_SHOT_MARK"
_includes = "KILLER_QUEEN_MARK"
_name = "SwindlersShotMark"

activeMarks = 0
reticle = nil
reticleIcon = "Sprites/Icons/Abilities/Boss/Icon_SwindlersShot"

markIcons =
{
    "SwindlersShotMarkIcon1",
    "SwindlersShotMarkIcon2",
    "SwindlersShotMarkIcon3",
}

--[[------------------------------------------------------------------------------
Mark Icons
--------------------------------------------------------------------------------]]

_id = "SWINDLERS_SHOT_MARK_ICON_1"
_includes = "STATUS_EFFECT_BASE"
_name = "SwindlersShotMarkIcon1"
desc = "$BEHAVIOURS_SWINDLERS_SHOT_MARK_ICON_BASE_desc" --$ Marked By Swindlers Shot
modifierName = desc
icon = "Sprites/Icons/StatusEffects/StatusEffect_MarkedTarget"


_id = "SWINDLERS_SHOT_MARK_ICON_2"
_includes = "SWINDLERS_SHOT_MARK_ICON_1"
_name = "SwindlersShotMarkIcon2"

_id = "SWINDLERS_SHOT_MARK_ICON_3"
_includes = "SWINDLERS_SHOT_MARK_ICON_1"
_name = "SwindlersShotMarkIcon3"

-- ------------------------------------------
-- Killer Queen Scenario
-- ------------------------------------------

_namespace = "SCENARIOS"
_id = "SWINDLERS_SHOT"
_name = "SwindlersShot"
_includes = {"COMBAT_CAMERA_UTILS"}

aoe = nil
targetShotMap = nil
abilityInfo = nil

function onStart(_, _, ability, info)
    Utils:audioOneShot( "AUDIO.COMBAT.START_ABILITY" )
    targetShotMap = {}
    abilityInfo = info
    temp.weapon = ability:getDamageItem()
    temp.savedWeaponItem = ability.savedWeaponItem
    local source = abilityInfo:getSource()
    aoe = abilityInfo:getAreaOfEffect()
    local components = aoe.components
    start(Aim, source)
    local firstShot = true
    local prevTarget
    local targets = ability.targets

    local i = 1
    for _, comp in next, components do
        -- Loop through the aoe components.
        local lastTarget = targets[i]
        i = i + 1
        if lastTarget and (lastTarget ~= prevTarget) then
            if firstShot then
                firstShot = false
                start(BeginCombatCamera, source, lastTarget)
                addWaitForLookAt(source, lastTarget.x, lastTarget.y).timeout(1, "LookAt")
                step(DoShot, source, lastTarget, comp)
                prevTarget = lastTarget
            else
                start(UpdateCombatCamera, lastTarget)
                step(TraceAndProcessHit, prevTarget, lastTarget, comp, "Chest")
                prevTarget = lastTarget
            end
        end
    end

    step(CleanupMarkers, abilityInfo)
    step(EndAim, source)
    start(EvilLaugh, source)
    start(EndCombatCamera)
    start(ClearTargets, ability)
end

function ClearTargets(ability)
    clearTable(ability.targets)
end

function EvilLaugh(source)
    source:playCharacterSound( "onEvilLaugh" )
end

function CleanupMarkers(abilityInfo)
    for target in abilityInfo:allTargets() do
        target:removeState("SwindlersShotMark")
    end

end

function DoShot(source, target, aoeComp)
    if target.health:isActive() then
        step(BeginShot, source).timeout(1.5, "Begin Shot")
        start(FireWeapon, source, target, aoeComp)
        addWaitForActorEvent(source, "onAttackEnd").timeout(2, "Wait for end shot")
        step(EndShot, source)
    end
end

function Aim(source)
    source.anims:enterAim(false)
end

function BeginShot(source)
    local temp = temp
    source.anims:playAttackAnim()

    addWaitForActorEvent(source, "onAttackStart")
end

function FireWeapon(source, target, aoeComp)

    local activeWeapon = temp.weapon
    Utils:audioOneShotAtPos(activeWeapon:get("audio").onFire, source:getPos(), 1, 150)

    source.anims:beginMuzzleFlash()

    source:dispatchPooledEvent("onShooterUpdate", "target", source, "phase", "ammo")
    TraceAndProcessHit(source, target, aoeComp)
end

function TraceAndProcessHit(source, target, aoeComp, locator)
    if not target then return end
    local activeWeapon = temp.weapon
    local targetData = abilityInfo:getTargetData(target)
    local shotIndex = (targetShotMap[target] or 0) + 1
    targetShotMap[target] = shotIndex
    local hitInfo = targetData.attacks[shotIndex]
    -- Draw the tracer effect
    step(Utils:scenario("SpawnHitTracer"), "EFFECTS.TRACERS.BULLET", source, target, 25, nil, locator).timeout(3, "SpawnHitTracer")

    -- Process Hit info.
    for aoeTarget in aoeComp:getAffectedActors() do
        if aoeTarget ~= target then
            local aoeTargetData = abilityInfo:getTargetData(aoeTarget)
            local aoeShotIndex = (targetShotMap[aoeTarget] or 0) + 1
            local aoeHitInfo = aoeTargetData.attacks[aoeShotIndex]
            targetShotMap[aoeTarget] = aoeShotIndex
            -- Process hit for everyone in the aoe.
            start(ProcessHit, source, aoeTarget, aoeTargetData, aoeHitInfo, aoeShotIndex)
        end
    end

    step(ProcessHit, source, target, targetData, hitInfo, shotIndex).timeout(2, "ProcessHitTimeout")
end

function ProcessHit(source, target, targetData, hitInfo, shotIndex)
    if target:isDead() then
        return
    end
    -- Play the proper animations
    if hitInfo.isAttackLethal then
        step(Utils:scenario("KillTarget"), source, target, temp.turnBasedCombat, targetData).timeout(3)
    else
    -- Rotate the target to look at the source.
        if not CombatUtils:inCover(target) then
            target.navigation:lookAt(source:getPos())
        end
        if hitInfo.didCrit or hitInfo.didHit then
            if not target:hasState("DeepWounds") then
                target:addState("DeepWounds")
            end
        end
        if hitInfo.didCrit then
            -- Play the critical hit animation
            target.anims:setAnimTrigger("Shot_Critical")

        elseif hitInfo.didHit then
            -- Play the regular hit animation
            target.anims:setAnimTrigger("Shot")
            target.anims:setAnimTrigger("Shot_Critical")
        else
            target.anims:setAnimTrigger("Shot_Miss")
            if not Utils:viewIsInWorldMap() then
                target.icon:showMissAlert()
            end
        end
    end

    targetData:applyHit(shotIndex)
end

function EndShot(source)
    source.anims:endMuzzleFlash()
    source.anims:setCombatAnim(source:hasTag("InCombat"))
    if temp.knockBackStepId then
        addWaitFor(temp.knockBackStepId)
    end
end

function EndAim(source)
    step(Utils:scenario("ExitAim"), source)
    addWait(1)
    -- source.gunHandler:switchWeapon(temp.savedWeaponItem) (Mod)
end
