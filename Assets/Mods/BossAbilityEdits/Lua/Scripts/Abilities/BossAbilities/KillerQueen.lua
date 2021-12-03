-- --------------------------------------------------
-- KillerQueen.lua
-- --------------------------------------------------

_namespace = "BEHAVIOURS"
_id = "KILLER_QUEEN"
_name = "KillerQueen"
_includes = {"ABILITY_BASE", "BOSS_ABILITY", "NO_AMMO_NEEDED_FILTERS", "ABILITY_DATA.KILLER_QUEEN", "TRAVELLING_SHOT_ATTACK_DATA"}

-- Ability Data
execute = "KillerQueen"
uiOrder = 729
targetSelectionMode = "CHARACTER_SELECT"
aiScript = "MultiTarget"

attackCount = 1
needsStepOutAssistance = true
requiredTargetCount = 1
useConfirmation = true
displayBreakdown = true

-- Ability Vars
confirmedComponents = 0
item = nil
savedWeaponItem = nil
turnContext = nil
weapon = nil
aoeLineHandles = {}

function onActivate()
    abilityIcon = item:get("hudIcon")
    tooltipName = item:get("name")
    confirmedComponents = 0

    weapon = Utils:createNewItem("ITEM.WEAPON.UNIQUE_BOSS_075")
end

function onDeactivate()
    if weapon then
        weapon:release()
        weapon = nil
    end
end

function getHitChecker()
    return Utils:skillCheckAlwaysPass("$Combat_AlwaysHit", "alwaysHit")
end

function getDamageItem()
    return weapon
end

function isValid()
    return true
end

function onAbilityActivated(source, target)
    savedWeaponItem = source.shooter.activeWeapon
    -- source.gunHandler:switchWeapon(weapon)
    Utils:audioOneShot( "AUDIO.COMBAT.START_ABILITY" )
end

function onAISelected(source)
    onAbilityActivated(source)
end

-- Ability info will be nil when the action is confirmed. TODO: Maybe make this less confusing
function onAbilityDeactivated(source, abilityInfo)
    if abilityInfo and savedWeaponItem then
        -- source.gunHandler:switchWeapon(savedWeaponItem)
        savedWeaponItem = nil
    end
end

