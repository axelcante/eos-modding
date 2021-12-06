-- 
--$$ General

_namespace = "BEHAVIOURS"

--[[------------------------------------------------------------------------------
Scorned
--------------------------------------------------------------------------------]]

_id = "SCORNED"
_name = "Scorned"
modifierName = "$BEHAVIOURS_SCORNED_modifierName" --$ Scorned
modifierId = "SCORNED"
Modifier.defense = function() return "-5%", modifierName end
Modifier.movement = function() return "-1%", modifierName end
Modifier.critDefense = function() return -15, modifierName end
Modifier.hairTriggerPropensity = function() return 15, modifierName end
Modifier.drinkPropensity = function() return 20, modifierName end
desc = "$BEHAVIOURS_SCORNED_desc" --$ This character is scorned.
icon = "Sprites/AllSharedUI/MissingIcon"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Immigrant
--------------------------------------------------------------------------------]]

_id = "IMMIGRANT"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Immigrant"
modifierName = "$BEHAVIOURS_IMMIGRANT_modifierName" --$ Immigrant
modifierId = "IMMIGRANT"
Modifier.movement = function() return "10%", modifierName end
Modifier.initiative = function() return "10%", modifierName end
desc = "$BEHAVIOURS_IMMIGRANT_desc" --$ This person came to America searching for a better life.
icon = "Sprites/Icons/Trait/History/Background/Trait_Immigrant"
iconLarge = "Sprites/Icons/Trait_Large/History/Background/Trait_Immigrant_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Second Generation
--------------------------------------------------------------------------------]]

_id = "SECOND_GENERATION"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "SecondGeneration"
modifierName = "$BEHAVIOURS_SECOND_GENERATION_modifierName" --$ Second Generation
modifierId = "SECOND_GENERATION"
Modifier.loyaltyGain = function() return "10%", modifierName end
Modifier.moraleGain = function() return "10%", modifierName end
desc = "$BEHAVIOURS_SECOND_GENERATION_desc" --$ This person is an American by birth whose parents are immigrants.
icon = "Sprites/Icons/Trait/History/Background/Trait_SecondGeneraton"
iconLarge = "Sprites/Icons/Trait_Large/History/Background/Trait_SecondGeneraton_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Poverty
--------------------------------------------------------------------------------]]

_id = "POVERTY"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Poverty"
modifierName = "$BEHAVIOURS_POVERTY_modifierName" --$ Poverty
modifierId = "POVERTY"
Modifier.moraleGain = function() return "10%", modifierName end
Modifier.defense = function() return "10%", modifierName end
desc = "$BEHAVIOURS_POVERTY_desc" --$ This person grew up poor and knows what it means to struggle.
icon = "Sprites/Icons/Trait/History/Background/Trait_Poverty"
iconLarge = "Sprites/Icons/Trait_Large/History/Background/Trait_Poverty_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Fell On Hard Times
--------------------------------------------------------------------------------]]

_id = "FELL_ON_HARD_TIMES"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "FellOnHardTimes"
modifierName = "$BEHAVIOURS_FELL_ON_HARD_TIMES_modifierName" --$ Fell on Hard Times
modifierId = "FELL_ON_HARD_TIMES"
Modifier.defense = function() return "10%", modifierName end
Modifier.initiative = function() return "10%", modifierName end
desc = "$BEHAVIOURS_FELL_ON_HARD_TIMES_desc" --$ This person has lost it all and persevered.
icon = "Sprites/Icons/Trait/History/Background/Trait_FallenOnHardTimes"
iconLarge = "Sprites/Icons/Trait_Large/History/Background/Trait_FallenOnHardTimes_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Privileged
--------------------------------------------------------------------------------]]

_id = "PRIVILEGED"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Privileged"
modifierName = "$BEHAVIOURS_PRIVILEGED_modifierName" --$ Privileged
modifierId = "PRIVILEGED"
Modifier.initiative = function() return "10%", modifierName end
Modifier.persuasion = function() return "10%", modifierName end
desc = "$BEHAVIOURS_PRIVILEGED_desc" --$ This person hasn't had much, if any, hardship in their life.
icon = "Sprites/Icons/Trait/History/Background/Trait_Priviledged"
iconLarge = "Sprites/Icons/Trait_Large/History/Background/Trait_Priviledged_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Strictly Schooled
--------------------------------------------------------------------------------]]

_id = "STRICTLY_SCHOOLED"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "StrictlySchooled"
modifierName = "$BEHAVIOURS_STRICTLY_SCHOOLED_modifierName" --$ Strictly Schooled
modifierId = "STRICTLY_SCHOOLED"
Modifier.bonusHiredGun = function() return "10%", modifierName end
Modifier.bonusEnforcer = function() return "10%", modifierName end
Modifier.bonusMobDoctor = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_STRICTLY_SCHOOLED_desc" --$ This person never missed a day of school.
icon = "Sprites/Icons/Trait/History/Childhood/Trait_StrictlySchooled"
iconLarge = "Sprites/Icons/Trait_Large/History/Childhood/Trait_StrictlySchooled_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Religious
--------------------------------------------------------------------------------]]

_id = "RELIGIOUS"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Religious"
modifierName = "$BEHAVIOURS_RELIGIOUS_modifierName" --$ Religious
modifierId = "RELIGIOUS"
Modifier.moraleGain = function() return "10%", modifierName end
Modifier.leadership = function() return "10%", modifierName end
Modifier.persuasion = function() return "10%", modifierName end
desc = "$BEHAVIOURS_RELIGIOUS_desc" --$ This person grew up in a religious household.
icon = "Sprites/Icons/Trait/History/Childhood/Trait_Religious"
iconLarge = "Sprites/Icons/Trait_Large/History/Childhood/Trait_Religious_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Fled To America
must also be immigrant
--------------------------------------------------------------------------------]]

_id = "FLED_TO_AMERICA"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "FledToAmerica"
modifierName = "$BEHAVIOURS_FLED_TO_AMERICA_modifierName" --$ Fled To America
modifierId = "FLED_TO_AMERICA"
Modifier.loyaltyGain = function() return "10%", modifierName end
Modifier.bonusHiredGun = function() return "10%", modifierName end
Modifier.bonusSniper = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_FLED_TO_AMERICA_desc" --$ This person had to leave their home country for America, and not by choice.
icon = "Sprites/Icons/Trait/History/Childhood/Trait_FledToAmerica"
iconLarge = "Sprites/Icons/Trait_Large/History/Childhood/Trait_FledToAmerica_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Child Labour
--------------------------------------------------------------------------------]]

_id = "CHILD_LABOUR"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "ChildLabour"
modifierName = "$BEHAVIOURS_CHILD_LABOUR_modifierName" --$ Child Labor
modifierId = "SAFEHOUSE_EQUIPPED_CHILD_LABOUR"
Modifier.bonusConArtist = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_CHILD_LABOUR_desc" --$ This person has been working almost as long as they've been alive.
icon = "Sprites/Icons/Trait/History/Childhood/Trait_ChildLabor"
iconLarge = "Sprites/Icons/Trait_Large/History/Childhood/Trait_ChildLabor_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Delinquent
--------------------------------------------------------------------------------]]

_id = "DELINQUENT"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "Delinquent"
modifierName = "$BEHAVIOURS_DELINQUENT_modifierName" --$ Delinquent
modifierId = "SAFEHOUSE_EQUIPPED_DELINQUENT"
Modifier.intimidation = function() return "10%", modifierName end
Modifier.persuasion = function() return "10%", modifierName end
Modifier.bonusHiredGun = function() return "10%", modifierName end
Modifier.bonusDemolitionist = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_DELINQUENT_desc" --$ This person has always been trouble, and no amount of schooling could keep them in line.
icon = "Sprites/Icons/Trait/History/Adolescence/Trait_Delinquent"
iconLarge = "Sprites/Icons/Trait_Large/History/Adolescence/Trait_Delinquent_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Boxer
--------------------------------------------------------------------------------]]

_id = "BOXER"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "Boxer"
modifierName = "$BEHAVIOURS_BOXER_modifierName" --$ Boxer
modifierId = "SAFEHOUSE_EQUIPPED_BOXER"
Modifier.intimidation = function() return "10%", modifierName end
Modifier.bonusEnforcer = function() return "20%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
Modifier.meleeDamage = function() return "10%", modifierName end
desc = "$BEHAVIOURS_BOXER_desc" --$ This person has gotten into more fights than they can count on their busted up fingers.
icon = "Sprites/Icons/Trait/History/Adolescence/Trait_Boxer"
iconLarge = "Sprites/Icons/Trait_Large/History/Adolescence/Trait_Boxer_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Gang Leader
--------------------------------------------------------------------------------]]

_id = "GANG_LEADER"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "GangLeader"
modifierName = "$BEHAVIOURS_GANG_LEADER_modifierName" --$ Gang Leader
modifierId = "SAFEHOUSE_EQUIPPED_GANG_LEADER"
Modifier.leadership = function() return "10%", modifierName end
Modifier.bonusConArtist = function() return "10%", modifierName end
Modifier.bonusSniper = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_GANG_LEADER_desc" --$ This is the person others look up to, whether they're looking for guidance or the next big score.
icon = "Sprites/Icons/Trait/History/Adolescence/Trait_GangLeader"
iconLarge = "Sprites/Icons/Trait_Large/History/Adolescence/Trait_GangLeader_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Stayed In School
--------------------------------------------------------------------------------]]

_id = "STAYED_IN_SCHOOL"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "StayedInSchool"
modifierName = "$BEHAVIOURS_STAYED_IN_SCHOOL_modifierName" --$ Stayed In School
modifierId = "SAFEHOUSE_EQUIPPED_STAYED_IN_SCHOOL"
Modifier.bonusDemolitionist = function() return "10%", modifierName end
Modifier.bonusMobDoctor = function() return "10%", modifierName end
Modifier.bonusSniper = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_STAYED_IN_SCHOOL_desc" --$ This person is your standard goodie-two-shoes. They're always happy to be learning.
icon = "Sprites/Icons/Trait/History/Adolescence/Trait_StayedInSchool"
iconLarge = "Sprites/Icons/Trait_Large/History/Adolescence/Trait_StayedInSchool_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Reform School
--------------------------------------------------------------------------------]]

_id = "REFORM_SCHOOL"
_includes = {}
_includes[1] = "SAFEHOUSE_TRAIT_BASE"
_name = "ReformSchool"
modifierName = "$BEHAVIOURS_REFORM_SCHOOL_modifierName" --$ Reform School
modifierId = "SAFEHOUSE_EQUIPPED_REFORM_SCHOOL"
Modifier.leadership = function() return "10%", modifierName end
Modifier.bonusEnforcer = function() return "10%", modifierName end
Modifier.bonusConArtist = function() return "10%", modifierName end
Modifier.bonusBoss = function() return "15%", modifierName end
desc = "$BEHAVIOURS_REFORM_SCHOOL_desc" --$ This person narrowly avoided jail as a youngster. As a result, they're a little rough around the edges.
icon = "Sprites/Icons/Trait/History/Adolescence/Trait_ReformSchool"
iconLarge = "Sprites/Icons/Trait_Large/History/Adolescence/Trait_ReformSchool_Large"
buffType = "HISTORY_TRAIT"

--[[------------------------------------------------------------------------------
Trust No One
--------------------------------------------------------------------------------]]

_id = "TRUST_NO_ONE"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "TrustNoOne"
modifierName = "$BEHAVIOURS_TRUST_NO_ONE_modifierName" --$ Trust No One
modifierId = "TRUST_NO_ONE"
desc = "$BEHAVIOURS_TRUST_NO_ONE_desc" --$ This person has been burned by too many people. They won't trust a single soul.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_TrustNoOne"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_TrustNoOne_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Shoot First
--------------------------------------------------------------------------------]]

_id = "SHOOT_FIRST"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "ShootFirst"
modifierName = "$BEHAVIOURS_SHOOT_FIRST_modifierName" --$ Shoot First
modifierId = "SHOOT_FIRST"
desc = "$BEHAVIOURS_SHOOT_FIRST_desc" --$ This person's itchy trigger finger has saved them more times than it's damned them.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_ShootFirst"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_ShootFirst_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Amazing What Talking Can Achieve
--------------------------------------------------------------------------------]]

_id = "AMAZING_WHAT_TALKING_CAN_ACHIEVE"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "AmazingWhatTalkingCanAchieve"
modifierName = "$BEHAVIOURS_AMAZING_WHAT_TALKING_CAN_ACHIEVE_modifierName" --$ Amazing What Talking Can Achieve
modifierId = "AMAZING_WHAT_TALKING_CAN_ACHIEVE"
desc = "$BEHAVIOURS_AMAZING_WHAT_TALKING_CAN_ACHIEVE_desc" --$ This person has a silver tongue. They always seem to know the right thing to say.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_AmazingWhatTalkingCanDo"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_AmazingWhatTalkingCanDo_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Always Keep Your Word
--------------------------------------------------------------------------------]]

_id = "ALWAYS_KEEP_YOUR_WORD"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "AlwaysKeepYourWord"
modifierName = "$BEHAVIOURS_ALWAYS_KEEP_YOUR_WORD_modifierName" --$ Always Keep Your Word
modifierId = "ALWAYS_KEEP_YOUR_WORD"
Modifier.factionHonorsPactMoraleBonus = function() return 10, modifierName end
desc = "$BEHAVIOURS_ALWAYS_KEEP_YOUR_WORD_desc" --$ This person knows that their word is their bond. And they won't break it for anyone.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_AlwaysKeepYourWord"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_AlwaysKeepYourWord_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Never Be Disrespected
--------------------------------------------------------------------------------]]

_id = "NEVER_BE_DISRESPECTED"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "NeverBeDisrespected"
modifierName = "$BEHAVIOURS_NEVER_BE_DISRESPECTED_modifierName" --$ Never Be Disrespected
modifierId = "NEVER_BE_DISRESPECTED"
desc = "$BEHAVIOURS_NEVER_BE_DISRESPECTED_desc" --$ This person wants to call the shots, no matter what. And they don't need anyone else's input.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_NeverBeDisrespected"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_NeverBeDisrespected_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Fortune Favors The Bold
--------------------------------------------------------------------------------]]

_id = "FORTUNE_FAVORS_THE_BOLD"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "FortuneFavorsTheBold"
modifierName = "$BEHAVIOURS_FORTUNE_FAVORS_THE_BOLD_modifierName" --$ Fortune Favors the Bold
modifierId = "FORTUNE_FAVORS_THE_BOLD"
Modifier.partyRacketTakeoverMoraleBonus = function() return 20, modifierName end
desc = "$BEHAVIOURS_FORTUNE_FAVORS_THE_BOLD_desc" --$ This person loves the glory of the fight. If there's a hostile option, they'll be gunning for it.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_FortuneFavorsTheBold"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_FortuneFavorsTheBold_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Lover Not A Fighter
--------------------------------------------------------------------------------]]

_id = "LOVER_NOT_A_FIGHTER"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "LoverNotAFighter"
modifierName = "$BEHAVIOURS_LOVER_NOT_A_FIGHTER_modifierName" --$ Lover, Not a Fighter
modifierId = "LOVER_NOT_A_FIGHTER"
Modifier.hostileActionMoraleBonus = function() return -1000, modifierName end
desc = "$BEHAVIOURS_LOVER_NOT_A_FIGHTER_desc" --$ This person is a hopeless romantic. They're happier when they're in a relationship.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_LoverNotAFighter"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_LoverNotAFighter_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Show Me The Money
--------------------------------------------------------------------------------]]

_id = "SHOW_ME_THE_MONEY"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "ShowMeTheMoney"
modifierName = "$BEHAVIOURS_SHOW_ME_THE_MONEY_modifierName" --$ Show Me the Money
modifierId = "SHOW_ME_THE_MONEY"
Modifier.hostileActionMoraleBonus = function() return -1000, modifierName end
Modifier.factionAcquiresRacketMoraleBonus = function() return 10, modifierName end
desc = "$BEHAVIOURS_SHOW_ME_THE_MONEY_desc" --$ This person is born for business. Their sights are always set on racket expansion.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_ShowMeTheMoney"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_ShowMeTheMoney_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
No Man Is An Island
--------------------------------------------------------------------------------]]

_id = "NO_MAN_IS_AN_ISLAND"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "NoManIsAnIsland"
modifierName = "$BEHAVIOURS_NO_MAN_IS_AN_ISLAND_modifierName" --$ No Man Is An Island
modifierId = "NO_MAN_IS_AN_ISLAND"
desc = "$BEHAVIOURS_NO_MAN_IS_AN_ISLAND_desc" --$ This person loves to be in the company of others. The more the better.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_NoManIsAnIsland"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_NoManIsAnIsland_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Birds Of A Feather Flock Together
--------------------------------------------------------------------------------]]

_id = "BIRDS_OF_A_FEATHER_FLOCK_TOGETHER"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "BirdsOfAFeatherFlockTogether"
modifierName = "$BEHAVIOURS_BIRDS_OF_A_FEATHER_FLOCK_TOGETHER_modifierName" --$ Birds of a Feather Flock Together
modifierId = "BIRDS_OF_A_FEATHER_FLOCK_TOGETHER"
desc = "$BEHAVIOURS_BIRDS_OF_A_FEATHER_FLOCK_TOGETHER_desc" --$ This person would prefer working with others within their own profession.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_BirdsOfAFeather"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_BirdsOfAFeather_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Discretion Is The Greater Part Of Valor
--------------------------------------------------------------------------------]]

_id = "DISCRETION_IS_THE_GREATER_PART_OF_VALOR"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "DiscretionIsTheGreaterPartOfValor"
modifierName = "$BEHAVIOURS_DISCRETION_IS_THE_GREATER_PART_OF_VALOR_modifierName" --$ Discretion is the Greater Part of Valor
modifierId = "LIFE_LESSON_DISCRETION_IS_THE_GREATER_PART_OF_VALOR"
desc = "$BEHAVIOURS_DISCRETION_IS_THE_GREATER_PART_OF_VALOR_desc" --$ This person knows how to run a brothel better than almost anyone.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_DiscretionIsTheGreater"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_DiscretionIsTheGreater_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
A Penny Saved Is A Penny Earned
--------------------------------------------------------------------------------]]

_id = "A_PENNY_SAVED_IS_A_PENNY_EARNED"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "APennySavedIsAPennyEarned"
modifierName = "$BEHAVIOURS_A_PENNY_SAVED_IS_A_PENNY_EARNED_modifierName" --$ A Penny Saved is a Penny Earned
modifierId = "LIFE_LESSON_A_PENNY_SAVED_IS_A_PENNY_EARNED"
desc = "$BEHAVIOURS_A_PENNY_SAVED_IS_A_PENNY_EARNED_desc" --$ This person has been pinching pennies their whole life, and they know how to run a business cheaply and efficiently.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_APennySaved"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_APennySaved_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Easy Come Easy Go
--------------------------------------------------------------------------------]]

