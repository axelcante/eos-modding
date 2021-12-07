_namespace = "NEWGAME"
_id = "STANDARD"

-- Input vars
generatorSeed = nil

-- Instance vars
_setupGamePhase = "Start"
_assignRacketsPhase = "Start"
_assignStartingSquadIndex = nil
_startingSquadFactions = nil
_availableRacketsByLocationId = {}
_buildingsWithGuards = {}
_curBuildingsWithGuardsIndex = 0
_initConfig = nil
_playerStartLocation = nil
_exteriorLocations = nil
_playerFaction = nil
_startingSafehouse = nil
_ankleBitersFaction = nil
_littleBossFaction = nil
_littleBossSafehouses = {}
_enemyFactions = nil
_enemySafehouses = {}
_minorFactions = nil
_minorFactionSafehouses = {}
_lawEnforcementFactions = nil
_secondaryStartingDepot = nil

-- Nobody should be choosing derelict
local _racketTypeSelectionBuffer = {
    {0, "BUILDING_DATA.BAR"},
    {0, "BUILDING_DATA.BREWERY"},
    {0, "BUILDING_DATA.CASINO"},
    {0, "BUILDING_DATA.BROTHEL"},
    -- {0, "BUILDING_DATA.DERELICT"},
}

local function readRacketTypePreference(aiSensor, key, index)
    local val = aiSensor[key]
    if not val or (val < 1) then val = 1 end
    _racketTypeSelectionBuffer[index][1] = val
end

local function setRacketTypePreference(racketType, value)
    for i = 1,#_racketTypeSelectionBuffer do
        local entry = _racketTypeSelectionBuffer[i]
        if entry[2] == racketType then
            entry[1] = value
            break
        end
    end
end

local function overrideRacketTypePreference(racketType, value)
    for i = 1,#_racketTypeSelectionBuffer do
        local entry = _racketTypeSelectionBuffer[i]
        if entry[2] == racketType then
            entry[1] = value
        else
            entry[1] = 0
        end
    end
end

function chooseStartingRacketType(faction, totalNumRacketsToChoose)
    if faction.isThugFaction then
        return "BUILDING_DATA.DERELICT"

    elseif faction.isMinorFaction then
        setRacketTypePreference("BUILDING_DATA.BAR", 10)
        setRacketTypePreference("BUILDING_DATA.CASINO", 10)
        setRacketTypePreference("BUILDING_DATA.BROTHEL", 10)
        setRacketTypePreference("BUILDING_DATA.BREWERY", 0)
        return TableUtils.select(_racketTypeSelectionBuffer)

    end
    local factionAI = faction.factionAI

    -- Try to ensure they have enough breweries
    local totalAlcoholProduced = 0
    local totalAlcoholConsumed = 0
    for i = 1, #faction.buildings do
        local building = faction.buildings[i]
        local alcoholProduced = FactionAI:getMinAlcoholProducedForBuildingType(building.buildingData.id, building.size)
        local alcoholConsumed = FactionAI:getMinAlcoholConsumedForBuildingType(building.buildingData.id, building.size)
        totalAlcoholProduced = totalAlcoholProduced + alcoholProduced
        totalAlcoholConsumed = totalAlcoholConsumed + alcoholConsumed
    end
    if totalAlcoholConsumed > totalAlcoholProduced then
        return "BUILDING_DATA.BREWERY"
    end

    local aiSensor = factionAI and factionAI.aiSensor
    if aiSensor then
        setRacketTypePreference("BUILDING_DATA.BREWERY", 0)
        readRacketTypePreference(aiSensor, "barRacketDesire", 1)
        readRacketTypePreference(aiSensor, "casinoRacketDesire", 3)
        readRacketTypePreference(aiSensor, "brothelRacketDesire", 4)
        return TableUtils.select(_racketTypeSelectionBuffer)
    else
        return TableUtils.select(faction.racketPreferences)
    end
end

