-- 
--$$ Diplomacy

_namespace = "RATING_EFFECTS"

--[[------------------------------------------------------------------------------
At War Delta
--------------------------------------------------------------------------------]]

_id = "AT_WAR_DELTA"
value = -20
name = "$RATING_EFFECTS_AT_WAR_DELTA_name" --$ Ongoing War
description = "$RATING_EFFECTS_AT_WAR_DELTA_description" --$ Ongoing War

--[[------------------------------------------------------------------------------
Recent War Delta
--------------------------------------------------------------------------------]]

_id = "RECENT_WAR_DELTA"
value = 5
name = "$RATING_EFFECTS_RECENT_WAR_DELTA_name" --$ Peace

--[[------------------------------------------------------------------------------
Forgetting Favor Delta
--------------------------------------------------------------------------------]]

_id = "FORGETTING_FAVOR_DELTA"
value = -6
name = "$RATING_EFFECTS_FORGETTING_FAVOR_DELTA_name" --$ Forgetting Favor

--[[------------------------------------------------------------------------------
Forgetting Refusal Delta
--------------------------------------------------------------------------------]]

_id = "FORGETTING_REFUSAL_DELTA"
value = 6
name = "$RATING_EFFECTS_FORGETTING_REFUSAL_DELTA_name" --$ Forgetting Refusal

--[[------------------------------------------------------------------------------
Forgetting Insult Delta
--------------------------------------------------------------------------------]]

_id = "FORGETTING_INSULT_DELTA"
value = 3
name = "$RATING_EFFECTS_FORGETTING_INSULT_DELTA_name" --$ Forgetting Insult

--[[------------------------------------------------------------------------------
Forgetting Aggression Delta
--------------------------------------------------------------------------------]]

_id = "FORGETTING_AGGRESSION_DELTA"
value = 3
name = "$RATING_EFFECTS_FORGETTING_AGGRESSION_DELTA_name" --$ Forgetting Aggression

--[[------------------------------------------------------------------------------
Warming To You Delta
--------------------------------------------------------------------------------]]

_id = "WARMING_TO_YOU_DELTA"
value = 1
name = "$RATING_EFFECTS_WARMING_TO_YOU_DELTA_name" --$ Warming to you

--[[------------------------------------------------------------------------------
At War
--------------------------------------------------------------------------------]]

_id = "AT_WAR"
value = -40
name = "$RATING_EFFECTS_AT_WAR_name" --$ At War
description = "$RATING_EFFECTS_AT_WAR_description" --$ War has been declared
deltaId = "AT_WAR_DELTA"

--[[------------------------------------------------------------------------------
Recent War
Uses the modifier from the war to set its initial value,
--------------------------------------------------------------------------------]]

_id = "RECENT_WAR"
value = 0
name = "$RATING_EFFECTS_RECENT_WAR_name" --$ Recent War
description = "$RATING_EFFECTS_RECENT_WAR_description" --$ There was a recent war
deltaId = "RECENT_WAR_DELTA"

--[[------------------------------------------------------------------------------
Lent Alcohol
--------------------------------------------------------------------------------]]

_id = "LENT_ALCOHOL"
value = 20
name = "$RATING_EFFECTS_LENT_ALCOHOL_name" --$ Lent Alcohol
description = "$RATING_EFFECTS_LENT_ALCOHOL_description" --$ You lent them alcohol
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Refused Lend Alcohol
--------------------------------------------------------------------------------]]

_id = "REFUSED_LEND_ALCOHOL"
value = -10
name = "$RATING_EFFECTS_REFUSED_LEND_ALCOHOL_name" --$ Didn't Lend Alcohol
description = "$RATING_EFFECTS_REFUSED_LEND_ALCOHOL_description" --$ You refused to lend them alcohol
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Lent Cash
--------------------------------------------------------------------------------]]

_id = "LENT_CASH"
value = 20
name = "$RATING_EFFECTS_LENT_CASH_name" --$ Lent Cash
description = "$RATING_EFFECTS_LENT_CASH_description" --$ You lent them cash
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Refused Lend Cash
--------------------------------------------------------------------------------]]

_id = "REFUSED_LEND_CASH"
value = -10
name = "$RATING_EFFECTS_REFUSED_LEND_CASH_name" --$ Didn't Lend Cash
description = "$RATING_EFFECTS_REFUSED_LEND_CASH_description" --$ You refused to lend them cash
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Killed Target
--------------------------------------------------------------------------------]]

_id = "KILLED_TARGET"
value = 20
name = "$RATING_EFFECTS_KILLED_TARGET_name" --$ Killed Target
description = "$RATING_EFFECTS_KILLED_TARGET_description" --$ You killed their requested hit target
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Refused Kill Target
--------------------------------------------------------------------------------]]

_id = "REFUSED_KILL_TARGET"
value = -10
name = "$RATING_EFFECTS_REFUSED_KILL_TARGET_name" --$ Didn't Accept Hit
description = "$RATING_EFFECTS_REFUSED_KILL_TARGET_description" --$ You refused to kill their requested hit target
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Put In A Good Word
--------------------------------------------------------------------------------]]

_id = "PUT_IN_A_GOOD_WORD"
value = 20
name = "$RATING_EFFECTS_PUT_IN_A_GOOD_WORD_name" --$ Good Word
description = "$RATING_EFFECTS_PUT_IN_A_GOOD_WORD_description" --$ You put in a good word for them
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Refused Put In A Good Word
--------------------------------------------------------------------------------]]

_id = "REFUSED_PUT_IN_A_GOOD_WORD"
value = -10
name = "$RATING_EFFECTS_REFUSED_PUT_IN_A_GOOD_WORD_name" --$ Refused Good Word
description = "$RATING_EFFECTS_REFUSED_PUT_IN_A_GOOD_WORD_description" --$ You refused to put in a good word for them
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Refused Payment
--------------------------------------------------------------------------------]]

_id = "REFUSED_PAYMENT"
value = -200
name = "$RATING_EFFECTS_REFUSED_PAYMENT_name" --$ Refused Payment
description = "$RATING_EFFECTS_REFUSED_PAYMENT_description" --$ You refused to pay what you owed
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Recommended
--------------------------------------------------------------------------------]]

_id = "RECOMMENDED"
value = 60
name = "$RATING_EFFECTS_RECOMMENDED_name" --$ Recommended
description = "$RATING_EFFECTS_RECOMMENDED_description" --$ You were recommended by an ally
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Recently Raided
--------------------------------------------------------------------------------]]

_id = "RECENTLY_RAIDED"
value = -40
name = "$RATING_EFFECTS_RECENTLY_RAIDED_name" --$ Recently Raided
description = "$RATING_EFFECTS_RECENTLY_RAIDED_description" --$ You recently raided their racket
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Refused Reparations
--------------------------------------------------------------------------------]]

_id = "REFUSED_REPARATIONS"
value = -100
name = "$RATING_EFFECTS_REFUSED_REPARATIONS_name" --$ Refused Reparations
description = "$RATING_EFFECTS_REFUSED_REPARATIONS_description" --$ You refused to pay reparations
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Disappointed
--------------------------------------------------------------------------------]]

_id = "DISAPPOINTED"
value = -20
name = "$RATING_EFFECTS_DISAPPOINTED_name" --$ Disappointed
description = "$RATING_EFFECTS_DISAPPOINTED_description" --$ They're disappointed in your recent actions
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Refused To End Alliance
--------------------------------------------------------------------------------]]

_id = "REFUSED_TO_END_ALLIANCE"
value = -45
name = "$RATING_EFFECTS_REFUSED_TO_END_ALLIANCE_name" --$ Refused to End Business Arrangement
description = "$RATING_EFFECTS_REFUSED_TO_END_ALLIANCE_description" --$ You refused their request to end a Business Arrangement
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Refused To End War
--------------------------------------------------------------------------------]]

_id = "REFUSED_TO_END_WAR"
value = -45
name = "$RATING_EFFECTS_REFUSED_TO_END_WAR_name" --$ Refused to End War
description = "$RATING_EFFECTS_REFUSED_TO_END_WAR_description" --$ You refused their request to end a war
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Conquered Racket
--------------------------------------------------------------------------------]]

_id = "CONQUERED_RACKET"
value = -250
name = "$RATING_EFFECTS_CONQUERED_RACKET_name" --$ Conquered Racket
description = "$RATING_EFFECTS_CONQUERED_RACKET_description" --$ You conquered one of their rackets
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Member Killed
--------------------------------------------------------------------------------]]

_id = "MEMBER_KILLED"
value = -14
name = "$RATING_EFFECTS_MEMBER_KILLED_name" --$ Member Killed
description = "$RATING_EFFECTS_MEMBER_KILLED_description" --$ You killed a member of their gang
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Favor Granted
--------------------------------------------------------------------------------]]