_id = "EASY_COME_EASY_GO"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "EasyComeEasyGo"
modifierName = "$BEHAVIOURS_EASY_COME_EASY_GO_modifierName" --$ Easy Come, Easy Go
modifierId = "EASY_COME_EASY_GO"
Modifier.moraleLoss = function() return -1000, modifierName end
desc = "$BEHAVIOURS_EASY_COME_EASY_GO_desc" --$ This person won't let much get to them. They just take everything as it comes.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_EasyComeEasyGo"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_EasyComeEasyGo_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
A Chain Is Only As Strong As Its Weakest Link
--------------------------------------------------------------------------------]]

_id = "A_CHAIN_IS_ONLY_AS_STRONG_AS_ITS_WEAKEST_LINK"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "AChainIsOnlyAsStrongAsItsWeakestLink"
modifierName = "$BEHAVIOURS_A_CHAIN_IS_ONLY_AS_STRONG_AS_ITS_WEAKEST_LINK_modifierName" --$ A Chain Is Only As Strong As Its Weakest Link
modifierId = "A_CHAIN_IS_ONLY_AS_STRONG_AS_ITS_WEAKEST_LINK"
desc = "$BEHAVIOURS_A_CHAIN_IS_ONLY_AS_STRONG_AS_ITS_WEAKEST_LINK_desc" --$ This person prefers working with professionals, or anyone who might be more qualified than they are.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_AChainIsOnlyAsStrong"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_AChainIsOnlyAsStrong_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
A Cat Has Nine Lives
--------------------------------------------------------------------------------]]

_id = "A_CAT_HAS_NINE_LIVES"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "ACatHasNineLives"
modifierName = "$BEHAVIOURS_A_CAT_HAS_NINE_LIVES_modifierName" --$ A Cat Has Nine Lives
modifierId = "A_CAT_HAS_NINE_LIVES"
desc = "$BEHAVIOURS_A_CAT_HAS_NINE_LIVES_desc" --$ This person has been legally declared dead more than once. Somehow, they keep coming back.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_ACatHasNineLives"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_ACatHasNineLives_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
A Fool And His Money Are Soon Parted
--------------------------------------------------------------------------------]]

_id = "A_FOOL_AND_HIS_MONEY_ARE_SOON_PARTED"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "AFoolAndHisMoneyAreSoonParted"
modifierName = "$BEHAVIOURS_A_FOOL_AND_HIS_MONEY_ARE_SOON_PARTED_modifierName" --$ A Fool and His Money Are Soon Parted
modifierId = "LIFE_LESSON_A_FOOL_AND_HIS_MONEY_ARE_SOON_PARTED"
desc = "$BEHAVIOURS_A_FOOL_AND_HIS_MONEY_ARE_SOON_PARTED_desc" --$ When you want your casinos rolling high, this is the person that you call.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_AFoolAndHisMoney"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_AFoolAndHisMoney_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Everyone Has Their Price
--------------------------------------------------------------------------------]]

_id = "EVERYONE_HAS_THEIR_PRICE"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "EveryoneHasTheirPrice"
modifierName = "$BEHAVIOURS_EVERYONE_HAS_THEIR_PRICE_modifierName" --$ Everyone Has Their Price
modifierId = "EVERYONE_HAS_THEIR_PRICE"
desc = "$BEHAVIOURS_EVERYONE_HAS_THEIR_PRICE_desc" --$ This person is a born schmoozer. They learned long ago that just about anyone can be bought.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_EveryoneHasTheirPrice"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_EveryoneHasTheirPrice_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Say Nothing
--------------------------------------------------------------------------------]]

_id = "SAY_NOTHING"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "SayNothing"
modifierName = "$BEHAVIOURS_SAY_NOTHING_modifierName" --$ Say Nothing
modifierId = "SAY_NOTHING"
Modifier.intimidation = function() return "10%", modifierName end
Modifier.persuasion = function() return "-10%", modifierName end
desc = "$BEHAVIOURS_SAY_NOTHING_desc" --$ This person ain't no rat. And they certainly won't work for one.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_SayNothing"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_SayNothing_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
The Work Praises The Man
--------------------------------------------------------------------------------]]

_id = "THE_WORK_PRAISES_THE_MAN"
_includes = {}
_includes[1] = "LIFE_LESSON_BASE"
_name = "TheWorkPraisesTheMan"
modifierName = "$BEHAVIOURS_THE_WORK_PRAISES_THE_MAN_modifierName" --$ The Work Praises the Man
modifierId = "LIFE_LESSON_THE_WORK_PRAISES_THE_MAN"
desc = "$BEHAVIOURS_THE_WORK_PRAISES_THE_MAN_desc" --$ This person knows the value of good, honest labor, and they'll make the working man's rackets shine.
icon = "Sprites/Icons/Trait/History/LifeLessons/Trait_TheWorkPraisesTheMan"
iconLarge = "Sprites/Icons/Trait_Large/History/LifeLessons/Trait_TheWorkPraisesTheMan_Large"
buffType = "LIFE_LESSON"

