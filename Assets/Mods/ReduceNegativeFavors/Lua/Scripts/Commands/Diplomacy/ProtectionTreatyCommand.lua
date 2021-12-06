--$$ Diplomacy
-- ------------------------------------------------------
-- COMMAND: OFFER PROTECTION
-- ------------------------------------------------------
_namespace = "COMMAND"
_id = "OFFER_PROTECTION"
_includes = "BASE_FACTION_COMMAND"
_command = "OfferProtection"
_aiDecision = "protectionOffered"

name = "$OfferProtection" --$ Offer 6 months Protection for {0:C0} weekly
icon = "Sprites/Diplomacy/Icon_Protector"
tooltipDescription = "$TOOLTIPS_DiplomacyScreen_OfferProtection_Description_text"
amount = 0

function getProtectionAmount()
    local min = Config.DIPLOMATIC_STATES.PROTECTION_TREATY.minimumProtectionMoney
    amount = math.max(min, thisObject:getNetIncome() * 0.1)
    return amount
end

function getName()
    return name, getProtectionAmount()
end

function isVisible()
    return not thisObject.diplomacy:hasState("PROTECTION_TREATY", otherObject)
        and not thisObject.diplomacy:hasState("DEFENSE_AGREEMENT", otherObject)
end

function isValid()
    if thisObject.diplomacy:isProtected() then
        return false
    end
    if thisObject.isPlayerFaction then -- Only the AI will use this
        local sharedSensor = otherObject.factionAI.sharedFactionAI.sharedSensor
        local lastTimeRequested = sharedSensor.lastPlayerDiplomaticRequestTimestamps["OFFER_PROTECTION"] or 0
        local timeout = Utils:convertDuration(7, "Days", "Seconds")
        local skipOnDevRequest
        if Dev then
            skipOnDevRequest = Dev.forceOfferProtectionInProgress
        end

        if lastTimeRequested + timeout > worldTime then
            if not skipOnDevRequest then
                return false
            end
        end
        local lastTimeFactionRequested = otherObject.factionAI.aiSensor.lastPlayerDiplomaticRequestTimestamps["OFFER_PROTECTION"] or 0
        if lastTimeFactionRequested + (timeout * 4) > worldTime then
            if not skipOnDevRequest then
                return false
            end
        end
    end
    return isVisible()
        and (not thisObject.diplomacy:isAtWar())
        and (not otherObject.diplomacy:isAtWar())
end

function populateTooltip(tooltip)
    tooltip:setTitle(getName(otherObject))
    tooltip:setIcon(getIcon(otherObject))
    tooltip:setIconColor("gold")
     -- Not valid
    if not isValid() then
        tooltip:setSubtitle("$Format_Color", "stateInvalid", "$InvalidAction")
        if otherObject.diplomacy:isAtWar() then
            tooltip:addData("$InvalidAction_YouAreAtWar")
        elseif thisObject.diplomacy:isAtWar() then
            tooltip:addData("$InvalidAction_TheyAreAtWar")
        elseif thisObject.diplomacy:isProtected() then
            for protectionTreaty in thisObject.diplomacy:iterateOverInterfaces("PROTECTION_TREATY") do
                if protectionTreaty.protected == thisObject then
                    tooltip:addData({"$InvalidAction_OfferAlreadyProtected", protectionTreaty.protector.name}) --$ Already protected by {0}
                    break
                end
            end
        end
    else -- Show Decision
        populateAIDecisionTooltip(tooltip)
    end

    tooltip:setDescription(tooltipDescription)
end

function dispatchPlayerMessage()
    amount = getProtectionAmount()
    WorldUtils:triggerEvent("OfferProtectionToPlayer", "offeringFaction", otherObject, "cost", amount)
    local sharedSensor = otherObject.factionAI.sharedFactionAI.sharedSensor
    sharedSensor.lastPlayerDiplomaticRequestTimestamps["OFFER_PROTECTION"] = worldTime
    local aiSensor = otherObject.factionAI.aiSensor
    aiSensor.lastPlayerDiplomaticRequestTimestamps["OFFER_PROTECTION"] = worldTime
end

function getDecisionParams()
    return _aiDecision, "otherFaction", otherObject, "cashRequested", getProtectionAmount()
end

function makeAIDecision()
    return thisObject.factionAI:makeDecision(getDecisionParams())
end

function getAcceptMessageParams()
    return {
        title = "$OfferProtectionTitle", --$ Protection Offer Accepted
        text = "$OfferProtectionText", --$ "I'll gladly take your protection."
        image = thisObject.icon,
        wide = true,
    }
