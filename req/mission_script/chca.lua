local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local get_table_index_func = ASS:require("get_table_index_func", true)
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", true)
local guards_amount_casino_1 = { group_amount = normal and 1 or hard and 2 or 3, }
local guards_amount_casino_2 = { group_amount = normal and 1 or hard and 2 or 3, }
local guards_amount_cabin_corridor_1 = { group_amount = normal and 0 or hard and 1 or 2, }
local guards_amount_cabin_corridor_2 = { group_amount = normal and 0 or hard and 1 or 2, }
local guards_amount_inner_courtyard = { group_amount = normal and 1 or hard and 2 or 3, }
local guards_amount_lobby = { group_amount = normal and 1 or hard and 2 or 3, }
local guards_amount_spa = { group_amount = normal and 1 or hard and 2 or 3, }
local guards_amount_helipad = { group_amount = normal and 0 or hard and 1 or 2, }
local cams_amount_casino = { values = { amount = normal and 4 or hard and 6 or 8, }, }
local cams_amount_crew = { values = { amount = overkill and 2 or 1, }, }
local cams_amount_hall = { values = { amount = overkill and 2 or 1, }, }
local cams_amount_reception = { values = { amount = overkill and 2 or 1, }, }
local cams_amount_spa = { values = { amount = normal and 1 or hard and 3 or 5, }, }
local cams_amount_lobby = {
	values = {
		amount = normal and 1 or hard and 3 or 5,
	},
	on_executed = {
		{ id = 100296, delay = 0, },
	},
}
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
local switch_bikini_civs = math.random() < 0.5
local casual_male_ids = get_table_index_func({ 102188, 102189, 102174, 103010, 103008, 102173, })
local casual_male = {
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_2/civ_male_asian_casual_2"),
}
local suit_male_ids = get_table_index_func({ 102248, 102247, 102250, 102187, })
local suit_male = {
	Idstring("units/pd2_dlc_casino/characters/civ_male_business_casino_2/civ_male_business_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
}
local spa_male_ids = get_table_index_func({ 102169, 102171, 103643, 103641, 103644, })
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
local try_pick_bob_spa = try_pick_bobblehead_bob(nil, spa_male, Idstring("units/pd2_dlc_chca/characters/civ_male_bathhouse_3/civ_male_bathhouse_3"))
local try_pick_bob_casino = try_pick_bobblehead_bob(nil, suit_male)
local try_pick_bob_casual = try_pick_bobblehead_bob(nil, casual_male)

return {
	-- group spawn points
	[100312] = {  -- in casino balconies, its easy enough to get swamped back here
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		interval = 5,
	},
	[100325] = {
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		interval = 5,
	},
	[100758] = {  -- courtyard rappel spawns
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		interval = 15,
	},
	[100757] = {
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		interval = 15,
	},
	[100759] = {
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		interval = 15,
	},
	-- reenforce points
	[103169] = {  -- unneeded, courtyard
		values = {
			enabled = false,
		},
	},
	[103170] = {  -- spa
		values = {
			enabled = false,
		},
	},
	[103172] = {  -- helipad
		values = {
			enabled = false,
		},
	},
	[100022] = {  -- alarm
		reinforce = {
			{
				name = "courtyard",
				force = 3,
				position = Vector3(-9650, 6800, 0),
			},
			{
				name = "casino1",
				force = 2,
				position = Vector3(-8200, 4900, 0),
			},
			{
				name = "casino2",
				force = 2,
				position = Vector3(-10750, 4900, 0),
			},
			{
				name = "spa_lobby",
				force = 3,
				position = Vector3(-9300, 11100, 450),
			},
			{
				name = "spa1",
				force = 2,
				position = Vector3(-10500, 12400, 450),
			},
			{
				name = "spa2",
				force = 2,
				position = Vector3(-8000, 12400, 450),
			},
			{
				name = "spa_bar1",
				force = 2,
				position = Vector3(-8250, 14500, 0),
			},
			{
				name = "spa_bar2",
				force = 2,
				position = Vector3(-10500, 14500, 0),
			},
			{
				name = "crew_stairs1",
				force = 2,
				position = Vector3(-8200, 10700, -150),
			},
			{
				name = "crew_stairs2",
				force = 2,
				position = Vector3(-7600, 13900, -350),
			},
		},
	},
	-- guards amount
	[101945] = guards_amount_casino_1,
	[101946] = guards_amount_casino_1,
	[101947] = guards_amount_casino_1,
	[101952] = guards_amount_casino_2,
	[101953] = guards_amount_casino_2,
	[101954] = guards_amount_casino_2,
	[102064] = guards_amount_cabin_corridor_1,
	[102068] = guards_amount_cabin_corridor_1,
	[101927] = guards_amount_cabin_corridor_2,
	[101930] = guards_amount_cabin_corridor_2,
	[102069] = guards_amount_inner_courtyard,
	[102070] = guards_amount_inner_courtyard,
	[102071] = guards_amount_inner_courtyard,
	[101935] = guards_amount_lobby,
	[102072] = guards_amount_lobby,
	[103018] = guards_amount_lobby,
	[102073] = guards_amount_spa,
	[102074] = guards_amount_spa,
	[102075] = guards_amount_spa,
	[102076] = guards_amount_helipad,
	[102077] = guards_amount_helipad,
	[101942] = {  -- crew corridor filter
		values = set_difficulty_groups("hard_above"),
	},
	-- cams
	[100303] = {  -- no titan
		values = {
			enabled = false,
		},
	},
	[100033] = cams_amount_casino,
	[102348] = cams_amount_casino,
	[102349] = cams_amount_casino,
	[102375] = cams_amount_crew,
	[102376] = cams_amount_crew,
	[102354] = cams_amount_hall,
	[102355] = cams_amount_hall,
	[102356] = cams_amount_hall,
	[103014] = cams_amount_reception,
	[103015] = cams_amount_reception,
	[102372] = cams_amount_spa,
	[102373] = cams_amount_spa,
	[102374] = cams_amount_spa,
	[102365] = cams_amount_lobby,
	[102366] = cams_amount_lobby,
	[102367] = cams_amount_lobby,
	[102364] = {  -- lobby filter
		on_executed = {
			{ id = 100296, remove = true, },
		},
	},
	-- enemies
	[101949] = { enemy = cruise_securitys, },  -- guards
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
	-- civs
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
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
	[102172] = switch_bikini_civs and { enemy = Idstring("units/payday2/characters/civ_female_bikini_1/civ_female_bikini_1"), } or nil,
	[102184] = switch_bikini_civs and { enemy = Idstring("units/payday2/characters/civ_female_bikini_2/civ_female_bikini_2"), } or nil,
}
