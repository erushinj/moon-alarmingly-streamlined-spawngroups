local cruise_triads = {
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"),
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"),
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"),
}
local cruise_securitys = {
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"),
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"),
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"),
}
local casual_male_ids = ASS.utils.gen_remove_random_value({ 102188, 102189, 102174, 103010, 103008, 102173, })
local casual_male = {
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_2/civ_male_asian_casual_2"),
}
local suit_male_ids = ASS.utils.gen_remove_random_value({ 102248, 102247, 102250, 102187, })
local suit_male = {
	Idstring("units/pd2_dlc_casino/characters/civ_male_business_casino_2/civ_male_business_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
}
local spa_male_ids = ASS.utils.gen_remove_random_value({ 102169, 102171, 103643, 103641, 103644, })
local spa_male = {
	Idstring("units/pd2_dlc_chca/characters/civ_male_bathhouse_1/civ_male_bathhouse_1"),
	Idstring("units/pd2_dlc_chca/characters/civ_male_bathhouse_2/civ_male_bathhouse_2"),
}
local civs_female = {
	Idstring("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"),
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/pd2_dlc_chas/characters/civ_female_asian_casual_1/civ_female_asian_casual_1"),
}
local spa_female = {
	Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_1/civ_female_bathhouse_1"),
	Idstring("units/pd2_dlc_chca/characters/civ_female_bathhouse_2/civ_female_bathhouse_2"),
}
local service = {
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_1/civ_female_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_2/civ_female_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_3/civ_female_casino_3"),
}
local try_pick_bob_spa = ASS.utils.try_pick_bobblehead_bob(nil, spa_male, Idstring("units/pd2_dlc_chca/characters/civ_male_bathhouse_3/civ_male_bathhouse_3"))
local try_pick_bob_casino = ASS.utils.try_pick_bobblehead_bob(nil, suit_male)
local try_pick_bob_casual = ASS.utils.try_pick_bobblehead_bob(nil, casual_male)
local bikini_female_ids = ASS.utils.gen_remove_random_value({ 102172, 102184, })

return {
	[101949] = { enemy = cruise_securitys, },  -- enemies, guards
	[101951] = { enemy = cruise_securitys, },
	[101956] = { enemy = cruise_securitys, },
	[101957] = { enemy = cruise_securitys, },
	[101920] = { enemy = cruise_securitys, },
	[101943] = { enemy = cruise_securitys, },
	[101944] = { enemy = cruise_securitys, },
	[102079] = { enemy = cruise_securitys, },
	[101958] = { enemy = cruise_securitys, },
	[102101] = { enemy = cruise_securitys, },
	[102102] = { enemy = cruise_securitys, },
	[102104] = { enemy = cruise_securitys, },
	[102105] = { enemy = cruise_securitys, },
	[102109] = { enemy = cruise_securitys, },
	[102111] = { enemy = cruise_securitys, },
	[103509] = { enemy = cruise_securitys, },
	[102147] = { enemy = cruise_securitys, },
	[101534] = { enemy = cruise_securitys, },
	[101535] = { enemy = cruise_securitys, },
	[101793] = { enemy = cruise_securitys, },
	[101796] = { enemy = cruise_securitys, },
	[101950] = { enemy = cruise_triads, },  -- triads
	[102082] = { enemy = cruise_triads, },
	[102078] = { enemy = cruise_triads, },
	[102080] = { enemy = cruise_triads, },
	[102081] = { enemy = cruise_triads, },
	[102103] = { enemy = cruise_triads, },
	[102106] = { enemy = cruise_triads, },
	[102110] = { enemy = cruise_triads, },
	[102148] = { enemy = cruise_triads, },
	[101794] = { enemy = cruise_triads, },
	[101795] = { enemy = cruise_triads, },
	[103016] = { enemy = cruise_triads, },
	[101802] = { enemy = cruise_triads, },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },  -- civs
	[suit_male_ids()] = { enemy = try_pick_bob_casino(), },
	[spa_male_ids()] = { enemy = try_pick_bob_spa(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[suit_male_ids()] = { enemy = try_pick_bob_casino(), },
	[spa_male_ids()] = { enemy = try_pick_bob_spa(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[suit_male_ids()] = { enemy = try_pick_bob_casino(), },
	[spa_male_ids()] = { enemy = try_pick_bob_spa(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[spa_male_ids()] = { enemy = try_pick_bob_spa(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[spa_male_ids()] = { enemy = try_pick_bob_spa(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[100678] = { enemy = civs_female, },
	[100679] = { enemy = civs_female, },
	[102186] = { enemy = civs_female, },
	[103011] = { enemy = civs_female, },
	[103009] = { enemy = civs_female, },
	[103642] = { enemy = spa_female, },
	[103640] = { enemy = spa_female, },
	[102170] = { enemy = spa_female, },
	[103007] = { enemy = service, },
	[102201] = { enemy = service, },
	[102202] = { enemy = service, },
	[102203] = { enemy = service, },
	[102204] = { enemy = service, },
	[102205] = { enemy = service, },
	[102206] = { enemy = service, },
	[102213] = { enemy = service, },
	[102214] = { enemy = service, },
	[102215] = { enemy = service, },
	[102216] = { enemy = service, },
	[102217] = { enemy = service, },
	[102218] = { enemy = service, },
	[bikini_female_ids()] = { enemy = Idstring("units/payday2/characters/civ_female_bikini_1/civ_female_bikini_1"), },
	[bikini_female_ids()] = { enemy = Idstring("units/payday2/characters/civ_female_bikini_2/civ_female_bikini_2"), },
}