--[[------------------------------------------------------------------------------
Safehouse Equipped Child Labour
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_CHILD_LABOUR"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedChildLabour"
modifierId = "SAFEHOUSE_EQUIPPED_CHILD_LABOUR"

--[[------------------------------------------------------------------------------
Safehouse Equipped Delinquent
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_DELINQUENT"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedDelinquent"
modifierId = "SAFEHOUSE_EQUIPPED_DELINQUENT"

--[[------------------------------------------------------------------------------
Safehouse Equipped Boxer
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_BOXER"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedBoxer"
modifierId = "SAFEHOUSE_EQUIPPED_BOXER"

--[[------------------------------------------------------------------------------
Safehouse Equipped Gang Leader
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_GANG_LEADER"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedGangLeader"
modifierId = "SAFEHOUSE_EQUIPPED_GANG_LEADER"

--[[------------------------------------------------------------------------------
Safehouse Equipped Stayed In School
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_STAYED_IN_SCHOOL"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedStayedInSchool"
modifierId = "SAFEHOUSE_EQUIPPED_STAYED_IN_SCHOOL"

--[[------------------------------------------------------------------------------
Safehouse Equipped Reform School
--------------------------------------------------------------------------------]]

_id = "SAFEHOUSE_EQUIPPED_REFORM_SCHOOL"
_includes = {}
_includes[1] = "BOSS_BONUS_TRAIT_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "SafehouseEquippedReformSchool"
modifierId = "SAFEHOUSE_EQUIPPED_REFORM_SCHOOL"

--[[------------------------------------------------------------------------------
Physical Beautiful
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_BEAUTIFUL"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Beautiful"
modifierName = "$BEHAVIOURS_PHYSICAL_BEAUTIFUL_modifierName" --$ Beautiful
modifierId = "PHYSICAL_BEAUTIFUL"
Modifier.intimidation = function() return -20, modifierName end
Modifier.persuasion = function() return 30, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_BEAUTIFUL_desc" --$ This person turns heads everywhere they go.
icon = "Sprites/Icons/Trait/Physical/Trait_Beautiful"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Beautiful_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Thick Skinned
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_THICK_SKINNED"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "ThickSkinned"
modifierName = "$BEHAVIOURS_PHYSICAL_THICK_SKINNED_modifierName" --$ Thick Skinned
modifierId = "PHYSICAL_THICK_SKINNED"
Modifier.critDefense = function() return 15, modifierName end
Modifier.injuryChance = function() return -20, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_THICK_SKINNED_desc" --$ This person's skin is so tough, their calluses have calluses.
icon = "Sprites/Icons/Trait/Physical/Trait_ThickSkinned"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_ThickSkinned_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Disfigured
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_DISFIGURED"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Disfigured"
modifierName = "$BEHAVIOURS_PHYSICAL_DISFIGURED_modifierName" --$ Disfigured
modifierId = "PHYSICAL_DISFIGURED"
Modifier.intimidation = function() return 10, modifierName end
Modifier.persuasion = function() return -20, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_DISFIGURED_desc" --$ This person has been through a lot, but they wear their scars with pride.
icon = "Sprites/Icons/Trait/Physical/Trait_Disfigured"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Disfigured_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Immovable
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_IMMOVABLE"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Immovable"
modifierName = "$BEHAVIOURS_PHYSICAL_IMMOVABLE_modifierName" --$ Immovable
modifierId = "PHYSICAL_IMMOVABLE"
Modifier.knockBackDefense = function() return 10, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_IMMOVABLE_desc" --$ This person is a hard one to knock down. Maybe it's thanks to their low center of gravity.
icon = "Sprites/Icons/Trait/Physical/Trait_Immovable"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Immovable_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Small
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_SMALL"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Small"
modifierName = "$BEHAVIOURS_PHYSICAL_SMALL_modifierName" --$ Small
modifierId = "PHYSICAL_SMALL"
Modifier.defense = function() return 10, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_SMALL_desc" --$ This person uses their diminutive stature to their advantage.
icon = "Sprites/Icons/Trait/Physical/Trait_Small"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Small_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Brawny
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_BRAWNY"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Brawny"
modifierName = "$BEHAVIOURS_PHYSICAL_BRAWNY_modifierName" --$ Brawny
modifierId = "PHYSICAL_BRAWNY"
Modifier.meleeDamage = function() return 5, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_BRAWNY_desc" --$ This person has muscles in places they didn't even know existed.
icon = "Sprites/Icons/Trait/Physical/Trait_Brawny"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Brawny_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Giant
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_GIANT"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Giant"
modifierName = "$BEHAVIOURS_PHYSICAL_GIANT_modifierName" --$ Giant
modifierId = "PHYSICAL_GIANT"
Modifier.defense = function() return -5, modifierName end
Modifier.meleeDamage = function() return 5, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_GIANT_desc" --$ This person is the biggest and the strongest around. And they don't even exercise.
icon = "Sprites/Icons/Trait/Physical/Trait_Giant"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_Giant_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Adrenaline Rush
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_ADRENALINE_RUSH"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "AdrenalineRush"
modifierName = "$BEHAVIOURS_PHYSICAL_ADRENALINE_RUSH_modifierName" --$ Adrenaline Rush
modifierId = "PHYSICAL_ADRENALINE_RUSH"
desc = "$BEHAVIOURS_PHYSICAL_ADRENALINE_RUSH_desc" --$ This person's heart may be racing, but they've never felt more in control.
icon = "Sprites/Icons/Trait/Physical/Trait_AdrenalineRush"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_AdrenalineRush_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Long Distance Runner
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_LONG_DISTANCE_RUNNER"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "LongDistanceRunner"
modifierName = "$BEHAVIOURS_PHYSICAL_LONG_DISTANCE_RUNNER_modifierName" --$ Long Distance Runner
modifierId = "PHYSICAL_LONG_DISTANCE_RUNNER"
Modifier.movement = function() return 2, modifierName end
desc = "$BEHAVIOURS_PHYSICAL_LONG_DISTANCE_RUNNER_desc" --$ This person has got stamina for days.
icon = "Sprites/Icons/Trait/Physical/Trait_LongDistanceRunner"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_LongDistanceRunner_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Physical Hair Trigger
--------------------------------------------------------------------------------]]

_id = "PHYSICAL_HAIR_TRIGGER"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "HairTrigger"
modifierName = "$BEHAVIOURS_PHYSICAL_HAIR_TRIGGER_modifierName" --$ Hair Trigger
modifierId = "PHYSICAL_HAIR_TRIGGER"
desc = "$BEHAVIOURS_PHYSICAL_HAIR_TRIGGER_desc" --$ This person has a short fuse and a fiery temper.
icon = "Sprites/Icons/Trait/Physical/Trait_HairTrigger"
iconLarge = "Sprites/Icons/Trait_Large/Physical/Trait_HairTrigger_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Cruel
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_CRUEL"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "Cruel"
modifierName = "$BEHAVIOURS_PERSONALITY_CRUEL_modifierName" --$ Cruel
modifierId = "PERSONALITY_CRUEL"
Modifier.intimidation = function() return 10, modifierName end
Modifier.leadership = function() return -10, modifierName end
Modifier.lieutenantMoraleEffect = function() return "10%", modifierName end
Modifier.advisorLoyaltyEffect = function() return "-10%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_CRUEL_desc" --$ This person enjoys watching other people suffer.
icon = "Sprites/Icons/Trait/Personality/Trait_Cruel"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Cruel_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Kind
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_KIND"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Kind"
modifierName = "$BEHAVIOURS_PERSONALITY_KIND_modifierName" --$ Kind
modifierId = "PERSONALITY_KIND"
Modifier.effectResistance = function() return 10, modifierName end
Modifier.lieutenantMoraleEffect = function() return "10%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_KIND_desc" --$ This person treats others how they'd like to be treated.
icon = "Sprites/Icons/Trait/Personality/Trait_Kind"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Kind_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Angry
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_ANGRY"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Angry"
modifierName = "$BEHAVIOURS_PERSONALITY_ANGRY_modifierName" --$ Angry
modifierId = "PERSONALITY_ANGRY"
Modifier.marksmanship = function() return -10, modifierName end
Modifier.defense = function() return -10, modifierName end
Modifier.drinkPropensity = function() return 10, modifierName end
Modifier.relapsePropensity = function() return 10, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_ANGRY_desc" --$ This person isn't afraid to tell people how they really feel.
icon = "Sprites/Icons/Trait/Personality/Trait_Angry"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Angry_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Calm
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_CALM"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Calm"
modifierName = "$BEHAVIOURS_PERSONALITY_CALM_modifierName" --$ Calm
modifierId = "PERSONALITY_CALM"
Modifier.bleedOutChance = function() return 25, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_CALM_desc" --$ This person takes things as they come.
icon = "Sprites/Icons/Trait/Personality/Trait_Calm"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Calm_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Sullen
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_SULLEN"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Sullen"
modifierName = "$BEHAVIOURS_PERSONALITY_SULLEN_modifierName" --$ Sullen
modifierId = "PERSONALITY_SULLEN"
turnsDuration = 100
Modifier.marksmanship = function() return -5, modifierName end
Modifier.leadership = function() return -10, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_SULLEN_desc" --$ For this person, things just don't seem to go their way.
icon = "Sprites/Icons/Trait/Personality/Trait_Sullen"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Sullen_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Happy
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_HAPPY"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Happy"
modifierName = "$BEHAVIOURS_PERSONALITY_HAPPY_modifierName" --$ Happy
modifierId = "PERSONALITY_HAPPY"
Modifier.marksmanship = function() return 5, modifierName end
Modifier.partyInProximityMoraleGain = function() return "5%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_HAPPY_desc" --$ This person is more of a "cup is half full" kinda person.
icon = "Sprites/Icons/Trait/Personality/Trait_Happy"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Happy_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Reckless
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_RECKLESS"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Reckless"
modifierName = "$BEHAVIOURS_PERSONALITY_RECKLESS_modifierName" --$ Reckless
modifierId = "PERSONALITY_RECKLESS"
Modifier.defense = function() return -5, modifierName end
Modifier.initiative = function() return 10, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_RECKLESS_desc" --$ This person has never met a risk they didn't like.
icon = "Sprites/Icons/Trait/Personality/Trait_Reckless"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Reckless_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Careful
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_CAREFUL"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Careful"
modifierName = "$BEHAVIOURS_PERSONALITY_CAREFUL_modifierName" --$ Careful
modifierId = "PERSONALITY_CAREFUL"
Modifier.critDefense = function() return 15, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_CAREFUL_desc" --$ This person looks both ways twice before crossing the street.
icon = "Sprites/Icons/Trait/Personality/Trait_Careful"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Careful_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Intolerant
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_INTOLERANT"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Intolerant"
modifierName = "$BEHAVIOURS_PERSONALITY_INTOLERANT_modifierName" --$ Intolerant
modifierId = "PERSONALITY_INTOLERANT"
Modifier.critChance = function() return -5, modifierName end
Modifier.critDamage = function() return "-5%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_INTOLERANT_desc" --$ This person doesn't like most people, and doesn't understand people who do.
icon = "Sprites/Icons/Trait/Personality/Trait_Intolerant"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Intolerant_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Tolerant
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_TOLERANT"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Tolerant"
modifierName = "$BEHAVIOURS_PERSONALITY_TOLERANT_modifierName" --$ Tolerant
modifierId = "PERSONALITY_TOLERANT"
Modifier.injuryChance = function() return 5, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_TOLERANT_desc" --$ This person gets along with most people.
icon = "Sprites/Icons/Trait/Personality/Trait_Tolerant"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Tolerant_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Coward
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_COWARD"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Coward"
modifierName = "$BEHAVIOURS_PERSONALITY_COWARD_modifierName" --$ Coward
modifierId = "PERSONALITY_COWARD"
Modifier.chanceToFleeWithTeamMember = function() return 25, modifierName end
desc = "$BEHAVIOURS_PERSONALITY_COWARD_desc" --$ This person turns tail the moment things get too tough.
icon = "Sprites/Icons/Trait/Personality/Trait_Coward"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Coward_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Brave
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_BRAVE"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Brave"
modifierName = "$BEHAVIOURS_PERSONALITY_BRAVE_modifierName" --$ Brave
modifierId = "PERSONALITY_BRAVE"
desc = "$BEHAVIOURS_PERSONALITY_BRAVE_desc" --$ This person will gladly take one for the team.
icon = "Sprites/Icons/Trait/Personality/Trait_Brave"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Brave_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Flirt
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_FLIRT"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Flirt"
modifierName = "$BEHAVIOURS_PERSONALITY_FLIRT_modifierName" --$ Flirt
modifierId = "PERSONALITY_FLIRT"
desc = "$BEHAVIOURS_PERSONALITY_FLIRT_desc" --$ This person wants everyone to want them. And usually everyone does.
icon = "Sprites/Icons/Trait/Personality/Trait_Flirt"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Flirt_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Loner
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_LONER"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "Loner"
modifierName = "$BEHAVIOURS_PERSONALITY_LONER_modifierName" --$ Loner
modifierId = "PERSONALITY_LONER"
desc = "$BEHAVIOURS_PERSONALITY_LONER_desc" --$ This person doesn't need or want anyone to get close to them.
icon = "Sprites/Icons/Trait/Personality/Trait_Loner"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Loner_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Cunning
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_CUNNING"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Cunning"
modifierName = "$BEHAVIOURS_PERSONALITY_CUNNING_modifierName" --$ Cunning
modifierId = "PERSONALITY_CUNNING"
desc = "$BEHAVIOURS_PERSONALITY_CUNNING_desc" --$ This person has got more than a few tricks up their sleeve.
icon = "Sprites/Icons/Trait/Personality/Trait_Cunning"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Cunning_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Naive
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_NAIVE"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Naive"
modifierName = "$BEHAVIOURS_PERSONALITY_NAIVE_modifierName" --$ Naive
modifierId = "PERSONALITY_NAIVE"
Modifier.salary = function() return "-1%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_NAIVE_desc" --$ This person is a little too trusting of others.
icon = "Sprites/Icons/Trait/Personality/Trait_Naive"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Naive_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Aggressive
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_AGGRESSIVE"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Aggressive"
modifierName = "$BEHAVIOURS_PERSONALITY_AGGRESSIVE_modifierName" --$ Aggressive
modifierId = "PERSONALITY_AGGRESSIVE"
desc = "$BEHAVIOURS_PERSONALITY_AGGRESSIVE_desc" --$ This person isn't above forcing others to see things their way.
icon = "Sprites/Icons/Trait/Personality/Trait_Aggressive"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Aggressive_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Personality Greedy
displaying of effects on faction ai pending design review
--------------------------------------------------------------------------------]]

_id = "PERSONALITY_GREEDY"
_includes = {}
_includes[1] = "PERSONALITY_TRAIT_BASE"
_name = "Greedy"
modifierName = "$BEHAVIOURS_PERSONALITY_GREEDY_modifierName" --$ Greedy
modifierId = "PERSONALITY_GREEDY"
Modifier.salary = function() return "1%", modifierName end
desc = "$BEHAVIOURS_PERSONALITY_GREEDY_desc" --$ If there's something there for the taking, this person wants it all to themself.
icon = "Sprites/Icons/Trait/Personality/Trait_Greedy"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Greedy_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Casino Upscale
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_CASINO_UPSCALE"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "Upscale"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_UPSCALE_modifierName" --$ Upscale
modifierId = "EMPIRE_TALENT_CASINO_UPSCALE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_UPSCALE_desc" --$ This person knows the importance of a classy and sophisticated atmosphere. Theirs is the place people want to be.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Casino_Upscale"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Casino_Upscale_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Casino Tough Guy
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_CASINO_TOUGH_GUY"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "ToughGuy"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_TOUGH_GUY_modifierName" --$ Tough Guy
modifierId = "EMPIRE_TALENT_CASINO_TOUGH_GUY"
desc = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_TOUGH_GUY_desc" --$ This person has the extra muscle to look after the joint.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Casino_ToughGuy"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Casino_ToughGuy_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Casino Swanky
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_CASINO_SWANKY"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "Swanky"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_SWANKY_modifierName" --$ Swanky
modifierId = "EMPIRE_TALENT_CASINO_SWANKY"
desc = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_SWANKY_desc" --$ This person knows how to class up the joint on the cheap.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Casino_Swanky"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Casino_Swanky_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Casino Holding Aces
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_CASINO_HOLDING_ACES"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "HoldingAces"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_HOLDING_ACES_modifierName" --$ Holding Aces
modifierId = "EMPIRE_TALENT_CASINO_HOLDING_ACES"
desc = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_HOLDING_ACES_desc" --$ This person always seems to be in the right place at the right time. Must be luck.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Casino_HoldingAces"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Casino_HoldingAces_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Casino Pit Boss
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_CASINO_PIT_BOSS"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "PitBoss"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_PIT_BOSS_modifierName" --$ Pit Boss
modifierId = "EMPIRE_TALENT_CASINO_PIT_BOSS"
desc = "$BEHAVIOURS_EMPIRE_TALENT_CASINO_PIT_BOSS_desc" --$ This person runs the show, and they're raking in more dough than they can count.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Casino_PitBoss"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Casino_PitBoss_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brothel Setting The Mood
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BROTHEL_SETTING_THE_MOOD"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "SettingTheMood"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_SETTING_THE_MOOD_modifierName" --$ Setting the Mood
modifierId = "EMPIRE_TALENT_BROTHEL_SETTING_THE_MOOD"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_SETTING_THE_MOOD_desc" --$ This person knows how to get the place looking just right to put everyone in the right mood.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brothel_SettingTheMood"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brothel_SettingTheMood_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brothel Tricks Of The Trade
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BROTHEL_TRICKS_OF_THE_TRADE"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "TricksOfTheTrade"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_TRICKS_OF_THE_TRADE_modifierName" --$ Tricks of the Trade
modifierId = "EMPIRE_TALENT_BROTHEL_TRICKS_OF_THE_TRADE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_TRICKS_OF_THE_TRADE_desc" --$ This person knows all the right tricks to keep the place running smooth.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brothel_TricksOfTheTrade"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brothel_TricksOfTheTrade_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brothel Discretion Guaranteed
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BROTHEL_DISCRETION_GUARANTEED"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "DiscretionGuaranteed"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_DISCRETION_GUARANTEED_modifierName" --$ Discretion Guaranteed
modifierId = "EMPIRE_TALENT_BROTHEL_DISCRETION_GUARANTEED"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_DISCRETION_GUARANTEED_desc" --$ This person has their staff schooled in knowing when to pull those shades down and keep prying eyes away.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brothel_DiscretionGuaranteed"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brothel_DiscretionGuaranteed_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brothel Knowing What Works
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BROTHEL_KNOWING_WHAT_WORKS"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "KnowingWhatWorks"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_KNOWING_WHAT_WORKS_modifierName" --$ Knowing What Works
modifierId = "EMPIRE_TALENT_BROTHEL_KNOWING_WHAT_WORKS"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_KNOWING_WHAT_WORKS_desc" --$ This person has experience. They know exactly what the people want, and they know how to deliver.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brothel_KnowingWhatWorks"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brothel_KnowingWhatWorks_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brothel Top Pimp Madam
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BROTHEL_TOP_PIMP_MADAM"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "TopPimpMadam"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_TOP_PIMP_MADAM_modifierName" --$ Top Pimp/Madam
modifierId = "EMPIRE_TALENT_BROTHEL_TOP_PIMP_MADAM"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BROTHEL_TOP_PIMP_MADAM_desc" --$ This person is the master of their trade. They know how to get those clients spending.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brothel_TopPimp"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brothel_TopPimp_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brewery Nothing To See Here
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BREWERY_NOTHING_TO_SEE_HERE"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "NothingToSeeHere"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_NOTHING_TO_SEE_HERE_modifierName" --$ Nothing to See Here
modifierId = "EMPIRE_TALENT_BREWERY_NOTHING_TO_SEE_HERE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_NOTHING_TO_SEE_HERE_desc" --$ This person keeps the machine humming at just the right volume, keeping the cops at bay.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brewery_NothingToSeeHere"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brewery_NothingToSeeHere_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brewery Pile Em High
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BREWERY_PILE_EM_HIGH"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "PileEmHigh"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_PILE_EM_HIGH_modifierName" --$ Pile 'Em High
modifierId = "EMPIRE_TALENT_BREWERY_PILE_EM_HIGH"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_PILE_EM_HIGH_desc" --$ This person knows how to stack 'em, which makes it easier to store 'em.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brewery_PileEmHigh"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brewery_PileEmHigh_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brewery Builder
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BREWERY_BUILDER"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "Builder"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_BUILDER_modifierName" --$ Builder
modifierId = "EMPIRE_TALENT_BREWERY_BUILDER"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_BUILDER_desc" --$ This person's got people who know how to fix something if it breaks. Nothing goes to waste.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brewery_Builder"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brewery_Builder_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brewery Keep Em Out
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BREWERY_KEEP_EM_OUT"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "KeepEmOut"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_KEEP_EM_OUT_modifierName" --$ Keep 'Em Out
modifierId = "EMPIRE_TALENT_BREWERY_KEEP_EM_OUT"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_KEEP_EM_OUT_desc" --$ This person's got a lotta product, and they know how best to protect it.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brewery_KeepEmOut"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brewery_KeepEmOut_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Brewery Master Brewer
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_BREWERY_MASTER_BREWER"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "MasterBrewer"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_MASTER_BREWER_modifierName" --$ Master Brewer
modifierId = "EMPIRE_TALENT_BREWERY_MASTER_BREWER"
desc = "$BEHAVIOURS_EMPIRE_TALENT_BREWERY_MASTER_BREWER_desc" --$ This person knows how to brew the booze that brings people back again and again.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Brewery_MasterBrewer"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Brewery_MasterBrewer_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy Know Everyones Name
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_KNOW_EVERYONES_NAME"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "KnowEveryonesName"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_KNOW_EVERYONES_NAME_modifierName" --$ Know Everyone's Name
modifierId = "EMPIRE_TALENT_SPEAKEASY_KNOW_EVERYONES_NAME"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_KNOW_EVERYONES_NAME_desc" --$ This person makes sure everyone always feels welcome in their joint at the end of a long day.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_KnowEveryonesName"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_KnowEveryonesName_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy Keep It On The Qt
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_KEEP_IT_ON_THE_QT"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "KeepItOnTheQT"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_KEEP_IT_ON_THE_QT_modifierName" --$ Keep It on the QT
modifierId = "EMPIRE_TALENT_SPEAKEASY_KEEP_IT_ON_THE_QT"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_KEEP_IT_ON_THE_QT_desc" --$ This person doesn't let the place get too hot. They know how to keep a low profile.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_KeepItOnTheQT"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_KeepItOnTheQT_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy A Little Something Officer
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_A_LITTLE_SOMETHING_OFFICER"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "ALittleSomethingOfficer"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_A_LITTLE_SOMETHING_OFFICER_modifierName" --$ A Little Something, Officer?
modifierId = "EMPIRE_TALENT_SPEAKEASY_A_LITTLE_SOMETHING_OFFICER"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_A_LITTLE_SOMETHING_OFFICER_desc" --$ This person keeps cops on the take, which makes everyone happy, and lowers the chance of an unwanted intrusion.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_ALitteSomethingOfficer"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_ALitteSomethingOfficer_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy My Word Is Good
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_MY_WORD_IS_GOOD"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "MyWordIsGood"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_MY_WORD_IS_GOOD_modifierName" --$ My Word is Good
modifierId = "EMPIRE_TALENT_SPEAKEASY_MY_WORD_IS_GOOD"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_MY_WORD_IS_GOOD_desc" --$ This person's name inspires trust, just like any good brand. People want to work with them.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_MyWordIsGood"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_MyWordIsGood_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy Bouncers
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_BOUNCERS"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "Bouncers"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_BOUNCERS_modifierName" --$ Bouncers
modifierId = "EMPIRE_TALENT_SPEAKEASY_BOUNCERS"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_BOUNCERS_desc" --$ This person has the kinda brawn out front that makes sure nobody will mess with their place.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_Bouncers"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_Bouncers_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Speakeasy Beer Magnate
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_SPEAKEASY_BEER_MAGNATE"
_includes = {}
_includes[1] = "EMPIRE_TALENT_BASE"
_name = "BeerMagnate"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_BEER_MAGNATE_modifierName" --$ Beer Magnate
modifierId = "EMPIRE_TALENT_SPEAKEASY_BEER_MAGNATE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_SPEAKEASY_BEER_MAGNATE_desc" --$ This person knows that perfecting the art of selling beer takes practice.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Speakeasy_BeerMagnate"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Speakeasy_BeerMagnate_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Hotel A Nightcap Sir
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_HOTEL_A_NIGHTCAP_SIR"
_includes = {}
_includes[1] = "HOTEL_EMPIRE_TALENT_BASE"
_name = "ANightcapSir"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_A_NIGHTCAP_SIR_modifierName" --$ A Nightcap Sir?
modifierId = "EMPIRE_TALENT_HOTEL_A_NIGHTCAP_SIR"
desc = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_A_NIGHTCAP_SIR_desc" --$ This person believes patrons might as well stay over while they're drinking in the neighborhood...
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Hotel_NightCapSir"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Hotel_NightCapSir_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Hotel Room Service
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_HOTEL_ROOM_SERVICE"
_includes = {}
_includes[1] = "HOTEL_EMPIRE_TALENT_BASE"
_name = "RoomService"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_ROOM_SERVICE_modifierName" --$ Room Service?
modifierId = "EMPIRE_TALENT_HOTEL_ROOM_SERVICE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_ROOM_SERVICE_desc" --$ This person knows a little something extra at the end of the day never hurt anybody.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Hotel_RoomService"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Hotel_RoomService_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Hotel A Game Of Chance Perchance
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_HOTEL_A_GAME_OF_CHANCE_PERCHANCE"
_includes = {}
_includes[1] = "HOTEL_EMPIRE_TALENT_BASE"
_name = "AGameOfChancePerchance"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_A_GAME_OF_CHANCE_PERCHANCE_modifierName" --$ A Game of Chance, Perchance?
modifierId = "EMPIRE_TALENT_HOTEL_A_GAME_OF_CHANCE_PERCHANCE"
desc = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_A_GAME_OF_CHANCE_PERCHANCE_desc" --$ This person is happy to cater to guests with an appetite for gambling.
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Hotel_AGameOfChance"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Hotel_AGameOfChance_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Hotel Finer Customers
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_HOTEL_FINER_CUSTOMERS"
_includes = {}
_includes[1] = "HOTEL_EMPIRE_TALENT_BASE"
_name = "FinerCustomers"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_FINER_CUSTOMERS_modifierName" --$ Finer Customers
modifierId = "EMPIRE_TALENT_HOTEL_FINER_CUSTOMERS"
desc = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_FINER_CUSTOMERS_desc" --$ This person knows where to find the finer things in life for those inclined. 
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Hotel_FinerCustomers"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Hotel_FinerCustomers_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Empire Talent Hotel Master Hotelier
replace baked-in modifier info in description with dynamic population
--------------------------------------------------------------------------------]]

_id = "EMPIRE_TALENT_HOTEL_MASTER_HOTELIER"
_includes = {}
_includes[1] = "HOTEL_EMPIRE_TALENT_BASE"
_name = "MasterHotelier"
modifierName = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_MASTER_HOTELIER_modifierName" --$ Master Hotelier
modifierId = "EMPIRE_TALENT_HOTEL_MASTER_HOTELIER"
desc = "$BEHAVIOURS_EMPIRE_TALENT_HOTEL_MASTER_HOTELIER_desc" --$ This person's a jack of all trades. People go to them because they can offer what's needed, whatever it may be. 
icon = "Sprites/Icons/Trait/RacketBonuses/Trait_Hotel_MasterHotelier"
iconLarge = "Sprites/Icons/Trait_Large/RacketBonuses/Trait_Hotel_MasterHotelier_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Caution
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_CAUTION"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Caution"
modifierName = "$BEHAVIOURS_NEGATIVE_CAUTION_modifierName" --$ Caution
modifierId = "NEGATIVE_CAUTION"
Modifier.halfCover = function() return 5, modifierName end
desc = "$BEHAVIOURS_NEGATIVE_CAUTION_desc" --$ This person always needs to know where all of the exits are. Just in case.
icon = "Sprites/Icons/Trait/Negative/Trait_Caution"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_Caution_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Unfocused
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_UNFOCUSED"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Unfocused"
modifierName = "$BEHAVIOURS_NEGATIVE_UNFOCUSED_modifierName" --$ Unfocused
modifierId = "NEGATIVE_UNFOCUSED"
desc = "$BEHAVIOURS_NEGATIVE_UNFOCUSED_desc" --$ This person is more than a little scatterbrained.
icon = "Sprites/Icons/Trait/Negative/Trait_Unfocussed"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_Unfocussed_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Fearful
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_FEARFUL"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Fearful"
modifierName = "$BEHAVIOURS_NEGATIVE_FEARFUL_modifierName" --$ Fearful
modifierId = "NEGATIVE_FEARFUL"
Modifier.chanceToFleeWithTeamMember = function() return 25, modifierName end
desc = "$BEHAVIOURS_NEGATIVE_FEARFUL_desc" --$ This person really doesn't like to see blood. Especially their own.
icon = "Sprites/Icons/Trait/Negative/Trait_Fearful"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_Fearful_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Shell Shock
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_SHELL_SHOCK"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "ShellShock"
modifierName = "$BEHAVIOURS_NEGATIVE_SHELL_SHOCK_modifierName" --$ Shell Shock
modifierId = "NEGATIVE_SHELL_SHOCK"
desc = "$BEHAVIOURS_NEGATIVE_SHELL_SHOCK_desc" --$ This person has seen their share of heavy combat, and it's taken its toll on them.
icon = "Sprites/Icons/Trait/Negative/Trait_ShellShocked"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_ShellShocked_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Backs Away
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_BACKS_AWAY"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "BacksAway"
modifierName = "$BEHAVIOURS_NEGATIVE_BACKS_AWAY_modifierName" --$ Backs Away
modifierId = "NEGATIVE_BACKS_AWAY"
Modifier.receiveMeleeAttackMoraleLoss = function() return 5, modifierName end
desc = "$BEHAVIOURS_NEGATIVE_BACKS_AWAY_desc" --$ This person doesn't like to get too close in combat.
icon = "Sprites/Icons/Trait/Negative/Trait_BacksAway"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_BacksAway_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Up Close
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_UP_CLOSE"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "UpClose"
modifierName = "$BEHAVIOURS_NEGATIVE_UP_CLOSE_modifierName" --$ Up Close
modifierId = "NEGATIVE_UP_CLOSE"
desc = "$BEHAVIOURS_NEGATIVE_UP_CLOSE_desc" --$ This person prefers the personal approach when in combat.
icon = "Sprites/Icons/Trait/Negative/Trait_UpClose"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_UpClose_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Mad Dog
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_MAD_DOG"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "MadDog"
modifierName = "$BEHAVIOURS_NEGATIVE_MAD_DOG_modifierName" --$ Mad Dog
modifierId = "NEGATIVE_MAD_DOG"
desc = "$BEHAVIOURS_NEGATIVE_MAD_DOG_desc" --$ This person's rage knows no bounds. God help anyone that gets in their way.
icon = "Sprites/Icons/Trait/Negative/Trait_MadDog"
iconLarge = "Sprites/Icons/Trait_Large/Negative/Trait_MadDog_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Negative Worrier
--------------------------------------------------------------------------------]]

_id = "NEGATIVE_WORRIER"
_includes = {}
_includes[1] = "TRAIT_BASE"
_includes[2] = "PROXIMITY_CHECKER"
_name = "Worrier"
modifierName = "$BEHAVIOURS_NEGATIVE_WORRIER_modifierName" --$ Worrier
modifierId = "NEGATIVE_WORRIER"
desc = "$BEHAVIOURS_NEGATIVE_WORRIER_desc" --$ This person is overly concerned about nearly everything.
icon = "Sprites/Icons/Trait/Personality/Trait_Worrier"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Worrier_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Untrustworthy
--------------------------------------------------------------------------------]]

_id = "HIDDEN_UNTRUSTWORTHY"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Untrustworthy"
modifierName = "$BEHAVIOURS_HIDDEN_UNTRUSTWORTHY_modifierName" --$ Untrustworthy
modifierId = "HIDDEN_UNTRUSTWORTHY"
Modifier.partyInProximityMoraleLoss = function() return "20%", modifierName end
desc = "$BEHAVIOURS_HIDDEN_UNTRUSTWORTHY_desc" --$ This person can barely keep a secret, and everyone knows it.
icon = "Sprites/Icons/Trait/Personality/Trait_Untrustworthy"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Untrustworthy_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Dishonest
--------------------------------------------------------------------------------]]