_id = "FAVOR_GRANTED"
value = 35
name = "$RATING_EFFECTS_FAVOR_GRANTED_name" --$ Favor Granted
description = "$RATING_EFFECTS_FAVOR_GRANTED_description" --$ You granted them a favor
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Favor Granted Half
--------------------------------------------------------------------------------]]

_id = "FAVOR_GRANTED_HALF"
value = 20
name = "$RATING_EFFECTS_FAVOR_GRANTED_HALF_name" --$ Reduced Favor Granted
description = "$RATING_EFFECTS_FAVOR_GRANTED_HALF_description" --$ You granted them a small favor
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Favor Rejected
--------------------------------------------------------------------------------]]

_id = "FAVOR_REJECTED"
value = -25
name = "$RATING_EFFECTS_FAVOR_REJECTED_name" --$ Favor Rejected
description = "$RATING_EFFECTS_FAVOR_REJECTED_description" --$ You rejected a favor request
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Trade Granted
--------------------------------------------------------------------------------]]

_id = "TRADE_GRANTED"
value = 10
name = "$RATING_EFFECTS_TRADE_GRANTED_name" --$ Trade Granted
description = "$RATING_EFFECTS_TRADE_GRANTED_description" --$ You accepted their trade offer
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Trade Rejection
--------------------------------------------------------------------------------]]

_id = "TRADE_REJECTION"
value = -15
name = "$RATING_EFFECTS_TRADE_REJECTION_name" --$ Trade Rejected
description = "$RATING_EFFECTS_TRADE_REJECTION_description" --$ You rejected their trade offer
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Tribute Given
--------------------------------------------------------------------------------]]

_id = "TRIBUTE_GIVEN"
value = 30
name = "$RATING_EFFECTS_TRIBUTE_GIVEN_name" --$ Tribute Given
description = "$RATING_EFFECTS_TRIBUTE_GIVEN_description" --$ You gave them tribute
deltaId = "FORGETTING_TRADE_DELTA"

--[[------------------------------------------------------------------------------
Tribute Rejection
--------------------------------------------------------------------------------]]

_id = "TRIBUTE_REJECTION"
value = -10
name = "$RATING_EFFECTS_TRIBUTE_REJECTION_name" --$ Tribute Rejected
description = "$RATING_EFFECTS_TRIBUTE_REJECTION_description" --$ You rejected their tribute
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Tribute Demanded
--------------------------------------------------------------------------------]]

_id = "TRIBUTE_DEMANDED"
value = -30
name = "$RATING_EFFECTS_TRIBUTE_DEMANDED_name" --$ Tribute Demanded
description = "$RATING_EFFECTS_TRIBUTE_DEMANDED_description" --$ You demanded Tribute from them
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Tribute Demand Rejection
--------------------------------------------------------------------------------]]

_id = "TRIBUTE_DEMAND_REJECTION"
value = -20
name = "$RATING_EFFECTS_TRIBUTE_DEMAND_REJECTION_name" --$ Tribute Demand Rejected
description = "$RATING_EFFECTS_TRIBUTE_DEMAND_REJECTION_description" --$ You rejected your tribute demand
deltaId = "FORGETTING_REFUSAL_DELTA"

--[[------------------------------------------------------------------------------
Intel Given
--------------------------------------------------------------------------------]]

_id = "INTEL_GIVEN"
value = 20
name = "$RATING_EFFECTS_INTEL_GIVEN_name" --$ Intel Given
description = "$RATING_EFFECTS_INTEL_GIVEN_description" --$ You provided intel
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
In Alliance
--------------------------------------------------------------------------------]]

_id = "IN_ALLIANCE"
value = 25
name = "$RATING_EFFECTS_IN_ALLIANCE_name" --$ In Business Arrangement
description = "$RATING_EFFECTS_IN_ALLIANCE_description" --$ You joined a Business Arrangement

--[[------------------------------------------------------------------------------
Truce
--------------------------------------------------------------------------------]]

_id = "TRUCE"
value = 500
name = "$RATING_EFFECTS_TRUCE_name" --$ Truce
description = "$RATING_EFFECTS_TRUCE_description" --$ A truce was declared
deltaId = "AT_WAR_DELTA"

--[[------------------------------------------------------------------------------
Break Truce
--------------------------------------------------------------------------------]]

_id = "BREAK_TRUCE"
value = -1000
name = "$RATING_EFFECTS_BREAK_TRUCE_name" --$ Broke Truce
description = "$RATING_EFFECTS_BREAK_TRUCE_description" --$ A truce was broken

--[[------------------------------------------------------------------------------
Rival
--------------------------------------------------------------------------------]]

_id = "RIVAL"
value = -100
name = "$RATING_EFFECTS_RIVAL_name" --$ Is Rival
description = "$RATING_EFFECTS_RIVAL_description" --$ You are their rival

--[[------------------------------------------------------------------------------
Sold Item
--------------------------------------------------------------------------------]]

_id = "SOLD_ITEM"
value = 2
name = "$RATING_EFFECTS_SOLD_ITEM_name" --$ Sold Item
description = "$RATING_EFFECTS_SOLD_ITEM_description" --$ You sold them an item

--[[------------------------------------------------------------------------------
Friction
--------------------------------------------------------------------------------]]

_id = "FRICTION"
value = 0
name = "$RATING_EFFECTS_FRICTION_name" --$ Friction
description = "$RATING_EFFECTS_FRICTION_description" --$ You're getting too close to their rackets

--[[------------------------------------------------------------------------------
Disguised Alcohol
--------------------------------------------------------------------------------]]

_id = "DISGUISED_ALCOHOL"
value = -20
name = "$RATING_EFFECTS_DISGUISED_ALCOHOL_name" --$ Disguised Alcohol
description = "$RATING_EFFECTS_DISGUISED_ALCOHOL_description" --$ You sold them disguised alcohol

--[[------------------------------------------------------------------------------
Enemy Conquered
--------------------------------------------------------------------------------]]

_id = "ENEMY_CONQUERED"
value = 40
name = "$RATING_EFFECTS_ENEMY_CONQUERED_name" --$ Enemy Conquered
description = "$RATING_EFFECTS_ENEMY_CONQUERED_description" --$ You killed an enemy boss

--[[------------------------------------------------------------------------------
Enemy Racket Conquered
--------------------------------------------------------------------------------]]

_id = "ENEMY_RACKET_CONQUERED"
value = 5
name = "$RATING_EFFECTS_ENEMY_RACKET_CONQUERED_name" --$ Enemy Racket Conquered
description = "$RATING_EFFECTS_ENEMY_RACKET_CONQUERED_description" --$ You took over an enemy racket

--[[------------------------------------------------------------------------------
Neutral Conquered
--------------------------------------------------------------------------------]]

_id = "NEUTRAL_CONQUERED"
value = 20
name = "$RATING_EFFECTS_NEUTRAL_CONQUERED_name" --$ Neutral Conquered
description = "$RATING_EFFECTS_NEUTRAL_CONQUERED_description" --$ You killed another boss

--[[------------------------------------------------------------------------------
Neutral Racket Conquered
--------------------------------------------------------------------------------]]

_id = "NEUTRAL_RACKET_CONQUERED"
value = 2
name = "$RATING_EFFECTS_NEUTRAL_RACKET_CONQUERED_name" --$ Neutral Racket Conquered
description = "$RATING_EFFECTS_NEUTRAL_RACKET_CONQUERED_description" --$ You took over another boss's racket

--[[------------------------------------------------------------------------------
Ally Racket Conquered
--------------------------------------------------------------------------------]]

_id = "ALLY_RACKET_CONQUERED"
value = -5
name = "$RATING_EFFECTS_ALLY_RACKET_CONQUERED_name" --$ Ally Racket Conquered
description = "$RATING_EFFECTS_ALLY_RACKET_CONQUERED_description" --$ You conquered an ally's racket

--[[------------------------------------------------------------------------------
Ally Boss Conquered
--------------------------------------------------------------------------------]]

_id = "ALLY_BOSS_CONQUERED"
value = -40
name = "$RATING_EFFECTS_ALLY_BOSS_CONQUERED_name" --$ You killed Ally Boss
description = "$RATING_EFFECTS_ALLY_BOSS_CONQUERED_description" --$ You killed an allied boss

--[[------------------------------------------------------------------------------
Opened Multiple In Ward
--------------------------------------------------------------------------------]]

_id = "OPENED_MULTIPLE_IN_WARD"
value = -10
name = "$RATING_EFFECTS_OPENED_MULTIPLE_IN_WARD_name" --$ Opened Multiple in Ward
description = "$RATING_EFFECTS_OPENED_MULTIPLE_IN_WARD_description" --$ You opened multiple rackets in a shared ward

