-- 
--$$ Character

_namespace = "INJURY_DATA"

--[[------------------------------------------------------------------------------
Moderate
--------------------------------------------------------------------------------]]

_id = "MODERATE"
name = "$INJURY_DATA_MODERATE_name" --$ Moderate Injury
percentDamageCeiling = 20
percentInjuryChance = 2
durationDaysMin = 1
durationDaysMax = 2

--[[------------------------------------------------------------------------------
Serious
--------------------------------------------------------------------------------]]

_id = "SERIOUS"
name = "$INJURY_DATA_SERIOUS_name" --$ Serious Injury
percentDamageCeiling = 50
percentInjuryChance = 7
durationDaysMin = 2
durationDaysMax = 5

--[[------------------------------------------------------------------------------
Severe
--------------------------------------------------------------------------------]]

_id = "SEVERE"
name = "$INJURY_DATA_SEVERE_name" --$ Severe Injury
percentDamageCeiling = 75
percentInjuryChance = 15
durationDaysMin = 3
durationDaysMax = 7

--[[------------------------------------------------------------------------------
Critical
leave percentDamageCeiling field blank
--------------------------------------------------------------------------------]]

_id = "CRITICAL"
name = "$INJURY_DATA_CRITICAL_name" --$ Critical Injury
percentInjuryChance = 35
durationDaysMin = 4
durationDaysMax = 10