_id = "HIDDEN_DISHONEST"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Dishonest"
modifierName = "$BEHAVIOURS_HIDDEN_DISHONEST_modifierName" --$ Dishonest
modifierId = "HIDDEN_DISHONEST"
desc = "$BEHAVIOURS_HIDDEN_DISHONEST_desc" --$ This person's not just a liar, they're a known liar, and that's much worse.
icon = "Sprites/Icons/Trait/Personality/Trait_Dishonest"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Dishonest_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Affectionate
--------------------------------------------------------------------------------]]

_id = "HIDDEN_AFFECTIONATE"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Affectionate"
modifierName = "$BEHAVIOURS_HIDDEN_AFFECTIONATE_modifierName" --$ Affectionate
modifierId = "HIDDEN_AFFECTIONATE"
Modifier.fallInLoveChance = function() return 20, modifierName end
desc = "$BEHAVIOURS_HIDDEN_AFFECTIONATE_desc" --$ This person is a hopeless romantic.
icon = "Sprites/Icons/Trait/Personality/Trait_Affectionate"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Affectionate_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Drunkard
--------------------------------------------------------------------------------]]

_id = "HIDDEN_DRUNKARD"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Drunkard"
modifierName = "$BEHAVIOURS_HIDDEN_DRUNKARD_modifierName" --$ Drunkard
modifierId = "HIDDEN_DRUNKARD"
desc = "$BEHAVIOURS_HIDDEN_DRUNKARD_desc" --$ This person has a tendency to overdo it at the bar. And everywhere else.
icon = "Sprites/Icons/Trait/Personality/Trait_Drunkard"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Drunkard_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Alcoholic
--------------------------------------------------------------------------------]]

_id = "HIDDEN_ALCOHOLIC"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Alcoholic"
modifierName = "$BEHAVIOURS_HIDDEN_ALCOHOLIC_modifierName" --$ Alcoholic
modifierId = "HIDDEN_ALCOHOLIC"
desc = "$BEHAVIOURS_HIDDEN_ALCOHOLIC_desc" --$ This person hit the bottle hard and it's a part of who they are now.
icon = "Sprites/Icons/Trait/Personality/Trait_Alcoholic"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Alcoholic_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Alone
--------------------------------------------------------------------------------]]

_id = "HIDDEN_ALONE"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Alone"
modifierName = "$BEHAVIOURS_HIDDEN_ALONE_modifierName" --$ Alone
modifierId = "HIDDEN_ALONE"
Modifier.initiative = function() return -10, modifierName end
desc = "$BEHAVIOURS_HIDDEN_ALONE_desc" --$ This person prefers not to be in the company of others.
icon = "Sprites/Icons/Trait/Personality/Trait_Alone"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Alone_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Hidden Flighty
--------------------------------------------------------------------------------]]

_id = "HIDDEN_FLIGHTY"
_includes = {}
_includes[1] = "HIDDEN_TRAIT_BASE"
_name = "Flighty"
modifierName = "$BEHAVIOURS_HIDDEN_FLIGHTY_modifierName" --$ Flighty
modifierId = "HIDDEN_FLIGHTY"
Modifier.chanceToRunAtHalfHealth = function() return 25, modifierName end
desc = "$BEHAVIOURS_HIDDEN_FLIGHTY_desc" --$ This person picks up their feet and gets going as soon as things get tough. 
icon = "Sprites/Icons/Trait/Personality/Trait_Flighty"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Flighty_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Bomb Suit
--------------------------------------------------------------------------------]]

_id = "BOMB_SUIT"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "BombSuit"
modifierName = "$BEHAVIOURS_BOMB_SUIT_modifierName" --$ Bomb Suit
modifierId = "BOMB_SUIT"
Modifier.knockBackDefense = function() return 50, modifierName end
Modifier.explosiveDamageReduction = function() return "20%", modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_BombSuit"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_BombSuit_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Explosive Ordnance Training
--------------------------------------------------------------------------------]]

_id = "EXPLOSIVE_ORDNANCE_TRAINING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ExplosiveOrdnanceTraining"
modifierName = "$BEHAVIOURS_EXPLOSIVE_ORDNANCE_TRAINING_modifierName" --$ Explosive Ordnance Training
modifierId = "EXPLOSIVE_ORDNANCE_TRAINING"
icon = "Sprites/Icons/StatusEffects/StatusEffect_ExplosiveOrdnanceTraining"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ExplosiveOrdnanceTraining_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bunker Down
--------------------------------------------------------------------------------]]

_id = "BUNKER_DOWN"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "BunkerDown"
modifierName = "$BEHAVIOURS_BUNKER_DOWN_modifierName" --$ Bunker Down
modifierId = "BUNKER_DOWN"
icon = "Sprites/Icons/StatusEffects/StatusEffect_BunkerDown"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_BunkerDown_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Chain Reaction
--------------------------------------------------------------------------------]]

_id = "CHAIN_REACTION"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ChainReaction"
modifierName = "$BEHAVIOURS_CHAIN_REACTION_modifierName" --$ Chain Reaction
modifierId = "CHAIN_REACTION"
icon = "Sprites/Icons/StatusEffects/StatusEffect_ChainReaction"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ChainReaction_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Kill Cord Bonus
--------------------------------------------------------------------------------]]

_id = "KILL_CORD_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "KillCordBonus"
modifierName = "$BEHAVIOURS_KILL_CORD_BONUS_modifierName" --$ Kill Cord
modifierId = "KILL_CORD_BONUS"
icon = "Sprites/Icons/StatusEffects/StatusEffect_KillCord"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_KillCord_Large"
buffType = "NEUTRAL"

--[[------------------------------------------------------------------------------
Break Weapon Penalty
--------------------------------------------------------------------------------]]

_id = "BREAK_WEAPON_PENALTY"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BreakWeaponPenalty"
modifierName = "$BEHAVIOURS_BREAK_WEAPON_PENALTY_modifierName" --$ Broken Weapon
modifierId = "BREAK_WEAPON_PENALTY"
desc = "$BEHAVIOURS_BREAK_WEAPON_PENALTY_desc" --$ Use the Repair Weapon action to repair your currently equipped weapon.
icon = "Sprites/Icons/StatusEffects/StatusEffect_WeaponBreak"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_WeaponBreak_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Light Footed
--------------------------------------------------------------------------------]]

_id = "LIGHT_FOOTED"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "LightFooted"
modifierName = "$BEHAVIOURS_LIGHT_FOOTED_modifierName" --$ Light Footed
modifierId = "LIGHT_FOOTED"
icon = "Sprites/Icons/StatusEffects/StatusEffect_LightFooted"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_LightFooted_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Pick Pocket
--------------------------------------------------------------------------------]]

_id = "PICK_POCKET"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "PickPocket"
modifierName = "$BEHAVIOURS_PICK_POCKET_modifierName" --$ Pick Pocket
modifierId = "PICK_POCKET"
icon = "Sprites/Icons/StatusEffects/StatusEffect_PickPocket"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_PickPocket_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Poison Tipped Blade
--------------------------------------------------------------------------------]]

_id = "POISON_TIPPED_BLADE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "PoisonTippedBlade"
modifierName = "$BEHAVIOURS_POISON_TIPPED_BLADE_modifierName" --$ Poison-Tipped Blade
modifierId = "POISON_TIPPED_BLADE"
icon = "Sprites/Icons/StatusEffects/StatusEffect_PoisonTippedBlade"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_PoisonTippedBlade_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Low Profile
--------------------------------------------------------------------------------]]

_id = "LOW_PROFILE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "LowProfile"
modifierName = "$BEHAVIOURS_LOW_PROFILE_modifierName" --$ Low Profile
modifierId = "LOW_PROFILE"
icon = "Sprites/Icons/StatusEffects/StatusEffect_LowProfile"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_LowProfile_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bullet Shield Guardian
--------------------------------------------------------------------------------]]

_id = "BULLET_SHIELD_GUARDIAN"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BulletShieldGuardian"
modifierName = "$BEHAVIOURS_BULLET_SHIELD_GUARDIAN_modifierName" --$ Bullet Shield Guardian
modifierId = "BULLET_SHIELD_GUARDIAN"
turnsDuration = 3
desc = "$BEHAVIOURS_BULLET_SHIELD_GUARDIAN_desc" --$ Any damage done to you is reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Protected"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Protected_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bullet Shield Protected
--------------------------------------------------------------------------------]]

_id = "BULLET_SHIELD_PROTECTED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BulletShieldProtected"
modifierName = "$BEHAVIOURS_BULLET_SHIELD_PROTECTED_modifierName" --$ Bullet Shield Protected
modifierId = "BULLET_SHIELD_PROTECTED"
turnsDuration = 3
desc = "$BEHAVIOURS_BULLET_SHIELD_PROTECTED_desc" --$ Any damage done to you is reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Protected"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Protected_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bulwark
--------------------------------------------------------------------------------]]

_id = "BULWARK"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Bulwark"
modifierName = "$BEHAVIOURS_BULWARK_modifierName" --$ Bulwark
modifierId = "BULWARK"
desc = "$BEHAVIOURS_BULWARK_desc" --$ All damage from enemy attack is decreased while in cover, but increased while not in cover.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Bulwark"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Bulwark_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Revenge
--------------------------------------------------------------------------------]]

_id = "REVENGE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Revenge"
modifierName = "$BEHAVIOURS_REVENGE_modifierName" --$ Revenge
modifierId = "REVENGE"
desc = "$BEHAVIOURS_REVENGE_desc" --$ While equipped, you automatically perform a counter melee attack if another character melee attacks you.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Revenge"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Revenge_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shattering Impact
--------------------------------------------------------------------------------]]

_id = "SHATTERING_IMPACT"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ShatteringImpact"
modifierName = "$BEHAVIOURS_SHATTERING_IMPACT_modifierName" --$ Shattering Impact
modifierId = "SHATTERING_IMPACT"
desc = "$BEHAVIOURS_SHATTERING_IMPACT_desc" --$ Your melee attacks now have a chance to shatter a piece of body armor.
icon = "Sprites/Icons/StatusEffects/StatusEffect_ShatteringImpact"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ShatteringImpact_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Slugger
--------------------------------------------------------------------------------]]

_id = "SLUGGER"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Slugger"
modifierName = "$BEHAVIOURS_SLUGGER_modifierName" --$ Slugger
modifierId = "SLUGGER"
desc = "$BEHAVIOURS_SLUGGER_desc" --$ All melee attacks now have a chance to Knock Out the target.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Slugger"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Slugger_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Covering Fire
--------------------------------------------------------------------------------]]

_id = "COVERING_FIRE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "CoveringFire"
modifierName = "$BEHAVIOURS_COVERING_FIRE_modifierName" --$ Covering Fire
modifierId = "COVERING_FIRE"
desc = "$BEHAVIOURS_COVERING_FIRE_desc" --$ Overwatch shots are now triggered by enemies' actions and abilities, not just movement. 
icon = "Sprites/Icons/StatusEffects/StatusEffect_CoveringFire"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_CoveringFire_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Priority Target
--------------------------------------------------------------------------------]]

_id = "PRIORITY_TARGET"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "PriorityTarget"
modifierName = "$BEHAVIOURS_PRIORITY_TARGET_modifierName" --$ Taunted
modifierId = "PRIORITY_TARGET"
icon = "Sprites/Icons/StatusEffects/StatusEffect_DrawFire_Bad"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Return Fire
--------------------------------------------------------------------------------]]

_id = "RETURN_FIRE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ReturnFire"
modifierName = "$BEHAVIOURS_RETURN_FIRE_modifierName" --$ Return Fire
modifierId = "RETURN_FIRE"
desc = "$BEHAVIOURS_RETURN_FIRE_desc" --$ If this person is attacked by another character, they will automatically return fire with their secondary weapon. This action can only trigger once per turn.
icon = "Sprites/Icons/StatusEffects/StatusEffect_ReturnFire"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ReturnFire_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rapid Reload
--------------------------------------------------------------------------------]]

_id = "RAPID_RELOAD"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "RapidReload"
modifierName = "$BEHAVIOURS_RAPID_RELOAD_modifierName" --$ Rapid Reload
modifierId = "RAPID_RELOAD"
desc = "$BEHAVIOURS_RAPID_RELOAD_desc" --$ Reloading your weapons no longer consumes an action point.
icon = "Sprites/Icons/StatusEffects/StatusEffect_RapidReload"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_RapidReload_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Guile
--------------------------------------------------------------------------------]]

_id = "GUILE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Guile"
modifierName = "$BEHAVIOURS_GUILE_modifierName" --$ Guile
modifierId = "GUILE"
desc = "$BEHAVIOURS_GUILE_desc" --$ This person uses their cunning to press their advantage.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Guile"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Guile_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Booster Shot Bonus
--------------------------------------------------------------------------------]]

_id = "BOOSTER_SHOT_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "MiracleElixirBonus"
modifierName = "$BEHAVIOURS_BOOSTER_SHOT_BONUS_modifierName" --$ Miracle Elixir
modifierId = "BOOSTER_SHOT_BONUS"
turnsDuration = 3
Modifier.maxHealth = function() return 100, modifierName end
Modifier.actionPoints = function() return 1, modifierName end
desc = "$BEHAVIOURS_BOOSTER_SHOT_BONUS_desc" --$ Temporarily increases AP and max HP.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Boosted"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Boosted_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Knee Capped
--------------------------------------------------------------------------------]]

_id = "KNEE_CAPPED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "KneeCapped"
modifierName = "$BEHAVIOURS_KNEE_CAPPED_modifierName" --$ Knee Capped
modifierId = "KNEE_CAPPED"
turnsDuration = 2
Modifier.movement = function() return "-75%", modifierName end
desc = "$BEHAVIOURS_KNEE_CAPPED_desc" --$ A target's movement attribute is reduced, thanks to the Doctor's single shot attack to the knee with their current weapon.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Slowed"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Slowed_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Mob Doctor
--------------------------------------------------------------------------------]]

_id = "MOB_DOCTOR"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "MobDoctor"
modifierName = "$BEHAVIOURS_MOB_DOCTOR_modifierName" --$ Mob Doctor
modifierId = "MOB_DOCTOR"
desc = "$BEHAVIOURS_MOB_DOCTOR_desc" --$ Increases the bleed out time to all characters within 6 meters of the doctor by 2 rounds. 
icon = "Sprites/Icons/StatusEffects/StatusEffect_MobDoctor"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_MobDoctor_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Surgical Precision
--------------------------------------------------------------------------------]]

_id = "SURGICAL_PRECISION"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "SurgicalPrecision"
modifierName = "$BEHAVIOURS_SURGICAL_PRECISION_modifierName" --$ Surgical Precision
modifierId = "SURGICAL_PRECISION"
Modifier.critChance = function() return 10, modifierName end
Modifier.Bleeding = function() return 55, modifierName end
desc = "$BEHAVIOURS_SURGICAL_PRECISION_desc" --$ Increases critical hit chance on all attacks, and increases the chance it will cause the target to bleed.
icon = "Sprites/Icons/StatusEffects/StatusEffect_SurgicalPrecision"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_SurgicalPrecision_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Malpractice
--------------------------------------------------------------------------------]]

_id = "MALPRACTICE"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Malpractice"
modifierName = "$BEHAVIOURS_MALPRACTICE_modifierName" --$ Malpractice
modifierId = "MALPRACTICE"
Modifier.appliedEffectsDuration = function() return 2, modifierName end
desc = "$BEHAVIOURS_MALPRACTICE_desc" --$ Increases the duration of all status effects applied by the Doctor temporarily.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Malpractice"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Malpractice_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Cold Efficiency
--------------------------------------------------------------------------------]]

_id = "COLD_EFFICIENCY"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ColdEfficiency"
modifierName = "$BEHAVIOURS_COLD_EFFICIENCY_modifierName" --$ Cold Efficiency
modifierId = "COLD_EFFICIENCY"
desc = "$BEHAVIOURS_COLD_EFFICIENCY_desc" --$ Your Overwatch shot now has a chance to trigger an additional shot if the previous Overwatch shot successfully hits its target.
icon = "Sprites/Icons/StatusEffects/StatusEffect_ColdEfficiency"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ColdEfficiency_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lifeline Bonus
--------------------------------------------------------------------------------]]

_id = "LIFELINE_BONUS"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "LifelineBonus"
modifierName = "$BEHAVIOURS_LIFELINE_BONUS_modifierName" --$ Lifeline Bonus
modifierId = "LIFELINE_BONUS"
Modifier.bleedOutChance = function() return 100, modifierName end
desc = "$BEHAVIOURS_LIFELINE_BONUS_desc" --$ Increases the chance to bleed out when their health reaches zero.
icon = "Sprites/Icons/StatusEffects/StatusEffect_LifelineBuff"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_LifelineBuff_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lifeline Doctor
--------------------------------------------------------------------------------]]

_id = "LIFELINE_DOCTOR"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "LifelineDoctor"
modifierName = "$BEHAVIOURS_LIFELINE_DOCTOR_modifierName" --$ Lifeline Doctor
modifierId = "LIFELINE_DOCTOR"
desc = "$BEHAVIOURS_LIFELINE_DOCTOR_desc" --$ Increases the chances of the doctor's allies to bleed out when their health reaches zero.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Lifeline"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Lifeline_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Barroom Brawler Bonus
--------------------------------------------------------------------------------]]