local _chosenRacketBuildings = {}
function assignRacketsToFaction(availableRackets, faction, numRacketsToAssign)
    local difficulty = WorldUtils:getWorldDifficulty()
    for i = 1, math.min(#availableRackets, numRacketsToAssign) do
        local racketId = chooseStartingRacketType(faction, #_chosenRacketBuildings)
        local racket = availableRackets[i]
        racket:setOwnerId(faction.configId)
        racket.name = WorldUtils:pickRandomRacketName(racketId)
        racket:equipBuildingAs(racketId)
        faction:addNewGameBuilding(racket)
        _buildingsWithGuards[#_buildingsWithGuards + 1] = racket
        logGameInfo("NewGame", string.format("Created Racket %s for building %s at %s for faction %s",
            racketId,
            getDebugLocalizedString(racket.name),
            tostring(racket:getPos()),
            faction.configId))
        if not faction.isPlayerFaction and not WorldUtils:isTutorialBuilding(racket) then
            local securityUpgrades = racket.upgrades and racket.upgrades:getUpgradeOfType("security")
            if not securityUpgrades then
                logError("Could not find security upgrades on racket for faction", faction.configId)
            else
                -- logInfo("Setting up security on racket for", faction.configId)
                securityUpgrades:setLevel(Config.DEFAULTS.AI.startingRacketSecurityLevel[difficulty])
            end
        end
    end
end

function assignThugPrecinctRackets(thugFaction, precinct)
    -- print("assignThugPrecinctRackets", precinct.id, precinct.faction.configId)
    local buildings = precinct.buildings
    local newGameThugPrecinctDerelictRatio = _initConfig.newGameThugPrecinctDerelictRatio
    local possibleBuildingsToChange = {}
    for i = 1, #buildings do
        local building = buildings[i]
        if not building.canBeDepot and building.buildingType == "Vacant" then
            possibleBuildingsToChange[#possibleBuildingsToChange + 1] = building
        end
    end
    local numThugBuildingsToMake = math.round(newGameThugPrecinctDerelictRatio * #possibleBuildingsToChange)
    local buildingsToAssign = TableUtils.iselectNRandomElements(possibleBuildingsToChange, numThugBuildingsToMake)
    for i = 1, #buildingsToAssign do
        local building = buildingsToAssign[i]
        -- print("Assigning thug building", precinct.id, building.iid, precinct.faction.configId, building.faction.configId)
        building:setOwnerId(thugFaction.configId)
        building:equipBuildingAs("BUILDING_DATA.DERELICT")
        thugFaction:assignBuilding(building)
        logGameInfo("NewGame", string.format("Created Derelict for building %s at %s for thug faction",
            getDebugLocalizedString(building.name),
            tostring(building:getPos())))
    end
end

local _availableEnemySafehouses = {}
function assignPrecinctToFaction(faction, precinct)
    local safehouse = precinct.primaryBuilding
    if not safehouse then
        logError("No primary building found for precinct", precinct.definitionId)
        return
    end
    setupDepot(faction, safehouse)
    local boss = faction.boss
    if boss and boss:getLocationId() == 0 then
        boss:placeInSafehouseWithGuards(safehouse)
    end
    precinct:transferPrecinct(faction, true)

    logGameInfo("NewGame", string.format("Selected %s safehouse: %s at %s", faction.configId, getDebugLocalizedString(safehouse.name), tostring(safehouse:getPos())))
    return safehouse
end

function getRandomAvailablePrecinct(location)
    local precincts = location.precincts
    local randomIndex = math.random(#precincts)
    for i = 1, #precincts do
        local precinct = precincts[randomIndex]
        if (precinct.primaryBuilding == _startingSafehouse) or (precinct.primaryBuilding == _secondaryStartingDepot) or (precinct._faction and not precinct._faction.isCitizenFaction) then
            randomIndex = (randomIndex == #precincts) and 1 or (randomIndex + 1)
        else
            return precinct
        end
    end
end

function assignLocation(faction)
    -- MOD: for referal, faction indexes are as follow (no idea why they aren't the same as the ward _ids?)
    -- Function must return a location index to then be used in the _exteriorLocations table
    -- index    / templateName      / name
    -- 1        / neighborhood_06   / $Little_Italy
    -- 2        / neighborhood_01   / $Loop
    -- 3        / neighborhood_04   / $Chinatown
    -- 4        / neighborhood_07   / $West_Loop_Gate
    -- 5        / neighborhood_02   / $South_Loop
    -- 6        / neighborhood_05   / $East_Pilsen
    -- 7        / neighborhood_10   / $Municipal_Pier
    -- 8        / neighborhood_08   / $Fulton_Market
    -- 9        / neighborhood_09   / $Near_North_Side
    -- 10       / neighborhood_03   / $Near_South_Side
    local factLocIdx
    if faction == WorldUtils:getFactionById("FACTION.THE_OUTFIT") then
        factLocIdx = 1
    elseif faction == WorldUtils:getFactionById("FACTION.VICE_KINGS") then
        factLocIdx = 2
    elseif faction == WorldUtils:getFactionById("FACTION.LOS_LUCEROS") then
        factLocIdx = 10
    elseif faction == WorldUtils:getFactionById("FACTION.THE_NORTHSIDE_MOB") then
        factLocIdx = 9
    elseif faction == WorldUtils:getFactionById("FACTION.LOS_HIJOS") then
        factLocIdx = 5
    elseif faction == WorldUtils:getFactionById("FACTION.THE_DONOVANS") then
        factLocIdx = 9
    elseif faction == WorldUtils:getFactionById("FACTION.SALTIS_MCERLANE") then
        factLocIdx = 6
    elseif faction == WorldUtils:getFactionById("FACTION.FORTUNE_TELLERS") then
        factLocIdx = 5
    elseif faction == WorldUtils:getFactionById("FACTION.RAGENS_COLTS") then
        factLocIdx = 2
    elseif faction == WorldUtils:getFactionById("FACTION.ALLEY_CATS") then
        factLocIdx = 7
    elseif faction == WorldUtils:getFactionById("FACTION.CARD_SHARKS") then
        factLocIdx = 10
    elseif faction == WorldUtils:getFactionById("FACTION.GENNA_CRIME_FAMILY") then
        factLocIdx = 1
    elseif faction == WorldUtils:getFactionById("FACTION.HIP_SING_TONG") then
        factLocIdx = 3
    elseif faction == WorldUtils:getFactionById("FACTION.WHITE_CITY_CIRCUS") then
        factLocIdx = 8
    elseif faction == WorldUtils:getFactionById("FACTION.MURDER_INC") then
        factLocIdx = 4
    else
        return nil
    end
    return factLocIdx
end

function assignSafehouses()
    fact.StartingLocationId = _playerStartLocation.id -- This is the player neighborhood (i.e., Loop, Little Italy, etc.)

    -- ExteriorLocations
    -- for i = 1, #_exteriorLocations do
    --      local location = _exteriorLocations[i]
    --      local precincts = location.precincts
    --      local numMatchingPrecincts = 0
    --      for p = 1, #precincts do
    --          local precinct = precincts[p]
    --          if (#(precinct.buildings) - 1) >= _initConfig.newGameMinPlayerPrecinctBuildings then
    --              numMatchingPrecincts = numMatchingPrecincts + 1
    --          end
    --          print("NumBuildings", precinct.id, (#precinct.buildings) - 1)
    --      end
    --      print("Matching Precincts", location.templateName, numMatchingPrecincts)
    --  end

    -- Select starting safehouse
    if Dev and Dev.perfTest then
        _startingSafehouse = ActorUtils:getActorFromLabel("PerfTestSafehouse")
        if not _startingSafehouse then
            throwException("Unable to find building with PerfTestSafeHouse label!")
        end
    else

        -- Filter the possible starting precincts
        local possibleStartingPrecincts = {}
        for i = 1, #_playerStartLocation.precincts do
            local precinct = _playerStartLocation.precincts[i]
            if (#precinct.buildings - 1) >= _initConfig.newGameMinPlayerPrecinctBuildings then
               possibleStartingPrecincts[#possibleStartingPrecincts + 1] = precinct
            end
        end


        if #possibleStartingPrecincts == 0 then
            throwException("Unable to find starting precincts that match constraints in location: " .. tostring(_playerStartLocation.templateName))
        end
        local startingIndex = math.random(#possibleStartingPrecincts)
        _startingSafehouse = possibleStartingPrecincts[startingIndex].primaryBuilding
        clearTable(possibleStartingPrecincts)
        local precinctNeighbors = _startingSafehouse:getPrecinct().neighbors
    end

    local startingPrecinct = _startingSafehouse:getPrecinct()

    _startingSafehouse:addLabel("StartingSafehouse")
    _startingSafehouse.pendingSetup = nil

    local numEnemyFactions = #_enemyFactions -- This relates to the chosen number when setting up a game (min 7, max 14)
    local numMinorFactions = #_minorFactions

    -- Select enemy safehouses
    local locationIndex = 1

    local remainingStartingLocationPrecincts = Clone.shallow(_playerStartLocation.precincts)
    TableUtils.iremove(remainingStartingLocationPrecincts, startingPrecinct)
    -- print("startingPrecinct", startingPrecinct.id, "remainingStartingLocationPrecincts", #remainingStartingLocationPrecincts)

    local nearbyThugPrecincts = {}
    local nearbyMinorPrecincts = {}
    local numMajorNeighbors = math.min(2, numEnemyFactions)
    local startingPrecinctNeighbors = Clone.shallow(startingPrecinct.neighbors)

    if #startingPrecinctNeighbors > 0 then
        -- Get thug neighbor
        local idx = math.random(#startingPrecinctNeighbors)
        local thugPrecinct = startingPrecinctNeighbors[idx]
        nearbyThugPrecincts[#nearbyThugPrecincts + 1] = thugPrecinct
        table.remove(startingPrecinctNeighbors, idx)
        TableUtils.iremove(remainingStartingLocationPrecincts, thugPrecinct)
        -- print("Added thug neighbor: ", thugPrecinct.id)

        if (#startingPrecinctNeighbors > 0) and (#remainingStartingLocationPrecincts > numMajorNeighbors) then
            -- Get minor faction neighbor
            idx = math.random(#startingPrecinctNeighbors)
            local nearbyMinorPrecinct = startingPrecinctNeighbors[idx]
            nearbyMinorPrecincts[#nearbyMinorPrecincts + 1] = nearbyMinorPrecinct
            table.remove(startingPrecinctNeighbors, idx)
            TableUtils.iremove(remainingStartingLocationPrecincts, nearbyMinorPrecinct)
            -- print("Added minor faction neighbor: ", nearbyMinorPrecinct.id)
        end

        -- Maybe fill remaining with other thugs (may need to be careful here that there is still room for other major factions)
        while (#startingPrecinctNeighbors > 0) and (#remainingStartingLocationPrecincts > numMajorNeighbors) do
            thugPrecinct = startingPrecinctNeighbors[1]
            nearbyThugPrecincts[#nearbyThugPrecincts + 1] = thugPrecinct
            table.remove(startingPrecinctNeighbors, 1)
            TableUtils.iremove(remainingStartingLocationPrecincts, thugPrecinct)
            -- print("Added remaining thug neighbor: ", thugPrecinct.id)
        end
    end

    local remainingEnemyFactions = Clone.shallow(_enemyFactions)
    -- print("remainingStartingLocationPrecincts", #remainingStartingLocationPrecincts)

    local rivalFactionPrecincts = {}
    if #_enemyFactions ~= 14 then -- Mod: if using 14 factions and assigning them manually, no need to have rival factions in player precinct
        print("#_enemyFactions: ", #_enemyFactions)
        -- Put rivals in player precinct
        print("#numMajorNeighbors: ", numMajorNeighbors)
        for i = 1, numMajorNeighbors do
            local rivalFactionIdx = math.random(#remainingEnemyFactions)
            local rivalFaction = remainingEnemyFactions[rivalFactionIdx]
            table.remove(remainingEnemyFactions, rivalFactionIdx)

            local idx = math.random(#remainingStartingLocationPrecincts)
            local rivalPrecinct = remainingStartingLocationPrecincts[idx]
            table.remove(remainingStartingLocationPrecincts, idx)
            print("rivalPrecinct: ", rivalPrecinct)
            rivalFactionPrecincts[rivalFaction.configId] = rivalPrecinct
            -- print("Added rival faction precinct: ", rivalPrecinct.id, rivalFaction.configId)
        end

        -- Assign rival precincts (this relates to factions in player chosen ward/neighborhood)
        for i = 1, #_enemyFactions do
            local enemyFaction = _enemyFactions[i]
            print("enemyFaction: ", enemyFaction)
            local rivalPrecinct = rivalFactionPrecincts[enemyFaction.configId]
            print("rivalFactionPrecincts: ", rivalFactionPrecincts)
            if rivalPrecinct then
                -- print("Assigning rival precinct", i, enemyFaction.configId, _playerStartLocation.templateName, rivalPrecinct.id)
                _enemySafehouses[i] = assignPrecinctToFaction(enemyFaction, rivalPrecinct)
            end
        end
    end

    -- Assign close minor factions
    local curMinorFactionIdx = 1
    print(#nearbyMinorPrecincts, #_minorFactions)
    for i = 1, math.min(#nearbyMinorPrecincts, #_minorFactions) do
        local nearbyPrecinct = nearbyMinorPrecincts[i]
        local faction = _minorFactions[curMinorFactionIdx]
        -- print("Assigning close minor faction", faction.configId, _playerStartLocation.templateName, nearbyPrecinct.id)
        _minorFactionSafehouses[curMinorFactionIdx] = assignPrecinctToFaction(faction, nearbyPrecinct)
        curMinorFactionIdx = curMinorFactionIdx + 1
    end

    for i = 1, #_enemyFactions do
        local enemyFaction = _enemyFactions[i]
        -- Ignore close rivals we already assigned
        print("rivalFactionPrecincts: ", rivalFactionPrecincts)
        if #_enemyFactions == 14 or not rivalFactionPrecincts[enemyFaction.configId] then -- Mod (if using 14 factions, there are no rivals)
            local precinct
            -- MOD ; for now I do not feel comfortable altering the logic for less than all the factions: only activate mod logic if max factions selected
            if #_enemyFactions == 14 then
                local tempLocIndex = assignLocation(enemyFaction)
                local location = _exteriorLocations[tempLocIndex]
                precinct = getRandomAvailablePrecinct(location)
                if precinct then
                    _enemySafehouses[i] = assignPrecinctToFaction(enemyFaction, precinct)
                end
            else
                for l = 1, #_exteriorLocations do
                    local location = _exteriorLocations[locationIndex] -- Locations are neighborhoods/wards (e.g., South Loop, Chinatown, etc.)
                    locationIndex = (locationIndex == #_exteriorLocations) and 1 or (locationIndex + 1)
                    if _playerStartLocation.id ~= location.id then
                        precinct = getRandomAvailablePrecinct(location)
                        if precinct then
                            -- print("Assigning enemy precinct", i, enemyFaction.configId, location.templateName, precinct.id)
                            _enemySafehouses[i] = assignPrecinctToFaction(enemyFaction, precinct)
                            break
                        end
                    end
                end
            end
            if not precinct then -- Should remove when mod active?
                precinct = getRandomAvailablePrecinct(_playerStartLocation)
                if precinct then
                    -- print("Assigning enemy precinct in player location", i, enemyFaction.configId, _playerStartLocation.templateName, precinct.id)
                    _enemySafehouses[i] = assignPrecinctToFaction(enemyFaction, precinct)
                else
                    logError("wasn't able to find a precinct for a major faction")
                end
            end
        end
    end
    local removeMinorFactions
    for i = curMinorFactionIdx, numMinorFactions do
        local precinct
        for l = 1, #_exteriorLocations do
            local location = _exteriorLocations[locationIndex]
            locationIndex = (locationIndex == #_exteriorLocations) and 1 or (locationIndex + 1)
            if _playerStartLocation.id ~= location.id then
                precinct = getRandomAvailablePrecinct(location)
                if precinct then
                    local faction = _minorFactions[i]
                    -- print("Assigning minor faction", faction.configId, location.templateName, precinct.id)
                    _minorFactionSafehouses[i] = assignPrecinctToFaction(faction, precinct)
                    break
                end
            end
        end
        if not precinct then
            removeMinorFactions = i
            break
        end
    end

    if removeMinorFactions then
        for i = removeMinorFactions, numMinorFactions do
            local minorFaction = _minorFactions[i]
            WorldUtils:removeFactionFromCurrentGame(minorFaction)
            _minorFactions[i] = nil
        end
    end

    -- Set the rest of the precincts to be taken over by thugs
    for _, neighborhood in next, _exteriorLocations do
        for _, precinct in next, neighborhood.precincts do
            if precinct.faction.isCitizenFaction then
                local depot = precinct.primaryBuilding
                if (depot ~= _startingSafehouse) and (depot ~= _secondaryStartingDepot) then
                    depot:setOwnerId(_ankleBitersFaction.configId)
                    depot:equipBuildingAs("BUILDING_DATA.DERELICT")
                    depot.name = WorldUtils:pickRandomRacketName("BUILDING_DATA.DERELICT")
                    _ankleBitersFaction:addNewGameBuilding(depot)
                    precinct:transferPrecinct(_ankleBitersFaction, true)
                end
            end
        end
    end

    -- Check all precincts have a faction!
    for _, neighborhood in next, _exteriorLocations do
        for _, precinct in next, neighborhood.precincts do
            if not precinct._faction then
                local depot = precinct.primaryBuilding
                if (depot ~= _startingSafehouse) and (depot ~= _secondaryStartingDepot) then
                    logError("Found precinct with no faction!", precinct.name)
                end
            end
        end
    end
end

function getAvailableRackets(location)
    if not _availableRacketsByLocationId[location.id] then
        _availableRacketsByLocationId[location.id] = WorldUtils:getLocationRackets(location)
    end
    return _availableRacketsByLocationId[location.id]
end

function updateAssignRackets()
    if _assignRacketsPhase == "Start" then

        -- Reserve rackets near the starting safehouse for the player/tutorial

        local availableStartLocationRackets = _startingSafehouse:getPrecinct().racketBuildings
        local reservedRacketRadius = 25
        local reservedRacketRadiusSq = reservedRacketRadius * reservedRacketRadius
        local safeHousePos = _startingSafehouse:getInteractionPos()
        local Vector2_DistanceSquared = Vector2.DistanceSquared

        local sortedRackets = Clone.shallow(availableStartLocationRackets)
        table.sort(sortedRackets, function(a, b)
            local sizeDiff = b.size - a.size
            if sizeDiff ~= 0 then
                return a.size < b.size
            end
            local racketPosA = a:getInteractionPos()
            local distSqA = Vector2_DistanceSquared(racketPosA, safeHousePos)

            local racketPosB = b:getInteractionPos()
            local distSqB = Vector2_DistanceSquared(racketPosB, safeHousePos)

            return distSqA < distSqB
        end)

        local closestRacket = sortedRackets[1]
        local secondClosestRacket = sortedRackets[2]
        closestRacket:addLabel("StartingClosestRacket")
        secondClosestRacket:addLabel("StartingSecondClosestRacket")

        _assignRacketsPhase = "AssignToEnemyFactions"
        return false

    elseif _assignRacketsPhase == "AssignToEnemyFactions" then

        -- Assign rackets to each enemy faction
        for i = 1, #_enemyFactions do
            local faction = _enemyFactions[i]
            local safehouse = _enemySafehouses[i]
            if safehouse:getPrecinct().faction ~= faction then
                logError("safehouse faction does not match faction!")
            end
            local availableRackets = safehouse:getPrecinct().racketBuildings
            assignRacketsToFaction(availableRackets, faction, #availableRackets)
        end

        _assignRacketsPhase = "AssignToMinorFactions"
        return false

    elseif _assignRacketsPhase == "AssignToMinorFactions" then

        for i = 1, #_minorFactions do
            local faction = _minorFactions[i]
            local safehouse = _minorFactionSafehouses[i]
            local availableRackets = safehouse:getPrecinct().racketBuildings
            assignRacketsToFaction(availableRackets, faction, 3)
        end

        _assignRacketsPhase = "AssignToThugFactions"
        return false

    elseif _assignRacketsPhase == "AssignToThugFactions" then

        local thugFaction = WorldUtils:thugFaction()
        local thugPrecincts = thugFaction.ownedPrecincts
        for _, locationEntry in next, thugPrecincts do
            for _, precinct in next, locationEntry do
                assignThugPrecinctRackets(thugFaction, precinct)
            end
        end
        _assignRacketsPhase = "Complete"
        return true
    else
        logError("Invalid assign rackets phase:", _assignRacketsPhase)
        return true
    end
end

function updateAssignStartingSquads()
    local numStartingSquads = Config.DEFAULTS.AI.numStartingSquads
    local startingSquadWeeklyCostLimit = Config.DEFAULTS.AI.startingSquadWeeklyCostLimit
    if not _assignStartingSquadIndex then
        _assignStartingSquadIndex = 1
        _startingSquadFactions = {}
        for _, faction in next, _enemyFactions do
            _startingSquadFactions[#_startingSquadFactions + 1] = faction
        end
    end
    local faction = _startingSquadFactions[_assignStartingSquadIndex]
    if faction then
        for i = 1, numStartingSquads do
            -- Select affordable starting squads
            local desiredPower = FactionAI:getPreferredSquadPower(faction, 100000, startingSquadWeeklyCostLimit) or 1
            local squadType = FactionAI:getPreferredSquadType(faction) or "Balanced"
            local squadToPurchase = faction.squads:createSquadForPurchase(desiredPower, squadType)
            if not squadToPurchase then
                logError("Unable to assign starting squad", squadType, desiredPower, faction.configId)
            else
                -- print("assigning startingSquad", faction.configId, squadType, desiredPower)
                faction.squads:populateSquadFromMemberDefinitions(squadToPurchase)
            end
        end
    end
    _assignStartingSquadIndex = _assignStartingSquadIndex + 1
    if _assignStartingSquadIndex > #_startingSquadFactions then
        return true
    else
        return false
    end
end

function setupDepot(faction, depot)

    depot:clearBuilding(false)
    if faction.isMinorFaction then
        depot:equipBuildingAs("BUILDING_DATA.DEPOT")
    else
        depot:equipBuildingAs("BUILDING_DATA.SAFEHOUSE")
    end
    depot.pendingSetup = nil
    faction:addNewGameBuilding(depot)
    depot:registerAsProximityTarget()
    if not faction.isMinorFaction then
        faction:setStartingSafehouse(depot)
    end

    local difficulty = WorldUtils:getWorldDifficulty()
    local specialItems = _initConfig.safehouseSpecialItems
    local count = #specialItems
    if count > 0 then
        for i = 1, math.min(count, math.random(2, 5)) do
            local itemIndex = math.random(count)
            local itemId = specialItems[itemIndex]
            specialItems[itemIndex] = specialItems[#specialItems]
            specialItems[#specialItems] = nil
            local item = Utils:createNewItem(itemId)
            faction.inventory:addItem(item)
            count = count -1
        end
    end
    if not faction.isPlayerFaction and not faction.isMinorFaction and not depot.hasLabel("StartingSafehouse") then
        local securityUpgrades = depot.upgrades and depot.upgrades:getUpgradeOfType("security")
        if not securityUpgrades then
            logError("Could not find security upgrades on safehouse for faction", faction.configId)
        else
            -- logInfo("Setting up security on safehouse for", faction.configId)
            securityUpgrades:setLevel(Config.DEFAULTS.AI.startingSafehouseSecurityLevel[difficulty])
        end
    end
    _buildingsWithGuards[#_buildingsWithGuards + 1] = depot
end

function assignInformation()
    local initialLearningRange = Config.DEFAULTS.AI.initialLearningRange
    for i = 1, #_enemyFactions do
        local faction = _enemyFactions[i]
        local enemySafehouse = _enemySafehouses[i]
        local location = WorldUtils:getLocationFromId(enemySafehouse.locationId)
        local buildings = location.buildings

        for j = 1, #buildings do
            local building = buildings[j]
            if (building ~= _startingSafehouse) then
                local _, distance = WorldUtils:getActorDistance(building, enemySafehouse)
                if distance <= initialLearningRange then
                    faction:learnAbout(building)
                end
            end
        end
    end
end

function assignRPCToFaction(faction, rpcCache, randomizedOrder)
    local safehouse = faction:getPrimarySafehouse()
    if not safehouse then return end

    local idx = table.remove(randomizedOrder, #randomizedOrder)
    local rpc = ActorUtils:getActorFromId(rpcCache[idx])

    while rpc and (rpc:hasState("Employed") or rpc:hasState("Excluded") or rpc.isImportant) do
        idx = table.remove(randomizedOrder, #randomizedOrder)
        rpc = ActorUtils:getActorFromId(rpcCache[idx])
    end

    if rpc == nil then
        logError("Not enough RPCs. What did you do?")
        return
    end

    faction:hireRPC(rpc, nil, nil, 0)

    local minDist = 4
    local maxDist = 30
    local locationId = safehouse.interiorLocationId
    local targetLocation = WorldUtils:getLocationFromId(locationId)
    local entranceStation = targetLocation.locationAI:findFreeStation(nil, nil, "ENTRANCE")
    rpc:enterInteriorNear(locationId, entranceStation.pos, entranceStation.rot, minDist, maxDist)
end

function updateSetupGame()

    if rgperf then rgperf.pushMarker("newGame.updateSetupGame " .. _setupGamePhase) end

    if _setupGamePhase == "Start" then

        if Utils:isDLC4Active() then
            table.insert(_racketTypeSelectionBuffer, {0, "BUILDING_DATA.LOAN_SHARK"})
        end

        math.randomseed(generatorSeed)
        logGameInfo("NewGame", string.format("Generating new game using seed: %d", generatorSeed))

        _exteriorLocations = WorldUtils:getExteriorLocations()
        _initConfig = WorldUtils:getInitConfig()
        _playerStartLocation = WorldUtils:getPlayerStartLocation()
        if not _playerStartLocation then
            _playerStartLocation = _exteriorLocations[math.random(#_exteriorLocations)]
        end
        _playerFaction = WorldUtils:getPlayerFaction()
        _playerFaction.factionAI:setupPersonality("FACTIONAI_PERSONALITIES.MINOR_FACTION", true)
        _littleBossFaction = WorldUtils:getFactionById(fact.LittleBossFactionId)
        _littleBossFaction.factionAI:setupPersonality("FACTIONAI_PERSONALITIES.MINOR_FACTION")
        _enemyFactions = WorldUtils:getRivalFactions()
        _minorFactions = WorldUtils:getCurrentMinorFactions()
        _lawEnforcementFactions = WorldUtils:getCurrentLawEnforcementFactions()

        _ankleBitersFaction = WorldUtils:getFactionById(fact.AnkleBitersFactionId)
        local cmaFaction = WorldUtils:getFactionById("FACTION.CANADIAN_MAPLE_ASSOCIATION")

        -- Add player specific behaviours
        _playerFaction.boss:addState("PlayerBoss")

        -- Remove the ankle biters, and little boss since we want to handle them specifically
        TableUtils.iremove(_enemyFactions, _ankleBitersFaction)
        TableUtils.iremove(_enemyFactions, _littleBossFaction)
        TableUtils.iremove(_enemyFactions, cmaFaction)

        -- cmaFaction.factionAI:setupPersonality("cma")

        -- WorldUtils:addInvisibleProducer(cmaFaction, 4, 2, 300, 50)
        -- WorldUtils:addInvisibleProducer(cmaFaction, 5, 1.5, 200, 50)
        -- WorldUtils:addInvisibleProducer(cmaFaction, 6, 1, 100, 50)

        local totalPrecinctCount = 0
        for _, location in next, _exteriorLocations do
            totalPrecinctCount = totalPrecinctCount + #location.precincts
        end

        local estimatedRemainingPrecinctCount = totalPrecinctCount
        estimatedRemainingPrecinctCount = estimatedRemainingPrecinctCount - 2 -- Player / Tutorial Precincts
        estimatedRemainingPrecinctCount = estimatedRemainingPrecinctCount - #_enemyFactions

        local numMinorFactions = math.max(0, math.floor(estimatedRemainingPrecinctCount * _initConfig.newGameMinorFactionRatio))
        estimatedRemainingPrecinctCount = estimatedRemainingPrecinctCount - numMinorFactions

        local numEnemyFactions = #_enemyFactions
        if estimatedRemainingPrecinctCount < 0 then
            numEnemyFactions = numEnemyFactions + estimatedRemainingPrecinctCount
        end
        -- print("totalPrecinctCount", totalPrecinctCount)
        -- print("estimatedRemainingPrecinctCount", estimatedRemainingPrecinctCount)
        -- print("numEnemyFactions", numEnemyFactions)
        -- print("numMinorFactions", numMinorFactions)
        -- print("Remaining thug precincts", estimatedRemainingPrecinctCount)

        for i = #_minorFactions, numMinorFactions + 1, -1 do
            local minorFaction = _minorFactions[i]
            WorldUtils:removeFactionFromCurrentGame(minorFaction)
            _minorFactions[i] = nil
        end

        for i = #_enemyFactions, numEnemyFactions + 1, -1 do
            local enemyFaction = _enemyFactions[i]
            -- print("Removing enemy faction", i, enemyFaction.configId)
            WorldUtils:removeFactionFromCurrentGame(enemyFaction)
            _enemyFactions[i] = nil
        end

        for _, faction in next, _enemyFactions do
            faction.factionAI:setupPersonality(faction:getDefaultNewPersonalityId())
            -- faction.cash:add(1000000) -- Todo: remove when the AI is more balanced
        end

        for _, faction in next, _minorFactions do
            faction.factionAI:setupPersonality(faction:getDefaultNewPersonalityId())
        end

        for _, faction in next, _lawEnforcementFactions do
            faction.factionAI:setupPersonality(faction:getDefaultNewPersonalityId())
        end

        -- All gangs know about the basic factions, Police, Citizens..etc
        local currentGameFactions = WorldUtils:getCurrentGameFactions()
        local independentFaction = WorldUtils:independentFaction()
        for _, f1 in next, currentGameFactions do
            if not (f1.isGang and f1.bossId) and not f1.isMinorFaction then
                for _, f2 in next, currentGameFactions do
                    f2:learnAbout(f1)
                end
            end
            f1:learnAbout(independentFaction)
        end

        _setupGamePhase = "AssignSafehouses"
        if rgperf then rgperf.popMarker() end
        return false

    elseif _setupGamePhase == "AssignSafehouses" then

        assignSafehouses()
        _setupGamePhase = "AssignRackets"
        if rgperf then rgperf.popMarker() end
        return false

    elseif _setupGamePhase == "AssignRackets" then

        if updateAssignRackets() then
            _curBuildingsWithGuardsIndex = 1
            _setupGamePhase = "SpawnBuildingGuards"
        end
        if rgperf then rgperf.popMarker() end
        return false

    elseif _setupGamePhase == "SpawnBuildingGuards" then
        if _curBuildingsWithGuardsIndex <= #_buildingsWithGuards then
            local building = _buildingsWithGuards[_curBuildingsWithGuardsIndex]
            building.upgrades:forceAdd() -- Do this to make the guards spawn in this frame (so they don't all spawn at once later)
            _curBuildingsWithGuardsIndex = _curBuildingsWithGuardsIndex + 1
            if _curBuildingsWithGuardsIndex > #_buildingsWithGuards then
                _setupGamePhase = "AssignStartingSquads"
            end
        else
            _setupGamePhase = "AssignStartingSquads"
        end
        if rgperf then rgperf.popMarker() end
        return false

    elseif _setupGamePhase == "AssignStartingSquads" then

        if updateAssignStartingSquads() then
            _setupGamePhase = "AssignInformation"
        end
        if rgperf then rgperf.popMarker() end
        return false

    elseif _setupGamePhase == "AssignInformation" then

        assignInformation()

        --stop any gangsters needed for boss missions from being hired
        MissionUtils:setUpGangstersForBossMissions()

        local rpcCache = {}
        local function filterFunction(rpc)
            return rpc.tier >= 2 -- Mod: enemy factions can hire higher tier RPCs
        end
        Character:getAllRPCs(rpcCache, filterFunction)
        local rpcCount = #rpcCache
        local randomizedOrder = math.chooseNumbers(rpcCount, rpcCount)

        for _, faction in next, _enemyFactions do
            assignRPCToFaction(faction, rpcCache, randomizedOrder)
        end
        assignRPCToFaction(_littleBossFaction, rpcCache, randomizedOrder)

        Utils:raiseGameEvent("onNewGameSetupComplete")

        _setupGamePhase = "Complete"
        if rgperf then rgperf.popMarker() end
        return true

    else
        logError("Invalid _setupGamePhase", _setupGamePhase)
        if rgperf then rgperf.popMarker() end
        return true
    end
end
