_namespace = "BEHAVIOURS"
_id = "BASE_UPGRADE"
_name = "BaseUpgrade"
_tag = "base"
_autoTimeSlice = false

_maxLevel = 5
_upgradeVectorId = nil

_levelDatasheetReferences = {}
_levelDatasheetIds = nil

-- This will be implemented in the included scripts
_image = nil
_costId = nil
_upgradeTimeId = nil

persist{}
_active = false

persist{}
level = 0

function canUpgrade(ignoreCost)
    if level >= _maxLevel then return false end
    if isUpgrading() then return false end
    if ignoreCost then return true end
    local cost = getNextCost()
    if not thisActor.faction.cash:canAfford(cost) then
        return false
    end
    return true
end

function beginUpgrading()
    thisActor.upgrades:beginUpgrading(handle, getUpgradeTime())
end

function confirmUpgrade()
    if thisActor.faction:pay(getNextCost(), "CASH.EQUIP_UPGRADE", thisActor.iid, false, getName(), thisActor.name) then
        beginUpgrading()
    end
end

attemptUpgradeParams = {}
function attemptUpgrade()
    if not canUpgrade() then return end
    local cost = getNextCost()
    local timeInDays = getUpgradeTime()
    clearTable(attemptUpgradeParams)
    local p = attemptUpgradeParams
    p.title = {"$Tactic_Upgrade_Name", getName()}
    p.subtitle = thisActor.name
    p.image = getIcon()
    p.imageColor = "gold"
    p.text = {"$Confirm_Building_Upgrade", getName(), level + 1, cost, timeInDays } --$ Upgrade {0} to level {1} for {2:C0}?\nThis will take {3:0} days.
    p.onAlertYes = {confirmUpgrade}
    p.onAlertYesParams = {cost}
    p.wide = true
    p.usesNoButton = true
    Utils:alertDialog(attemptUpgradeParams)
end

function getUpgradeProgress()
    return thisActor.upgrades:getUpgradeProgress(handle)
end

function getUpgradeCostReduction()
    if thisActor.faction.boss then
        local percentTotal = math.floor(math.clamp(0, 0.25, thisActor.faction.boss.notorietyModifier/4000) * 100)
        return percentTotal / 100
    else
        return 0
    end
end

function getTag()
    return _tag
end

function toggleActive()
    if _active then
        deactivateBase()
    else
        activateBase()
    end
end

function getLevel()
    return level
end

function getMaxLevel()
    return _maxLevel
end

function atMaxLevel()
    return level == _maxLevel
end

function getUpgradeTimeRemainingFormatted()
    local days = WorldUtils:getTimeRemainingDays(getUpgradeTimeRemaining())
    return "$Format_TwoItems", "$Upgrading", "$Shop_Days", days
end

function getUpgradeTimeRemaining()
    return thisActor.upgrades:getUpgradeTimeRemaining(handle)
end

function isActive()
    return _active
end

function getDeactivateName()
    return "$Upgrade_Disable" --$ Disable
end

function getActivateName()
    return "$Upgrade_Enable" --$ Enable
end

function setLevel(targetLevel)
    local count = targetLevel - level
    upgrade(count)
end

function applyUpgradeModifiers()
    local config = getDatasheetConfig()
    if config and config.mod then
        for k, v in next, config.mod do
            thisActor.data:setModifier(k, getName(), v)
        end
    end
end

function removeUpgradeModifiers()
    local config = getDatasheetConfig()
    if config and config.mod then
        for k, v in next, config.mod do
            thisActor.data:setModifier(k, getName(), nil)
        end
    end
end

function upgrade(count)
    count = count or 1
    if count < 0 then
        return downgrade(-count)
    end
    local oldLevel = level
    level = math.min(_maxLevel, level + count)
    if level ~= oldLevel then
        applyUpgradeModifiers()
        onUpgrade(oldLevel, level)
    end
    thisActor.upgrades:onUpgradeComplete(handle)
    Utils:raiseGameEvent("onUpgradeScoresRepopulated", "target", thisActor)
    if thisActor.isRacket then
        Utils:raiseGameEvent("onRacketUpgraded", "building", thisActor, "racketType", thisActor.buildingData.id, "upgradeTag", _tag, "level", level)
    elseif thisActor.buildingType and thisActor.buildingType == "Safehouse" then
        Utils:raiseGameEvent("onSafeHouseUpgraded", "building", thisActor, "upgradeTag", _tag)
    elseif thisActor.buildingType and thisActor.buildingType == "Depot" then
        Utils:raiseGameEvent("onDepotUpgraded", "building", thisActor, "upgradeTag", _tag)
    end