_id = "BARROOM_BRAWLER_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BarroomBrawlerBonus"
modifierName = "$BEHAVIOURS_BARROOM_BRAWLER_BONUS_modifierName" --$ Barroom Brawler
modifierId = "BARROOM_BRAWLER_BONUS"
desc = "$BEHAVIOURS_BARROOM_BRAWLER_BONUS_desc" --$ Increases your Melee skill and Melee damage. This effect increases if you are drunk.
icon = "Sprites/Icons/StatusEffects/StatusEffect_BarRoomBrawler"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_BarRoomBrawler_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bleeding
--------------------------------------------------------------------------------]]

_id = "BLEEDING"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Bleeding"
modifierName = "$BEHAVIOURS_BLEEDING_modifierName" --$ Bleeding
modifierId = "BLEEDING"
turnsDuration = 3
Modifier.passiveHealing = function() return -1000, modifierName end
Modifier.damageOverTime = function() return 20, modifierName end
desc = "$BEHAVIOURS_BLEEDING_desc" --$ You're bleeding!
icon = "Sprites/Icons/StatusEffects/StatusEffect_Bleed"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Bleed_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Poisoned
--------------------------------------------------------------------------------]]

_id = "POISONED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Poisoned"
modifierName = "$BEHAVIOURS_POISONED_modifierName" --$ Poisoned
modifierId = "POISONED"
turnsDuration = 4
Modifier.movement = function() return -3, modifierName end
Modifier.initiative = function() return -50, modifierName end
Modifier.damageOverTime = function() return 15, modifierName end
desc = "$BEHAVIOURS_POISONED_desc" --$ You've been poisoned!
icon = "Sprites/Icons/StatusEffects/StatusEffect_Poisoned"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Poisoned_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Stunned
--------------------------------------------------------------------------------]]

_id = "STUNNED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Stunned"
modifierName = "$BEHAVIOURS_STUNNED_modifierName" --$ Stunned
modifierId = "STUNNED"
turnsDuration = 2
Modifier.initiative = function() return -50, modifierName end
Modifier.actionPoints = function() return -1, modifierName end
desc = "$BEHAVIOURS_STUNNED_desc" --$ You've been stunned! Your initiative and AP have been temporarily reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Stun"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Stun_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Slow
--------------------------------------------------------------------------------]]

_id = "SLOW"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Slow"
modifierName = "$BEHAVIOURS_SLOW_modifierName" --$ Slow
modifierId = "SLOW"
turnsDuration = 3
Modifier.movement = function() return -3, modifierName end
Modifier.initiative = function() return -50, modifierName end
desc = "$BEHAVIOURS_SLOW_desc" --$ You've been slowed! Movement and Initiative have been reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Slowed"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Slowed_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Panic
--------------------------------------------------------------------------------]]

_id = "PANIC"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Panic"
modifierName = "$BEHAVIOURS_PANIC_modifierName" --$ Panic
modifierId = "PANIC"
turnsDuration = 2
desc = "$BEHAVIOURS_PANIC_desc" --$ Everyone is dying around you, and you have a strong desire to get the hell outta here.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Panic"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Panic_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Knocked Out
--------------------------------------------------------------------------------]]

_id = "KNOCKED_OUT"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "KnockedOut"
modifierName = "$BEHAVIOURS_KNOCKED_OUT_modifierName" --$ Knocked Out
modifierId = "KNOCKED_OUT"
turnsDuration = 2
Modifier.movement = function() return "-100%", modifierName end
Modifier.initiative = function() return -1000, modifierName end
Modifier.knockBackDefense = function() return 1000, modifierName end
Modifier.actionPoints = function() return -1000, modifierName end
desc = "$BEHAVIOURS_KNOCKED_OUT_desc" --$ You've been Knocked Out and cannot move, use items, or abilities. You'll spend the next round getting back to your feet.
icon = "Sprites/Icons/StatusEffects/StatusEffect_KnockedOut"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_KnockedOut_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Hunkered Down
--------------------------------------------------------------------------------]]

_id = "HUNKERED_DOWN"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "HunkeredDown"
modifierName = "$BEHAVIOURS_HUNKERED_DOWN_modifierName" --$ Hunkered Down
modifierId = "HUNKERED_DOWN"
Modifier.halfCover = function() return 10, modifierName end
Modifier.fullCover = function() return 10, modifierName end
Modifier.critDefense = function() return 1000, modifierName end
desc = "$BEHAVIOURS_HUNKERED_DOWN_desc" --$ Increases the defensive bonus provided by cover and makes the character immune to critical hits.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Crouched"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Crouched_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Bandaged
--------------------------------------------------------------------------------]]

_id = "BANDAGED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Bandaged"
modifierName = "$BEHAVIOURS_BANDAGED_modifierName" --$ Bandaged
modifierId = "BANDAGED"
turnsDuration = 3
Modifier.healOverTime = function() return 20, modifierName end
desc = "$BEHAVIOURS_BANDAGED_desc" --$ You've been bandaged.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Bandaged"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Bandaged_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Remedy Heal
--------------------------------------------------------------------------------]]

_id = "REMEDY_HEAL"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "RemedyHeal"
modifierName = "$BEHAVIOURS_REMEDY_HEAL_modifierName" --$ Remedy Heal
modifierId = "REMEDY_HEAL"
turnsDuration = 3
Modifier.healOverTime = function() return 30, modifierName end
desc = "$BEHAVIOURS_REMEDY_HEAL_desc" --$ This is an old trick you learned to help get better quick. Your ma swears by it.
icon = "Sprites/Icons/StatusEffects/StatusEffect_RemedyHeal"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_RemedyHeal_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Devils Breath Status
--------------------------------------------------------------------------------]]

_id = "DEVILS_BREATH_STATUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "DevilsBreathStatus"
modifierName = "$BEHAVIOURS_DEVILS_BREATH_STATUS_modifierName" --$ Devil's Plaything
modifierId = "DEVILS_BREATH_STATUS"
turnsDuration = 4
desc = "$BEHAVIOURS_DEVILS_BREATH_STATUS_desc" --$ Your mind is no longer your own!
icon = "Sprites/Icons/StatusEffects/StatusEffect_DevilsPlaything"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_DevilsPlaything_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Bloodlust Bonus
--------------------------------------------------------------------------------]]

_id = "BLOODLUST_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BloodlustBonus"
modifierName = "$BEHAVIOURS_BLOODLUST_BONUS_modifierName" --$ Bloodlust
modifierId = "BLOODLUST_BONUS"
maxStacks = 3
turnsDuration = 3
Modifier.healOverTime = function() return 15, modifierName end
desc = "$BEHAVIOURS_BLOODLUST_BONUS_desc" --$ You've gained Bloodlust from executing an enemy!\n\nWhile Bloodlust is active you will slowly heal over time.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Bloodlust"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Bloodlust_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Deep Wounds
--------------------------------------------------------------------------------]]

_id = "DEEP_WOUNDS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "DeepWounds"
modifierName = "$BEHAVIOURS_DEEP_WOUNDS_modifierName" --$ Deep Wounds
modifierId = "DEEP_WOUNDS"
turnsDuration = 4
desc = "$BEHAVIOURS_DEEP_WOUNDS_desc" --$ A bleed effect that damages you every time you move.
icon = "Sprites/Icons/StatusEffects/StatusEffect_DeepWounds"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_DeepWounds_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Subdued
--------------------------------------------------------------------------------]]

_id = "SUBDUED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Subdued"
modifierName = "$BEHAVIOURS_SUBDUED_modifierName" --$ Subdued
modifierId = "SUBDUED"
desc = "$BEHAVIOURS_SUBDUED_desc" --$ You've been subdued! 
icon = "Sprites/Icons/StatusEffects/StatusEffect_Panic"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Panic_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Marked Target
--------------------------------------------------------------------------------]]

_id = "MARKED_TARGET"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "MarkedTarget"
modifierName = "$BEHAVIOURS_MARKED_TARGET_modifierName" --$ Marked Target
modifierId = "MARKED_TARGET"
turnsDuration = 2
Modifier.defense = function() return -25, modifierName end
desc = "$BEHAVIOURS_MARKED_TARGET_desc" --$ All attacks made against this character have their marksmanship increased.
icon = "Sprites/Icons/StatusEffects/StatusEffect_MarkedTarget"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Exhaustion
--------------------------------------------------------------------------------]]

_id = "EXHAUSTION"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Exhaustion"
modifierName = "$BEHAVIOURS_EXHAUSTION_modifierName" --$ Exhaustion
modifierId = "EXHAUSTION"
maxStacks = 3
turnsDuration = 3
Modifier.movement = function() return -1, modifierName end
Modifier.meleeDamage = function() return "-20%", modifierName end
desc = "$BEHAVIOURS_EXHAUSTION_desc" --$ You've pushed your body too far and are now Exhausted.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Exhausted"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Exhausted_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Infected
--------------------------------------------------------------------------------]]

_id = "INFECTED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Infected"
modifierName = "$BEHAVIOURS_INFECTED_modifierName" --$ Infected
modifierId = "INFECTED"
turnsDuration = 3
Modifier.healing = function() return -10, modifierName end
Modifier.passiveHealing = function() return -1000, modifierName end
Modifier.damageOverTime = function() return 1, modifierName end
desc = "$BEHAVIOURS_INFECTED_desc" --$ You've been infected. You will no longer heal passively.\nCan only be removed by a Doctor. 
icon = "Sprites/Icons/StatusEffects/StatusEffect_Infected"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Infected_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Suppressed
--------------------------------------------------------------------------------]]

_id = "SUPPRESSED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Suppressed"
modifierName = "$BEHAVIOURS_SUPPRESSED_modifierName" --$ Suppressed
modifierId = "SUPPRESSED"
Modifier.marksmanship = function() return -40, modifierName end
Modifier.initiative = function() return -50, modifierName end
desc = "$BEHAVIOURS_SUPPRESSED_desc" --$ Your chance to hit is reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Suppressed"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Suppressed_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Suppressing
--------------------------------------------------------------------------------]]

_id = "SUPPRESSING"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Suppressing"
modifierName = "$BEHAVIOURS_SUPPRESSING_modifierName" --$ Suppressing
modifierId = "SUPPRESSING"
desc = "$BEHAVIOURS_SUPPRESSING_desc" --$ Actively suppressing your target.
icon = "Sprites/Icons/StatusEffects/StatusEffect_SuppressedBuff"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_SuppressedBuff_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Drunk
--------------------------------------------------------------------------------]]

_id = "DRUNK"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Drunk"
modifierName = "$BEHAVIOURS_DRUNK_modifierName" --$ Drunk
modifierId = "DRUNK"
turnsDuration = 4
Modifier.marksmanship = function() return -25, modifierName end
Modifier.movement = function() return -1, modifierName end
desc = "$BEHAVIOURS_DRUNK_desc" --$ You're drunk!
icon = "Sprites/Icons/StatusEffects/StatusEffect_Drunk"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Drunk_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Worried
--------------------------------------------------------------------------------]]

_id = "WORRIED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Worried"
modifierName = "$BEHAVIOURS_WORRIED_modifierName" --$ Worried
modifierId = "WORRIED"
turnsDuration = 240
Modifier.moraleGain = function() return "-20%", modifierName end
desc = "$BEHAVIOURS_WORRIED_desc" --$ You're worried about someone close to you.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Worried"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Worried_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Yee Haw
--------------------------------------------------------------------------------]]

_id = "YEE_HAW"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "YeeHaw"
modifierName = "$BEHAVIOURS_YEE_HAW_modifierName" --$ Hair Trigger Temper
modifierId = "YEE_HAW"
desc = "$BEHAVIOURS_YEE_HAW_desc" --$ You've lost control. You will attack random characters next round.
icon = "Sprites/Icons/StatusEffects/StatusEffect_YeeHaw"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_YeeHaw_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Sexually Transmitted Disease
--------------------------------------------------------------------------------]]

_id = "SEXUALLY_TRANSMITTED_DISEASE"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "SexuallyTransmittedDisease"
modifierName = "$BEHAVIOURS_SEXUALLY_TRANSMITTED_DISEASE_modifierName" --$ Sexually Transmitted Disease
modifierId = "SEXUALLY_TRANSMITTED_DISEASE"
Modifier.maxHealth = function() return -10, modifierName end
Modifier.healing = function() return -10, modifierName end
Modifier.passiveHealing = function() return -1000, modifierName end
desc = "$BEHAVIOURS_SEXUALLY_TRANSMITTED_DISEASE_desc" --$ You gambled in the bedroom and lost. Stick to casinos from now on. Effects get progressively worse over time.
icon = "Sprites/Icons/StatusEffects/StatusEffect_STD"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_STD_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Desire To Kill
--------------------------------------------------------------------------------]]

_id = "DESIRE_TO_KILL"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "DesireToKill"
modifierName = "$BEHAVIOURS_DESIRE_TO_KILL_modifierName" --$ Desire To Kill
modifierId = "DESIRE_TO_KILL"
desc = "$BEHAVIOURS_DESIRE_TO_KILL_desc" --$ You've developed an urge to kill a rival.
icon = "Sprites/Icons/StatusEffects/StatusEffect_DesireToKill"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_DesireToKill_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Shell Shocked
--------------------------------------------------------------------------------]]

_id = "SHELL_SHOCKED"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "ShellShocked"
modifierName = "$BEHAVIOURS_SHELL_SHOCKED_modifierName" --$ Shell Shocked
modifierId = "SHELL_SHOCKED"
turnsDuration = 1
desc = "$BEHAVIOURS_SHELL_SHOCKED_desc" --$ You've been around too many explosions and have reached your breaking point.
icon = "Sprites/Icons/StatusEffects/StatusEffect_ShellShocked"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_ShellShocked_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Adrenaline Shot Bonus
--------------------------------------------------------------------------------]]

_id = "ADRENALINE_SHOT_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "AdrenalineShotBonus"
modifierName = "$BEHAVIOURS_ADRENALINE_SHOT_BONUS_modifierName" --$ Adrenaline Shot Bonus
modifierId = "ADRENALINE_SHOT_BONUS"
turnsDuration = 1
Modifier.actionPoints = function() return 1, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_AdrenalineShot_Good"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_AdrenalineShot_Good_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Adrenaline Shot Penalty
--------------------------------------------------------------------------------]]

_id = "ADRENALINE_SHOT_PENALTY"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "AdrenalineShotPenalty"
modifierName = "$BEHAVIOURS_ADRENALINE_SHOT_PENALTY_modifierName" --$ Adrenaline Shot Penalty
modifierId = "ADRENALINE_SHOT_PENALTY"
turnsDuration = 2
Modifier.actionPoints = function() return -1, modifierName end
desc = "$BEHAVIOURS_ADRENALINE_SHOT_PENALTY_desc" --$ You're suffering withdrawal from the Adrenaline Shot. Your total AP has been temporarily reduced.
icon = "Sprites/Icons/StatusEffects/StatusEffect_AdrenalineShot_Bad"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_AdrenalineShot_Bad_Large"
buffType = "NEGATIVE"

--[[------------------------------------------------------------------------------
Smelling Salts Bonus
--------------------------------------------------------------------------------]]

_id = "SMELLING_SALTS_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "SmellingSaltsBonus"
modifierName = "$BEHAVIOURS_SMELLING_SALTS_BONUS_modifierName" --$ Smelling Salts
modifierId = "SMELLING_SALTS_BONUS"
turnsDuration = 2
Modifier.movement = function() return 5, modifierName end
Modifier.initiative = function() return 30, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_SmellingSalts"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_SmellingSalts_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Dr Cutters Bitters Bonus
--------------------------------------------------------------------------------]]

_id = "DR_CUTTERS_BITTERS_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "DrCuttersBittersBonus"
modifierName = "$BEHAVIOURS_DR_CUTTERS_BITTERS_BONUS_modifierName" --$ Dr. Cutter's Bitters
modifierId = "DR_CUTTERS_BITTERS_BONUS"
turnsDuration = 2
Modifier.movement = function() return 3, modifierName end
Modifier.maxHealth = function() return 50, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_Bitters"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Bitters_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Health Tonic Bonus
--------------------------------------------------------------------------------]]

_id = "HEALTH_TONIC_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "HealthTonicBonus"
modifierName = "$BEHAVIOURS_HEALTH_TONIC_BONUS_modifierName" --$ Health Tonic
modifierId = "HEALTH_TONIC_BONUS"
turnsDuration = 3
Modifier.healOverTime = function() return 30, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_HealthTonic"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_HealthTonic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Painkillers Bonus
--------------------------------------------------------------------------------]]

_id = "PAINKILLERS_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "PainkillersBonus"
modifierName = "$BEHAVIOURS_PAINKILLERS_BONUS_modifierName" --$ Painkillers
modifierId = "PAINKILLERS_BONUS"
turnsDuration = 2
Modifier.damageReduction = function() return "50%", modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_PainKiller"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_PainKiller_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Nerve Tonic Bonus
--------------------------------------------------------------------------------]]

_id = "NERVE_TONIC_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "NerveTonicBonus"
modifierName = "$BEHAVIOURS_NERVE_TONIC_BONUS_modifierName" --$ Nerve Tonic
modifierId = "NERVE_TONIC_BONUS"
turnsDuration = 2
Modifier.damageReduction = function() return "20%", modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_NerveTonic"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_NerveTonic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Liniment Tonic Bonus
--------------------------------------------------------------------------------]]

_id = "LINIMENT_TONIC_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "LinimentTonicBonus"
modifierName = "$BEHAVIOURS_LINIMENT_TONIC_BONUS_modifierName" --$ Liniment Tonic
modifierId = "LINIMENT_TONIC_BONUS"
turnsDuration = 2
Modifier.effectResistance = function() return 100, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_LinimentTonic"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_LinimentTonic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Wizard Oil Bonus
--------------------------------------------------------------------------------]]

_id = "WIZARD_OIL_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "WizardOilBonus"
modifierName = "$BEHAVIOURS_WIZARD_OIL_BONUS_modifierName" --$ Wizard Oil
modifierId = "WIZARD_OIL_BONUS"
turnsDuration = 3
Modifier.effectResistance = function() return 50, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_WizardOil"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_WizardOil_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Herbal Remedy Bonus
--------------------------------------------------------------------------------]]

_id = "HERBAL_REMEDY_BONUS"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "HerbalRemedyBonus"
modifierName = "$BEHAVIOURS_HERBAL_REMEDY_BONUS_modifierName" --$ Herbal Remedy
modifierId = "HERBAL_REMEDY_BONUS"
turnsDuration = 4
Modifier.healOverTime = function() return 25, modifierName end
Modifier.effectResistance = function() return 10, modifierName end
icon = "Sprites/Icons/StatusEffects/StatusEffect_HerbalRemedy"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_HerbalRemedy_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Handgun Proficiency Steady Hands
--------------------------------------------------------------------------------]]