function onAddConfirmedTarget(target, abilityInfo)
    local interface = target:getState("KillerQueenMark")
    if not interface then
        interface = target:addState("KillerQueenMark")
    end
    interface:addMark()

    local components = abilityInfo:getAreaOfEffect().components
    local comp = components[confirmedComponents]
    if comp then
        confirmedComponents = confirmedComponents + 1
        components[#components].confirmed = true
    end
end

function onRemoveConfirmedTarget(target, abilityInfo)
    local interface = target:getState("KillerQueenMark")
    if interface then
        interface:removeMark()
    end
    local components = abilityInfo:getAreaOfEffect().components
    local comp = components[confirmedComponents]
    if comp then
        comp.confirmed = false
        confirmedComponents = confirmedComponents - 1
    end
end

-- Ability info will be nil when the action is confirmed. TODO: Maybe make this less confusing
function onAbilityDeactivated(source, abilityInfo)
    if abilityInfo then
        for target in abilityInfo:allTargets() do
            target:removeState("KillerQueenMark")
        end
        -- source.gunHandler:switchWeapon(savedWeaponItem)
    end
    confirmedComponents = 0
end

function constructAoE()
    local aoe = CombatUtils:acquireAreaOfEffect()
    return aoe
end

function addAoeLine(aoe, x, y, abilityInfo)
    local ax, ay = abilityInfo:getActionPosition()
    return aoe:addLine(ax, ay, x, y, nil, true)
end

function showAbilityUI(abilityInfo)
    hideAbilityUI(abilityInfo)
    local aoe = abilityInfo:getAreaOfEffect()
    if aoe then
        abilityInfo:showAffectedTiles()
        aoe:showUI()
        local source = abilityInfo:getSource()
        local i = 1
        for _, comp in next, aoe.components do
            local lastTarget
            for target in comp:getAffectedActors() do
                lastTarget = target
            end
            if lastTarget then
                showAoeLine(source, lastTarget, i)
            end
            i = i + 1
        end
   end
end

function hideAbilityUI(abilityInfo)
    local aoe = abilityInfo:getAreaOfEffect()
    if aoe then
        abilityInfo:hideAffectedTiles()
        aoe:hideUI()
    end
    hideAoeLines()
end

function showAoeLine(source, target, index)
    local sourcePos = source:get3DPos()
    local targetPos = target:get3DPos()
    -- Raise the y position by 1 so that the line isn't on the ground
    sourcePos.y = sourcePos.y + 1
    targetPos.y = targetPos.y + 1
    aoeLineHandles[index] = CombatUtils:displayLine(sourcePos, targetPos, "hostile", "bullRush", 0.05, true, false, true);
end

function hideAoeLine(index)
    local line = aoeLineHandles[index]
    if line then
        CombatUtils:releaseLine(line)
    end
end

function hideAoeLines()
    for i = 1, #aoeLineHandles do
        CombatUtils:releaseLine(aoeLineHandles[i])
    end
    clearTable(aoeLineHandles)
end

_id = "KILLER_QUEEN_MARK"
_name = "KillerQueenMark"

reticle = nil
reticleIcon = "Sprites/Icons/Abilities/Boss/Icon_KillerQueen"
activeMarks = 0

markIcons =
{
    "KillerQueenMarkIcon1",
    "KillerQueenMarkIcon2",
    "KillerQueenMarkIcon3",
}

function onRemove()
    for i = activeMarks, 1, -1 do
        local icon = markIcons[i]
        if icon then
            thisActor:removeState(icon)
        end
    end
    removeReticle()
    activeMarks = 0
end

function addMark()
    if activeMarks == 0 then
        addReticle()
    end
    activeMarks = activeMarks + 1

    local icon = markIcons[activeMarks]
    if icon then
        -- Add the icon
        thisActor:addState(icon)
        Utils:audioOneShot( "AUDIO.UI.MARK_ENEMY" )
    end
end

function removeMark()
    local icon = markIcons[activeMarks]
    if icon then
        thisActor:removeState(icon)
        Utils:audioOneShot( "AUDIO.UI.WHOOSH" )
    end

    activeMarks = activeMarks - 1
    if activeMarks == 0 then
        removeReticle()
    end
end

function addReticle()
    if reticle then
        logError("Target already has a marked target reticle.")
        return
    end
    -- Get the reticle.
    reticle = CombatUtils:getMarkedTargetReticle(reticleIcon, "hostile")
    local pos = thisActor:getGridPos()
    reticle:setPositionXY(pos.x + 0.5, pos.y + 0.5)
end

function removeReticle()
    if not reticle then
        return
    end
    CombatUtils:releaseMarkedTargetReticle(reticle)
    reticle = nil
end

--[[------------------------------------------------------------------------------
Mark Icons
--------------------------------------------------------------------------------]]

_id = "KILLER_QUEEN_MARK_ICON_1"
_includes = "STATUS_EFFECT_BASE"
_name = "KillerQueenMarkIcon1"
desc = "$BEHAVIOURS_KILLER_QUEEN_MARK_ICON_BASE_desc" --$ Marked By Killer Queen
modifierName = desc
icon = "Sprites/Icons/StatusEffects/StatusEffect_MarkedTarget"

_id = "KILLER_QUEEN_MARK_ICON_2"
_includes = "KILLER_QUEEN_MARK_ICON_1"
_name = "KillerQueenMarkIcon2"

_id = "KILLER_QUEEN_MARK_ICON_3"
_includes = "KILLER_QUEEN_MARK_ICON_1"
_name = "KillerQueenMarkIcon3"

-- ------------------------------------------
-- Killer Queen Scenario
-- ------------------------------------------

_namespace = "SCENARIOS"
_id = "KILLER_QUEEN"
_name = "KillerQueen"
_includes = {"COMBAT_CAMERA_UTILS"}

aoe = nil
targetShotMap = nil
abilityInfo = nil

function onStart(_, _, ability, info)
    targetShotMap = {}
    abilityInfo = info
    temp.weapon = ability:getDamageItem()
    temp.savedWeaponItem = ability.savedWeaponItem
    local source = abilityInfo:getSource()
    aoe = abilityInfo:getAreaOfEffect()
    local components = aoe.components

    source:playCharacterSound( "onAngry" )

    -- play boss ability stinger
    local player = Character:getPlayer()
    player:playCharacterSound( "onUseBossAbility" )

    start(Aim, source)
    local firstShot = true
    for _, comp in next, components do
        -- Loop through the aoe components
        local lastTarget
        for target in comp:getAffectedActors() do
            lastTarget = target
        end
        step(LookAt, source, lastTarget)
        if firstShot then
            step(BeginCombatCamera, source, lastTarget)
            firstShot = false
        else
            step(UpdateCombatCamera, lastTarget)
        end

        step(DoShot, source, lastTarget, comp)
    end

    step(CleanupMarkers, abilityInfo)
    step(EndAim, source)
    start(EvilLaugh, source)
end

function EvilLaugh(source)
    source:playCharacterSound( "onEvilLaugh" )
end

function CleanupMarkers(abilityInfo)
    for target in abilityInfo:allTargets() do
        target:removeState("KillerQueenMark")
    end
end

function DoShot(source, target, aoeComp)
    if target.health:isActive() then
        step(BeginShot, source).timeout(1.5)
        start(FireWeapon, source, target, aoeComp)
        step(WaitForEndShot, source).timeout(0.5)
        step(EndShot, source)
        addWait(1)
    end
end

function LookAt(source, target)
    local x, y = target:getGridPosXY()
    addWaitForLookAt(source, x, y).timeout(1)
end

function Aim(source)
    source.anims:enterAim(false)
end

function BeginShot(source)
    local temp = temp
    source.anims:playAttackAnim()

    temp.shotCallback = function()
        source:removeEventListener("onAttackStart", temp.shotCallback)
        temp.shotFired = true
        temp.shotCallback = nil
    end

    source:addEventListener("onAttackStart", temp.shotCallback)
    addWaitUntilFlag(temp, "shotFired")
end

function FireWeapon(source, target, aoeComp)

    local activeWeapon = temp.weapon
    Utils:audioOneShotAtPos(activeWeapon:get("audio").onFire, source:getPos(), 1, 150)

    source.anims:beginMuzzleFlash()

    source:dispatchPooledEvent("onShooterUpdate", "target", source, "phase", "ammo")

    local targetData = abilityInfo:getTargetData(target)
    local shotIndex = (targetShotMap[target] or 0) + 1
    targetShotMap[target] = shotIndex
    local hitInfo = targetData.attacks[shotIndex]

    -- Draw the tracer effect
    if hitInfo.didHit then
        WorldUtils:spawnHitTracerEffect("EFFECTS.TRACERS.BULLET", source, target)
    else
        WorldUtils:spawnMissTracerEffect("EFFECTS.TRACERS.BULLET", source, target)
    end

    -- Process Hit info.
    for aoeTarget in aoeComp:getAffectedActors() do
        if aoeTarget ~= target then
            local aoeTargetData = abilityInfo:getTargetData(aoeTarget)
            local aoeShotIndex = (targetShotMap[aoeTarget] or 0) + 1
            local aoeHitInfo = aoeTargetData.attacks[aoeShotIndex]
            targetShotMap[aoeTarget] = aoeShotIndex
            ProcessHit(source, aoeTarget, aoeTargetData, aoeHitInfo, aoeShotIndex)
        end
    end

    ProcessHit(source, target, targetData, hitInfo, shotIndex)
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

        if hitInfo.didCrit then
            -- Play the critical hit animation
            target.anims:setAnimTrigger("Shot_Critical")
            addWait(1)
        elseif hitInfo.didHit then
            -- Play the regular hit animation
            target.anims:setAnimTrigger("Shot")
            addWait(0.5)
        else
            -- TODO: Confirm the name. Maybe the animation name will change
            target.anims:setAnimTrigger("Shot_Miss")
            if not Utils:viewIsInWorldMap() then
                target.icon:showMissAlert()
            end
            addWait(0.5)
        end
    end

    targetData:applyHit(shotIndex)
end

function WaitForEndShot(source)
    local temp = temp
    temp.endShotCallback = function()
        source:removeEventListener("onAttackEnd", temp.endShotCallback)
        temp.shotEnded = true
        temp.endShotCallback = nil
    end

    source:addEventListener("onAttackEnd", temp.endShotCallback)
    addWaitUntilFlag(temp, "shotEnded")
end

function EndShot(source)
    source.anims:endMuzzleFlash()
    source.anims:setCombatAnim(source:hasTag("InCombat"))
    if temp.knockBackStepId then
        addWaitFor(temp.knockBackStepId)
    end
    addWait(0.2)
end

function EndAim(source)
    step(Utils:scenario("ExitAim"), source)
    start(EndCombatCamera)
    addWait(1)
    -- source.gunHandler:switchWeapon(temp.savedWeaponItem)
end