--[[------------------------------------------------------------------------------
Took Over Majority Ward
--------------------------------------------------------------------------------]]

_id = "TOOK_OVER_MAJORITY_WARD"
value = -20
name = "$RATING_EFFECTS_TOOK_OVER_MAJORITY_WARD_name" --$ Took Over Majority
description = "$RATING_EFFECTS_TOOK_OVER_MAJORITY_WARD_description" --$ They lost a majority stake in a shared ward

--[[------------------------------------------------------------------------------
Honorable Behaviour
--------------------------------------------------------------------------------]]

_id = "HONORABLE_BEHAVIOUR"
value = 10
name = "$RATING_EFFECTS_HONORABLE_BEHAVIOUR_name" --$ Honorable Behavior
description = "$RATING_EFFECTS_HONORABLE_BEHAVIOUR_description" --$ You behaved honorably

--[[------------------------------------------------------------------------------
Dishonorable Behaviour
--------------------------------------------------------------------------------]]

_id = "DISHONORABLE_BEHAVIOUR"
value = -10
name = "$RATING_EFFECTS_DISHONORABLE_BEHAVIOUR_name" --$ Dishonorable Behavior
description = "$RATING_EFFECTS_DISHONORABLE_BEHAVIOUR_description" --$ You behaved dishonorably

--[[------------------------------------------------------------------------------
Last One Standing
Three left, others are allies
--------------------------------------------------------------------------------]]

_id = "LAST_ONE_STANDING"
value = -500
name = "$RATING_EFFECTS_LAST_ONE_STANDING_name" --$ Last One Standing
description = "$RATING_EFFECTS_LAST_ONE_STANDING_description" --$ It's you or them

--[[------------------------------------------------------------------------------
Last Two Standing Ally
--------------------------------------------------------------------------------]]

_id = "LAST_TWO_STANDING_ALLY"
value = -100
name = "$RATING_EFFECTS_LAST_TWO_STANDING_ALLY_name" --$ No Trust
description = "$RATING_EFFECTS_LAST_TWO_STANDING_ALLY_description" --$ They no longer trust you

--[[------------------------------------------------------------------------------
In Protection Treaty
--------------------------------------------------------------------------------]]

_id = "IN_PROTECTION_TREATY"
value = 25
name = "$RATING_EFFECTS_IN_PROTECTION_TREATY_name" --$ Protection Treaty
description = "$RATING_EFFECTS_IN_PROTECTION_TREATY_description" --$ You formed Protection Treaty

--[[------------------------------------------------------------------------------
In Non Aggression Pact
--------------------------------------------------------------------------------]]

_id = "IN_NON_AGGRESSION_PACT"
value = 25
name = "$RATING_EFFECTS_IN_NON_AGGRESSION_PACT_name" --$ Non-Aggression Pact
description = "$RATING_EFFECTS_IN_NON_AGGRESSION_PACT_description" --$ You formed Non-Aggression Pact

--[[------------------------------------------------------------------------------
In Defensive Pact
--------------------------------------------------------------------------------]]

_id = "IN_DEFENSIVE_PACT"
value = 10
name = "$RATING_EFFECTS_IN_DEFENSIVE_PACT_name" --$ Defensive Pact
description = "$RATING_EFFECTS_IN_DEFENSIVE_PACT_description" --$ You formed a Defensive Pact
deltaId = "IN_DEFENSIVE_PACT_DELTA"

--[[------------------------------------------------------------------------------
Broke Defensive Pact
--------------------------------------------------------------------------------]]

_id = "BROKE_DEFENSIVE_PACT"
value = -400
name = "$RATING_EFFECTS_BROKE_DEFENSIVE_PACT_name" --$ No Defense
description = "$RATING_EFFECTS_BROKE_DEFENSIVE_PACT_description" --$ You failed to stand by Defensive Pact

--[[------------------------------------------------------------------------------
Broke Aggression Treaty
--------------------------------------------------------------------------------]]

_id = "BROKE_AGGRESSION_TREATY"
value = -1000
name = "$RATING_EFFECTS_BROKE_AGGRESSION_TREATY_name" --$ No Nerve
description = "$RATING_EFFECTS_BROKE_AGGRESSION_TREATY_description" --$ You failed to stand by Aggression Treaty

--[[------------------------------------------------------------------------------
Noshow War
--------------------------------------------------------------------------------]]

_id = "NOSHOW_WAR"
value = -100
name = "$RATING_EFFECTS_NOSHOW_WAR_name" --$ No Show
description = "$RATING_EFFECTS_NOSHOW_WAR_description" --$ You did nothing to help them during war

--[[------------------------------------------------------------------------------
War Pact Truce
--------------------------------------------------------------------------------]]

_id = "WAR_PACT_TRUCE"
value = -100
name = "$RATING_EFFECTS_WAR_PACT_TRUCE_name" --$ No See Through
description = "$RATING_EFFECTS_WAR_PACT_TRUCE_description" --$ They joined you in war and you accepted truce

--[[------------------------------------------------------------------------------
New Contact
--------------------------------------------------------------------------------]]

_id = "NEW_CONTACT"
value = -10
name = "$RATING_EFFECTS_NEW_CONTACT_name" --$ New Contact
description = "$RATING_EFFECTS_NEW_CONTACT_description" --$ They need to get to know you
deltaId = "WARMING_TO_YOU_DELTA"

--[[------------------------------------------------------------------------------
Same Heritage
--------------------------------------------------------------------------------]]

_id = "SAME_HERITAGE"
value = 100
name = "$RATING_EFFECTS_SAME_HERITAGE_name" --$ Same Heritage
description = "$RATING_EFFECTS_SAME_HERITAGE_description" --$ You both share the same heritage

--[[------------------------------------------------------------------------------
Thugs
Added when attacking a building, removed after
--------------------------------------------------------------------------------]]

_id = "THUGS"
value = -1000
name = "$RATING_EFFECTS_THUGS_name" --$ Thugs

--[[------------------------------------------------------------------------------
Attacking Building
Added when threatening a faction on first meeting
--------------------------------------------------------------------------------]]

_id = "ATTACKING_BUILDING"
value = -500
name = "$RATING_EFFECTS_ATTACKING_BUILDING_name" --$ Attacking Building

--[[------------------------------------------------------------------------------
Threatened
--------------------------------------------------------------------------------]]

_id = "THREATENED"
value = -20
name = "$RATING_EFFECTS_THREATENED_name" --$ Threatened
description = "$RATING_EFFECTS_THREATENED_description" --$ You threatened them

--[[------------------------------------------------------------------------------
Attempted Sabotage
--------------------------------------------------------------------------------]]

_id = "ATTEMPTED_SABOTAGE"
value = -250
name = "$RATING_EFFECTS_ATTEMPTED_SABOTAGE_name" --$ Attempted Sabotage

description = "$RATING_EFFECTS_ATTEMPTED_SABOTAGE_description" --$ You tried to sabotage them
deltaId = "FORGETTING_AGGRESSION_DELTA"

--[[------------------------------------------------------------------------------
Favorable Trade
--------------------------------------------------------------------------------]]

_id = "FAVORABLE_TRADE"
value = 50
name = "$RATING_EFFECTS_FAVORABLE_TRADE_name" --$ Favorable Trade
description = "$RATING_EFFECTS_FAVORABLE_TRADE_description" --$ You made favorable trade with them
deltaId = "FORGETTING_TRADE_DELTA"

--[[------------------------------------------------------------------------------
Gift
--------------------------------------------------------------------------------]]

_id = "GIFT"
value = 75
name = "$RATING_EFFECTS_GIFT_name" --$ Gift
description = "$RATING_EFFECTS_GIFT_description" --$ You gave them a gift
deltaId = "FORGETTING_TRADE_DELTA"

--[[------------------------------------------------------------------------------
Accepted Gift
--------------------------------------------------------------------------------]]

_id = "ACCEPTED_GIFT"
value = 10
name = "$RATING_EFFECTS_ACCEPTED_GIFT_name" --$ Accepted Gift
description = "$RATING_EFFECTS_ACCEPTED_GIFT_description" --$ You accepted their gift
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Aggressive Behaviour
--------------------------------------------------------------------------------]]

_id = "AGGRESSIVE_BEHAVIOUR"
value = -250
name = "$RATING_EFFECTS_AGGRESSIVE_BEHAVIOUR_name" --$ Aggressive Behavior
description = "$RATING_EFFECTS_AGGRESSIVE_BEHAVIOUR_description" --$ You behaved aggressively
deltaId = "FORGETTING_AGGRESSION_DELTA"

--[[------------------------------------------------------------------------------
Double Cross
--------------------------------------------------------------------------------]]