_id = "HANDGUN_PROFICIENCY_STEADY_HANDS"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "SteadyHands"
modifierName = "$BEHAVIOURS_HANDGUN_PROFICIENCY_STEADY_HANDS_modifierName" --$ Steady Hands
modifierId = "HANDGUN_PROFICIENCY_STEADY_HANDS"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_HandGun_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_HandGun_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Handgun Proficiency Close And Personal
assumption: within 3m = +10% Crit Chance
--------------------------------------------------------------------------------]]

_id = "HANDGUN_PROFICIENCY_CLOSE_AND_PERSONAL"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "CloseAndPersonal"
modifierName = "$BEHAVIOURS_HANDGUN_PROFICIENCY_CLOSE_AND_PERSONAL_modifierName" --$ Close And Personal
modifierId = "HANDGUN_PROFICIENCY_CLOSE_AND_PERSONAL"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_HandGun_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_HandGun_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Handgun Proficiency Sureshot
--------------------------------------------------------------------------------]]

_id = "HANDGUN_PROFICIENCY_SURESHOT"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Sureshot"
modifierName = "$BEHAVIOURS_HANDGUN_PROFICIENCY_SURESHOT_modifierName" --$ Sureshot
modifierId = "HANDGUN_PROFICIENCY_SURESHOT"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_HandGun_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_HandGun_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Handgun Proficiency Pick Your Shots
--------------------------------------------------------------------------------]]

_id = "HANDGUN_PROFICIENCY_PICK_YOUR_SHOTS"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "PickYourShots"
modifierName = "$BEHAVIOURS_HANDGUN_PROFICIENCY_PICK_YOUR_SHOTS_modifierName" --$ Pick Your Shots
modifierId = "HANDGUN_PROFICIENCY_PICK_YOUR_SHOTS"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_HandGun_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_HandGun_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Handgun Proficiency Executioner
--------------------------------------------------------------------------------]]

_id = "HANDGUN_PROFICIENCY_EXECUTIONER"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Executioner"
modifierName = "$BEHAVIOURS_HANDGUN_PROFICIENCY_EXECUTIONER_modifierName" --$ Executioner
modifierId = "HANDGUN_PROFICIENCY_EXECUTIONER"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_HandGun_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_HandGun_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Weapon Proficiency Thirst For Violence
--------------------------------------------------------------------------------]]

_id = "MELEE_WEAPON_PROFICIENCY_THIRST_FOR_VIOLENCE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "ThirstForViolence"
modifierName = "$BEHAVIOURS_MELEE_WEAPON_PROFICIENCY_THIRST_FOR_VIOLENCE_modifierName" --$ Thirst for Violence
modifierId = "MELEE_WEAPON_PROFICIENCY_THIRST_FOR_VIOLENCE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Melee_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Melee_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Weapon Proficiency Invigorating Kill
--------------------------------------------------------------------------------]]

_id = "MELEE_WEAPON_PROFICIENCY_INVIGORATING_KILL"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "InvigoratingKill"
modifierName = "$BEHAVIOURS_MELEE_WEAPON_PROFICIENCY_INVIGORATING_KILL_modifierName" --$ Invigorating Kill
modifierId = "MELEE_WEAPON_PROFICIENCY_INVIGORATING_KILL"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Melee_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Melee_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Weapon Proficiency Mean Streak
--------------------------------------------------------------------------------]]

_id = "MELEE_WEAPON_PROFICIENCY_MEAN_STREAK"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "MeanStreak"
modifierName = "$BEHAVIOURS_MELEE_WEAPON_PROFICIENCY_MEAN_STREAK_modifierName" --$ Mean Streak
modifierId = "MELEE_WEAPON_PROFICIENCY_MEAN_STREAK"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Melee_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Melee_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Weapon Proficiency Run Up
--------------------------------------------------------------------------------]]

_id = "MELEE_WEAPON_PROFICIENCY_RUN_UP"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "RunUp"
modifierName = "$BEHAVIOURS_MELEE_WEAPON_PROFICIENCY_RUN_UP_modifierName" --$ Run Up
modifierId = "MELEE_WEAPON_PROFICIENCY_RUN_UP"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Melee_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Melee_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Weapon Proficiency Counter Strike
--------------------------------------------------------------------------------]]

_id = "MELEE_WEAPON_PROFICIENCY_COUNTER_STRIKE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "CounterStrike"
modifierName = "$BEHAVIOURS_MELEE_WEAPON_PROFICIENCY_COUNTER_STRIKE_modifierName" --$ Counter Strike
modifierId = "MELEE_WEAPON_PROFICIENCY_COUNTER_STRIKE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Melee_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Melee_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Weapon Training
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_WEAPON_TRAINING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "ShotgunWeaponTraining"
modifierName = "$BEHAVIOURS_SHOTGUN_WEAPON_TRAINING_modifierName" --$ Shotgun Weapon Training
modifierId = "SHOTGUN_WEAPON_TRAINING"
desc = "$BEHAVIOURS_SHOTGUN_WEAPON_TRAINING_desc" --$ You are now trained to equip and use Shotguns.
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Common_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Common_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Proficiency Soft Boiled
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_PROFICIENCY_SOFT_BOILED"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "SoftBoiled"
modifierName = "$BEHAVIOURS_SHOTGUN_PROFICIENCY_SOFT_BOILED_modifierName" --$ Soft Boiled
modifierId = "SHOTGUN_PROFICIENCY_SOFT_BOILED"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Proficiency Push Off
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_PROFICIENCY_PUSH_OFF"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "PushOff"
modifierName = "$BEHAVIOURS_SHOTGUN_PROFICIENCY_PUSH_OFF_modifierName" --$ Push Off
modifierId = "SHOTGUN_PROFICIENCY_PUSH_OFF"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Proficiency Close And Personal
assumption: within 3m = +10% Crit Chance
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_PROFICIENCY_CLOSE_AND_PERSONAL"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "ShotgunCloseAndPersonal"
modifierName = "$BEHAVIOURS_SHOTGUN_PROFICIENCY_CLOSE_AND_PERSONAL_modifierName" --$ Close And Personal
modifierId = "SHOTGUN_PROFICIENCY_CLOSE_AND_PERSONAL"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Proficiency Freeloader
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_PROFICIENCY_FREELOADER"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Freeloader"
modifierName = "$BEHAVIOURS_SHOTGUN_PROFICIENCY_FREELOADER_modifierName" --$ Freeloader
modifierId = "SHOTGUN_PROFICIENCY_FREELOADER"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Shotgun Proficiency Born Bare
--------------------------------------------------------------------------------]]

_id = "SHOTGUN_PROFICIENCY_BORN_BARE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "BornBare"
modifierName = "$BEHAVIOURS_SHOTGUN_PROFICIENCY_BORN_BARE_modifierName" --$ Born Bare
modifierId = "SHOTGUN_PROFICIENCY_BORN_BARE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_ShotGun_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_ShotGun_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Weapon Training
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_WEAPON_TRAINING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "SubmachineGunWeaponTraining"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_WEAPON_TRAINING_modifierName" --$ Submachine Gun Weapon Training
modifierId = "SUBMACHINE_GUN_WEAPON_TRAINING"
desc = "$BEHAVIOURS_SUBMACHINE_GUN_WEAPON_TRAINING_desc" --$ You are now trained to equip and use Submachine Guns.
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Common_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Common_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Proficiency Peak Performance
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_PROFICIENCY_PEAK_PERFORMANCE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "PeakPerformance"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_PROFICIENCY_PEAK_PERFORMANCE_modifierName" --$ Peak Performance
modifierId = "SUBMACHINE_GUN_PROFICIENCY_PEAK_PERFORMANCE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Proficiency Prey On The Weak
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_PROFICIENCY_PREY_ON_THE_WEAK"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "PreyOnTheWeak"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_PROFICIENCY_PREY_ON_THE_WEAK_modifierName" --$ Prey on the Weak
modifierId = "SUBMACHINE_GUN_PROFICIENCY_PREY_ON_THE_WEAK"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Proficiency Iron Grip
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_PROFICIENCY_IRON_GRIP"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "IronGrip"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_PROFICIENCY_IRON_GRIP_modifierName" --$ Iron Grip
modifierId = "SUBMACHINE_GUN_PROFICIENCY_IRON_GRIP"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Proficiency Full Of Lead
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_PROFICIENCY_FULL_OF_LEAD"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "FullOfLead"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_PROFICIENCY_FULL_OF_LEAD_modifierName" --$ Full of Lead
modifierId = "SUBMACHINE_GUN_PROFICIENCY_FULL_OF_LEAD"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Submachine Gun Proficiency Hit And Run
--------------------------------------------------------------------------------]]

_id = "SUBMACHINE_GUN_PROFICIENCY_HIT_AND_RUN"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "HitAndRun"
modifierName = "$BEHAVIOURS_SUBMACHINE_GUN_PROFICIENCY_HIT_AND_RUN_modifierName" --$ Hit and Run
modifierId = "SUBMACHINE_GUN_PROFICIENCY_HIT_AND_RUN"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_SubMachineGun_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_SubMachineGun_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Weapon Training
--------------------------------------------------------------------------------]]

_id = "RIFLE_WEAPON_TRAINING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "RifleWeaponTraining"
modifierName = "$BEHAVIOURS_RIFLE_WEAPON_TRAINING_modifierName" --$ Rifle Weapon Training
modifierId = "RIFLE_WEAPON_TRAINING"
desc = "$BEHAVIOURS_RIFLE_WEAPON_TRAINING_desc" --$ You are now trained to equip and use Rifles.
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Common_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Common_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Proficiency Steadfast Aim
--------------------------------------------------------------------------------]]

_id = "RIFLE_PROFICIENCY_STEADFAST_AIM"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "SteadfastAim"
modifierName = "$BEHAVIOURS_RIFLE_PROFICIENCY_STEADFAST_AIM_modifierName" --$ Steadfast Aim
modifierId = "RIFLE_PROFICIENCY_STEADFAST_AIM"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Proficiency Huntsman
--------------------------------------------------------------------------------]]

_id = "RIFLE_PROFICIENCY_HUNTSMAN"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Huntsman"
modifierName = "$BEHAVIOURS_RIFLE_PROFICIENCY_HUNTSMAN_modifierName" --$ Huntsman
modifierId = "RIFLE_PROFICIENCY_HUNTSMAN"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Proficiency Puncture Hide
--------------------------------------------------------------------------------]]

_id = "RIFLE_PROFICIENCY_PUNCTURE_HIDE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "PunctureHide"
modifierName = "$BEHAVIOURS_RIFLE_PROFICIENCY_PUNCTURE_HIDE_modifierName" --$ Puncture Hide
modifierId = "RIFLE_PROFICIENCY_PUNCTURE_HIDE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Proficiency Wing Clip
--------------------------------------------------------------------------------]]

_id = "RIFLE_PROFICIENCY_WING_CLIP"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "WingClip"
modifierName = "$BEHAVIOURS_RIFLE_PROFICIENCY_WING_CLIP_modifierName" --$ Wing Clip
modifierId = "RIFLE_PROFICIENCY_WING_CLIP"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Rifle Proficiency In Cold Blood
--------------------------------------------------------------------------------]]

_id = "RIFLE_PROFICIENCY_IN_COLD_BLOOD"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "InColdBlood"
modifierName = "$BEHAVIOURS_RIFLE_PROFICIENCY_IN_COLD_BLOOD_modifierName" --$ In Cold Blood
modifierId = "RIFLE_PROFICIENCY_IN_COLD_BLOOD"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Rifle_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Rifle_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Weapon Traning
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_WEAPON_TRANING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "SniperRifleWeaponTraining"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_WEAPON_TRANING_modifierName" --$ Sniper Rifle Weapon Training
modifierId = "SNIPER_RIFLE_WEAPON_TRANING"
desc = "$BEHAVIOURS_SNIPER_RIFLE_WEAPON_TRANING_desc" --$ You are now trained to equip and use Sniper Rifles.
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Common_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Common_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Proficiency Pincushion
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_PROFICIENCY_PINCUSHION"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Pincushion"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_PROFICIENCY_PINCUSHION_modifierName" --$ Pincushion
modifierId = "SNIPER_RIFLE_PROFICIENCY_PINCUSHION"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Proficiency Sight Alignment
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_PROFICIENCY_SIGHT_ALIGNMENT"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "SightAlignment"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_PROFICIENCY_SIGHT_ALIGNMENT_modifierName" --$ Sight Alignment
modifierId = "SNIPER_RIFLE_PROFICIENCY_SIGHT_ALIGNMENT"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Proficiency Blindside
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_PROFICIENCY_BLINDSIDE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "Blindside"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_PROFICIENCY_BLINDSIDE_modifierName" --$ Blindside
modifierId = "SNIPER_RIFLE_PROFICIENCY_BLINDSIDE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Proficiency Sniper Nest
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_PROFICIENCY_SNIPER_NEST"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "SniperNest"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_PROFICIENCY_SNIPER_NEST_modifierName" --$ Sniper Nest
modifierId = "SNIPER_RIFLE_PROFICIENCY_SNIPER_NEST"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Sniper Rifle Proficiency Breach Shot
--------------------------------------------------------------------------------]]

_id = "SNIPER_RIFLE_PROFICIENCY_BREACH_SHOT"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "BreachShot"
modifierName = "$BEHAVIOURS_SNIPER_RIFLE_PROFICIENCY_BREACH_SHOT_modifierName" --$ Breach Shot
modifierId = "SNIPER_RIFLE_PROFICIENCY_BREACH_SHOT"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_Sniper_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_Sniper_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Weapon Training
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_WEAPON_TRAINING"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "MachineGunWeaponTraining"
modifierName = "$BEHAVIOURS_MACHINE_GUN_WEAPON_TRAINING_modifierName" --$ Machine Gun Weapon Training
modifierId = "MACHINE_GUN_WEAPON_TRAINING"
desc = "$BEHAVIOURS_MACHINE_GUN_WEAPON_TRAINING_desc" --$ You are now trained to equip and use Machine Guns.
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Common_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Common_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Proficiency Maintain Distance
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_PROFICIENCY_MAINTAIN_DISTANCE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "MaintainDistance"
modifierName = "$BEHAVIOURS_MACHINE_GUN_PROFICIENCY_MAINTAIN_DISTANCE_modifierName" --$ Maintain Distance
modifierId = "MACHINE_GUN_PROFICIENCY_MAINTAIN_DISTANCE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Uncommon_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Uncommon_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Proficiency Shove Off
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_PROFICIENCY_SHOVE_OFF"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "ShoveOff"
modifierName = "$BEHAVIOURS_MACHINE_GUN_PROFICIENCY_SHOVE_OFF_modifierName" --$ Shove Off
modifierId = "MACHINE_GUN_PROFICIENCY_SHOVE_OFF"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Rare_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Rare_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Proficiency Improved Handling
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_PROFICIENCY_IMPROVED_HANDLING"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "ImprovedHandling"
modifierName = "$BEHAVIOURS_MACHINE_GUN_PROFICIENCY_IMPROVED_HANDLING_modifierName" --$ Improved Handling
modifierId = "MACHINE_GUN_PROFICIENCY_IMPROVED_HANDLING"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Epic_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Epic_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Proficiency Machinegun Expert
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_PROFICIENCY_MACHINEGUN_EXPERT"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "MachinegunExpert"
modifierName = "$BEHAVIOURS_MACHINE_GUN_PROFICIENCY_MACHINEGUN_EXPERT_modifierName" --$ Machine Gun Expert
modifierId = "MACHINE_GUN_PROFICIENCY_MACHINEGUN_EXPERT"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Legendary_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Legendary_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Machine Gun Proficiency Firing Stance
--------------------------------------------------------------------------------]]

_id = "MACHINE_GUN_PROFICIENCY_FIRING_STANCE"
_includes = {}
_includes[1] = "INVISIBLE_TRAIT"
_name = "FiringStance"
modifierName = "$BEHAVIOURS_MACHINE_GUN_PROFICIENCY_FIRING_STANCE_modifierName" --$ Firing Stance
modifierId = "MACHINE_GUN_PROFICIENCY_FIRING_STANCE"
icon = "Sprites/Icons/Trait/WeaponProficiency/WeaponProficiency_MachineGun_Unique_128"
iconLarge = "Sprites/Icons/Trait_Large/WeaponProficiency/WeaponProficiency_MachineGun_Unique_256"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Boss Slot Motivation
--------------------------------------------------------------------------------]]

_id = "BOSS_SLOT_MOTIVATION"
_includes = {}
_includes[1] = "BOSS_SLOT_SAFEHOUSE_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "Motivation"
modifierName = "$BEHAVIOURS_BOSS_SLOT_MOTIVATION_modifierName" --$ Motivation
modifierId = "BOSS_SLOT_MOTIVATION"
desc = "$BEHAVIOURS_BOSS_SLOT_MOTIVATION_desc" --$ Increases the amount of loyalty gained for all Gangsters in this neighborhood for a limited time, passive gain.
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_BossSlot"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_BossSlot_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Boss Slot Boss Level
--------------------------------------------------------------------------------]]