end

function getRejectMessageParams(reason)
    return {
        title = "$RejectProtectionOfferTitle", --$ Protection Offer Rejected
        text = reason,
        image = thisObject.icon,
        wide = true,
    }
end

function onFactionAccept()
    local protector = otherObject
    local protected = thisObject
    logGameInfo("FactionAI", string.format("%s is now protecting %s.", protector.configId, protected.configId))
    WorldUtils:declareProtectionTreaty(protector, protected, getProtectionAmount())
end

function onFactionReject()
    local protector = otherObject
    local protected = thisObject
    protector.rating:applyEffect(protected, "REJECTED_OFFER")
    WorldUtils:addActionHistory(protected, {"$RefusedProtectionOffer", protector}) --$ Refused protection offer from {0:name}
    WorldUtils:addActionHistory(protector, {"$TheyRefusedProtectionOffer", protected}) --$ {0:name} refused their protection offer
    WorldUtils:addWorldHistory({"$RefusedProtectionOffer_ThirdParty", protected, protector}, "negative") --$ {0:name} has refused a protection offer from {1:name}
end

function notifyPlayerOfResult(accepted)
    if accepted ~= false then
        local protector = otherObject
        local protected = thisObject
        WorldUtils:triggerPlayerNotification("Default", "RivalFactionProtectionTreaty", {protector.name, protected.name})
    end
end

-- ------------------------------------------------------
-- COMMAND: REQUEST PROTECTION
-- ------------------------------------------------------
_id = "REQUEST_PROTECTION"
_includes = "BASE_FACTION_COMMAND"
_command = "RequestProtection"

name = "$RequestProtection" --$ Request 6 months Protection for {0:C0} weekly
icon = "Sprites/Diplomacy/Icon_Protected"
amount = 0
_aiDecision = "protectionRequested"
tooltipDescription = "$TOOLTIPS_DiplomacyScreen_RequestProtectionPact_Description_text"

function getProtectionAmount()
    local min = Config.DIPLOMATIC_STATES.PROTECTION_TREATY.minimumProtectionMoney
    amount = math.max(min, otherObject:getNetIncome() * 0.1)
    return amount
end

function getName()
    return name, getProtectionAmount()
end

function isVisible()
    return not thisObject.diplomacy:hasState("PROTECTION_TREATY", otherObject)
        and not thisObject.diplomacy:hasState("DEFENSE_AGREEMENT", otherObject)
        and (thisObject.isGang)
        and (not thisObject:isDead())
end

function isValid()
    if otherObject.diplomacy:isProtected() then
        return false
    end

    if thisObject.isPlayerFaction then -- Only the AI will use this
        local sharedSensor = otherObject.factionAI.sharedFactionAI.sharedSensor
        local lastTimeRequested = sharedSensor.lastPlayerDiplomaticRequestTimestamps["REQUEST_PROTECTION"] or 0
        local timeout = Utils:convertDuration(7, "Days", "Seconds")
        local skipOnDevRequest
        if Dev then
            skipOnDevRequest = Dev.forceRequestProtectionInProgress
        end
        if lastTimeRequested + timeout > worldTime then
            if not skipOnDevRequest then
                return false
            end
        end
        local lastTimeFactionRequested = otherObject.factionAI.aiSensor.lastPlayerDiplomaticRequestTimestamps["REQUEST_PROTECTION"] or 0
        if lastTimeFactionRequested + (timeout * 4) > worldTime then
            if not skipOnDevRequest then
                return false
            end
        end
    end
    return isVisible()
        and (not thisObject.diplomacy:isAtWar())
        and (not otherObject.diplomacy:isAtWar())
end

function populateTooltip(tooltip)
    tooltip:setTitle(getName(otherObject))
    tooltip:setIcon(getIcon(otherObject))
    tooltip:setIconColor("gold")
     -- Not valid
    if not isValid() then
        tooltip:setSubtitle("$Format_Color", "stateInvalid", "$InvalidAction")
        if otherObject.diplomacy:isAtWar() then
            tooltip:addData("$InvalidAction_YouAreAtWar")
        elseif thisObject.diplomacy:isAtWar() then
            tooltip:addData("$InvalidAction_TheyAreAtWar")
        elseif otherObject.diplomacy:isProtected() then
            local protector
            for protectionTreaty in otherObject.diplomacy:iterateOverInterfaces("PROTECTION_TREATY") do
                if protectionTreaty.protected == otherObject then
                    tooltip:addData({"$InvalidAction_RequestAlreadyProtected", protectionTreaty.protector.name}) --$ You are already protected by {0}
                    break
                end
            end
        end
    else -- Show Decision
        populateAIDecisionTooltip(tooltip)
    end

    tooltip:setDescription(tooltipDescription)
