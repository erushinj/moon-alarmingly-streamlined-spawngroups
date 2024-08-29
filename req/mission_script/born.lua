local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local van_swat_ids = ASS.utils.gen_remove_random_value({ 100826, 103257, 103260, })
local van_swats = ASS.utils.scripted_swat_squads({
	hard_target = normal and 1 or hard and 2 or 3,
	hard_spawn = "dozers_any",
	normal_spawn = "specials_any",
})
local heli_swat_ids = ASS.utils.gen_remove_random_value({ 101560, 101672, 101814, 101627, })
local heli_swats = ASS.utils.scripted_swat_squads({
	hard_target = overkill and 2 or 1,
	hard_spawn = "dozers_any",
	normal_spawn = "specials_any",
})
local biker_1 = Idstring("units/payday2/characters/ene_biker_1/ene_biker_1")
local biker_2 = Idstring("units/payday2/characters/ene_biker_2/ene_biker_2")
local biker_3 = Idstring("units/payday2/characters/ene_biker_3/ene_biker_3")
local biker_4 = Idstring("units/payday2/characters/ene_biker_4/ene_biker_4")
local biker_female_1 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1")
local biker_female_2 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2")
local biker_female_3 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3")
local bikers_male = { biker_1, biker_2, biker_3, biker_4, }
local lucky_punk = table.remove(bikers_male, math.random(#bikers_male))
local bikers_any = table.list_add(bikers_male, { biker_female_1, biker_female_2, biker_female_3, })
local biker_bartenders = {
	biker_female_2,
	biker_female_3,
	lucky_punk ~= biker_1 and biker_1 or biker_3,
}
-- theres actually exactly 8 civ spawns and 8 civs loaded, no need for try pick bobblehead bob
local civs_female_ids = ASS.utils.gen_remove_random_value({ 100936, 100993, 101051, 101055, })
local civs_female = ASS.utils.gen_remove_random_value({
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_wife_trophy_2/civ_female_wife_trophy_2"),
})
local civs_male_ids = ASS.utils.gen_remove_random_value({ 100538, 100697, 100723, 100906, })
local civs_male = ASS.utils.gen_remove_random_value({
	Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1"),
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_casual_9/civ_male_casual_9"),
})
local bikers_amount_clubhouse = {
	values = {
		amount = normal and 1 or hard and 2 or 3,
		amount_random = 0,
	},
}
local bikers_amount_clubhouse_1 = {
	values = {
		amount = overkill and 12 or 8,
		amount_random = 0,
	},
}
local bikers_amount_clubhouse_2 = bikers_amount_clubhouse_1
local bikers_amount_clubhouse_3 = bikers_amount_clubhouse_1
local bikers_amount_clubhouse_4 = bikers_amount_clubhouse_1
local bikers_amount_outside = {
	values = {
		amount = overkill and 7 or 5,
		amount_random = 0,
	},
}
local bikers_amount_outside_more = bikers_amount_outside
local filters_disable = {
	values = ASS.utils.set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}

-- WAITER !  WAITER !  MORE BIKERS PLEASE !
return {
	[102549] = {
		modify_list_value = {
			elements = {
				[100826] = true,
				[103257] = true,
				[103260] = true,
			},
		},
	},
	[102299] = filters_normal_above,  -- heli filters
	[102110] = filters_disable,
	[102513] = filters_disable,
	[102514] = filters_disable,
	[101176] = filters_normal_above,  -- van filters
	[103251] = filters_disable,
	[103252] = filters_disable,
	[100077] = bikers_amount_clubhouse_1,  -- random biker clubhouse 001
	[101417] = bikers_amount_clubhouse_2,  -- random biker clubhouse 002
	[101474] = bikers_amount_clubhouse_3,  -- random biker clubhouse 003
	[101481] = bikers_amount_clubhouse_4,  -- random biker clubhouse 004
	[100082] = bikers_amount_clubhouse,  -- random biker clubhouse
	[102475] = bikers_amount_outside,  -- random biker outside
	[102492] = bikers_amount_outside_more,  -- random biker outside more
	[100056] = {  -- random biker garage
		values = {
			amount = overkill and 6 or 4,
			amount_random = 0,
		},
	},
	[100540] = {  -- random biker workshop
		values = {
			amount = overkill and 5 or 3,
			amount_random = 0,
		},
	},
	[100385] = {  -- spawn bikers reinforcements
		values = {
			amount = overkill and 10 or 7,
			amount_random = 0,
		},
	},
	[100920] = { enemy = lucky_punk, },  -- "biker beat up"
	[100024] = { enemy = biker_bartenders, },  -- "bartender"
	[100026] = { enemy = bikers_any, },
	[100027] = { enemy = bikers_any, },
	[100028] = { enemy = bikers_any, },
	[100052] = { enemy = bikers_any, },
	[100053] = { enemy = bikers_any, },
	[100073] = { enemy = bikers_any, },
	[100074] = { enemy = bikers_any, },
	[100438] = { enemy = bikers_any, },
	[101419] = { enemy = bikers_any, },
	[100526] = { enemy = bikers_any, },
	[100527] = { enemy = bikers_any, },
	[102423] = { enemy = bikers_any, },
	[102432] = { enemy = bikers_any, },
	[102448] = { enemy = bikers_any, },
	[102451] = { enemy = bikers_any, },
	[102453] = { enemy = bikers_any, },
	[100081] = { enemy = bikers_any, },
	[102485] = { enemy = bikers_any, },
	[101851] = { enemy = bikers_any, },
	[101854] = { enemy = bikers_any, },
	[101856] = { enemy = bikers_any, },
	[101857] = { enemy = bikers_any, },
	[101420] = { enemy = bikers_any, },
	[101421] = { enemy = bikers_any, },
	[100394] = { enemy = bikers_any, },
	[100413] = { enemy = bikers_any, },
	[101099] = { enemy = bikers_any, },
	[101117] = { enemy = bikers_any, },
	[100254] = { enemy = bikers_any, },
	[100295] = { enemy = bikers_any, },
	[100301] = { enemy = bikers_any, },
	[100302] = { enemy = bikers_any, },
	[100303] = { enemy = bikers_any, },
	[100357] = { enemy = bikers_any, },
	[100372] = { enemy = bikers_any, },
	[100373] = { enemy = bikers_any, },
	[100374] = { enemy = bikers_any, },
	[100384] = { enemy = bikers_any, },
	[100149] = { enemy = bikers_any, },
	[100524] = { enemy = bikers_any, },
	[100525] = { enemy = bikers_any, },
	[100151] = { enemy = bikers_any, },
	[100153] = { enemy = bikers_any, },
	[van_swat_ids()] = { enemy = van_swats(), },  -- van swats
	[van_swat_ids()] = { enemy = van_swats(), },
	[van_swat_ids()] = { enemy = van_swats(), },
	[heli_swat_ids()] = { enemy = heli_swats(), },  -- heli spawns
	[heli_swat_ids()] = { enemy = heli_swats(), },
	[heli_swat_ids()] = { enemy = heli_swats(), },
	[heli_swat_ids()] = { enemy = heli_swats(), },
	[civs_female_ids()] = { enemy = civs_female(), },  -- civs
	[civs_female_ids()] = { enemy = civs_female(), },
	[civs_female_ids()] = { enemy = civs_female(), },
	[civs_female_ids()] = { enemy = civs_female(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
	[civs_male_ids()] = { enemy = civs_male(), },
}