_id = "DOUBLE_CROSS"
value = -200
name = "$RATING_EFFECTS_DOUBLE_CROSS_name" --$ Double-Cross
description = "$RATING_EFFECTS_DOUBLE_CROSS_description" --$ They double-crossed you

--[[------------------------------------------------------------------------------
Mission Killed Herb
--------------------------------------------------------------------------------]]

_id = "MISSION_KILLED_HERB"
value = -200
name = "$RATING_EFFECTS_MISSION_KILLED_HERB_name" --$ Killed Herb
description = "$RATING_EFFECTS_MISSION_KILLED_HERB_description" --$ You killed Herb

--[[------------------------------------------------------------------------------
Mission Sobered Herb
--------------------------------------------------------------------------------]]

_id = "MISSION_SOBERED_HERB"
value = 200
name = "$RATING_EFFECTS_MISSION_SOBERED_HERB_name" --$ Sobered Herb up
description = "$RATING_EFFECTS_MISSION_SOBERED_HERB_description" --$ You sobered Herb up

--[[------------------------------------------------------------------------------
Mission Romy Story
--------------------------------------------------------------------------------]]

_id = "MISSION_ROMY_STORY"
value = 100
name = "$RATING_EFFECTS_MISSION_ROMY_STORY_name" --$ Romy's Article
description = "$RATING_EFFECTS_MISSION_ROMY_STORY_description" --$ Romy wrote a favorable article about you

--[[------------------------------------------------------------------------------
Mission Meeting Of Minds
--------------------------------------------------------------------------------]]

_id = "MISSION_MEETING_OF_MINDS"
value = 250
name = "$RATING_EFFECTS_MISSION_MEETING_OF_MINDS_name" --$ Meeting of Minds
description = "$RATING_EFFECTS_MISSION_MEETING_OF_MINDS_description" --$ You pulled some strings with Jacques

--[[------------------------------------------------------------------------------
Killed Lover
--------------------------------------------------------------------------------]]

_id = "KILLED_LOVER"
value = -500
name = "$RATING_EFFECTS_KILLED_LOVER_name" --$ Killed their Lover
description = "$RATING_EFFECTS_KILLED_LOVER_description" --$ You killed their lover

--[[------------------------------------------------------------------------------
Rejected Offer
--------------------------------------------------------------------------------]]

_id = "REJECTED_OFFER"
value = -50
name = "$RATING_EFFECTS_REJECTED_OFFER_name" --$ Rejected their Offer
description = "$RATING_EFFECTS_REJECTED_OFFER_description" --$ You rejected their offer

--[[------------------------------------------------------------------------------
Killed Boss
--------------------------------------------------------------------------------]]

_id = "KILLED_BOSS"
value = -500
name = "$RATING_EFFECTS_KILLED_BOSS_name" --$ Killed their Boss
description = "$RATING_EFFECTS_KILLED_BOSS_description" --$ You killed their boss

--[[------------------------------------------------------------------------------
Refused To Cooperate
--------------------------------------------------------------------------------]]

_id = "REFUSED_TO_COOPERATE"
value = -100
name = "$RATING_EFFECTS_REFUSED_TO_COOPERATE_name" --$ Refused to Cooperate
description = "$RATING_EFFECTS_REFUSED_TO_COOPERATE_description" --$ You refused to cooperate

--[[------------------------------------------------------------------------------
Ambushed
--------------------------------------------------------------------------------]]

_id = "AMBUSHED"
value = -250
name = "$RATING_EFFECTS_AMBUSHED_name" --$ Ambushed
description = "$RATING_EFFECTS_AMBUSHED_description" --$ You ambushed them
deltaId = "FORGETTING_AGGRESSION_DELTA"

--[[------------------------------------------------------------------------------
Successful Bribe
--------------------------------------------------------------------------------]]

_id = "SUCCESSFUL_BRIBE"
value = 100
name = "$RATING_EFFECTS_SUCCESSFUL_BRIBE_name" --$ Successful Bribe
description = "$RATING_EFFECTS_SUCCESSFUL_BRIBE_description" --$ You successfully bribed them

--[[------------------------------------------------------------------------------
Failed Bribe
--------------------------------------------------------------------------------]]

_id = "FAILED_BRIBE"
value = -50
name = "$RATING_EFFECTS_FAILED_BRIBE_name" --$ Failed Bribe
description = "$RATING_EFFECTS_FAILED_BRIBE_description" --$ You failed to bribe them
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
No Show
--------------------------------------------------------------------------------]]

_id = "NO_SHOW"
value = -25
name = "$RATING_EFFECTS_NO_SHOW_name" --$ No Show
description = "$RATING_EFFECTS_NO_SHOW_description" --$ You failed to attend the sitdown
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Law Enforcement Spy Let Go
--------------------------------------------------------------------------------]]

_id = "LAW_ENFORCEMENT_SPY_LET_GO"
value = -20
name = "$RATING_EFFECTS_LAW_ENFORCEMENT_SPY_LET_GO_name" --$ Let spy go
description = "$RATING_EFFECTS_LAW_ENFORCEMENT_SPY_LET_GO_description" --$ You let their spy go

--[[------------------------------------------------------------------------------
Opened Mystery Box
--------------------------------------------------------------------------------]]

_id = "OPENED_MYSTERY_BOX"
value = -250
name = "$RATING_EFFECTS_OPENED_MYSTERY_BOX_name" --$ Opened Mystery Box
description = "$RATING_EFFECTS_OPENED_MYSTERY_BOX_description" --$ You opened the box
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Leave Mystery Box
--------------------------------------------------------------------------------]]

_id = "LEAVE_MYSTERY_BOX"
value = -100
name = "$RATING_EFFECTS_LEAVE_MYSTERY_BOX_name" --$ Left Mystery Box
description = "$RATING_EFFECTS_LEAVE_MYSTERY_BOX_description" --$ You left the mystery box
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Stolen Mystery Box
--------------------------------------------------------------------------------]]

_id = "STOLEN_MYSTERY_BOX"
value = -200
name = "$RATING_EFFECTS_STOLEN_MYSTERY_BOX_name" --$ Mystery Box Stolen
description = "$RATING_EFFECTS_STOLEN_MYSTERY_BOX_description" --$ You let their box get stolen

--[[------------------------------------------------------------------------------
Kept Mystery Box Safe
--------------------------------------------------------------------------------]]

_id = "KEPT_MYSTERY_BOX_SAFE"
value = 200
name = "$RATING_EFFECTS_KEPT_MYSTERY_BOX_SAFE_name" --$ Kept Mystery Box Safe
description = "$RATING_EFFECTS_KEPT_MYSTERY_BOX_SAFE_description" --$ You kept their box safe

--[[------------------------------------------------------------------------------
Insulted
--------------------------------------------------------------------------------]]

_id = "INSULTED"
value = -25
name = "$RATING_EFFECTS_INSULTED_name" --$ Insulted
description = "$RATING_EFFECTS_INSULTED_description" --$ You insulted them
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Illegal Activities
--------------------------------------------------------------------------------]]

_id = "ILLEGAL_ACTIVITIES"
value = -300
name = "$RATING_EFFECTS_ILLEGAL_ACTIVITIES_name" --$ Illegal activities
description = "$RATING_EFFECTS_ILLEGAL_ACTIVITIES_description" --$ You performed illegal activities

--[[------------------------------------------------------------------------------
Sitdown Missed
Big Jim's Crates increase of rating with law enforcement
--------------------------------------------------------------------------------]]

_id = "SITDOWN_MISSED"
value = -100
name = "$RATING_EFFECTS_SITDOWN_MISSED_name" --$ Missed Sitdown
description = "$RATING_EFFECTS_SITDOWN_MISSED_description" --$ You missed a sitdown

--[[------------------------------------------------------------------------------
Loot Crate Cassaday Connection
--------------------------------------------------------------------------------]]

_id = "LOOT_CRATE_CASSADAY_CONNECTION"
value = 250
name = "$RATING_EFFECTS_LOOT_CRATE_CASSADAY_CONNECTION_name" --$ Cassiday Connection
description = "$RATING_EFFECTS_LOOT_CRATE_CASSADAY_CONNECTION_description" --$ The law is smiling on you.

--[[------------------------------------------------------------------------------
Conquered Safehouse
--------------------------------------------------------------------------------]]

_id = "CONQUERED_SAFEHOUSE"
value = -500
name = "$RATING_EFFECTS_CONQUERED_SAFEHOUSE_name" --$ Conquered Safehouse
description = "$RATING_EFFECTS_CONQUERED_SAFEHOUSE_description" --$ You conquered one of their safehouses
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
In Defensive Pact Delta
--------------------------------------------------------------------------------]]