end

function dispatchPlayerMessage()
    local cost = getProtectionAmount()
    WorldUtils:triggerEvent("RequestProtectionFromPlayer", "offeringFaction", otherObject, "cost", cost)
    local sharedSensor = otherObject.factionAI.sharedFactionAI.sharedSensor
    sharedSensor.lastPlayerDiplomaticRequestTimestamps["REQUEST_PROTECTION"] = worldTime
    local aiSensor = otherObject.factionAI.aiSensor
    aiSensor.lastPlayerDiplomaticRequestTimestamps["REQUEST_PROTECTION"] = worldTime
end

function getDecisionParams()
    local cost = getProtectionAmount()
    return _aiDecision, "otherFaction", otherObject, "cashOffered", cost
end

function makeAIDecision()
    return thisObject.factionAI:makeDecision(getDecisionParams())
end

function getAcceptMessageParams()
    return {
        title = "$RequestProtectionTitle", --$ Protection Request Accepted
        text = "$RequestProtectionText", --$ "Alright, I'll protect you."
        image = thisObject.icon,
        wide = true,
    }
end

function getRejectMessageParams(reason)
    return {
        title = "$RejectProtectionRequestTitle", --$ Protection Request Rejected
        text = reason,
        image = thisObject.icon,
        wide = true,
    }
end

function onFactionAccept()
    local protector = thisObject
    local protected = otherObject
    logGameInfo("FactionAI", string.format("%s is now protecting %s.", protector.configId, protected.configId))
    WorldUtils:declareProtectionTreaty(protector, protected, getProtectionAmount())
end

function onFactionReject()
    local protector = thisObject
    local protected = otherObject
    protected.rating:applyEffect(protector, "FAVOR_REJECTED")
    WorldUtils:addActionHistory(protector, {"$RefusedProtectionRequest", protected}) --$ Refused protection request from {0:name}
    WorldUtils:addActionHistory(protected, {"$TheyRefusedProtectionRequest", protector}) --$ {0:name} refused their protection request
    WorldUtils:addWorldHistory({"$RefusedProtectionRequest_ThirdParty", protector, protected}, "negative") --$ {0:name} has refused a protection request from {1:name}
end

function notifyPlayerOfResult(accepted)
    if accepted ~= false then
        local protector = thisObject
        local protected = otherObject
        WorldUtils:triggerPlayerNotification("Default", "RivalFactionProtectionTreaty", {protector.name, protected.name})
    end
end

-- ------------------------------------------------------
-- COMMAND: STOP PROTECTING
-- ------------------------------------------------------
_id = "STOP_PROTECTING"
_includes = "BASE_FACTION_COMMAND"
_command = "StopProtecting"

name = "$StopProtecting" --$ Stop Protecting
icon = "Sprites/Diplomacy/Icon_StopProtection_128"

function isVisible()
    return otherObject.diplomacy:isProtectingFaction(thisObject)
end

function isValid()
    return isVisible()
end

function getNeedsConfirmation()
    return otherObject.isPlayerFaction
end

function getConfirmationParams()
    local protectionTreaty = otherObject.diplomacy:getStateInterface("PROTECTION_TREATY", thisObject)
    return
    {
        title = "$StopProtecting",
        text = {"$StopProtectingText", thisObject.name, protectionTreaty.weeklyAmount }, --$ Stop protecting {0}? You are receiving {1:C0} from them every week for your protection.
        image = thisObject.icon,
        wide = true,
    }
end

function dispatchPlayerMessage()
    WorldUtils:triggerEvent("StopProtectingPlayer", "otherFaction", otherObject)
end

function getResponseParams()
    return {
        title = "$StopProtecting_Response_Title", --$ Protection Guarantee Revoked
        text = "$StopProtecting_Response_Text", --$ "What? I don't understand? I thought you had my back..."
        image = thisObject.icon,
        wide = true,
    }
end

function onApplyResult()
    local treaty = otherObject.diplomacy:getStateInterface("PROTECTION_TREATY", thisObject)
    treaty:breakProtectionTreaty(otherObject)
end

function notifyPlayerOfResult(accepted)
    if accepted ~= false then
        WorldUtils:triggerPlayerNotification("Default", "RivalBreaksProtectionTreaty", {otherObject.name, thisObject.name})
    end
end

