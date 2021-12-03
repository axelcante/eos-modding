--$$ Empire Info

-- "$PrecinctOverview" --$ Precinct Overview
-- "$RacketSlots" --$ Racket Slots
-- "$EquipBuildingAs" --$ Equip Building As
-- "$PurchaseImprovement" --$ Purchase Improvement
-- "$ImprovementSlots" --$ Improvement Slots
-- "$ImprovementSlot" --$ Improvement Slot
-- "$AvailableImprovementSlot" --$ Available Improvement Slot
-- "$CountAlreadyInPrecinct" --$ In Precinct
-- "$Precinct_Customers" --$ Customers
-- "$Precinct_CustomersCapacity" --$ Max Precinct Customers
-- "$Precinct_CustomersWeeklyChange" --$ Weekly Customer Change
-- "$Precinct_CustomersInRackets" --$ In Rackets
-- "$Precinct_AvailableCustomers" --$ Available
-- "$Precinct_RequiredCustomers" --$ Required
-- "$Precinct_CustomerCrowds" --$ Crowds
-- "$Racket_CustomersCapacity" --$ Max Customers
-- "$Economy" --$ Economy
-- "$AlcoholServed" --$ Alcohol Served
-- "$ProducePoison" --$ Produce Poison

local FullScreenPanelController = require("UI.FullScreenPanelController")
local Audio = require( "Libs.Audio" )
local Alcohol = require("World.Alcohol")
local World = require("World.World")
local WorldLibs = require("Libs.WorldLibs")
local WorldAudio = require( "World.WorldAudio" )
local WorldMapController = require("World.WorldMapController")
local ItemInfoController = require("UI.ItemInfoController")
local UIController = require("Libs.UIController")
local InputProcessor = require("Libs.InputProcessor")
local ConfigBuilder = require("Libs.ConfigBuilder")
local TableUtils = require("Libs.TableUtils")
local BuildingData = require("World.BuildingData")
local ImprovementSlot = require("World.ImprovementSlot")
local GenericTooltip = require("UI.Floaters.GenericTooltip")
local TooltipPopulation = require("UI.TooltipPopulation")
local tooltip

local input = client.input

local Super = FullScreenPanelController
local _controllerInstance
local _itemInfoController

local PrecinctOverviewController = {}

local _repopulateEvents =
{
    "onPlayerUpgradeComplete",
    "onBeginBuilding",
    "onRacketAcquired",
    "onSafehouseAcquired",
    "onBeginDemolish",
    "onDemolishComplete",
    "onUpgradeStart",
    "onPlayerUpgradeComplete",
    "onAttemptPurchaseBuilding",
    "onAttemptUpgradeBuilding",
    "onEnterEconomyIdle",
}

local _precinctRepopulateEvents =
{
    "onPrecinctRefreshCustomerDistribution",
}
local _dirty = false

local _slotSelectionOptions
local _purchaseSlots = 1
local _purchaseSlotIds = { "slotPurchaseOption_1" }
local _purchaseSlotIdToIndex = { slotPurchaseOption_1 = 1 }
local _purchaseImprovementSlots = 1
local _purchaseImprovementSlotIds = { "improvementSlotPurchaseOption_1" }
local improvementConfigs = {}
local improvementConfigCount = 0
local _purchaseImprovementSlotIdToKey = {}
local _racketUpgrades = 1
local _racketUpgradeIds = { "racketUpgradesOption_1" }
local _racketUpgradesById = {}

local _selectedId
local _racketSlots = 0
local _racketSlotIds = {}
local _racketSlotIdToIndex = {}
local _racketSlotIdToBuilding = {}
local _purchasingImprovementSlot = false
local _improvementSlots = 1
local _improvementSlotIds = { "improvementSlotButton_1" }
local _improvementSlotIdToIndex = { improvementSlotButton_1 = 1 }
local _racketBuildings = {}

local _servingDropdownOpen = false
local cachedImprovementSlotIds = {}

-- -----------------------------------------------------------------------------------
-- Local Functions
-- -----------------------------------------------------------------------------------

local vo_line = {
    [ "BUILDING_DATA.BREWERY" ]     = "onPurchaseBrewery",
    [ "BUILDING_DATA.BAR" ]         = "onPurchaseBar",
    [ "BUILDING_DATA.CASINO" ]      = "onPurchaseCasino",
    [ "BUILDING_DATA.BROTHEL" ]     = "onPurchaseBrothel",
    [ "BUILDING_DATA.LOAN_SHARK" ]  = "onPurchaseLoanShark",
}
local function confirmRename(text, option, building)
    World.removeRacketName(option, text)
    local faction = World.playerFaction
    local racketCost = WorldLibs.getRacketCost(building, option, faction)

    if faction.cash:canAfford( racketCost ) then
        building.name = text or building.name
        game:dispatchPooledEvent("onBuildingRenamed", "target", building)
        faction:buyRacket(building, option, racketCost)
        local w = vo_line[ option ]
        if w then
            World.player:playCharacterSound( w )
        end
    end
    building.memory.buildingUnderAttack = nil
    _controllerInstance:populate(World.uiData.curFocusedPrecinct)
    local selectId
    local rackets = World.uiData.curFocusedPrecinct.racketBuildings
    for i = 1, #rackets do
        if building == rackets[i] then
            selectId = _racketSlotIds[i]
            break
        end
    end
    if not selectId then
        selectId = "depotSlot"
    end
    _controllerInstance:select(selectId, true)
end

-- -----------------------------------------------------------------------------------
-- Tooltips
-- -----------------------------------------------------------------------------------

function PrecinctOverviewController:onShowCustomerCountTooltip(id, internalId)
    tooltip:clear()
    TooltipPopulation.populateCustomerCountTooltip(tooltip, World.uiData.curFocusedPrecinct)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowRacketCustomersTooltip(id, internalId)
    tooltip:clear()
    TooltipPopulation.populateRacketCustomersTooltip(tooltip, World.uiData.curFocusedPrecinct)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowAvailableRequiredCustomersTooltip(id, internalId)
    tooltip:clear()
    TooltipPopulation.populateAvailableRequiredCustomersTooltip(tooltip, World.uiData.curFocusedPrecinct)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowPoliceActivityTooltip(id, internalId)
    tooltip:clear()
    TooltipPopulation.populatePoliceActivityTooltip(tooltip, World.uiData.curFocusedPrecinct)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowRaidChanceTooltip(id, internalId)
    tooltip:clear()
    TooltipPopulation.populateRaidChanceTooltip(tooltip, World.uiData.curFocusedPrecinct)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowPrecinctOwnerTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    TooltipPopulation.populatePrecinctOwner(tooltip, precinct)
    tooltip:showOverElement(self, id, internalId)
end

function PrecinctOverviewController:onShowNetIncomeTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalNet = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.faction == precinct.faction then
            local netIncome = b.data.income - b.data.upkeep
            totalNet = totalNet + netIncome
            local netIncomeColor
            if netIncome > 0 then
                netIncomeColor = "statePositive"
            elseif netIncome < 0 then
                netIncomeColor = "stateNegative"
            else
                netIncomeColor = "gold"
            end
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Color", netIncomeColor, "$Format_Price", netIncome)
        end
    end
    local totalNetColor
    if totalNet > 0 then
        totalNetColor = "statePositive"
    elseif totalNet < 0 then
        totalNetColor = "stateNegative"
    else
        totalNetColor = "gold"
    end
    tooltip:setTitle("$Format_Colon2Elements", "$NetIncome", "$Format_Color", totalNetColor, "$Format_Price", totalNet)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowGrossIncomeTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalGross = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b:earnsIncome() then
            totalGross = totalGross + b.data.income
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Color", "statePositive", "$Format_Price", b.data.income)
        end
    end
    tooltip:setTitle("$Format_Colon2Elements", "$GrossIncome", "$Format_Color", "statePositive", "$Format_Price", totalGross)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowExpensesTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalExpenses = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.faction == precinct.faction then
            totalExpenses = totalExpenses + b.data.upkeep
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Color", "stateNegative", "$Format_Price", b.data.upkeep)
        end
    end
    tooltip:setTitle("$Format_Colon2Elements", "$Building_Expenses", "$Format_Color", "stateNegative", "$Format_Price", totalExpenses)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowWeeklyProductionTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalProduction = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.data.production and b.data.production > 0 then
            totalProduction = totalProduction + b.data.production
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Color", "statePositive", "$Format_PlusBarrels2DecimalPlaces", b.data.production)
        end
    end
    tooltip:setTitle("$Format_Colon2Elements", "$Building_WeeklyProduction", "$Format_Color", "statePositive", "$Format_PlusBarrels2DecimalPlaces", totalProduction)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowWeeklyConsumptionTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalConsumption = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.data.consumption and b.data.consumption > 0 then
            totalConsumption = totalConsumption + b.data.consumption
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Color", "stateNegative", "$Format_PlusBarrels2DecimalPlaces", b.data.consumption)
        end
    end
    tooltip:setTitle("$Format_Colon2Elements", "$Building_WeeklyConsumption", "$Format_Color", "stateNegative", "$Format_PlusBarrels2DecimalPlaces", totalConsumption)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onShowStorageTooltip(id, internalId)
    local precinct = World.uiData.curFocusedPrecinct
    tooltip:clear()
    tooltip:setWidth(800)
    local totalStorage, totalStored = 0, 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.storage then
            totalStorage = totalStorage + b.storage.amount
            totalStored = totalStored + b.storage.stored
            tooltip:addData("$Format_BulletEntry", "$Format_Colon2Elements", b.name, "$Format_Barrels", "$Format_FractionWholeNumber", b.storage.stored, b.storage.amount)
        end
    end
    tooltip:setTitle("$Format_Colon2Elements", "$Building_Storage", "$Format_Barrels", "$Format_FractionWholeNumber", totalStored, totalStorage)
    tooltip:showToRightOfElement(self, id, internalId)