_id = "IN_DEFENSIVE_PACT_DELTA"
value = 2
name = "$RATING_EFFECTS_IN_DEFENSIVE_PACT_DELTA_name" --$ Ongoing Defensive Pact

--[[------------------------------------------------------------------------------
Avoided War Against Them
Used for diplomacy bonuses
--------------------------------------------------------------------------------]]

_id = "AVOIDED_WAR_AGAINST_THEM"
value = 50
name = "$RATING_EFFECTS_AVOIDED_WAR_AGAINST_THEM_name" --$ Avoided War Against Them
description = "$RATING_EFFECTS_AVOIDED_WAR_AGAINST_THEM_description" --$ You avoided being dragged into a war with them
deltaId = "FORGETTING_FAVOR_DELTA"

--[[------------------------------------------------------------------------------
Non Aggression Pact All Faction Change
Used for diplomacy bonuses
--------------------------------------------------------------------------------]]

_id = "NON_AGGRESSION_PACT_ALL_FACTION_CHANGE"
value = 0
name = "$RATING_EFFECTS_NON_AGGRESSION_PACT_ALL_FACTION_CHANGE_name" --$ Acknowledged A Non Aggression Pact
description = "$RATING_EFFECTS_NON_AGGRESSION_PACT_ALL_FACTION_CHANGE_description" --$ Another faction made a non aggression pact

--[[------------------------------------------------------------------------------
Honor Defense Agreement
--------------------------------------------------------------------------------]]

_id = "HONOR_DEFENSE_AGREEMENT"
value = 0
name = "$RATING_EFFECTS_HONOR_DEFENSE_AGREEMENT_name" --$ Honored a Defense Agreement
description = "$RATING_EFFECTS_HONOR_DEFENSE_AGREEMENT_description" --$ You honored your defense agreement

--[[------------------------------------------------------------------------------
Ally Made Truce With Enemy
--------------------------------------------------------------------------------]]

_id = "ALLY_MADE_TRUCE_WITH_ENEMY"
value = -20
name = "$RATING_EFFECTS_ALLY_MADE_TRUCE_WITH_ENEMY_name" --$ Ally Made Truce With An Enemy
description = "$RATING_EFFECTS_ALLY_MADE_TRUCE_WITH_ENEMY_description" --$ You made a truce with their enemy
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Ally Traded With Enemy
--------------------------------------------------------------------------------]]

_id = "ALLY_TRADED_WITH_ENEMY"
value = -20
name = "$RATING_EFFECTS_ALLY_TRADED_WITH_ENEMY_name" --$ Ally Traded With An Enemy
description = "$RATING_EFFECTS_ALLY_TRADED_WITH_ENEMY_description" --$ You traded with their enemy
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Killed Police Officer
--------------------------------------------------------------------------------]]

_id = "KILLED_POLICE_OFFICER"
value = -25
name = "$RATING_EFFECTS_KILLED_POLICE_OFFICER_name" --$ Killed Police Officer
description = "$RATING_EFFECTS_KILLED_POLICE_OFFICER_description" --$ You killed a Police Officer
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Killed Boi Agent
--------------------------------------------------------------------------------]]

_id = "KILLED_BOI_AGENT"
value = -50
name = "$RATING_EFFECTS_KILLED_BOI_AGENT_name" --$ Killed BOI Agent
description = "$RATING_EFFECTS_KILLED_BOI_AGENT_description" --$ You killed a BOI Agent
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Killed Bop Agent
Dynamic value based on notoriety
--------------------------------------------------------------------------------]]

_id = "KILLED_BOP_AGENT"
value = -50
name = "$RATING_EFFECTS_KILLED_BOP_AGENT_name" --$ Killed BOP Agent
description = "$RATING_EFFECTS_KILLED_BOP_AGENT_description" --$ You killed a BOP Agent
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Notoriety
Dynamic value based on item cost
--------------------------------------------------------------------------------]]

_id = "NOTORIETY"
value = 0
name = "$RATING_EFFECTS_NOTORIETY_name" --$ Notoriety
description = "$RATING_EFFECTS_NOTORIETY_description" --$ Notoriety Changes

--[[------------------------------------------------------------------------------
Purchased Police Item
--------------------------------------------------------------------------------]]

_id = "PURCHASED_POLICE_ITEM"
value = 0
name = "$RATING_EFFECTS_PURCHASED_POLICE_ITEM_name" --$ Purchases
description = "$RATING_EFFECTS_PURCHASED_POLICE_ITEM_description" --$ You purchased from Police Store
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Mission Poisoned Cop Bar
--------------------------------------------------------------------------------]]

_id = "MISSION_POISONED_COP_BAR"
value = 100
name = "$RATING_EFFECTS_MISSION_POISONED_COP_BAR_name" --$ Poisoned Cop Bar
description = "$RATING_EFFECTS_MISSION_POISONED_COP_BAR_description" --$ You poisoned a bar filled with cops

--[[------------------------------------------------------------------------------
Event Honorary Lodger
--------------------------------------------------------------------------------]]

_id = "EVENT_HONORARY_LODGER"
value = -100
name = "$RATING_EFFECTS_EVENT_HONORARY_LODGER_name" --$ Became an Honorary Lodger
description = "$RATING_EFFECTS_EVENT_HONORARY_LODGER_description" --$ You became an honorary Lodger

--[[------------------------------------------------------------------------------
Event Izzys Been Busy
A mole with the profession Doctor plants misinformation to damage the target faction's relationship with the mole's least-liked faction.
--------------------------------------------------------------------------------]]

_id = "EVENT_IZZYS_BEEN_BUSY"
value = -100
name = "$RATING_EFFECTS_EVENT_IZZYS_BEEN_BUSY_name" --$ Sent Izzy to Their Bar
description = "$RATING_EFFECTS_EVENT_IZZYS_BEEN_BUSY_description" --$ You got their bar shut down by the BOP

--[[------------------------------------------------------------------------------
Mole Misinformation Attack
--------------------------------------------------------------------------------]]

_id = "MOLE_MISINFORMATION_ATTACK"
value = -100
name = "$RATING_EFFECTS_MOLE_MISINFORMATION_ATTACK_name" --$ Misinformation
description = "$RATING_EFFECTS_MOLE_MISINFORMATION_ATTACK_description" --$ A cunning mole planted some misinformation, damaging their relationship

--[[------------------------------------------------------------------------------
Event Pinned The Blame On Them
--------------------------------------------------------------------------------]]

_id = "EVENT_PINNED_THE_BLAME_ON_THEM"
value = -100
name = "$RATING_EFFECTS_EVENT_PINNED_THE_BLAME_ON_THEM_name" --$ Pinned The Blame On Them
description = "$RATING_EFFECTS_EVENT_PINNED_THE_BLAME_ON_THEM_description" --$ You pinned the blame on them for a crime

--[[------------------------------------------------------------------------------
Refused Cash Demands
--------------------------------------------------------------------------------]]

_id = "REFUSED_CASH_DEMANDS"
value = 0
name = "$RATING_EFFECTS_REFUSED_CASH_DEMANDS_name" --$ Refused Cash Demands
description = "$RATING_EFFECTS_REFUSED_CASH_DEMANDS_description" --$ You refused their cash demands
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Event Threatened Fbi
--------------------------------------------------------------------------------]]

_id = "EVENT_THREATENED_FBI"
value = -100
name = "$RATING_EFFECTS_EVENT_THREATENED_FBI_name" --$ Threatened FBI Agents 
description = "$RATING_EFFECTS_EVENT_THREATENED_FBI_description" --$ You threatened the FBI agents in your brothel

--[[------------------------------------------------------------------------------
Sitdown Refused
A rival faction tried and failed to flip one of the player's gangsters
--------------------------------------------------------------------------------]]

_id = "SITDOWN_REFUSED"
value = -100
name = "$RATING_EFFECTS_SITDOWN_REFUSED_name" --$ Refused Sitdown
description = "$RATING_EFFECTS_SITDOWN_REFUSED_description" --$ You refused to attend their sitdown
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Mole Flip Fail
A mole attempted to attack us and failed!
--------------------------------------------------------------------------------]]

_id = "MOLE_FLIP_FAIL"
value = -50
name = "$RATING_EFFECTS_MOLE_FLIP_FAIL_name" --$ Failed To Flip
description = "$RATING_EFFECTS_MOLE_FLIP_FAIL_description" --$ Someone approached one of our gangsters

--[[------------------------------------------------------------------------------
Mole Attack Fail
--------------------------------------------------------------------------------]]

_id = "MOLE_ATTACK_FAIL"
value = -100
name = "$RATING_EFFECTS_MOLE_ATTACK_FAIL_name" --$ Attempted Sabotage
description = "$RATING_EFFECTS_MOLE_ATTACK_FAIL_description" --$ One of our gangsters is working for another boss