-- ------------------------------------------------------
-- COMMAND: REJECT PROTECTION
-- ------------------------------------------------------
_id = "REJECT_PROTECTION"
_includes = "BASE_FACTION_COMMAND"
_command = "RejectProtection"

name = "$RejectProtection" --$ Reject Protection
icon = "Sprites/Diplomacy/Icon_RejectProtection_128"

function isVisible()
    return otherObject.diplomacy:isProtectedByFaction(thisObject)
end

function isValid()
    return isVisible()
end

function getNeedsConfirmation()
    return otherObject.isPlayerFaction
end

function getConfirmationParams()
    local protectionTreaty = otherObject.diplomacy:getStateInterface("PROTECTION_TREATY", thisObject)
    return
    {
        title = "$RejectProtection",
        text = {"$RejectProtectionText", thisObject.name, protectionTreaty.weeklyAmount }, --$ Reject protection from {0}? You are paying them {1:C0} every week for their protection.
        image = thisObject.icon,
        wide = true,
    }
end

function dispatchPlayerMessage()
    WorldUtils:triggerEvent("RejectProtectionFromPlayer", "otherFaction", otherObject)
end

function getResponseParams()
    return {
        title = "$RejectProtection_Response_Title", --$ Protection Rejected
        text = "$RejectProtection_Response_Text", --$ "You've just made a serious mistake."
        image = thisObject.icon,
        wide = true,
    }
end

function onDisplay()
    local boss = otherObject.boss
    if boss then
        Utils:playCharacterSound( boss, "onThreatReact" )
    end
end

function onApplyResult()
    local treaty = otherObject.diplomacy:getStateInterface("PROTECTION_TREATY", thisObject)
    treaty:breakProtectionTreaty(otherObject)
end

function notifyPlayerOfResult(accepted)
    if accepted ~= false then
        WorldUtils:triggerPlayerNotification("Default", "RivalBreaksProtectionTreaty", {thisObject.name, otherObject.name})
    end
end

-- -----------------------------------
_namespace = "WORLD_EVENTS"
_id = "OFFER_PROTECTION_TO_PLAYER"
_includes = "BASE_AI_MESSAGE_EVENT"
_event = "OfferProtectionToPlayer"

persist{}
offeringFaction = nil
persist{}
cost = nil

function getAIFaction()
    return offeringFaction
end

function GameEvent.onPlayerAllianceDeclared(e)
    if e.with == offeringFaction then
        getCommand():complete(offeringFaction)
        complete()
    end
end

function GameEvent.onWarDeclared(e)
    local playerFaction = WorldUtils:getPlayerFaction()
    local war = e.war
    if war:inOpposition(offeringFaction, playerFaction) then
        getCommand():complete(offeringFaction)
        complete()
    end
end

function populateEvent()
    setFactionPortrait(offeringFaction)
    title("$ProtectionOffered") --$ Protection Offered
    text({"$OfferProtection_ToPlayer", offeringFaction.name, cost }) --$ {0} is offering you protection.\n"For the reasonable price of {1:C0} a week, I can protect you from the other gangs for the next 6 months."
    option("$OfferProtection_Accept", Accept) --$ I accept. Glad to have you watching my back.
    option("$OfferProtection_Reject", Reject) --$ I don't need your protection!
end

function onTrigger()
    notificationIcon("Sprites/Diplomacy/Icon_Protector")
    disableAutoComplete()
    canDismiss()
    timeout(Utils:convertDuration(7, "Days", "Seconds"))
    populateEvent()
    option("$Let_Me_Think", Think)
    setImage("notoriety")
end

function onDisplay()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onCelebration" )
end

function onDismiss()
    Reject()
end

function Accept()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onCelebration" )
    getCommand():complete(offeringFaction, true)
    complete()
end

function Reject()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onFrustration" )
    getCommand():complete(offeringFaction, false)
    complete()
end

function Think()
    closeWindow()
end

function getCommand()
    return WorldUtils:getPlayerFaction().commands:getByName("Discussion"):getByName("OfferProtection")
end

function onTimeout()
    WorldUtils:triggerEvent("OfferProtectionToPlayerFinal",
            "offeringFaction", offeringFaction,
            "cost", cost
    )
    complete()
end

_id = "OFFER_PROTECTION_TO_PLAYER_FINAL"
_includes = "OFFER_PROTECTION_TO_PLAYER"
_event = "OfferProtectionToPlayerFinal"

function onTrigger()
    populateEvent()
    text({"$GaveTimeToThink", "$OfferProtection_ToPlayer", offeringFaction.name, cost})
end