end

function PrecinctOverviewController:onHideTooltip(id, internalId)
    tooltip:hide()
end
-- -----------------------------------------------------------------------------------
-- Xml Events
-- -----------------------------------------------------------------------------------

function PrecinctOverviewController:onClickPrimarySlot(id, internalId)
    local building = World.uiData.curFocusedPrecinct.primaryBuilding
    if building.faction.isPlayerFaction and not building:isDemolishTime() and not building.damaged and (building.open ~= false) then
        local upgrades = building.upgrades
        if upgrades then
            World.uiData.curFocusedRacket = building
            self:populate(World.uiData.curFocusedPrecinct)
            self:select("racketUpgradesOption_1", true)
            Audio.playUISelect()
            return
        end
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:onClickRacketSlot(id, internalId)
    if World.uiData.curFocusedPrecinct.inPlayerFaction then
        local index = _racketSlotIdToIndex[id]
        local building = _racketBuildings[index]
        if not building.damaged and (not building.upgrades or building.open ~= false) then
            if building.faction.isPlayerFaction and not building:isDemolishTime() then
                local upgrades = building.upgrades
                if upgrades then
                    World.uiData.curFocusedRacket = building
                    self:populate(World.uiData.curFocusedPrecinct)
                    self:select("racketUpgradesOption_1", true)
                    Audio.playUISelect()
                    return
                end
            elseif not building:hasRacket() and building.faction.isCitizenFaction then
                World.uiData.purchaseAttempt = building
                self:populate(World.uiData.curFocusedPrecinct)
                self:select("slotPurchaseOption_1", true)
                Audio.playUISelect()
                return
            end
        end
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:onRightClickBuildingSlot(id, internalId)
    if World.uiData.purchaseAttempt then
        return
    end
    local index = _racketSlotIdToIndex[id] or 0
    local building = _racketBuildings[index] or World.uiData.curFocusedPrecinct.primaryBuilding
    if building:isHiddenToFaction(World.playerFaction) then
        Audio.oneShot("AUDIO.UI.CLICK_INVALID")
        return
    end
    local screenPos = self:getPosition(id)
    client.transition:enableLayerWithParams("CommandContextMenu", {source = World.player, target = building, screenPos = screenPos})
end

function PrecinctOverviewController:confirmPurchase(option)
    local playerBuildings = World.playerFaction.buildings
    for i = 1, #playerBuildings do
        local b = playerBuildings[i]
        if b.buildingData and b.buildingData._id == option then
            World.removeRacketName(option, b.name)
        end
    end
    local params = {
        title = "$Building_RenameBuilding", --$ Rename Building?
        subtitle = BuildingData.getConfigValue(option, "name", nil),
        textOptions = World.availableRacketNames[option],
        placeholderText = "$EnterBuildingName", --$ Enter Building Name
        onAlertYes = confirmRename,
        onAlertYesParams = {option, World.uiData.purchaseAttempt},
        pause = true,
    }
    client.transition:enableLayerWithParams("InputAlert", params)
    Audio.playUISelect()
    WorldAudio.playUIBoughtRacket()
    local building = World.uiData.purchaseAttempt
    World.uiData.purchaseAttempt = nil
    self:populate(World.uiData.curFocusedPrecinct)
    for id, b in next, _racketSlotIdToBuilding do
        if b == building then
            self:select(id, true)
            break
        end
    end
end

function PrecinctOverviewController:onClickPurchaseSlot(id, internalId)
    local index = _purchaseSlotIdToIndex[id]
    local option = _slotSelectionOptions[index]
    local purchaseAttempt = World.uiData.purchaseAttempt
    local racketCost = WorldLibs.getRacketCost(purchaseAttempt, option, World.playerFaction)

    local building = purchaseAttempt
    local isValid = BuildingData.executeScriptBlock(option, "isValid", building, World.playerFaction)
    local blockPurchase = building:hasTag("BlockPurchase")

    if World.playerFaction.cash:canAfford(racketCost) and isValid and not blockPurchase then
        local config = ConfigBuilder.fromId(option)
        local params = {
            title = "$Building_ConfirmPurchase", --$ Confirm Purchase
            subtitle = config.name,
            image = config.icon,
            imageColor = "gold",
            text = { "$Format_Purchase", racketCost, World.playerFaction.cash.count}, --$ Cost: {0:C0}\nAvailable Cash: {1:C0}
            onAlertYes = {self, "confirmPurchase"},
            onAlertYesParams = {option, true},
            usesNoButton = true,
            wide = true,
        }
        World.confirmDialog(params)
        Audio.playUISelect()
        return
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:onMouseEnterSlot(id)
    self:select(id, true)
end

function PrecinctOverviewController:onSelectPurchaseSlot(id)
    _selectedId = id
    self:refreshButtonPrompts()
    local index = _purchaseSlotIdToIndex[id]
    local option = _slotSelectionOptions[index]
    _itemInfoController:populateRacketPurchaseInfo(World.uiData.purchaseAttempt, option)
end

function PrecinctOverviewController:onDeselectPurchaseSlot(id)
    _selectedId = nil
    self:refreshButtonPrompts()
    _itemInfoController:clearInfo()
end

function PrecinctOverviewController:onSelectDepotSlot(id)
    _selectedId = id
    self:refreshButtonPrompts()
    local building = World.uiData.curFocusedPrecinct.primaryBuilding
    if building:isDemolishTime() then -- TODO: refresh once building begins demolishing, other actions from the command wheel
        _itemInfoController:populateRacketDemolishingInProgressInfo(building)
    elseif building.faction.isThugFaction then
        _itemInfoController:populateDerelictRacketInfo(building)
    elseif not building.buildingData.id then
        if building.faction.isCitizenFaction then
            _itemInfoController:populateAvailableRacketInfo(building)
        else
            _itemInfoController:populateRacketBuildingInProgressInfo(building)
        end
    elseif building:isEquipped() then
        _itemInfoController:populateBuildingInfo(building)
    end
end

function PrecinctOverviewController:onSelectRacketSlot(id)
    _selectedId = id
    self:refreshButtonPrompts()
    local index = _racketSlotIdToIndex[id]
    local building = _racketBuildings[index]
    if not building then building = World.uiData.curFocusedPrecinct.primaryBuilding end
    if building:isDemolishTime() then
        _itemInfoController:populateRacketDemolishingInProgressInfo(building)
    elseif building.faction.isThugFaction then
        _itemInfoController:populateDerelictRacketInfo(building)
    elseif not building.buildingData.id then
        if building.faction.isCitizenFaction then
            _itemInfoController:populateAvailableRacketInfo(building)
        else
            _itemInfoController:populateRacketBuildingInProgressInfo(building)
        end
    elseif building:isEquipped() then
        _itemInfoController:populateBuildingInfo(building)
    end
end

function PrecinctOverviewController:onDeselectRacketSlot(id)
    _selectedId = nil
    self:refreshButtonPrompts()
    _itemInfoController:clearInfo()
end

function PrecinctOverviewController:onClickImprovementSlot(id)
    local precinct = World.uiData.curFocusedPrecinct
    local index = _improvementSlotIdToIndex[id]
    local improvementsAllowed = precinct:allowedToBuildImprovementSlotInPrecinct(index)
    if precinct.inPlayerFaction and improvementsAllowed then
        local improvement = precinct.improvementSlots[index]
        if not improvement and (index == 1 or precinct.improvementSlots[index - 1]) then -- Purchase Improvement
            _purchasingImprovementSlot = true
            self:populate(precinct)
            self:select("improvementSlotPurchaseOption_1", true)
            Audio.playUISelect()
            return
        end
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:confirmRemoveImprovement(index)
    local precinct = World.uiData.curFocusedPrecinct
    precinct:removeImprovement(index)
    self:populate(precinct)