--[[------------------------------------------------------------------------------
Event Ratted Out Other Faction
--------------------------------------------------------------------------------]]

_id = "EVENT_RATTED_OUT_OTHER_FACTION"
value = 100
name = "$RATING_EFFECTS_EVENT_RATTED_OUT_OTHER_FACTION_name" --$ Ratted Out Other Faction
description = "$RATING_EFFECTS_EVENT_RATTED_OUT_OTHER_FACTION_description" --$ You ratted out another faction to the cops

--[[------------------------------------------------------------------------------
Event Warned Other Faction
--------------------------------------------------------------------------------]]

_id = "EVENT_WARNED_OTHER_FACTION"
value = 100
name = "$RATING_EFFECTS_EVENT_WARNED_OTHER_FACTION_name" --$ Warned Other Faction
description = "$RATING_EFFECTS_EVENT_WARNED_OTHER_FACTION_description" --$ You warned them about the cops looking for them

--[[------------------------------------------------------------------------------
Event Didnt Help Cops
--------------------------------------------------------------------------------]]

_id = "EVENT_DIDNT_HELP_COPS"
value = -100
name = "$RATING_EFFECTS_EVENT_DIDNT_HELP_COPS_name" --$ Didn't Help Them
description = "$RATING_EFFECTS_EVENT_DIDNT_HELP_COPS_description" --$ You didn't help them take down another boss

--[[------------------------------------------------------------------------------
Event Vendetta
--------------------------------------------------------------------------------]]

_id = "EVENT_VENDETTA"
value = -100
name = "$RATING_EFFECTS_EVENT_VENDETTA_name" --$ They Have a Vendetta Against you
description = "$RATING_EFFECTS_EVENT_VENDETTA_description" --$ They have a vendetta against you for not helping them

--[[------------------------------------------------------------------------------
Event Tried To Persaude Them
--------------------------------------------------------------------------------]]

_id = "EVENT_TRIED_TO_PERSAUDE_THEM"
value = -100
name = "$RATING_EFFECTS_EVENT_TRIED_TO_PERSAUDE_THEM_name" --$ Tried To Persuade Them
description = "$RATING_EFFECTS_EVENT_TRIED_TO_PERSAUDE_THEM_description" --$ You tried and failed to persuade them

--[[------------------------------------------------------------------------------
Event Gave Up Gangsters
--------------------------------------------------------------------------------]]

_id = "EVENT_GAVE_UP_GANGSTERS"
value = 100
name = "$RATING_EFFECTS_EVENT_GAVE_UP_GANGSTERS_name" --$ Gave up gangsters
description = "$RATING_EFFECTS_EVENT_GAVE_UP_GANGSTERS_description" --$ You gave up your gangsters to them

--[[------------------------------------------------------------------------------
Similar Personality
--------------------------------------------------------------------------------]]

_id = "SIMILAR_PERSONALITY"
value = 0
name = "$RATING_EFFECTS_SIMILAR_PERSONALITY_name" --$ Personality Match
description = "$RATING_EFFECTS_SIMILAR_PERSONALITY_description" --$ You share a similar personality

--[[------------------------------------------------------------------------------
Different Personality
--------------------------------------------------------------------------------]]

_id = "DIFFERENT_PERSONALITY"
value = 0
name = "$RATING_EFFECTS_DIFFERENT_PERSONALITY_name" --$ Personality Match
description = "$RATING_EFFECTS_DIFFERENT_PERSONALITY_description" --$ You have differences in personality

--[[------------------------------------------------------------------------------
Introverted
--------------------------------------------------------------------------------]]

_id = "INTROVERTED"
value = -100
name = "$RATING_EFFECTS_INTROVERTED_name" --$ Introverted
description = "$RATING_EFFECTS_INTROVERTED_description" --$ They are Introverted

--[[------------------------------------------------------------------------------
Extroverted
--------------------------------------------------------------------------------]]

_id = "EXTROVERTED"
value = 100
name = "$RATING_EFFECTS_EXTROVERTED_name" --$ Extroverted
description = "$RATING_EFFECTS_EXTROVERTED_description" --$ They are Extroverted

--[[------------------------------------------------------------------------------
Forgetting Trade Delta
--------------------------------------------------------------------------------]]

_id = "FORGETTING_TRADE_DELTA"
value = -6

--[[------------------------------------------------------------------------------
Event Poisoned Cops
--------------------------------------------------------------------------------]]

_id = "EVENT_POISONED_COPS"
value = -100
name = "$RATING_EFFECTS_EVENT_POISONED_COPS_name" --$ Poisoned Cops
description = "$RATING_EFFECTS_EVENT_POISONED_COPS_description" --$ You poisoned the Cop Bar

--[[------------------------------------------------------------------------------
Bought Drink
--------------------------------------------------------------------------------]]

_id = "BOUGHT_DRINK"
value = 1
name = "$RATING_EFFECTS_BOUGHT_DRINK_name" --$ Bought a drink
description = "$RATING_EFFECTS_BOUGHT_DRINK_description" --$ You bought a drink in their racket

--[[------------------------------------------------------------------------------
Ignored Broken Agreement
--------------------------------------------------------------------------------]]

_id = "IGNORED_BROKEN_AGREEMENT"
value = -100
name = "$RATING_EFFECTS_IGNORED_BROKEN_AGREEMENT_name" --$ Ignored Broken Agreement
description = "$RATING_EFFECTS_IGNORED_BROKEN_AGREEMENT_description" --$ You ignored a broken agreement
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
You Admitted To Poisoning
--------------------------------------------------------------------------------]]

_id = "YOU_ADMITTED_TO_POISONING"
value = -100
name = "$RATING_EFFECTS_YOU_ADMITTED_TO_POISONING_name" --$ You admitted to poisoning them
description = "$RATING_EFFECTS_YOU_ADMITTED_TO_POISONING_description" --$ You admitted to poisoning them

--[[------------------------------------------------------------------------------
You Failed Pinning Poisoning Poisoned
--------------------------------------------------------------------------------]]

_id = "YOU_FAILED_PINNING_POISONING_POISONED"
value = -200
name = "$RATING_EFFECTS_YOU_FAILED_PINNING_POISONING_POISONED_name" --$ You failed to convince them you didn't poison them
description = "$RATING_EFFECTS_YOU_FAILED_PINNING_POISONING_POISONED_description" --$ You failed to convince them you didn't poison them

--[[------------------------------------------------------------------------------
You Succeeded Pinning Poisoning Poisoned
--------------------------------------------------------------------------------]]

_id = "YOU_SUCCEEDED_PINNING_POISONING_POISONED"
value = -25
name = "$RATING_EFFECTS_YOU_SUCCEEDED_PINNING_POISONING_POISONED_name" --$ You fooled them into believing you didn't poison them
description = "$RATING_EFFECTS_YOU_SUCCEEDED_PINNING_POISONING_POISONED_description" --$ You fooled them into believing you didn't poison them

--[[------------------------------------------------------------------------------
You Accused Them Of Poisoning
--------------------------------------------------------------------------------]]

_id = "YOU_ACCUSED_THEM_OF_POISONING"
value = -200
name = "$RATING_EFFECTS_YOU_ACCUSED_THEM_OF_POISONING_name" --$ You falsely accused them of poisoning the booze
description = "$RATING_EFFECTS_YOU_ACCUSED_THEM_OF_POISONING_description" --$ You falsely accused them of poisoning the booze

--[[------------------------------------------------------------------------------
You Denied Poisoning
--------------------------------------------------------------------------------]]

_id = "YOU_DENIED_POISONING"
value = -50
name = "$RATING_EFFECTS_YOU_DENIED_POISONING_name" --$ You denied poisoning them
description = "$RATING_EFFECTS_YOU_DENIED_POISONING_description" --$ You denied poisoning them

--[[------------------------------------------------------------------------------
Conquered Depot
--------------------------------------------------------------------------------]]

_id = "CONQUERED_DEPOT"
value = -300
name = "$RATING_EFFECTS_CONQUERED_DEPOT_name" --$ Conquered Depot
description = "$RATING_EFFECTS_CONQUERED_DEPOT_description" --$ You conquered one of their depots
deltaId = "FORGETTING_INSULT_DELTA"

--[[------------------------------------------------------------------------------
Loan Shark Event You Refused Alternative
--------------------------------------------------------------------------------]]

_id = "LOAN_SHARK_EVENT_YOU_REFUSED_ALTERNATIVE"
value = -20
name = "$RATING_EFFECTS_LOAN_SHARK_EVENT_YOU_REFUSED_ALTERNATIVE_name" --$ Refused offering
description = "$RATING_EFFECTS_LOAN_SHARK_EVENT_YOU_REFUSED_ALTERNATIVE_description" --$ You refused their offering when they couldn't pay back loan