_id = "BOSS_SLOT_BOSS_LEVEL"
_includes = {}
_includes[1] = "BOSS_SLOT_SAFEHOUSE_BASE"
_includes[2] = "INVISIBLE_TRAIT"
_name = "BossLevel"
modifierName = "$BEHAVIOURS_BOSS_SLOT_BOSS_LEVEL_modifierName" --$ Boss Level
modifierId = "BOSS_SLOT_BOSS_LEVEL"
desc = "$BEHAVIOURS_BOSS_SLOT_BOSS_LEVEL_desc" --$ Adds additional guards to the safehouse.
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_BossSlot"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_BossSlot_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Production
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_PRODUCTION"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryProduction"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_PRODUCTION_modifierName" --$ Wheels of Industry
modifierId = "EMPIRE_BONUS_BREWERY_PRODUCTION"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_PRODUCTION_desc" --$ This boss' expertise in industrial production techniques has found its place in {0:gender?his|her|their} criminal empire, and {0:gender?his|her|their} thirsty patrons thank {0:gender?him|her|them} for it.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryProduction"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryProduction"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Upgrade Discount
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelUpgradeDiscount"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_modifierName" --$ The House That Love Built
modifierId = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_desc" --$ This boss is wise enough to know that when clients come through the door, it's not the drapery they're looking at. 
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Reduced Police Activity
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusReducedPoliceActivity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY_modifierName" --$ For Medicinal Purposes
modifierId = "EMPIRE_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY_desc" --$ This boss knows it's all about how {0:gender?he markets himself|she markets herself|they market themselves}, and {0:gender?he markets his|she markets her|they market their} breweries as pharmaceutical companies. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Upgrade Discount
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryUpgradeDiscount"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_modifierName" --$ Bargain Beer
modifierId = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_desc" --$ This boss' money saving savvy comes in handy when buying expensive brewing equipment. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Police Activity Improvements Discount
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusPoliceActivityImprovementsDiscount"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT_modifierName" --$ Keep Your Enemies Closer
modifierId = "EMPIRE_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT_desc" --$ This boss knows how important it is to keep a close eye on the crew in blue so that they stay out of {0:gender?his|her|their} business.
icon = "Sprites/Diplomacy/EmpireBonus_PoliceActivityImprovementsDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_PoliceActivityImprovementsDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Reduced Police Activity
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyReducedPoliceActivity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY_modifierName" --$ Off The Record
modifierId = "EMPIRE_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY_desc" --$ Cops tend to favor this boss' rackets as their watering holes, and they're too busy drinking to notice anything else going on. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Upgrade Discount
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyUpgradeDiscount"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_modifierName" --$ Homebrew
modifierId = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_desc" --$ This boss has got a few tricks and a do it yourself attitude to shave a few bucks off the cost of speakeasy upgrades.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Upgrade Time
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyUpgradeTime"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_TIME_modifierName" --$ Happy Hour
modifierId = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_TIME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_TIME_desc" --$ This boss will take any measure necessary to get things done quickly so nothing cuts into quality drinking time. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Reduced Police Activity
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelReducedPoliceActivity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY_modifierName" --$ Fools For Love
modifierId = "EMPIRE_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY_desc" --$ This boss' staff are gifted at keeping cops so distracted that they forget why they even came to your brothel.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Income
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoIncome"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_INCOME_modifierName" --$ Jackpot
modifierId = "EMPIRE_BONUS_CASINO_INCOME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_INCOME_desc" --$ The house always wins, and this boss' house always seems to win more. It's certainly good for profits. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Income
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelIncome"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_INCOME_modifierName" --$ Love Pays
modifierId = "EMPIRE_BONUS_BROTHEL_INCOME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_INCOME_desc" --$ This boss knows that a happy customer tips well, and {0:gender?he keeps his|she keeps her|they keep their} customers happy no matter what. 
icon = "Sprites/Diplomacy/EmpireBonus_BrothelIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Starting Level
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_STARTING_LEVEL"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyStartingLevel"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_STARTING_LEVEL_modifierName" --$ Raise The Bar
modifierId = "EMPIRE_BONUS_SPEAKEASY_STARTING_LEVEL"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_STARTING_LEVEL_desc" --$ This boss knows the importance of a good start. Opening a speakeasy that's a cut above the rest is sure to draw the crowd. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyStartingLevel"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyStartingLevel"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Free Guard Improvement
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_FREE_GUARD_IMPROVEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusFreeGuardImprovement"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_FREE_GUARD_IMPROVEMENT_modifierName" --$ On Your Guard
modifierId = "EMPIRE_BONUS_FREE_GUARD_IMPROVEMENT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_FREE_GUARD_IMPROVEMENT_desc" --$ This boss has a knack for getting to know the locals when {0:gender?he moves|she moves|they move} into a new precinct, and they all want to work for {0:gender?him|her|them}. 
icon = "Sprites/Diplomacy/EmpireBonus_FreeGuardImprovement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_FreeGuardImprovement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus First Reinforcement Wave Early
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusFirstReinforcementWaveEarly"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY_modifierName" --$ Trigger Happy 
modifierId = "EMPIRE_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY_desc" --$ This boss' guards are so hungry for a fight, they arrive early for it.
icon = "Sprites/Diplomacy/EmpireBonus_FirstReinforcementWaveEarly"
iconLarge = "Sprites/Diplomacy/EmpireBonus_FirstReinforcementWaveEarly"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Upgrade Discount
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoUpgradeDiscount"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_modifierName" --$ Deals of Fortune
modifierId = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_desc" --$ This boss has been in this game long enough to know who can get things done cheap. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Reduced Police Activity
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoReducedPoliceActivity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_REDUCED_POLICE_ACTIVITY_modifierName" --$ Blind Betting
modifierId = "EMPIRE_BONUS_CASINO_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_REDUCED_POLICE_ACTIVITY_desc" --$ This boss can hide a casino in plain sight and away from the eyes of curious cops. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Income
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyIncome"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_INCOME_modifierName" --$ Drincome
modifierId = "EMPIRE_BONUS_SPEAKEASY_INCOME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_INCOME_desc" --$ This boss knows a little water in the whiskey gives it that signature smooth taste, and stretches {0:gender?his|her|their} speakeasy profits.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Upgrade Time
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_UPGRADE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoUpgradeTime"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_TIME_modifierName" --$ No Clocks Here
modifierId = "EMPIRE_BONUS_CASINO_UPGRADE_TIME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_TIME_desc" --$ This boss knows that hiring a construction crew of gamblers gets a job done quickly. They love to bet on how fast they can do things! 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Storage
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_STORAGE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryStorage"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_STORAGE_modifierName" --$ Personal Cellar
modifierId = "EMPIRE_BONUS_BREWERY_STORAGE"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_STORAGE_desc" --$ This boss can provide a little extra space for {0:gender?his|her|their} booze by putting some in {0:gender?his|her|their} personal cellar. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryStorage"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryStorage"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Extra Brewery Guard
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_EXTRA_BREWERY_GUARD"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_includes[2] = "EMPIRE_BONUS_EXTRA_GUARDS_BASE"
_name = "EmpireBonusExtraBreweryGuard"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_EXTRA_BREWERY_GUARD_modifierName" --$ Safeguard
modifierId = "EMPIRE_BONUS_EXTRA_BREWERY_GUARD"
desc = "$BEHAVIOURS_EMPIRE_BONUS_EXTRA_BREWERY_GUARD_desc" --$ This boss knows the importance of guarding {0:gender?his|her|their} product and believes an extra brewery guard is a worthy investment. 
icon = "Sprites/Diplomacy/EmpireBonus_ExtraBreweryGuard"
iconLarge = "Sprites/Diplomacy/EmpireBonus_ExtraBreweryGuard"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Loan Sharking
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_LOAN_SHARKING"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusLoanSharking"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_LOAN_SHARKING_modifierName" --$ Shark Smile
modifierId = "EMPIRE_BONUS_LOAN_SHARKING"
desc = "$BEHAVIOURS_EMPIRE_BONUS_LOAN_SHARKING_desc" --$ This boss has a head for making things work, and a grin that scares clients into thinking twice about skipping out on a loan.
icon = "Sprites/Diplomacy/EmpireBonus_LoanSharking"
iconLarge = "Sprites/Diplomacy/EmpireBonus_LoanSharking"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Double Time
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_DOUBLE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusDoubleTime"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_DOUBLE_TIME_modifierName" --$ Double Time
modifierId = "EMPIRE_BONUS_DOUBLE_TIME"
desc = "$BEHAVIOURS_EMPIRE_BONUS_DOUBLE_TIME_desc" --$ This boss' gangsters work time in hand if money gets tight. They know {0:gender?he's|she's|they're} good for it. 
icon = "Sprites/Diplomacy/EmpireBonus_DoubleTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_DoubleTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Upgrade Discount Production
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryUpgradeDiscountProduction"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION_modifierName" --$ Well Oiled Machine
modifierId = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION_desc" --$ This boss has a head for industry and can get breweries working to their full potential.  
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountProduction"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountProduction"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Upgrade Discount Quality
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryUpgradeDiscountQuality"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY_modifierName" --$ On The Hops
modifierId = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY_desc" --$ This boss has a line on the finest raw materials, which makes for a better finished product at a lesser cost.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountQuality"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountQuality"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brewery Upgrade Discount Deflect
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBreweryUpgradeDiscountDeflect"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT_modifierName" --$ Industry Standard
modifierId = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss knows all the loopholes of the industry to keep even the most inquisitive cops from digging too deep.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Upgrade Discount Ambience
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelUpgradeDiscountAmbience"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE_modifierName" --$ Silk Sheets
modifierId = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE_desc" --$ This boss knows where to find all the little extras that can turn a slum into a palace.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountAmbience"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountAmbience"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Upgrade Discount Deflect
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelUpgradeDiscountDeflect"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT_modifierName" --$ Red Lights Out
modifierId = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss has a special agreement with cops so that they don't come knocking as often as other places.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Upgrade Discount Security
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelUpgradeDiscountSecurity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY_modifierName" --$ Rocksteady
modifierId = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY_desc" --$ This boss can fortify a love shack at a far lesser cost than others can.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountSecurity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountSecurity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Brothel Extra Reinforcement
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_BROTHEL_EXTRA_REINFORCEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusBrothelExtraReinforcement"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_EXTRA_REINFORCEMENT_modifierName" --$ Love Hurts
modifierId = "EMPIRE_BONUS_BROTHEL_EXTRA_REINFORCEMENT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_BROTHEL_EXTRA_REINFORCEMENT_desc" --$ This boss has extra muscle to call upon should things get too out of hand.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelExtraReinforcement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelExtraReinforcement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Extra Brothel Guard
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_EXTRA_BROTHEL_GUARD"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_includes[2] = "EMPIRE_BONUS_EXTRA_GUARDS_BASE"
_name = "EmpireBonusExtraBrothelGuard"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_EXTRA_BROTHEL_GUARD_modifierName" --$ Heartbreaker
modifierId = "EMPIRE_BONUS_EXTRA_BROTHEL_GUARD"
desc = "$BEHAVIOURS_EMPIRE_BONUS_EXTRA_BROTHEL_GUARD_desc" --$ This boss is prepared to allocate an extra guard on their brothels to help protect the sanctity of paid love. 
icon = "Sprites/Diplomacy/EmpireBonus_ExtraBrothelGuard"
iconLarge = "Sprites/Diplomacy/EmpireBonus_ExtraBrothelGuard"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Upgrade Discount Word Of Mouth
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyUpgradeDiscountWordOfMouth"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH_modifierName" --$ Something I Said
modifierId = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH_desc" --$ This boss has a gift for talking up a storm about their speakeasies. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountWordOfMouth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountWordOfMouth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Upgrade Discount Deflect
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyUpgradeDiscountDeflect"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT_modifierName" --$ Blind Drunk
modifierId = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss offers beat cops a little tipple to ensure they keep looking the other way. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Speakeasy Upgrade Discount Ambience
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusSpeakeasyUpgradeDiscountAmbience"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE_modifierName" --$ Velvet Rope
modifierId = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE"
desc = "$BEHAVIOURS_EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE_desc" --$ This boss has been in enough 'members only' joints to know exactly how to jazz up their own places on the cheap.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountAmbience"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountAmbience"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Upgrade Discount Security
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoUpgradeDiscountSecurity"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY_modifierName" --$ House Rules
modifierId = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY_desc" --$ This boss gets indebted gamblers to work off what they owe as discount security. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountSecurity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountSecurity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Upgrade Discount Word Of Mouth
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoUpgradeDiscountWordOfMouth"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH_modifierName" --$ Gambler's Gab
modifierId = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH_desc" --$ This boss has a gambler on the inside to spread the word amongst punters about which rackets to place their bets in. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountWordOfMouth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountWordOfMouth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Extra Reinforcement
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_EXTRA_REINFORCEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoExtraReinforcement"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_EXTRA_REINFORCEMENT_modifierName" --$ Get Out Stakes
modifierId = "EMPIRE_BONUS_CASINO_EXTRA_REINFORCEMENT"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_EXTRA_REINFORCEMENT_desc" --$ When things get heated, this boss has an extra guard to call to help balance the odds.
icon = "Sprites/Diplomacy/EmpireBonus_CasinoExtraReinforcement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoExtraReinforcement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Empire Bonus Casino Precinct Growth
--------------------------------------------------------------------------------]]

_id = "EMPIRE_BONUS_CASINO_PRECINCT_GROWTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EmpireBonusCasinoPrecinctGrowth"
modifierName = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_PRECINCT_GROWTH_modifierName" --$ Hedge Yer Bets
modifierId = "EMPIRE_BONUS_CASINO_PRECINCT_GROWTH"
desc = "$BEHAVIOURS_EMPIRE_BONUS_CASINO_PRECINCT_GROWTH_desc" --$ This boss has invested in the market in order to keep customer base growing.
icon = "Sprites/Diplomacy/EmpireBonus_CasinoPrecinctGrowth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoPrecinctGrowth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Production
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_PRODUCTION"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_PRODUCTION"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryProduction"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_PRODUCTION"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_PRODUCTION_desc" --$ This boss' business partner has an expertise in industrial production techniques, and the boss will happily put that expertise to use in {0:gender?his|her|their} own empire.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryProduction"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryProduction"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Upgrade Discount
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelUpgradeDiscount"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_desc" --$ This boss' business partner knows that when clients come through the door, it's not the drapery they're looking at. 
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Reduced Police Activity
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusReducedPoliceActivity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_REDUCED_POLICE_ACTIVITY_desc" --$ This boss' business partner knows marketing goes a long way. They can market the boss' breweries to look like pharmaceutical companies. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Upgrade Discount
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryUpgradeDiscount"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_desc" --$ This business partner's money saving savvy comes in handy when investing in expensive brewing equipment. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Police Activity Improvements Discount
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusPoliceActivityImprovementsDiscount"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_POLICE_ACTIVITY_IMPROVEMENTS_DISCOUNT_desc" --$ This boss' business partner believes it's important to keep a close eye on the crew in blue so that they stay out of their way.
icon = "Sprites/Diplomacy/EmpireBonus_PoliceActivityImprovementsDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_PoliceActivityImprovementsDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Reduced Police Activity
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyReducedPoliceActivity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_REDUCED_POLICE_ACTIVITY_desc" --$ This boss' business partner knows that if you keep the cops drinking, they're too busy for anything else. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Upgrade Discount
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyUpgradeDiscount"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_desc" --$ This boss' business partner has a few tricks that can help shave a few bucks off the cost of speakeasy upgrades.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Upgrade Time
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_TIME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyUpgradeTime"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_TIME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_TIME_desc" --$ This boss' business partner takes any measure necessary to get things done quickly so nothing cuts into quality drinking time. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Reduced Police Activity
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelReducedPoliceActivity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_REDUCED_POLICE_ACTIVITY_desc" --$ This boss' business partner has their staff keep cops so distracted that they forget why they even came to the brothel.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Income
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_INCOME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoIncome"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_INCOME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_INCOME_desc" --$ The house always wins, and this boss' business partner can make the house win even more. That's got to be good for profits. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Income
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_INCOME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelIncome"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_INCOME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_INCOME_desc" --$ This boss' business partner knows that happy customers tip well, and they keep customers happy no matter what. 
icon = "Sprites/Diplomacy/EmpireBonus_BrothelIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Starting Level
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_STARTING_LEVEL"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_STARTING_LEVEL"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyStartingLevel"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_STARTING_LEVEL"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_STARTING_LEVEL_desc" --$ This boss' business partner knows that opening a speakeasy that's a cut above the rest is a sure way to draw the crowd.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyStartingLevel"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyStartingLevel"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Free Guard Improvement
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_FREE_GUARD_IMPROVEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_FREE_GUARD_IMPROVEMENT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusFreeGuardImprovement"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_FREE_GUARD_IMPROVEMENT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_FREE_GUARD_IMPROVEMENT_desc" --$ This boss' business partner can spot local talent when they take over a new precinct. They put them right to work. 
icon = "Sprites/Diplomacy/EmpireBonus_FreeGuardImprovement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_FreeGuardImprovement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus First Reinforcement Wave Early
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusFirstReinforcementWaveEarly"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_FIRST_REINFORCEMENT_WAVE_EARLY_desc" --$ This boss' business partner has guards so hungry for a fight, they arrive early for it. 
icon = "Sprites/Diplomacy/EmpireBonus_FirstReinforcementWaveEarly"
iconLarge = "Sprites/Diplomacy/EmpireBonus_FirstReinforcementWaveEarly"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Upgrade Discount
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoUpgradeDiscount"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_desc" --$ This boss' business partner has been in the game long enough to know who can get things done cheap.
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscount"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscount"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Reduced Police Activity
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_REDUCED_POLICE_ACTIVITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_REDUCED_POLICE_ACTIVITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoReducedPoliceActivity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_REDUCED_POLICE_ACTIVITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_REDUCED_POLICE_ACTIVITY_desc" --$ This boss' business partner can hide a casino in plain sight and away from the eyes of curious cops. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoReducedPoliceActivity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoReducedPoliceActivity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Income
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_INCOME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_INCOME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyIncome"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_INCOME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_INCOME_desc" --$ This boss' business partner knows that a little water in the whiskey can go a long way to helping a speakeasy's profits.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyIncome"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyIncome"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Upgrade Time
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_UPGRADE_TIME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoUpgradeTime"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_TIME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_TIME_desc" --$ This boss' business partner knows a gambling construction crew who love to bet on how fast they can get things done. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Storage
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_STORAGE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_STORAGE"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryStorage"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_STORAGE"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_STORAGE_desc" --$ This boss' business partner can grant {0:gender?him|her|them} access to their personal cellar if brewery storage is tight on space. 
icon = "Sprites/Diplomacy/EmpireBonus_BreweryStorage"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryStorage"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Extra Brewery Guard
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_EXTRA_BREWERY_GUARD"
_includes = {}
_includes[1] = "EMPIRE_BONUS_EXTRA_BREWERY_GUARD"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusExtraBreweryGuard"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_EXTRA_BREWERY_GUARD"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_EXTRA_BREWERY_GUARD_desc" --$ This boss' business partner knows the importance of guarding their product and believes an extra brewery guard is a worthy investment. 
icon = "Sprites/Diplomacy/EmpireBonus_ExtraBreweryGuard"
iconLarge = "Sprites/Diplomacy/EmpireBonus_ExtraBreweryGuard"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Loan Sharking
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_LOAN_SHARKING"
_includes = {}
_includes[1] = "EMPIRE_BONUS_LOAN_SHARKING"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusLoanSharking"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_LOAN_SHARKING"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_LOAN_SHARKING_desc" --$ This boss' business partner has a head for making things work, and a grin that scares clients into thinking twice about skipping out on a loan. 
icon = "Sprites/Diplomacy/EmpireBonus_LoanSharking"
iconLarge = "Sprites/Diplomacy/EmpireBonus_LoanSharking"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Double Time
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_DOUBLE_TIME"
_includes = {}
_includes[1] = "EMPIRE_BONUS_DOUBLE_TIME"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusDoubleTime"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_DOUBLE_TIME"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_DOUBLE_TIME_desc" --$ This boss' gangsters trust {0:gender?his|her|their} business partner enough to work some time in hand if money gets scarce. 
icon = "Sprites/Diplomacy/EmpireBonus_DoubleTime"
iconLarge = "Sprites/Diplomacy/EmpireBonus_DoubleTime"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Upgrade Discount Production
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryUpgradeDiscountProduction"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_PRODUCTION_desc" --$ This boss' business partner has a head for industry and can get breweries working to their full potential.  
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountProduction"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountProduction"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Upgrade Discount Quality
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryUpgradeDiscountQuality"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_QUALITY_desc" --$ This boss' business partner can access the finest raw materials, which makes for a better finished product at a lesser cost.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountQuality"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountQuality"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brewery Upgrade Discount Deflect
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBreweryUpgradeDiscountDeflect"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BREWERY_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss' business partner knows enough loopholes to keep even the most inquisitive cops from digging too deep.
icon = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BreweryUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Upgrade Discount Ambience
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelUpgradeDiscountAmbience"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_AMBIENCE_desc" --$ This boss' business partner knows where to find all the little extras that can turn a slum into a palace.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountAmbience"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountAmbience"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Upgrade Discount Deflect
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelUpgradeDiscountDeflect"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss' business partner has cops on the payroll, so the law won't come knocking as often as other places.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Upgrade Discount Security
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelUpgradeDiscountSecurity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_UPGRADE_DISCOUNT_SECURITY_desc" --$ This boss' business partner can fortify a love shack at a far lesser cost than others can.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountSecurity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelUpgradeDiscountSecurity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Brothel Extra Reinforcement
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_EXTRA_REINFORCEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_BROTHEL_EXTRA_REINFORCEMENT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusBrothelExtraReinforcement"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_BROTHEL_EXTRA_REINFORCEMENT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_BROTHEL_EXTRA_REINFORCEMENT_desc" --$ This boss' business partner has extra muscle to call upon should things get too out of hand.
icon = "Sprites/Diplomacy/EmpireBonus_BrothelExtraReinforcement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_BrothelExtraReinforcement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Extra Brothel Guard
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_EXTRA_BROTHEL_GUARD"
_includes = {}
_includes[1] = "EMPIRE_BONUS_EXTRA_BROTHEL_GUARD"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusExtraBrothelGuard"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_EXTRA_BROTHEL_GUARD"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_EXTRA_BROTHEL_GUARD_desc" --$ This boss' business partner allocates an extra guard to brothels to help protect the sanctity of paid love. 
icon = "Sprites/Diplomacy/EmpireBonus_ExtraBrothelGuard"
iconLarge = "Sprites/Diplomacy/EmpireBonus_ExtraBrothelGuard"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Upgrade Discount Word Of Mouth
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyUpgradeDiscountWordOfMouth"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_WORD_OF_MOUTH_desc" --$ This boss' business partner has a gift for talking up a storm about their speakeasies. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountWordOfMouth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountWordOfMouth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Upgrade Discount Deflect
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyUpgradeDiscountDeflect"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_DEFLECT_desc" --$ This boss' business partner offers beat cops a little tipple to ensure they keep looking the other way. 
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountDeflect"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountDeflect"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Speakeasy Upgrade Discount Ambience
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusSpeakeasyUpgradeDiscountAmbience"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_SPEAKEASY_UPGRADE_DISCOUNT_AMBIENCE_desc" --$ This boss' business partner knows exactly how to jazz up their own places on the cheap.
icon = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountAmbience"
iconLarge = "Sprites/Diplomacy/EmpireBonus_SpeakeasyUpgradeDiscountAmbience"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Upgrade Discount Security
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoUpgradeDiscountSecurity"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_SECURITY_desc" --$ This boss' business partner gets indebted gamblers to work off what they owe as discount security. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountSecurity"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountSecurity"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Upgrade Discount Word Of Mouth
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoUpgradeDiscountWordOfMouth"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_UPGRADE_DISCOUNT_WORD_OF_MOUTH_desc" --$ This boss' business partner has spread the word amongst punters about which rackets to place their bets in. 
icon = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountWordOfMouth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoUpgradeDiscountWordOfMouth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Extra Reinforcement
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_EXTRA_REINFORCEMENT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_EXTRA_REINFORCEMENT"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoExtraReinforcement"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_EXTRA_REINFORCEMENT"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_EXTRA_REINFORCEMENT_desc" --$ When things get heated, this boss' business partner has an extra guard to call to help balance the odds.
icon = "Sprites/Diplomacy/EmpireBonus_CasinoExtraReinforcement"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoExtraReinforcement"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Business Arrangement Bonus Casino Precinct Growth
name derived from empire bonus
--------------------------------------------------------------------------------]]