end

function PrecinctOverviewController:onRightClickImprovementSlot(id)
    local precinct = World.uiData.curFocusedPrecinct
    logInfo("onRightClickImprovementSlot")
    if precinct.inPlayerFaction then
        local index = _improvementSlotIdToIndex[id]
        local improvement = precinct.improvementSlots[index]
        if improvement then -- Remove Improvement?
            local params = {
                title = "$RemoveImprovement_Title", --$ Clear Improvement?
                subtitle = improvement:getName(),
                image = improvement:getIcon(),
                imageColor = "gold",
                text = { "$RemoveImprovement_Text" }, --$ Are you sure you want to clear this improvement slot. The slot will become available to equip.
                onAlertYes = {self, "confirmRemoveImprovement"},
                onAlertYesParams = {index, true},
                usesNoButton = true,
                wide = true,
            }
            World.confirmDialog(params)
            Audio.playUISelect()
            return
        end
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:onSelectImprovementSlot(id)
    _selectedId = id
    self:refreshButtonPrompts()
    local index = _improvementSlotIdToIndex[id]
    local precinct = World.uiData.curFocusedPrecinct
    local improvementSlot = precinct.improvementSlots[index]
    local allowed, reason = precinct:allowedToBuildImprovementSlotInPrecinct(index)
    if improvementSlot then
        _itemInfoController:populateImprovementSlot(improvementSlot)
    else
        _itemInfoController:populateEmptyImprovementSlotForPrecinct(precinct, allowed, reason)
    end
end

function PrecinctOverviewController:onDeselectImprovementSlot(id)
    _selectedId = nil
    self:refreshButtonPrompts()
    _itemInfoController:clearInfo()
end

function PrecinctOverviewController:confirmImprovementPurchase(improvementId)
    local config = Config.IMPROVEMENT_SLOTS[improvementId]
    local precinct = World.uiData.curFocusedPrecinct
    local cost = ImprovementSlot.getCost("IMPROVEMENT_SLOTS." .. improvementId, precinct)
    local cashDataId = Config.CASH_DATA[config.costId].cashDataConfigId
    if World.playerFaction:pay(cost, cashDataId, nil, nil, config.name) then
        precinct:addImprovement("IMPROVEMENT_SLOTS." .. improvementId)
        WorldAudio.playUIBoughtRacket()
    end
    _purchasingImprovementSlot = false
    self:populate(precinct)
    local index = #World.uiData.curFocusedPrecinct.improvementSlots
    local selectId = _improvementSlotIds[index]
    if selectId then
        self:select(selectId, true)
    end
end

function PrecinctOverviewController:onClickPurchaseImprovementSlot(id)
    local improvementId = _purchaseImprovementSlotIdToKey[id]
    local config = improvementConfigs[improvementId]
    local precinct = World.uiData.curFocusedPrecinct
    local configId = cachedImprovementSlotIds[improvementId]
    if not configId then
        configId = "IMPROVEMENT_SLOTS." .. improvementId
        cachedImprovementSlotIds[improvementId] = configId
    end
    if ImprovementSlot.isValidConfig(configId, precinct) then
        local cost = ImprovementSlot.getCost(configId, precinct)

        if World.playerFaction.cash:canAfford( cost ) then
            local params = {
                title = "$Building_ConfirmPurchase",
                subtitle = config.name,
                image = config.icon,
                imageColor = "gold",
                text = { "$Format_Purchase", cost, World.playerFaction.cash.count},
                onAlertYes = {self, "confirmImprovementPurchase"},
                onAlertYesParams = {improvementId, true},
                usesNoButton = true,
                wide = true,
            }
            World.confirmDialog(params)
            Audio.playUISelect()
            return
        end
    end

    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end

function PrecinctOverviewController:onSelectPurchaseImprovementSlot(id)
    _selectedId = id
    local improvementId = _purchaseImprovementSlotIdToKey[id]
    local config = improvementConfigs[improvementId]
    local configId = cachedImprovementSlotIds[improvementId]
    if not configId then
        configId = "IMPROVEMENT_SLOTS." .. improvementId
        cachedImprovementSlotIds[improvementId] = configId
    end
    _itemInfoController:populateImprovementConfigForPurchase(World.uiData.curFocusedPrecinct, configId, config)
    self:refreshButtonPrompts()
end

function PrecinctOverviewController:onDeselectPurchaseImprovementSlot(id)
    _selectedId = nil
    self:refreshButtonPrompts()
    _itemInfoController:clearInfo()
end

function PrecinctOverviewController:onClickRacketUpgrade(id)
    local upgrade = _racketUpgradesById[id]
    if not upgrade:isUpgrading() then
        if World.playerFaction.cash:canAfford(upgrade:getNextCost()) then
            upgrade:attemptUpgrade()
            return
        end
    end
    Audio.oneShot("AUDIO.UI.CLICK_INVALID")
end
function PrecinctOverviewController:onSelectRacketUpgrade(id)
    _selectedId = id
    local upgrade = _racketUpgradesById[id]
    self:refreshButtonPrompts()
    TooltipPopulation.populateRacketUpgradeTooltip(_itemInfoController, upgrade)
end

function PrecinctOverviewController:onDeselectRacketUpgrade(id)
    _selectedId = nil
    self:refreshButtonPrompts()
    _itemInfoController:clearInfo()
end

function PrecinctOverviewController:onToggleAlcoholServedDropdown(id)
    _servingDropdownOpen = not _servingDropdownOpen
end

function PrecinctOverviewController:onAlcoholServedValueChanged(id, internalId, selectedIndex)
    World.uiData.curFocusedPrecinct:setAlcoholType(8 - selectedIndex)
    _servingDropdownOpen = false
    _dirty = true
end

function PrecinctOverviewController:onToggleProducePoison(id)
    local racket = World.uiData.curFocusedRacket
    if racket then
        racket.producer.producingPoison = not racket.producer.producingPoison
        if racket.producer.producingPoison then
            self:setImage("togglePoisonIcon", "Sprites/AllSharedUI/Checkbox_True_Green")
        else
            self:setImage("togglePoisonIcon", "Sprites/AllSharedUI/Checkbox_False")
        end
    end
end

function PrecinctOverviewController:previousPrecinct()
    local curFocusedPrecinct = World.uiData.curFocusedPrecinct
    local location = curFocusedPrecinct:getLocation()
    local previousPrecinct = TableUtils.getPreviousEntry(location.precincts, curFocusedPrecinct, true)
    World.uiData.curFocusedPrecinct = previousPrecinct
    World.uiData.purchaseAttempt = nil
    World.uiData.curFocusedRacket = nil
    self:populate(previousPrecinct)
    self:select("depotSlot", true)
end

function PrecinctOverviewController:nextPrecinct()
    local curFocusedPrecinct = World.uiData.curFocusedPrecinct
    local location = curFocusedPrecinct:getLocation()
    local nextPrecinct = TableUtils.getNextEntry(location.precincts, curFocusedPrecinct, true)
    World.uiData.curFocusedPrecinct = nextPrecinct
    World.uiData.purchaseAttempt = nil
    World.uiData.curFocusedRacket = nil
    self:populate(nextPrecinct)
    self:select("depotSlot", true)
end


-- -----------------------------------------------------------------------------------
-- Scroll Functions
-- -----------------------------------------------------------------------------------

local _scrollAmounts = {}
local _scrollStep = 4
function PrecinctOverviewController:onScrollView(id, internalId, normalizedAmount)
    if _scrollAmounts[id] ~= normalizedAmount then
        _scrollAmounts[id] = normalizedAmount
    end
end

function PrecinctOverviewController:scrollViewUp(id)
    local scrollAmount = self:scrollHelper(id, 1, _scrollAmounts[id] or 0, nil, _scrollStep)
    self:verticalScrollTo(id, scrollAmount)
end

function PrecinctOverviewController:scrollViewDown(id)
    local scrollAmount = self:scrollHelper(id, -1, _scrollAmounts[id] or 0, nil, _scrollStep)
    self:verticalScrollTo(id, scrollAmount)
end

-- -----------------------------------------------------------------------------------
-- Events
-- -----------------------------------------------------------------------------------

function PrecinctOverviewController:onInputSourceChanged(e)
    self:checkControllerInput(e.mode == "controller")
    if e.mode ~= "controller" and _selectedId then
        self:select(_selectedId, false)
    end
end

-- -----------------------------------------------------------------------------------
-- Input Events
-- -----------------------------------------------------------------------------------

local inputEvents =
{
    "onCloseUI",
    "onSubmitUI",
    "onOpenContextMenu",
    "onNavUp",
    "onNavDown",
    "onNavLeft",
    "onNavRight",
    "onScroll",

    "onInputDemolish",
    "onInputAbandon",
    "onInputRename",
    "onInputNeighborhood",

    "onPreviousEntry",
    "onNextEntry",
}