--[[------------------------------------------------------------------------------
Loan Shark Event You Accepted Alternative
--------------------------------------------------------------------------------]]

_id = "LOAN_SHARK_EVENT_YOU_ACCEPTED_ALTERNATIVE"
value = 20
name = "$RATING_EFFECTS_LOAN_SHARK_EVENT_YOU_ACCEPTED_ALTERNATIVE_name" --$ Accepted offering
description = "$RATING_EFFECTS_LOAN_SHARK_EVENT_YOU_ACCEPTED_ALTERNATIVE_description" --$ You accepted their offering when they couldn't pay back loan

--[[------------------------------------------------------------------------------
Mission Killed Lawyer
--------------------------------------------------------------------------------]]

_id = "MISSION_KILLED_LAWYER"
value = -100
name = "$RATING_EFFECTS_MISSION_KILLED_LAWYER_name" --$ Killed Lawyer
description = "$RATING_EFFECTS_MISSION_KILLED_LAWYER_description" --$ You killed a high ranking barrister

--[[------------------------------------------------------------------------------
Mission Spared Lawyer
--------------------------------------------------------------------------------]]

_id = "MISSION_SPARED_LAWYER"
value = 50
name = "$RATING_EFFECTS_MISSION_SPARED_LAWYER_name" --$ Spared Lawyer
description = "$RATING_EFFECTS_MISSION_SPARED_LAWYER_description" --$ You spared a high ranking barrister

--[[------------------------------------------------------------------------------
Mission Let Milla Kill
--------------------------------------------------------------------------------]]

_id = "MISSION_LET_MILLA_KILL"
value = -100
name = "$RATING_EFFECTS_MISSION_LET_MILLA_KILL_name" --$ Let Milla kill their crew
description = "$RATING_EFFECTS_MISSION_LET_MILLA_KILL_description" --$ You let Milla kill a member of their crew

--[[------------------------------------------------------------------------------
Mission Killed Milla
--------------------------------------------------------------------------------]]

_id = "MISSION_KILLED_MILLA"
value = -50
name = "$RATING_EFFECTS_MISSION_KILLED_MILLA_name" --$ Killed Milla
description = "$RATING_EFFECTS_MISSION_KILLED_MILLA_description" --$ You killed Milla

--[[------------------------------------------------------------------------------
Mission Stopped Milla
--------------------------------------------------------------------------------]]

_id = "MISSION_STOPPED_MILLA"
value = 100
name = "$RATING_EFFECTS_MISSION_STOPPED_MILLA_name" --$ Stopped Milla
description = "$RATING_EFFECTS_MISSION_STOPPED_MILLA_description" --$ You stopped Milla from killing a member of their crew

--[[------------------------------------------------------------------------------
Mission Paid Ransom
--------------------------------------------------------------------------------]]

_id = "MISSION_PAID_RANSOM"
value = 100
name = "$RATING_EFFECTS_MISSION_PAID_RANSOM_name" --$ Paid Ransom
description = "$RATING_EFFECTS_MISSION_PAID_RANSOM_description" --$ You paid the ransom

--[[------------------------------------------------------------------------------
Mission Told Them About Gangster
--------------------------------------------------------------------------------]]

_id = "MISSION_TOLD_THEM_ABOUT_GANGSTER"
value = 200
name = "$RATING_EFFECTS_MISSION_TOLD_THEM_ABOUT_GANGSTER_name" --$ Told them about disloyal gangster
description = "$RATING_EFFECTS_MISSION_TOLD_THEM_ABOUT_GANGSTER_description" --$ You told them about their disloyal gangster

--[[------------------------------------------------------------------------------
Mission Getting More Personal
--------------------------------------------------------------------------------]]

_id = "MISSION_GETTING_MORE_PERSONAL"
value = 150
name = "$RATING_EFFECTS_MISSION_GETTING_MORE_PERSONAL_name" --$ Introduced them to Veronica
description = "$RATING_EFFECTS_MISSION_GETTING_MORE_PERSONAL_description" --$ You got Veronica to write an article about them

--[[------------------------------------------------------------------------------
Bad Boi Gave Agent
--------------------------------------------------------------------------------]]

_id = "BAD_BOI_GAVE_AGENT"
value = 20
name = "$RATING_EFFECTS_BAD_BOI_GAVE_AGENT_name" --$ Gave information about BOI Agent
description = "$RATING_EFFECTS_BAD_BOI_GAVE_AGENT_description" --$ You gave them information about BOI Agent

--[[------------------------------------------------------------------------------
Explosive Temperaments Rating Loss
--------------------------------------------------------------------------------]]

_id = "EXPLOSIVE_TEMPERAMENTS_RATING_LOSS"
value = -20
name = "$RATING_EFFECTS_EXPLOSIVE_TEMPERAMENTS_RATING_LOSS_name" --$ Sent your guys after Rupert Samson
description = "$RATING_EFFECTS_EXPLOSIVE_TEMPERAMENTS_RATING_LOSS_description" --$ You sent your guys after Rupert Samson in their crew

--[[------------------------------------------------------------------------------
Loose Threads Intimidation Fail
--------------------------------------------------------------------------------]]

_id = "LOOSE_THREADS_INTIMIDATION_FAIL"
value = -100
name = "$RATING_EFFECTS_LOOSE_THREADS_INTIMIDATION_FAIL_name" --$ Failed to Intimidate Them
description = "$RATING_EFFECTS_LOOSE_THREADS_INTIMIDATION_FAIL_description" --$ You tried and failed to intimidate them

--[[------------------------------------------------------------------------------
No Such Thing Good Press
--------------------------------------------------------------------------------]]

_id = "NO_SUCH_THING_GOOD_PRESS"
value = 20
name = "$RATING_EFFECTS_NO_SUCH_THING_GOOD_PRESS_name" --$ Good Press
description = "$RATING_EFFECTS_NO_SUCH_THING_GOOD_PRESS_description" --$ They read some good things about you

--[[------------------------------------------------------------------------------
No Such Thing Good Press Half
--------------------------------------------------------------------------------]]

_id = "NO_SUCH_THING_GOOD_PRESS_HALF"
value = 10
name = "$RATING_EFFECTS_NO_SUCH_THING_GOOD_PRESS_HALF_name" --$ Good Press
description = "$RATING_EFFECTS_NO_SUCH_THING_GOOD_PRESS_HALF_description" --$ They read some good things about you

--[[------------------------------------------------------------------------------
No Such Thing Bad Press
--------------------------------------------------------------------------------]]

_id = "NO_SUCH_THING_BAD_PRESS"
value = -20
name = "$RATING_EFFECTS_NO_SUCH_THING_BAD_PRESS_name" --$ Bad Press
description = "$RATING_EFFECTS_NO_SUCH_THING_BAD_PRESS_description" --$ They read some bad things about you

--[[------------------------------------------------------------------------------
No Such Thing Bad Press Half
--------------------------------------------------------------------------------]]

_id = "NO_SUCH_THING_BAD_PRESS_HALF"
value = -10
name = "$RATING_EFFECTS_NO_SUCH_THING_BAD_PRESS_HALF_name" --$ Bad Press
description = "$RATING_EFFECTS_NO_SUCH_THING_BAD_PRESS_HALF_description" --$ They read some bad things about you

--[[------------------------------------------------------------------------------
Mission Stole Alcohol
--------------------------------------------------------------------------------]]

_id = "MISSION_STOLE_ALCOHOL"
value = -50
name = "$RATING_EFFECTS_MISSION_STOLE_ALCOHOL_name" --$ Stole Alcohol from them
description = "$RATING_EFFECTS_MISSION_STOLE_ALCOHOL_description" --$ You stole alcohol from them

--[[------------------------------------------------------------------------------
No Such Thing Sold Debt
--------------------------------------------------------------------------------]]

_id = "NO_SUCH_THING_SOLD_DEBT"
value = 10
name = "$RATING_EFFECTS_NO_SUCH_THING_SOLD_DEBT_name" --$ Sold them Virginia's debt
description = "$RATING_EFFECTS_NO_SUCH_THING_SOLD_DEBT_description" --$ You sold them Virginia's debt

--[[------------------------------------------------------------------------------
Mission Rainbow City
--------------------------------------------------------------------------------]]

_id = "MISSION_RAINBOW_CITY"
value = -200
name = "$RATING_EFFECTS_MISSION_RAINBOW_CITY_name" --$ Painted their rackets.
description = "$RATING_EFFECTS_MISSION_RAINBOW_CITY_description" --$ You painted their rackets and brought them more attention from the police

--[[------------------------------------------------------------------------------
Forgive And Forget Strike The Debt
--------------------------------------------------------------------------------]]