end

function onAdd()
    applyUpgradeModifiers()
    thisActor.upgrades:onUpgradeAdded()
end

function onActivate()
    applyUpgradeModifiers()
end

function onRemove()
    removeUpgradeModifiers()
end

function onUpgrade(oldLevel, newLevel)
    -- Override with upgrade scripts
end

function downgradeToBase()
    if level == 1 then return end
    local oldLevel = level
    level = 1
    onDowngrade(oldLevel, level)
    Utils:raiseGameEvent("onUpgradeScoresRepopulated", "target", thisActor)
end

function downgrade(count)
    count = count or 1
    if count < 0 then
        return upgrade(-count)
    end
    local oldLevel = level
    level = math.max(0, level - count)
    if level ~= oldLevel then
        onDowngrade(oldLevel, level)
    end
    Utils:raiseGameEvent("onUpgradeScoresRepopulated", "target", thisActor)
end

function onDowngrade(oldLevel, newLevel)
    -- Override with upgrade scripts
end

function isUpgrading()
    return thisActor.upgrades:isUpgrading(handle)
end

function activateBase()
    _active = true
    applyUpgradeModifiers()
    onActivateUpgrade()
end

function deactivateBase()
    _active = false
    removeUpgradeModifiers()
    onDeactivateUpgrade()
end

function onActivateUpgrade()
    -- Override with upgrade scripts
end

function onDeactivateUpgrade()
    -- Override with upgrade scripts
end

function getUpgradeVectorId()
    if not _upgradeVectorId then
        local config = getDatasheetConfig(1)
        _upgradeVectorId = "UPGRADE_VECTORS." .. config.upgradeVector
    end
    return _upgradeVectorId
end

function GameEvent.onWorldSetupComplete(e)
    if _active and e.loading then
        activateBase()
    end
end

function onDeactivate()
    deactivateBase()
end

function getDatasheetIds()
    return _levelDatasheetIds[thisActor.size]
end

function getDatasheetConfig(lvl)
    lvl = lvl or level
    local levelDatasheetIds = getDatasheetIds()
    assert(levelDatasheetIds, "there is no levelDatasheetIds table for " .. getTag() .. "\n" .. debug.traceback())
    lvl = math.clamp(1, #levelDatasheetIds, lvl)
    local levelDatasheetId = levelDatasheetIds[lvl]
    local config = _levelDatasheetReferences[levelDatasheetId]
    if not config then
        config = Utils:configFromId(levelDatasheetId)
        _levelDatasheetReferences[levelDatasheetId] = config
    end
    return config
end

function getName()
    return Utils:configFromId(getUpgradeVectorId()).name
end

function getDescription()
    return Utils:configFromId(getUpgradeVectorId()).description
end

function getCustomEffectDescriptions()

end

function getCost(lvl)
    local config = getDatasheetConfig(lvl)
    if config then
        local thisCost = config.cost
        if not thisCost then
            local levelDatasheetIds = getDatasheetIds()
            local levelDatasheetId = levelDatasheetIds[lvl or level]
            if not levelDatasheetId then
                print("Cannot find levelDatasheetId for level " .. lvl or level)
                return
            end
            return logError("Cost Missing from Datasheets for " .. levelDatasheetId)
        end
        local cost = WorldUtils:getModifiedValue("cash", _costId, thisObject.faction.factionId, thisObject.locationId, thisObject:getPrecinctId(), thisObject, thisCost)
        if cost then
            local costReduction = cost * getUpgradeCostReduction()
            return cost - costReduction
        else
            return logError(_costId .. " Missing from CASH_DATA Datasheets.")
        end
    else
        return logError("Attempting to access invalid level.")
    end
end

function getNextCost()
    local lvl = level + 1
    if lvl > _maxLevel then
        lvl = _maxLevel
    end
    return getCost(lvl)
end

function getUpgradeTime(lvl)
    lvl = lvl or level + 1
    local config = getDatasheetConfig(lvl)
    if config then
        local baseTime = config.upgradeTimeDays or 0
        local modifiedTime = WorldUtils:getModifiedValue("generic", _upgradeTimeId, thisObject.faction.factionId, thisObject.locationId, thisObject:getPrecinctId(), thisObject, baseTime)
        return modifiedTime
    else
        return logError("Attempting to access invalid level.")
    end
end

function getModifiers(lvl)
    if not lvl or level == 0 then
        return nil
    end
    local config = getDatasheetConfig(lvl)
    if config then
        return config.mod
    else
        return logError("Attempting to access invalid level.")
    end
end

function getIcon()
    return _image
end

function getActor()
    return thisActor
end