_id = "BUSINESS_ARRANGEMENT_BONUS_CASINO_PRECINCT_GROWTH"
_includes = {}
_includes[1] = "EMPIRE_BONUS_CASINO_PRECINCT_GROWTH"
_includes[2] = "BUSINESS_ARRANGEMENT_BONUS_TRAIT_BASE"
_name = "BusinessArrangementBonusCasinoPrecinctGrowth"
modifierId = "BUSINESS_ARRANGEMENT_BONUS_CASINO_PRECINCT_GROWTH"
desc = "$BEHAVIOURS_BUSINESS_ARRANGEMENT_BONUS_CASINO_PRECINCT_GROWTH_desc" --$ This boss' business partner markets their rackets well in order to keep customer base growing.
icon = "Sprites/Diplomacy/EmpireBonus_CasinoPrecinctGrowth"
iconLarge = "Sprites/Diplomacy/EmpireBonus_CasinoPrecinctGrowth"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lieutenant Bonus Morale
--------------------------------------------------------------------------------]]

_id = "LIEUTENANT_BONUS_MORALE"
_includes = {}
_includes[1] = "LIEUTENANT_BONUS_BASE"
_name = "LieutenantBonusMorale"
modifierName = "$BEHAVIOURS_LIEUTENANT_BONUS_MORALE_modifierName" --$ Lieutenant Bonus: Gangster Morale Gain
modifierId = "LIEUTENANT_BONUS_MORALE"
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_Bonus_Lieutenant"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_Bonus_Lieutenant_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lieutenant Bonus Racket Guard Damage
--------------------------------------------------------------------------------]]

_id = "LIEUTENANT_BONUS_RACKET_GUARD_DAMAGE"
_includes = {}
_includes[1] = "LIEUTENANT_BONUS_BASE"
_name = "LieutenantBonusRacketGuardDamage"
modifierName = "$BEHAVIOURS_LIEUTENANT_BONUS_RACKET_GUARD_DAMAGE_modifierName" --$ Lieutenant Bonus: Racket Guard Damage
modifierId = "LIEUTENANT_BONUS_RACKET_GUARD_DAMAGE"
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_Bonus_Lieutenant"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_Bonus_Lieutenant_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lieutenant Bonus Raid Chance
--------------------------------------------------------------------------------]]

_id = "LIEUTENANT_BONUS_RAID_CHANCE"
_includes = {}
_includes[1] = "LIEUTENANT_BONUS_BASE"
_name = "LieutenantBonusRaidChance"
modifierName = "$BEHAVIOURS_LIEUTENANT_BONUS_RAID_CHANCE_modifierName" --$ Lieutenant Bonus: Reduced Raid Chance
modifierId = "LIEUTENANT_BONUS_RAID_CHANCE"
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_Bonus_Lieutenant"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_Bonus_Lieutenant_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Lieutenant Bonus Racket Income
--------------------------------------------------------------------------------]]

_id = "LIEUTENANT_BONUS_RACKET_INCOME"
_includes = {}
_includes[1] = "LIEUTENANT_BONUS_BASE"
_name = "LieutenantBonusRacketIncome"
modifierName = "$BEHAVIOURS_LIEUTENANT_BONUS_RACKET_INCOME_modifierName" --$ Lieutenant Bonus: Racket Income
modifierId = "LIEUTENANT_BONUS_RACKET_INCOME"
icon = "Sprites/Icons/Trait/SafehouseAssignment/Trait_Bonus_Lieutenant"
iconLarge = "Sprites/Icons/Trait_Large/SafehouseAssignment/Trait_Bonus_Lieutenant_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Stronger Bonds
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_STRONGER_BONDS"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "StrongerBonds"
modifierName = "$BEHAVIOURS_DIPLOMACY_STRONGER_BONDS_modifierName" --$ Stronger Bonds
modifierId = "DIPLOMACY_STRONGER_BONDS"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Turncoat
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_TURNCOAT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "Turncoat"
modifierName = "$BEHAVIOURS_DIPLOMACY_TURNCOAT_modifierName" --$ Turncoat
modifierId = "DIPLOMACY_TURNCOAT"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy The Heartbreak Kid
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_THE_HEARTBREAK_KID"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "TheHeartbreakKid"
modifierName = "$BEHAVIOURS_DIPLOMACY_THE_HEARTBREAK_KID_modifierName" --$ The Heartbreak Kid
modifierId = "DIPLOMACY_THE_HEARTBREAK_KID"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Strength In Numbers Base
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_STRENGTH_IN_NUMBERS_BASE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "StrengthInNumbersBase"
modifierName = "$BEHAVIOURS_DIPLOMACY_STRENGTH_IN_NUMBERS_BASE_modifierName" --$ Strength In Numbers
modifierId = "DIPLOMACY_STRENGTH_IN_NUMBERS"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Bygones Be Bygones
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_BYGONES_BE_BYGONES"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "BygonesBeBygones"
modifierName = "$BEHAVIOURS_DIPLOMACY_BYGONES_BE_BYGONES_modifierName" --$ Bygones Be Bygones
modifierId = "DIPLOMACY_BYGONES_BE_BYGONES"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Founding Farther
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_FOUNDING_FARTHER"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "FoundingFarther"
modifierName = "$BEHAVIOURS_DIPLOMACY_FOUNDING_FARTHER_modifierName" --$ Founding Farther
modifierId = "DIPLOMACY_FOUNDING_FARTHER"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Jive Joint
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_JIVE_JOINT"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "JiveJoint"
modifierName = "$BEHAVIOURS_DIPLOMACY_JIVE_JOINT_modifierName" --$ Jive Joint
modifierId = "DIPLOMACY_JIVE_JOINT"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Peacemaker
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_PEACEMAKER"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "Peacemaker"
modifierName = "$BEHAVIOURS_DIPLOMACY_PEACEMAKER_modifierName" --$ Peacemaker
modifierId = "DIPLOMACY_PEACEMAKER"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Fair Price
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_FAIR_PRICE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "FairPrice"
modifierName = "$BEHAVIOURS_DIPLOMACY_FAIR_PRICE_modifierName" --$ Fair Price
modifierId = "DIPLOMACY_FAIR_PRICE"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Room To Grow
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_ROOM_TO_GROW"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "RoomToGrow"
modifierName = "$BEHAVIOURS_DIPLOMACY_ROOM_TO_GROW_modifierName" --$ Room To Grow
modifierId = "DIPLOMACY_ROOM_TO_GROW"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Enemy Of My Enemy
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_ENEMY_OF_MY_ENEMY"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "EnemyOfMyEnemy"
modifierName = "$BEHAVIOURS_DIPLOMACY_ENEMY_OF_MY_ENEMY_modifierName" --$ Enemy Of My Enemy
modifierId = "DIPLOMACY_ENEMY_OF_MY_ENEMY"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Roll Of The Dice
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_ROLL_OF_THE_DICE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "RollOfTheDice"
modifierName = "$BEHAVIOURS_DIPLOMACY_ROLL_OF_THE_DICE_modifierName" --$ Roll Of The Dice
modifierId = "DIPLOMACY_ROLL_OF_THE_DICE"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy At Your Service
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_AT_YOUR_SERVICE"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "AtYourService"
modifierName = "$BEHAVIOURS_DIPLOMACY_AT_YOUR_SERVICE_modifierName" --$ At Your Service
modifierId = "DIPLOMACY_AT_YOUR_SERVICE"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Headhunter
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_HEADHUNTER"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "Headhunter"
modifierName = "$BEHAVIOURS_DIPLOMACY_HEADHUNTER_modifierName" --$ Headhunter
modifierId = "DIPLOMACY_HEADHUNTER"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Diplomacy Mob Power
--------------------------------------------------------------------------------]]

_id = "DIPLOMACY_MOB_POWER"
_includes = {}
_includes[1] = "EMPIRE_BONUS_TRAIT_BASE"
_name = "MobPower"
modifierName = "$BEHAVIOURS_DIPLOMACY_MOB_POWER_modifierName" --$ Mob Power
modifierId = "DIPLOMACY_MOB_POWER"
icon = "Sprites/Icons/Trait/Diplomatic/Trait_Bonus_Diplomatic"
iconLarge = "Sprites/Icons/Trait_Large/Diplomatic/Trait_Bonus_Diplomatic_Large"

--[[------------------------------------------------------------------------------
Afraid
--------------------------------------------------------------------------------]]

_id = "AFRAID"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Afraid"
modifierName = "$BEHAVIOURS_AFRAID_modifierName" --$ Afraid
modifierId = "AFRAID"
desc = "$BEHAVIOURS_AFRAID_desc" --$ This person has had too much and is about to break.
icon = "Sprites/Icons/Trait/Personality/Trait_Afraid"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_Afraid_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Barroom Brawler
--------------------------------------------------------------------------------]]

_id = "BARROOM_BRAWLER"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "BarroomBrawler"
modifierName = "$BEHAVIOURS_BARROOM_BRAWLER_modifierName" --$ Barroom Brawler
modifierId = "BARROOM_BRAWLER"
desc = "$BEHAVIOURS_BARROOM_BRAWLER_desc" --$ Increases your Melee skill and Melee damage. This effect increases if you are drunk.
icon = "Sprites/Icons/Trait/Personality/Trait_BarRoomBrawler"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_BarRoomBrawler_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Nervous Reflexes
--------------------------------------------------------------------------------]]

_id = "NERVOUS_REFLEXES"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "NervousReflexes"
modifierName = "$BEHAVIOURS_NERVOUS_REFLEXES_modifierName" --$ Nervous Reflexes
modifierId = "NERVOUS_REFLEXES"
Modifier.marksmanship = function() return -5, modifierName end
Modifier.movement = function() return 1, modifierName end
desc = "$BEHAVIOURS_NERVOUS_REFLEXES_desc" --$ Your nervous demeanor causes your hands to shake, but keeps you quick on your feet.
icon = "Sprites/Icons/StatusEffects/StatusEffect_NervousReflexes"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_NervousReflexes_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Bodyguard
--------------------------------------------------------------------------------]]

_id = "BODYGUARD"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "Bodyguard"
modifierName = "$BEHAVIOURS_BODYGUARD_modifierName" --$ Bodyguard
modifierId = "BODYGUARD"
Modifier.initiative = function() return 1000, modifierName end
desc = "$BEHAVIOURS_BODYGUARD_desc" --$ Whenever you accompany your Boss in combat, you will always have the first turn in combat.
icon = "Sprites/Icons/Trait/Elite/Trait_Bodyguard"
iconLarge = "Sprites/Icons/Trait_Large/Elite/Trait_Bodyguard_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Sober Alcoholic
--------------------------------------------------------------------------------]]

_id = "SOBER_ALCOHOLIC"
_includes = {}
_includes[1] = "TRAIT_BASE"
_name = "SoberAlcoholic"
modifierName = "$BEHAVIOURS_SOBER_ALCOHOLIC_modifierName" --$ Sober Alcoholic
modifierId = "SOBER_ALCOHOLIC"
desc = "$BEHAVIOURS_SOBER_ALCOHOLIC_desc" --$ You've managed to sober yourself up. You no longer feel the urge to have a drink.
icon = "Sprites/Icons/Trait/Personality/Trait_SoberAlcoholic"
iconLarge = "Sprites/Icons/Trait_Large/Personality/Trait_SoberAlcoholic_Large"
buffType = "TRAIT"

--[[------------------------------------------------------------------------------
Survivor
--------------------------------------------------------------------------------]]

_id = "SURVIVOR"
_includes = {}
_includes[1] = "PASSIVE_EFFECT_BASE"
_name = "Survivor"
modifierName = "$BEHAVIOURS_SURVIVOR_modifierName" --$ Survivor
modifierId = "SURVIVOR"
Modifier.bleedOutChance = function() return 1000, modifierName end
desc = "$BEHAVIOURS_SURVIVOR_desc" --$ Characters with the survivor ability will always bleed out when dealt lethal damage.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Survivor"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Survivor_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Overwatch
--------------------------------------------------------------------------------]]

_id = "OVERWATCH"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "Overwatch"
modifierName = "$BEHAVIOURS_OVERWATCH_modifierName" --$ Overwatch
modifierId = "OVERWATCH"
desc = "$BEHAVIOURS_OVERWATCH_desc" --$ Fire a reactionary shot at any enemy character that enters into your overwatch area.
icon = "Sprites/Icons/StatusEffects/StatusEffect_Overwatch"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_Overwatch_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Melee Overwatch
--------------------------------------------------------------------------------]]

_id = "MELEE_OVERWATCH"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "MeleeOverwatch"
modifierName = "$BEHAVIOURS_MELEE_OVERWATCH_modifierName" --$ Melee Overwatch
modifierId = "MELEE_OVERWATCH"
desc = "$BEHAVIOURS_MELEE_OVERWATCH_desc" --$ You will perform an automatic melee attack against any enemy character that gets too close to you. 
icon = "Sprites/Icons/StatusEffects/StatusEffect_MeleeOverwatch"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_MeleeOverwatch_Large"
buffType = "POSITIVE"

--[[------------------------------------------------------------------------------
Batter Up
--------------------------------------------------------------------------------]]

_id = "BATTER_UP"
_includes = {}
_includes[1] = "STATUS_EFFECT_BASE"
_name = "BatterUp"
modifierName = "$BEHAVIOURS_BATTER_UP_modifierName" --$ Batter Up!
modifierId = "BATTER_UP"
desc = "$BEHAVIOURS_BATTER_UP_desc" --$ Perform an automatic melee attack against any enemy character that gets too close for comfort. 
icon = "Sprites/Icons/StatusEffects/StatusEffect_BatterUp"
iconLarge = "Sprites/Icons/StatusEffects_Large/StatusEffect_BatterUp_Large"
buffType = "POSITIVE"