_id = "FORGIVE_AND_FORGET_STRIKE_THE_DEBT"
value = 100
name = "$RATING_EFFECTS_FORGIVE_AND_FORGET_STRIKE_THE_DEBT_name" --$ Struck Alicia Weiss' debt
description = "$RATING_EFFECTS_FORGIVE_AND_FORGET_STRIKE_THE_DEBT_description" --$ You struck Alicia Weiss' debt

--[[------------------------------------------------------------------------------
Forgive And Forget Gave Information
--------------------------------------------------------------------------------]]

_id = "FORGIVE_AND_FORGET_GAVE_INFORMATION"
value = -50
name = "$RATING_EFFECTS_FORGIVE_AND_FORGET_GAVE_INFORMATION_name" --$ Gave Alicia Weiss' debt to another faction
description = "$RATING_EFFECTS_FORGIVE_AND_FORGET_GAVE_INFORMATION_description" --$ You gave Alicia Weiss' debt to another faction

--[[------------------------------------------------------------------------------
Mission The Zepplin Botched Robbery
--------------------------------------------------------------------------------]]

_id = "MISSION_THE_ZEPPLIN_BOTCHED_ROBBERY"
value = -200
name = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_BOTCHED_ROBBERY_name" --$ Tried to steal alcohol
description = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_BOTCHED_ROBBERY_description" --$ You tried to steal their alcohol

--[[------------------------------------------------------------------------------
Mission The Zepplin Sabotaged
--------------------------------------------------------------------------------]]

_id = "MISSION_THE_ZEPPLIN_SABOTAGED"
value = -500
name = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_SABOTAGED_name" --$ Sabotaged their alcohol
description = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_SABOTAGED_description" --$ You sabotaged their alcohol shipment

--[[------------------------------------------------------------------------------
Mission The Zepplin Told Cops
--------------------------------------------------------------------------------]]

_id = "MISSION_THE_ZEPPLIN_TOLD_COPS"
value = -500
name = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_TOLD_COPS_name" --$ Told the cops
description = "$RATING_EFFECTS_MISSION_THE_ZEPPLIN_TOLD_COPS_description" --$ You told the cops about their alcohol shipment

--[[------------------------------------------------------------------------------
Mission Public Relations Attended Play
--------------------------------------------------------------------------------]]

_id = "MISSION_PUBLIC_RELATIONS_ATTENDED_PLAY"
value = 200
name = "$RATING_EFFECTS_MISSION_PUBLIC_RELATIONS_ATTENDED_PLAY_name" --$ Attended play
description = "$RATING_EFFECTS_MISSION_PUBLIC_RELATIONS_ATTENDED_PLAY_description" --$ You attended their play

--[[------------------------------------------------------------------------------
Mission Public Relations Hijacked Play
--------------------------------------------------------------------------------]]

_id = "MISSION_PUBLIC_RELATIONS_HIJACKED_PLAY"
value = -200
name = "$RATING_EFFECTS_MISSION_PUBLIC_RELATIONS_HIJACKED_PLAY_name" --$ Hijack play
description = "$RATING_EFFECTS_MISSION_PUBLIC_RELATIONS_HIJACKED_PLAY_description" --$ You hijacked the play that was supposed to be about them

--[[------------------------------------------------------------------------------
Attempted To Kill Gangster
--------------------------------------------------------------------------------]]

_id = "ATTEMPTED_TO_KILL_GANGSTER"
value = -400
name = "$RATING_EFFECTS_ATTEMPTED_TO_KILL_GANGSTER_name" --$ Attempted assissnation
description = "$RATING_EFFECTS_ATTEMPTED_TO_KILL_GANGSTER_description" --$ You attempted to kill their gangster

--[[------------------------------------------------------------------------------
Killed Gangster
--------------------------------------------------------------------------------]]

_id = "KILLED_GANGSTER"
value = -400
name = "$RATING_EFFECTS_KILLED_GANGSTER_name" --$ Killed gangster
description = "$RATING_EFFECTS_KILLED_GANGSTER_description" --$ You killed their gangster

--[[------------------------------------------------------------------------------
Mission Once Upon Congratulation Note
--------------------------------------------------------------------------------]]

_id = "MISSION_ONCE_UPON_CONGRATULATION_NOTE"
value = 500
name = "$RATING_EFFECTS_MISSION_ONCE_UPON_CONGRATULATION_NOTE_name" --$ Congratulation note
description = "$RATING_EFFECTS_MISSION_ONCE_UPON_CONGRATULATION_NOTE_description" --$ You sent them a congratulation note

--[[------------------------------------------------------------------------------
Mission Once Upon Protected Babies Positive
--------------------------------------------------------------------------------]]

_id = "MISSION_ONCE_UPON_PROTECTED_BABIES_POSITIVE"
value = 500
name = "$RATING_EFFECTS_MISSION_ONCE_UPON_PROTECTED_BABIES_POSITIVE_name" --$ Protected babies
description = "$RATING_EFFECTS_MISSION_ONCE_UPON_PROTECTED_BABIES_POSITIVE_description" --$ You sent extra protection for the World Fair

--[[------------------------------------------------------------------------------
Mission Once Upon Protected Babies Negative
--------------------------------------------------------------------------------]]

_id = "MISSION_ONCE_UPON_PROTECTED_BABIES_NEGATIVE"
value = -100
name = "$RATING_EFFECTS_MISSION_ONCE_UPON_PROTECTED_BABIES_NEGATIVE_name" --$ Protected babies
description = "$RATING_EFFECTS_MISSION_ONCE_UPON_PROTECTED_BABIES_NEGATIVE_description" --$ You sent extra protection for the World Fair

--[[------------------------------------------------------------------------------
Mission Once Upon Swapped Babies
--------------------------------------------------------------------------------]]

_id = "MISSION_ONCE_UPON_SWAPPED_BABIES"
value = -500
name = "$RATING_EFFECTS_MISSION_ONCE_UPON_SWAPPED_BABIES_name" --$ Swapped babies
description = "$RATING_EFFECTS_MISSION_ONCE_UPON_SWAPPED_BABIES_description" --$ You swapped babies at the World Fair

--[[------------------------------------------------------------------------------
Mission Zephyr Bought Bribed Train Driver Alone
--------------------------------------------------------------------------------]]

_id = "MISSION_ZEPHYR_BOUGHT_BRIBED_TRAIN_DRIVER_ALONE"
value = -500
name = "$RATING_EFFECTS_MISSION_ZEPHYR_BOUGHT_BRIBED_TRAIN_DRIVER_ALONE_name" --$ Outbid them
description = "$RATING_EFFECTS_MISSION_ZEPHYR_BOUGHT_BRIBED_TRAIN_DRIVER_ALONE_description" --$ You outbid them for an alcohol shipment

--[[------------------------------------------------------------------------------
Pay What You Owe Gangster Turns
--------------------------------------------------------------------------------]]

_id = "PAY_WHAT_YOU_OWE_GANGSTER_TURNS"
value = -100
name = "$RATING_EFFECTS_PAY_WHAT_YOU_OWE_GANGSTER_TURNS_name" --$ Attempted assassination
description = "$RATING_EFFECTS_PAY_WHAT_YOU_OWE_GANGSTER_TURNS_description" --$ You tried to get their own gangster to kill them

--[[------------------------------------------------------------------------------
Pay What You Owe Took Their Money
--------------------------------------------------------------------------------]]

_id = "PAY_WHAT_YOU_OWE_TOOK_THEIR_MONEY"
value = -20
name = "$RATING_EFFECTS_PAY_WHAT_YOU_OWE_TOOK_THEIR_MONEY_name" --$ Took their money
description = "$RATING_EFFECTS_PAY_WHAT_YOU_OWE_TOOK_THEIR_MONEY_description" --$ You took their money

--[[------------------------------------------------------------------------------
Mission All The Worlds A Stage
--------------------------------------------------------------------------------]]

_id = "MISSION_ALL_THE_WORLDS_A_STAGE"
value = -200
name = "$RATING_EFFECTS_MISSION_ALL_THE_WORLDS_A_STAGE_name" --$ Replaced lead actor
description = "$RATING_EFFECTS_MISSION_ALL_THE_WORLDS_A_STAGE_description" --$ You Replaced their lead actor

--[[------------------------------------------------------------------------------
Mission Jack Of All Trades
--------------------------------------------------------------------------------]]

_id = "MISSION_JACK_OF_ALL_TRADES"
value = 100
name = "$RATING_EFFECTS_MISSION_JACK_OF_ALL_TRADES_name" --$ $JackOfAllTrades_name
description = "$RATING_EFFECTS_MISSION_JACK_OF_ALL_TRADES_description" --$ $JackOfAllTrades_name