function PrecinctOverviewController:onPreviousTab(e) -- Override parent function
end

function PrecinctOverviewController:onNextTab(e) -- Override parent function
end

function PrecinctOverviewController:onOpenContextMenu(e)
    if _servingDropdownOpen then
        self:hideTMPDropdown("alcoholServedDropdown")
        _servingDropdownOpen = false
    end
    if _selectedId then
        if _improvementSlotIdToIndex[_selectedId] then
            self:onRightClickImprovementSlot(_selectedId)
        elseif _racketSlotIdToBuilding[_selectedId] then
            self:onRightClickBuildingSlot(_selectedId)
        end
    end
end

function PrecinctOverviewController:onInputDemolish(e)
    -- print("onInputDemolish")
end

function PrecinctOverviewController:onInputAbandon(e)
    -- print("onInputAbandon")
end

local function confirmPrecinctRename(text, self)
    local precinct = World.uiData.curFocusedPrecinct
    if text then
        precinct:setName(text)
    end
    self:populate(precinct)
end

function PrecinctOverviewController:onInputRename(e)
    if World.uiData.curFocusedPrecinct.faction.isPlayerFaction then
        if _servingDropdownOpen then
            self:hideTMPDropdown("alcoholServedDropdown")
            _servingDropdownOpen = false
        end
        local params = {
            title = "$RenamePrecinct", --$ Rename Precinct?
            -- textOptions = World.availableRacketNames[option], -- TODO: add precinct names
            text = World.uiData.curFocusedPrecinct.name,
            placeholderText = "$EnterPrecinctName", --$ Enter Precinct Name
            onAlertYes = confirmPrecinctRename,
            onAlertYesParams = {self},
            usesNoButton = true,
            pause = true,
        }
        client.transition:enableLayerWithParams("InputAlert", params)
    end
end

function PrecinctOverviewController:onInputNeighborhood(e)
    local precinct = World.uiData.curFocusedPrecinct
    local neighborhood = World.getLocation(precinct.locationId)
    World.uiData.curFocusedNeighborhood = neighborhood
    client.transition:enableLayer("NeighborhoodOverview")
end

function PrecinctOverviewController:onPreviousEntry(e)
    if _servingDropdownOpen then
        self:hideTMPDropdown("alcoholServedDropdown")
        _servingDropdownOpen = false
    end
    self:previousPrecinct()
end

function PrecinctOverviewController:onNextEntry(e)
    if _servingDropdownOpen then
        self:hideTMPDropdown("alcoholServedDropdown")
        _servingDropdownOpen = false
    end
    self:nextPrecinct()
end

function PrecinctOverviewController:onScroll(e)
    local id
    if World.uiData.purchaseAttempt then
        id = "purchaseScrollView"
    elseif _purchasingImprovementSlot then
        id = "purchaseImprovementScrollView"
    elseif World.uiData.curFocusedRacket then
        id = "racketOverviewScrollView"
    end
    if id then
        if e.direction > 0 then
            self:scrollViewUp(id)
        else
            self:scrollViewDown(id)
        end
    end
end

function PrecinctOverviewController:onSubmitUI(e)
    input:navigateUISubmit()
end