-- -----------------------------------
_id = "REQUEST_PROTECTION_FROM_PLAYER"
_includes = "BASE_AI_MESSAGE_EVENT"
_event = "RequestProtectionFromPlayer"

persist{}
offeringFaction = nil
persist{}
cost = nil

function getAIFaction()
    return offeringFaction
end

function GameEvent.onPlayerAllianceDeclared(e)
    if e.with == offeringFaction then
        getCommand():complete(offeringFaction)
        complete()
    end
end

function GameEvent.onWarDeclared(e)
    local playerFaction = WorldUtils:getPlayerFaction()
    local war = e.war
    if war:inOpposition(offeringFaction, playerFaction) then
        getCommand():complete(offeringFaction)
        complete()
    end
end

function populateEvent()
    setFactionPortrait(offeringFaction)
    title("$ProtectionRequested") --$ Protection Requested
    text({"$RequestProtection_FromPlayer", offeringFaction.name, cost }) --$ {0} is requesting protection.\n"I'll pay you {1:C0} a week to watch my back from the other gangs for the next 6 months."
    option("$RequestProtection_Accept", Accept) --$ I accept. Keep the payments up and I'll watch your back.
    option("$RequestProtection_Reject", Reject) --$ I'm not interested in protecting you.
end

function onTrigger()
    notificationIcon("Sprites/Diplomacy/Icon_Protected")
    disableAutoComplete()
    canDismiss()
    timeout(Utils:convertDuration(7, "Days", "Seconds"))
    populateEvent()
    option("$Let_Me_Think", Think)
end

function onDisplay()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onCelebration" )
end

function onDismiss()
    Reject()
end

function Accept()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onCelebration" )
    getCommand():complete(offeringFaction, true)
    complete()
end

function Reject()
    local boss = offeringFaction.boss
    Utils:playCharacterSound( boss, "onFrustration" )
    getCommand():complete(offeringFaction, false)
    complete()
end

function Think()
    closeWindow()
end

function getCommand()
    return WorldUtils:getPlayerFaction().commands:getByName("Discussion"):getByName("RequestProtection")
end

function onTimeout()
    WorldUtils:triggerEvent("RequestProtectionFromPlayerFinal",
            "offeringFaction", offeringFaction,
            "cost", cost
    )
    complete()
end

_id = "REQUEST_PROTECTION_FROM_PLAYER_FINAL"
_includes = "REQUEST_PROTECTION_FROM_PLAYER"
_event = "RequestProtectionFromPlayerFinal"

function onTrigger()
    populateEvent()
    text({"$GaveTimeToThink", "$RequestProtection_FromPlayer", offeringFaction.name, cost})
end

-- -----------------------------------
_id = "STOP_PROTECTING_PLAYER"
_includes = "BASE_AI_MESSAGE_EVENT"
_event = "StopProtectingPlayer"

persist{} otherFaction = nil

function getAIFaction()
    return otherFaction
end

function onTrigger()
    setModal(true)
    setFactionPortrait(otherFaction)

    title("$ProtectionStopped") --$ Protection Stopped
    text({"$StopProtectingPlayer", otherFaction.name}) --$ "Things have changed. I'm afraid I can't watch your back anymore."\n{0} has stopped protecting your gang!
    option("$Youve_Made_A_Mistake")
end

function onDisplay()
    local boss = otherFaction.boss
    Utils:playCharacterSound( boss, "onDisagree" )
end

function onComplete()
    getCommand():complete(otherFaction)
end

function getCommand()
    return WorldUtils:getPlayerFaction().commands:getByName("Action"):getByName("StopProtecting")
end

-- -----------------------------------
_id = "REJECT_PROTECTION_FROM_PLAYER"
_includes = "BASE_AI_MESSAGE_EVENT"
_event = "RejectProtectionFromPlayer"

persist{} otherFaction = nil

function getAIFaction()
    return otherFaction
end

function onTrigger()
    setModal(true)
    setFactionPortrait(otherFaction)

    title("$ProtectionRejected") --$ Protection Rejected
    text({"$RejectProtectionFromPlayer", otherFaction.name}) --$ "Why am I paying you? I don't need your protection any more!"\n{0} has rejected protection from your gang!
    option("$Youve_Made_A_Mistake")
end

function onDisplay()
    local boss = otherFaction.boss
    Utils:playCharacterSound( boss, "onEvilLaugh" )
end

function onComplete()
    getCommand():complete(otherFaction)
end

function getCommand()
    return WorldUtils:getPlayerFaction().commands:getByName("Action"):getByName("RejectProtection")
end