function PrecinctOverviewController:onNavUp(e)
    if _servingDropdownOpen then
        input:attemptNavigateUIUp(true)
        return
    end
    if not (_selectedId and input:attemptNavigateUIUp(true)) then
        local purchaseAttempt = World.uiData.purchaseAttempt
        if purchaseAttempt then
            local id = "slotPurchaseOption_" .. #purchaseAttempt:getRacketOptions()
            self:select(id, true)
        elseif _purchasingImprovementSlot then
            local id = "slotImprovementPurchaseOption_" .. improvementConfigCount
            self:select(id, true)
        elseif World.uiData.curFocusedRacket then
            local upgradesCount = #World.uiData.curFocusedRacket.upgrades.upgradeIds
            self:select("racketUpgradesOption_" .. upgradesCount, true)
        else
            local rackets = World.uiData.curFocusedPrecinct.racketBuildings
            local selectId = _racketSlotIds[#rackets]
            self:select(selectId, true)
        end
    end
end

function PrecinctOverviewController:onNavDown(e)
    if _servingDropdownOpen then
        input:attemptNavigateUIDown(true)
        return
    end
    if not (_selectedId and input:attemptNavigateUIDown(true)) then
        local purchaseAttempt = World.uiData.purchaseAttempt
        if purchaseAttempt then
            self:select("slotPurchaseOption_1", true)
        elseif _purchasingImprovementSlot then
            self:select("slotImprovementPurchaseOption_1", true)
        elseif World.uiData.curFocusedRacket then
            self:select("racketUpgradesOption_1", true)
        else
            self:select("depotSlot", true)
        end
    end
end

function PrecinctOverviewController:onNavLeft(e)
    if _servingDropdownOpen or World.uiData.purchaseAttempt or _purchasingImprovementSlot or World.uiData.curFocusedRacket then return end
    if not (_selectedId and input:attemptNavigateUILeft(true)) then
        local rackets = World.uiData.curFocusedPrecinct.racketBuildings
        local selectId = _racketSlotIds[#rackets]
        self:select(selectId, true)
    end
end

function PrecinctOverviewController:onNavRight(e)
    if _servingDropdownOpen or World.uiData.purchaseAttempt or _purchasingImprovementSlot or World.uiData.curFocusedRacket then return end
    if not (_selectedId and input:attemptNavigateUIRight(true)) then
        self:select("depotSlot", true)
    end
end

function PrecinctOverviewController:backOutOfPurchasingRacket()
    local purchaseAttempt = World.uiData.purchaseAttempt
    _itemInfoController:clearInfo()
    local selectId
    local rackets = World.uiData.curFocusedPrecinct.racketBuildings
    for i = 1, #rackets do
        if purchaseAttempt == rackets[i] then
            selectId = _racketSlotIds[i]
            break
        end
    end
    if not selectId then
        selectId = "depotSlot"
    end
    World.uiData.purchaseAttempt = nil
    self:populate(World.uiData.curFocusedPrecinct)
    if selectId then
        self:select(selectId, true)
    end
end

function PrecinctOverviewController:backOutOfPurchasingImprovementSlot()
    _itemInfoController:clearInfo()
    _purchasingImprovementSlot = false
    self:populate(World.uiData.curFocusedPrecinct)
    local index = #World.uiData.curFocusedPrecinct.improvementSlots + 1
    local selectId = _improvementSlotIds[index]
    if selectId then
        self:select(selectId, true)
    end
end

function PrecinctOverviewController:backOutOfRacketUpgrades()
    _itemInfoController:clearInfo()
    local selectId
    local rackets = World.uiData.curFocusedPrecinct.racketBuildings
    for i = 1, #rackets do
        if World.uiData.curFocusedRacket == rackets[i] then
            selectId = _racketSlotIds[i]
            break
        end
    end
    if not selectId then
        selectId = "depotSlot"
    end
    World.uiData.curFocusedRacket = nil
    self:populate(World.uiData.curFocusedPrecinct)
    if selectId then
        self:select(selectId, true)
    end
end

function PrecinctOverviewController:onCloseUI(e)
    if _servingDropdownOpen then
        self:hideTMPDropdown("alcoholServedDropdown")
        _servingDropdownOpen = false
    elseif World.uiData.purchaseAttempt then
        self:backOutOfPurchasingRacket()
    elseif _purchasingImprovementSlot then
        self:backOutOfPurchasingImprovementSlot()
    elseif World.uiData.curFocusedRacket then
        self:backOutOfRacketUpgrades()
    else
        self:closeGameLayer()
    end
end

-- -----------------------------------------------------------------------------------
-- Populate
-- -----------------------------------------------------------------------------------

function PrecinctOverviewController:populateBuildingUpgradeProgress(id, building)
    if building.upgrades and building.upgrades:isUpgrading() then
        self:setActiveInternal(id, "progress", true)
        -- Make sure to show something
        local progress = math.max(0.05, building.upgrades:getUpgradeProgress() or 0)
        self:setFillAmountInternal(id, "progress", progress)
    elseif building:isBuildingTime() then
        self:setActiveInternal(id, "progress", true)
        -- Make sure to show something
        local progress = math.max(0.05, building:getBuildingTimeProgress() or 0)
        self:setFillAmountInternal(id, "progress", progress)
    elseif building:isDemolishTime() then
        self:setActiveInternal(id, "progress", true)
        -- Make sure to show something
        local progress = math.max(0.05, building:getDemolishTimeProgress() or 0)
        self:setFillAmountInternal(id, "progress", progress)
    elseif building.damaged then
        self:setActiveInternal(id, "progress", true)
        -- Make sure to show something
        local progress = math.max(0.05, building.damagedInterface:getProgress() or 0)
        self:setFillAmountInternal(id, "progress", progress)
    elseif building.open == false and building:isEquipped() then
        local closedModifiers = building.buildingData._closedModifiers
        for i = 1, #closedModifiers do
            local cm = closedModifiers[i]
            if cm.originalTimeout then
                local progress = (cm.originalTimeout - cm.timeout)/cm.originalTimeout
                self:setActiveInternal(id, "progress", true)
                -- Make sure to show something
                progress = math.max(0.05, progress)
                self:setFillAmountInternal(id, "progress", progress)
                return
            end
        end
        self:setActiveInternal(id, "progress", false)
    else
        self:setActiveInternal(id, "progress", false)
    end
end

local starIds =
{
    "star_1",
    "star_2",
    "star_3",
    "star_4",
    "star_5",
}
function PrecinctOverviewController:populatePurchaseSlot(id, building, option)
    self:setActive(id, true)
    -- Set icon
    local config = ConfigBuilder.fromId(option)
    self:setImageInternal(id, "icon", config.icon)
    self:setTextInternal(id, "optionTypeText", config.name)
    local isValid = BuildingData.executeScriptBlock(option, "isValid", building, World.playerFaction)
    local racketCost = WorldLibs.getRacketCost(building, option, World.playerFaction)
    local canAfford = World.playerFaction.cash:canAfford(racketCost)
    local buildTime = WorldLibs.getRacketPurchaseTime(building, option, World.playerFaction)
    local timeString
    if buildTime == 1 then
        timeString = "$Shop_Day"
    else
        timeString = "$Shop_Days"
    end

    local costColor = canAfford and "statePositive" or "stateNegative"
    if buildTime == 0 then
        self:setTextInternal(id, "costAndTimeText", "$Format_Color", costColor, "$Format_Price", racketCost)
    else
        self:setTextInternal(id, "costAndTimeText", "$Format_BulletSeparatedStrings", "$Format_Color", costColor, "$Format_Price", racketCost, timeString, buildTime)
    end

    local optionCount = 0
    for i = 1, #_racketBuildings do
        if _racketBuildings[i].buildingData.id == option then
            optionCount = optionCount + 1
        end
    end
    self:setTextInternal(id, "countText", "$Format_Colon2Elements", "$CountAlreadyInPrecinct", "$Format_Count", optionCount)

    local blockPurchase = building:hasTag("BlockPurchase")
    if isValid and canAfford and not blockPurchase then
        self:setIconColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
        self:setTextColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    else
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
        self:setTextColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    end
end

function PrecinctOverviewController:populateImprovementPurchaseSlot(id, key, config)
    self:setActive(id, true)

    local precinct = World.uiData.curFocusedPrecinct
    local configId = cachedImprovementSlotIds[key]
    if not configId then
        configId = "IMPROVEMENT_SLOTS." .. key
        cachedImprovementSlotIds[key] = configId
    end
    local validPurchase = ImprovementSlot.isValidConfig(configId, precinct, true)
    -- Set icon
    self:setImageInternal(id, "icon", config.icon)
    self:setTextInternal(id, "optionTypeText", config.name)
    local cost = ImprovementSlot.getCost(configId, precinct)
    local canAfford = World.playerFaction.cash:canAfford(cost)
    local costColor
    if not validPurchase then
        costColor = "defaultButtonTextDisabled"
    elseif not canAfford then
        costColor = "stateNegative"
    else
        costColor = "statePositive"
    end
    self:setTextInternal(id, "costAndTimeText", "$Format_Color", costColor, "$Format_Price", cost)

    if canAfford and validPurchase then
        self:setIconColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
        self:setTextColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    else
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
        self:setTextColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    end
end

local textParams = {}
function PrecinctOverviewController:populateRacketUpgrade(id, upgradeInterface)
    self:setActive(id, true)

    -- Set icon
    self:setImageInternal(id, "icon", upgradeInterface:getIcon())
    self:setTextInternal(id, "optionTypeText", upgradeInterface:getName())
    clearTable(textParams)
    local isUpgrading = upgradeInterface:isUpgrading()
    if isUpgrading then
        textParams[#textParams + 1] = "$Format_TextInBracketsAndText"
        textParams[#textParams + 1] = "$Format_Color"
        textParams[#textParams + 1] = "statePositive"
        textParams[#textParams + 1] = "$Upgrading"
    end
    textParams[#textParams + 1] = "$Format_5ItemsNoSpace"
    for i = 1, upgradeInterface.level do
        textParams[#textParams + 1] = "$Icon_FullStar"
    end
    if isUpgrading then
        textParams[#textParams + 1] = "$Icon_SemiFullStar"
    end
    for i = upgradeInterface.level + (isUpgrading and 1 or 0), 5 do
        textParams[#textParams + 1] = "$Icon_EmptyStar"
    end
    self:setTextInternal(id, "upgradeLevel", textParams)
    local canAfford
    if upgradeInterface.level == upgradeInterface._maxLevel then
        self:setActiveInternal(id, "costAndTimeText", false)
    else
        self:setActiveInternal(id, "costAndTimeText", true)
        if isUpgrading then
            -- Show time remaining
            local upgradeTime = upgradeInterface:getUpgradeTimeRemaining()
            local timeString
            if upgradeTime == 1 then
                timeString = "$Shop_Day"
            else
                timeString = "$Shop_Days"
            end
            self:setTextInternal(id, "costAndTimeText", "$Format_Colon2Elements", "$TimeRemaining", timeString, upgradeTime)
        else
            -- Show cost for next upgrade
            local cost = upgradeInterface:getNextCost()
            canAfford = World.playerFaction.cash:canAfford(cost)
            local costColor
            if not canAfford then
                costColor = "stateNegative"
            else
                costColor = "statePositive"
            end
            local upgradeTime = upgradeInterface:getUpgradeTime(upgradeInterface.level + 1)
            local timeString
            if upgradeTime == 1 then
                timeString = "$Shop_Day"
            else
                timeString = "$Shop_Days"
            end
            self:setTextInternal(id, "costAndTimeText", "$Format_Colon2Elements", "$Building_Upgrade",
                    "$Format_BulletSeparatedStrings", "$Format_Color", costColor, "$Format_Price", cost, timeString, upgradeTime)
        end
    end

    if canAfford ~= false then
        self:setIconColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
        self:setTextColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    else
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
        self:setTextColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    end
end

function PrecinctOverviewController:populateRacketSlot(id, building)
    self:setActive(id, true)
    -- Set icon
    self:setImageInternal(id, "icon", building:getIcon())
    local canAttack
    if building:isEquipped() and not building:isDemolishTime() then
        local minLevel
        local maxLevel
        local emptyIcon
        local halfIcon
        local fullIcon
        if building.faction.isThugFaction then
            minLevel = building:getDifficultyRating()
            maxLevel = minLevel
            emptyIcon = "Sprites/EmpireView/Icon_Skull_Empty"
            fullIcon = "Sprites/EmpireView/Icon_Skull_Full"
        else
            minLevel, maxLevel = building.upgrades:getLevel()
            emptyIcon = "Sprites/EmpireView/Icon_Star_Empty_W"
            halfIcon = "Sprites/EmpireView/Icon_Star_SemiFull_W"
            fullIcon = "Sprites/EmpireView/Icon_Star_W"
        end
        for i = 1, 5 do
            local internalId = starIds[i]
            self:setActiveInternal(id, internalId, true)
            if i <= minLevel then
                self:setImageInternal(id, internalId, fullIcon)
            elseif i <= maxLevel then
                self:setImageInternal(id, internalId, halfIcon)
            else
                self:setImageInternal(id, internalId, emptyIcon)
            end
        end
        canAttack = building.commands:isValid("TakeOverBuilding", World.player)
    else
        for i = 1, 5 do
            local internalId = starIds[i]
            self:setActiveInternal(id, internalId, false)
        end
    end
    self:setActiveInternal(id, "modifier", not (building.buildingData.id or building.buildTargetId))
    self:setActiveInternal(id, "attackIcon", not not canAttack)
    if canAttack then
        self:setIconColors(id, "aggressiveButtonText", "aggressiveButtonTextHighlighted", "aggressiveButtonTextPressed", "defaultButtonIconDisabled")
    elseif building:hasTag("BlockPurchase") then
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    elseif building.faction.isPlayerFaction and (not building.upgrades or building.open ~= false) and not building.damaged then
        self:setIconColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    elseif building.damaged or (building.upgrades and building.open == false) or not building:getPrecinct().inPlayerFaction then
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    elseif building.faction.isThugFaction then -- Derelict
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    elseif (not building.faction.isPlayerFaction) and building.faction.isGang then -- Enemy Owned
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    else -- Player accessible
        self:setIconColors(id, "statePositive", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    end
    self:populateBuildingUpgradeProgress(id, building)
end

function PrecinctOverviewController:populateImprovementSlot(id, improvement, previousHasActiveSlot, locked)
    self:setActive(id, true)
    local isPlayerSlot = World.uiData.curFocusedPrecinct.faction.isPlayerFaction
    if improvement then
        self:setImageInternal(id, "icon", improvement:getIcon())
        self:setActiveInternal(id, "modifier", false)
    elseif locked then
        self:setImageInternal(id, "icon", "Sprites/SelectFaction/Icon_Locked")
        self:setActiveInternal(id, "modifier", false)
    else
        self:setImageInternal(id, "icon", "Sprites/Icons/Buildings/Icon_Racket_Sale_W")
        self:setActiveInternal(id, "modifier", previousHasActiveSlot and isPlayerSlot)
    end
    if locked or not (improvement or previousHasActiveSlot) or not isPlayerSlot then
        self:setIconColors(id, "talentButtonIconUnavailable", "talentButtonIconSelectedUnavailable", "talentButtonIconPressedUnavailable", "talentButtonIconDisabledUnavailable")
    elseif improvement then
        self:setIconColors(id, "defaultButtonIcon", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    else -- Player accessible
        self:setIconColors(id, "statePositive", "defaultButtonIconHighlighted", "defaultButtonIconPressed", "defaultButtonIconDisabled")
    end
end

function PrecinctOverviewController:populateRacketPurchaseAttemptList(purchaseAttempt)
    _slotSelectionOptions = purchaseAttempt:getRacketOptions()
    for i = _purchaseSlots + 1, #_slotSelectionOptions do
        local id = "slotPurchaseOption_" .. i
        self:clone("slotPurchaseOption_1", id, true)
        self:setOnClickCallback(id, self.onClickPurchaseSlot)
        self:setOnMouseEnterCallback(id, self.onMouseEnterSlot)
        self:setOnSelectCallback(id, self.onSelectPurchaseSlot)
        self:setOnDeselectCallback(id, self.onDeselectPurchaseSlot)
        _purchaseSlotIds[i] = id
        _purchaseSlotIdToIndex[id] = i
        _purchaseSlots = _purchaseSlots + 1
    end
    for i = 1, #_slotSelectionOptions do
        local id = _purchaseSlotIds[i]
        local option = _slotSelectionOptions[i]
        self:populatePurchaseSlot(id, purchaseAttempt, option)
    end
    for i = #_slotSelectionOptions + 1, _purchaseSlots do
        local id = _purchaseSlotIds[i]
        self:setActive(id, false)
    end
    self:verticalScrollTo("purchaseScrollView", 1)
end

function PrecinctOverviewController:populateImprovementPurchaseAttemptList(precinct)
    clearTable(improvementConfigs)
    improvementConfigs, improvementConfigCount = precinct:getVisibleImprovementConfigs(improvementConfigs)

    for i = _purchaseImprovementSlots + 1, improvementConfigCount do
        local id = "improvementSlotPurchaseOption_" .. i
        self:clone("improvementSlotPurchaseOption_1", id, true)
        self:setOnClickCallback(id, self.onClickPurchaseImprovementSlot)
        self:setOnMouseEnterCallback(id, self.onMouseEnterSlot)
        self:setOnSelectCallback(id, self.onSelectPurchaseImprovementSlot)
        self:setOnDeselectCallback(id, self.onDeselectPurchaseImprovementSlot)
        _purchaseImprovementSlotIds[i] = id
        _purchaseImprovementSlots = _purchaseImprovementSlots + 1
    end
    local index = 1
    clearTable(_purchaseImprovementSlotIdToKey)
    for k, v in next, improvementConfigs do
        local id = _purchaseImprovementSlotIds[index]
        _purchaseImprovementSlotIdToKey[id] = k
        self:populateImprovementPurchaseSlot(id, k, v)
        index = index + 1
    end
    for i = improvementConfigCount + 1, _purchaseImprovementSlots do
        local id = _purchaseImprovementSlotIds[i]
        self:setActive(id, false)
    end
    self:verticalScrollTo("purchaseImprovementScrollView", 1)
end

function PrecinctOverviewController:populateRacketUpgrades(racket)
    local upgradeIds = racket.upgrades.upgradeIds
    local upgradeInterfaces = racket.upgrades.upgradeInterfaces

    if racket.producer then
        self:setActive("togglePoisonButton", true)
        if racket.producer.producingPoison then
            self:setImage("togglePoisonIcon", "Sprites/AllSharedUI/Checkbox_True_Green")
        else
            self:setImage("togglePoisonIcon", "Sprites/AllSharedUI/Checkbox_False")
        end
    else
        self:setActive("togglePoisonButton", false)
    end

    self:setText("racketUpgradesHeader", racket.name)

    for i = _racketUpgrades + 1, #upgradeIds do
        local id = "racketUpgradesOption_" .. i
        self:clone("racketUpgradesOption_1", id, true)
        self:setOnClickCallback(id, self.onClickRacketUpgrade)
        self:setOnMouseEnterCallback(id, self.onMouseEnterSlot)
        self:setOnSelectCallback(id, self.onSelectRacketUpgrade)
        self:setOnDeselectCallback(id, self.onDeselectRacketUpgrade)
        _racketUpgradeIds[i] = id
        _racketUpgrades = _racketUpgrades + 1
    end
    clearTable(_racketUpgradesById)
    for i = 1, #upgradeIds do
        _racketUpgradesById[_racketUpgradeIds[i]] = upgradeInterfaces[upgradeIds[i]]
        self:populateRacketUpgrade(_racketUpgradeIds[i], upgradeInterfaces[upgradeIds[i]])
    end
    for i = #upgradeIds + 1, _racketUpgrades do
        self:setActive(_racketUpgradeIds[i], false)
    end
    self:verticalScrollTo("racketOverviewScrollView", 1)
    World.tryStartTutorial("RacketUpgrades")
end

local _panels =
{
    "upgradeSlotsPanel",
    "chooseSlotPanel",
    "chooseImprovementPanel",
    "racketOverviewPanel",
}

function PrecinctOverviewController:setPanelActive(panelId)
    for i = 1, #_panels do
        self:setActive(_panels[i], (panelId == _panels[i]))
    end
end

function PrecinctOverviewController:populate(precinct)
    _racketBuildings = precinct.racketBuildings
    _servingDropdownOpen = false
    local neighborhood = precinct:getLocation()
    self:setText("precinctName", precinct.name)
    self:setText("neighborhoodName", neighborhood.name)
    self:setImage("ownerPortrait", precinct.faction:getKnownBossPortrait(true))
    self:setImage("precinctImage", precinct.keyImage)
    self:setActive("notConnectedToSafehouse", not precinct:canSupplyOwner())

    local precinctUpgradeLevel = precinct:getOverallUpgradeLevel()

    local showStars = not precinct.faction.isThugFaction
    for i = 1, 5 do
        local id = starIds[i]
        self:setActive(id, showStars)
        if showStars then
            if i > precinctUpgradeLevel then
                self:setImage(id, "Sprites/RacketView/Icon_Star_Empty_Gold")
            else
                self:setImage(id, "Sprites/RacketView/Icon_Star_Gold")
            end
        end
    end

    local income = 0
    local upkeep = 0
    local production = 0
    local consumption = 0
    local stored = 0
    local storageSpace = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.open ~= false then
            income = income + b.data.income
            upkeep = upkeep + b.data.upkeep
            if b.producer then
                production = production + b.producer.amount
            else
                consumption = consumption + (b.data.consumption or 0)
            end
            if b.storage then
                stored = stored + b.storage.stored
                storageSpace = storageSpace + b.storage.amount
            end
        end
    end
    if precinct.faction.isMinorFaction then
        production = consumption -- Minor factions have limitless supply of alcohol
    end
    local netIncomeColor
    if income > upkeep then
        netIncomeColor = "statePositive"
    elseif upkeep > income then
        netIncomeColor = "stateNegative"
    else
        netIncomeColor = "gold"
    end
    self:setText("netIncome", "$Format_Price", income - upkeep)
    self:setColor("netIncome", netIncomeColor)
    self:setText("grossIncome", "$Format_Price", income)
    self:setText("expenses", "$Format_Price", upkeep)
    self:setText("weeklyProduction", "$Format_Barrels", production)
    self:setText("weeklyConsumption", "$Format_Barrels", consumption)
    self:setText("storage", "$Format_Barrels", "$Format_FractionWholeNumber", stored, storageSpace)

    if precinct.faction.isPlayerFaction then
        self:setActive("servingParent", true)
        local servingTypeFlipped = 7 - precinct.servingAlcoholType
        self:setTMPDropdownValue("alcoholServedDropdown", servingTypeFlipped) -- Ignoring poison and converting to base 0
    else
        self:setActive("servingParent", false)
    end

    local customerCount = precinct.customerCount
    local customerCapacity = precinct:getCustomerCapacity()
    local customerChange = precinct:getCustomerGrowth(true)
    local changeColor
    if customerChange > 0 then
        changeColor = "statePositive"
    elseif customerChange < 0 then
        changeColor = "stateNegative"
    else
        changeColor = "gold"
    end
    self:setText("customerCount", "$Format_TextAndTextInBrackets",
            "$Format_FractionWholeNumber", customerCount, customerCapacity,
            "$Format_Color", changeColor, "$Format_PlusMinusNumber", customerChange)
    local racketCapacity = 0
    for i = 1, #precinct.buildings do
        local b = precinct.buildings[i]
        if b.open ~= false then
            racketCapacity = racketCapacity + (b.data.racketCustomerCapacity or 0)
        end
    end
    local customersInRackets = math.min(racketCapacity, customerCount)
    self:setText("customersInRackets", "$Format_FractionWholeNumber", customersInRackets, racketCapacity)
    if customersInRackets < racketCapacity then
        self:setText("availableRequiredCustomersTitle", "$Precinct_RequiredCustomers")
        self:setText("availableRequiredCustomers", "$Format_Color", "stateNegative", "$Format_WholeNumber", racketCapacity - customersInRackets)
    else
        self:setText("availableRequiredCustomersTitle", "$Precinct_AvailableCustomers")
        self:setText("availableRequiredCustomers", "$Format_Color", "statePositive", "$Format_WholeNumber", customerCount - customersInRackets)
    end

    local maxPoliceActivity = 100
    local policeActivity = math.clamp(0, maxPoliceActivity, precinct:getPoliceActivity())
    self:setText("policeActivity", "$Format_FractionWholeNumber", policeActivity, maxPoliceActivity)
    local raidChance = precinct:getRaidChance()
    self:setText("raidChance", "$Format_Percent", raidChance * 100)

    local purchaseAttempt = World.uiData.purchaseAttempt
    if purchaseAttempt then
        self:setPanelActive("chooseSlotPanel")
        self:populateRacketPurchaseAttemptList(purchaseAttempt)
    elseif _purchasingImprovementSlot then
        self:setPanelActive("chooseImprovementPanel")
        self:populateImprovementPurchaseAttemptList(precinct)
    elseif World.uiData.curFocusedRacket then
        self:setPanelActive("racketOverviewPanel")
        self:populateRacketUpgrades(World.uiData.curFocusedRacket)
    else
        self:setPanelActive("upgradeSlotsPanel")
        clearTable(_racketSlotIdToBuilding)
        self:populateRacketSlot("depotSlot", precinct.primaryBuilding)
        _racketSlotIdToBuilding.depotSlot = precinct.primaryBuilding

        for b = _racketSlots + 1, #precinct.racketBuildings do
            local id = "racketSlot_" .. b
            self:clone("depotSlot", id, true)
            self:setOnClickCallback(id, self.onClickRacketSlot)
            self:setOnRightClickCallback(id, self.onRightClickBuildingSlot)
            self:setOnMouseEnterCallback(id, self.onMouseEnterSlot)
            self:setOnSelectCallback(id, self.onSelectRacketSlot)
            self:setOnDeselectCallback(id, self.onDeselectRacketSlot)
            self:setParent(id, "racketGridGroup")
            _racketSlotIds[b] = id
            _racketSlotIdToIndex[id] = b
            _racketSlots = _racketSlots + 1
        end
        for b = 1, #_racketBuildings do
            local id = _racketSlotIds[b]
            local building = _racketBuildings[b]
            _racketSlotIdToBuilding[id] = building
            self:populateRacketSlot(id, building)
        end
        for b = #_racketBuildings + 1, _racketSlots do
            local id = _racketSlotIds[b]
            self:setActive(id, false)
        end
        local improvementSlotCapacity = Config.DEFAULTS.BUILDING.improvementSlotCapacity
        for i = _improvementSlots + 1, improvementSlotCapacity do
            local id = "improvementSlotButton_" .. i
            self:clone("improvementSlotButton_1", id, true)
            self:setOnClickCallback(id, self.onClickImprovementSlot)
            self:setOnRightClickCallback(id, self.onRightClickImprovementSlot)
            self:setOnMouseEnterCallback(id, self.onMouseEnterSlot)
            self:setOnSelectCallback(id, self.onSelectImprovementSlot)
            self:setOnDeselectCallback(id, self.onDeselectImprovementSlot)
            _improvementSlotIds[i] = id
            _improvementSlotIdToIndex[id] = i
            _improvementSlots = _improvementSlots + 1
        end
        local previousSlotActive = true
        for i = 1, improvementSlotCapacity do
            local id = _improvementSlotIds[i]
            local improvement = precinct.improvementSlots[i]
            local allowed = precinct:allowedToBuildImprovementSlotInPrecinct(i)
            self:populateImprovementSlot(id, improvement, previousSlotActive, not allowed)
            if not improvement then
                previousSlotActive = false
            end
        end
        for i = improvementSlotCapacity + 1, _improvementSlots do
            local id = _improvementSlotIds[i]
            self:setActive(id, false)
        end
        if not World.facts.seenPrecinctScreenTutorial then
            World.tryStartTutorial("PrecinctScreen")
        end
    end
    self:checkControllerInput(InputProcessor.getInputMode() == "controller")
end

function PrecinctOverviewController:frame(e)
    if _dirty then
        _dirty = false
        _controllerInstance:populate(World.uiData.curFocusedPrecinct)
    else
        if World.uiData.purchaseAttempt or _purchasingImprovementSlot or World.uiData.curFocusedRacket then
            return
        end
        for b = 1, #_racketBuildings do
            local id = _racketSlotIds[b]
            local building = _racketBuildings[b]
            self:populateBuildingUpgradeProgress(id, building)
        end
    end
end

function PrecinctOverviewController:onCompleteGoToLocation(e)
    self:closeGameLayer()
end

function PrecinctOverviewController:onBeginGoToLocation(e)
    self:closeGameLayer()
end

local function repopulateListener(e)
    _dirty = true
end

local function precinctRepopulateListener(e)
    if e.precinct == World.uiData.curFocusedPrecinct then
        _dirty = true
    end
end

-- -----------------------------------------------------------------------------------
-- Initialization/Show/Hide Functions
-- -----------------------------------------------------------------------------------
function PrecinctOverviewController:showUI(movingFromFullScreenContext)
    World.uiData.precinctViewOpen = true
    Super.showUI(self, movingFromFullScreenContext)
    if not World.uiData.curFocusedPrecinct then
        local precinct = World.player:getPrecinct()
        World.uiData.curFocusedPrecinct = precinct
    end
    _itemInfoController:showUI()
    _itemInfoController:clearInfo()
    self:populate(World.uiData.curFocusedPrecinct)
    if World.uiData.purchaseAttempt then
        self:select("slotPurchaseOption_1", true)
    elseif World.uiData.curFocusedRacket then
        self:select("racketUpgradesOption_1", true)
    else
        self:select("depotSlot", true)
    end
    game:addMultiEventListener(_repopulateEvents, repopulateListener)
    game:addMultiEventListener(_precinctRepopulateEvents, precinctRepopulateListener)
    game:addEventListener("frame", self)
    game:addEventListener("onCompleteGoToLocation", self)
    game:addEventListener("onBeginGoToLocation", self)
end

function PrecinctOverviewController:hideUI(movingToFullScreenContext)
    World.uiData.precinctViewOpen = false
    Super.hideUI(self, movingToFullScreenContext)
    World.uiData.purchaseAttempt = nil
    if WorldMapController:isWorldMapActive() then
        if self.revertToZoom == "WorldMapSummaryGrid" then
            WorldMapController:overrideClampRotation(true)
        end
    end
    _itemInfoController:hideUI()
    game:removeMultiEventListener(_repopulateEvents, repopulateListener)
    game:removeMultiEventListener(_precinctRepopulateEvents, precinctRepopulateListener)
    game:removeEventListener("frame", self)
    game:removeEventListener("onCompleteGoToLocation", self)
    game:removeEventListener("onBeginGoToLocation", self)
end

function PrecinctOverviewController:adjustToScreenSettings(scale, width, height, aspectRatio)
    Super.adjustToScreenSettings(self, scale, width, height, aspectRatio)
    if scale > 1 then
        self:setAnchorMax("statsPanel", 0.25, 1)
        self:setAnchorMin("upgradeSlotsPanel", 0.25, 0)
        self:setAnchorMin("chooseSlotPanel", 0.25, 0)
        _scrollStep = 8
    else
        local anchorOffset = 0.25 * scale
        self:setAnchorMax("statsPanel", anchorOffset, 1)
        self:setAnchorMin("upgradeSlotsPanel", anchorOffset, 0)
        self:setAnchorMin("chooseSlotPanel", anchorOffset, 0)
        _scrollStep = 4
    end
end

function PrecinctOverviewController:checkControllerInput(controllerConnected)
    -- Super.checkControllerInput(self, controllerConnected)
    self:refreshButtonPrompts()
    -- if controllerConnected then
    --     self:setPromptImage("changeLocationIcon", "navigateEntries")
    -- end
    if World.uiData.purchaseAttempt then
        for i = 1, #_purchaseSlotIds do
            self:setPromptImageInternal(_purchaseSlotIds[i], "buttonPromptIcon", "navigateUISubmit")
        end
    elseif _purchasingImprovementSlot then
        for i = 1, #_purchaseImprovementSlotIds do
            self:setPromptImageInternal(_purchaseImprovementSlotIds[i], "buttonPromptIcon", "navigateUISubmit")
        end
    elseif World.uiData.curFocusedRacket then
        for i = 1, #_racketUpgradeIds do
            self:setPromptImageInternal(_racketUpgradeIds[i], "buttonPromptIcon", "navigateUISubmit")
        end
    end
end

local function canContextClick()
    if _purchasingImprovementSlot or World.uiData.purchaseAttempt then
        return false
    end
    if _racketSlotIdToBuilding[_selectedId] then
        return true
    end
    if not World.uiData.curFocusedPrecinct.faction.isPlayerFaction then
        return false
    end
    local index = _improvementSlotIdToIndex[_selectedId]
    if index and World.uiData.curFocusedPrecinct.improvementSlots[index] then
        return true
    end
    return false
end

local function canPurchaseOrUpgrade()
    local precinct = World.uiData.curFocusedPrecinct
    if not precinct.faction.isPlayerFaction then
        return false
    end
    if _selectedId then
        if World.uiData.curFocusedRacket then
            local upgrade = _racketUpgradesById[_selectedId]
            if upgrade and upgrade:canUpgrade() then
                return true
            end
        else
            local building = _racketSlotIdToBuilding[_selectedId]
            if building then
                if building.faction.isCitizenFaction then
                    return true
                elseif building.faction.isPlayerFaction and building.upgrades and building.upgrades:canUpgrade() then
                    return true
                else
                    return false
                end
            else
                local index = _improvementSlotIdToIndex[_selectedId]
                if index then
                    if not precinct.improvementSlots[index] and (index == 1 or precinct.improvementSlots[index - 1]) then
                        return true
                    else
                        return false
                    end
                end
            end
            return true
        end
    end
    return false
end

local function testFunction()   -- Mod
    return "$Test"

local function getUpgradeChoosePromptText()
    if World.uiData.curFocusedRacket then
        return "$Upgrade"
    end
    if _selectedId then
        local building = _racketSlotIdToBuilding[_selectedId]
        if building then
            if building.faction.isCitizenFaction then
                return "$Choose" --$ Choose
            elseif building.faction.isPlayerFaction and building.upgrades and building.upgrades:canUpgrade() then
                return "$Upgrade"
            end
        end
    end
    return "$Choose"
end

local function getContextClickText()
    if _selectedId then
        if _improvementSlotIdToIndex[_selectedId] then
            return "$ClearImprovement_Prompt" --$ Clear Improvement
        end
    end
    return "$INTERACT_text"
end

local function isPrecinctOwner()
    return World.uiData.curFocusedPrecinct.faction.isPlayerFaction
end

-- "$RenamePrecinctPrompt" --$ Rename Precinct
function PrecinctOverviewController:addButtonPrompts()
    self:addButtonPrompt("testButton", testFunction, nil, canPurchaseOrUpgrade) -- Mod
    self:addButtonPrompt("navigateUISubmit", getUpgradeChoosePromptText, nil, canPurchaseOrUpgrade)
    self:addButtonPrompt("openContextMenu", getContextClickText, nil, canContextClick)
    self:addButtonPrompt("rename", "$RenamePrecinctPrompt", self.onInputRename, isPrecinctOwner)
    self:addButtonPrompt("neighborhood", "$Ward", self.onInputNeighborhood)
    self:addButtonPrompt("navigateUIClose", "$Button_Back", self.onCloseUI)
end

function PrecinctOverviewController:setupCallbacks()
    self:setOnClickCallback("previousPrecinct", self.previousPrecinct)
    self:setOnClickCallback("nextPrecinct", self.nextPrecinct)

    self:setOnClickCallback("depotSlot", self.onClickPrimarySlot)
    self:setOnRightClickCallback("depotSlot", self.onRightClickBuildingSlot)
    self:setOnMouseEnterCallback("depotSlot", self.onMouseEnterSlot)
    self:setOnSelectCallback("depotSlot", self.onSelectDepotSlot)
    self:setOnDeselectCallback("depotSlot", self.onDeselectRacketSlot)

    self:setOnClickCallback("slotPurchaseOption_1", self.onClickPurchaseSlot)
    self:setOnMouseEnterCallback("slotPurchaseOption_1", self.onMouseEnterSlot)
    self:setOnSelectCallback("slotPurchaseOption_1", self.onSelectPurchaseSlot)
    self:setOnDeselectCallback("slotPurchaseOption_1", self.onDeselectPurchaseSlot)

    self:setOnClickCallback("improvementSlotButton_1", self.onClickImprovementSlot)
    self:setOnRightClickCallback("improvementSlotButton_1", self.onRightClickImprovementSlot)
    self:setOnMouseEnterCallback("improvementSlotButton_1", self.onMouseEnterSlot)
    self:setOnSelectCallback("improvementSlotButton_1", self.onSelectImprovementSlot)
    self:setOnDeselectCallback("improvementSlotButton_1", self.onDeselectImprovementSlot)

    self:setOnClickCallback("improvementSlotPurchaseOption_1", self.onClickPurchaseImprovementSlot)
    self:setOnMouseEnterCallback("improvementSlotPurchaseOption_1", self.onMouseEnterSlot)
    self:setOnSelectCallback("improvementSlotPurchaseOption_1", self.onSelectPurchaseImprovementSlot)
    self:setOnDeselectCallback("improvementSlotPurchaseOption_1", self.onDeselectPurchaseImprovementSlot)

    self:setOnClickCallback("racketUpgradesOption_1", self.onClickRacketUpgrade)
    self:setOnMouseEnterCallback("racketUpgradesOption_1", self.onMouseEnterSlot)
    self:setOnSelectCallback("racketUpgradesOption_1", self.onSelectRacketUpgrade)
    self:setOnDeselectCallback("racketUpgradesOption_1", self.onDeselectRacketUpgrade)

    self:setOnValueChangedCallback("purchaseScrollView", self.onScrollView)
    self:setOnValueChangedCallback("purchaseImprovementScrollView", self.onScrollView)
    self:setOnValueChangedCallback("racketOverviewScrollView", self.onScrollView)

    self:setUITooltipCallbacks("ownerPortrait", self.onShowPrecinctOwnerTooltip, self.onHideTooltip)

    self:setUITooltipCallbacks("netIncomeParent", self.onShowNetIncomeTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("grossIncomeParent", self.onShowGrossIncomeTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("expensesParent", self.onShowExpensesTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("weeklyProductionParent", self.onShowWeeklyProductionTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("weeklyConsumptionParent", self.onShowWeeklyConsumptionTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("storageParent", self.onShowStorageTooltip, self.onHideTooltip)

    self:setUITooltipCallbacks("customerCountParent", self.onShowCustomerCountTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("customersInRacketsParent", self.onShowRacketCustomersTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("availableRequiredCustomersParent", self.onShowAvailableRequiredCustomersTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("policeActivityParent", self.onShowPoliceActivityTooltip, self.onHideTooltip)
    self:setUITooltipCallbacks("raidChanceParent", self.onShowRaidChanceTooltip, self.onHideTooltip)

    self:setOnClickCallback("alcoholServedDropdown", self.onToggleAlcoholServedDropdown)
    self:setOnValueChangedCallback("alcoholServedDropdown", self.onAlcoholServedValueChanged)
    self:setOnClickCallback("togglePoisonButton", self.onToggleProducePoison)
end

function PrecinctOverviewController:init(gameLayer)
    Super.init(self, gameLayer, "Xml/PrecinctOverview")
    self:addTMPDropdownOption("alcoholServedDropdown", "$Best_Available") --$ Best Available
    for i = 6, 2, -1 do
        self:addTMPDropdownOption("alcoholServedDropdown", Alcohol.getName(i))
    end
    _controllerInstance = self

    _itemInfoController = ItemInfoController:new(gameLayer, "Xml/ItemInfo", true, gameLayer.priority - 1)
    _itemInfoController:setControllerParent(self, "itemInfoParent")
    World.registerUIWithTutorials("precinctOverview", self)
    tooltip = GenericTooltip.getInstance()

    self:setInputEvents(inputEvents)
end

return newClass("RomeroGames.UI.PrecinctOverviewController", PrecinctOverviewController, Super)
