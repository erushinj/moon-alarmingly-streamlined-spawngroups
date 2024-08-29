local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_disable = {
	values = ASS.utils.set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}
local dog_abuser_ids = ASS.utils.gen_remove_random_value({ 105663, 105664, })
local male_casual_ids = ASS.utils.gen_remove_random_value({
	103565,
	100706,
	100710,
	101667,
	103522,
	100696,
	100709,
	100711,
	100712,
	100702
})
local male_casual = {
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_trucker_1/civ_male_trucker_1"),
}
local get_male_casual = ASS.utils.try_pick_bobblehead_bob(nil, male_casual)
local male_business = {
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_bank_2/civ_male_bank_2"),
}
local female_casual = {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"),
}
local all_casual = table.list_add(male_casual, female_casual)
local player_filters = {
	values = {
		player_1 = true,
	},
}
local enable = {
	values = {
		enabled = true,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}
local teargas = {
	values = {
		amount = overkill and 4 or 2,
	},
}
local street_reenforce = {
	values = {
		amount = 3,
	},
}
local securitys = tweak_data.moon.units.securitys
local dozers_no_med = tweak_data.moon.units.dozers_no_med
local specials_no_shield = tweak_data.moon.units.specials_no_shield
local dozers_any = tweak_data.moon.units.dozers_any

return {
	[103072] = {  -- ambush stuff, chance
		values = {
			chance = normal and 40 or hard and 60 or 80,
		},
	},
	[105563] = player_filters,  -- player filters
	[105574] = player_filters,
	[105588] = player_filters,
	[105571] = enable,  -- cloaker spawns
	[105584] = enable,
	[105607] = enable,
	[103879] = {  -- amount per time cop cars pull in (vanilla is 1)
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[105496] = {  -- gas heli now loops like tweaked undercover, ovk and below chance to have the heli active at all (vanilla is 50)
		values = {
			chance = 100,
		},
	},
	[102299] = {  -- chance added whenever the heli roll fails
		values = {
			chance = normal and 10 or hard and 15 or 30,
		},
	},
	[100631] = {
		on_executed = {
			{ id = 101747, delay = 180, delay_rand = overkill and 120 or 240, },
		},
		func = function(self)
			self:chance_operation_reset()
		end,
	},
	[101424] = {
		values = {
			trigger_times = 0,
		},
	},
	[102297] = {  -- disable gas SO after deployment
		func = function(self)
			local element = self:get_mission_element(102296)

			if element then
				element:set_enabled(false)
			end
		end,
	},
	[101200] = {  -- snipers amount
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102194] = {  -- chance of no safe in manager's office (vanilla is 75)
		values = {
			chance = normal and 5 or hard and 15 or 25,
		},
	},
	[101930] = filters_disable,  -- forced skylights, make it always a chance
	[101934] = filters_normal_above,
	[104324] = {  -- but raise the chances overall
		values = {
			chance = overkill and 90 or 45,
		},
	},
	[102195] = teargas,  -- tear gas (3 locations always active, theres 3 more but only 1 of those is active based on escape location)
	[101355] = teargas,
	[100369] = street_reenforce,  -- reenforce, street
	[102091] = street_reenforce,
	[100370] = street_reenforce,
	[101125] = disable,  -- on the lance. kindly fuck off.
	[101126] = disable,
	[105331] = disable,  -- by the furthest escape. no other escape has reenforce, and sh already adds reenforce to escapes automatically.
	[100294] = { enemy = securitys, },  -- security guards
	[100296] = { enemy = securitys, },
	[100297] = { enemy = securitys, },
	[101063] = { enemy = securitys, },
	[101219] = { enemy = tweak_data.moon.units.securitys_heavy, },  -- surv guys
	[105100] = { enemy = tweak_data.moon.units.securitys_heavy, },
	[105280] = { enemy = dozers_no_med, },  -- ambush dozers
	[102283] = { enemy = dozers_no_med, },
	[105606] = { enemy = dozers_no_med, },
	[101432] = { enemy = specials_no_shield, },  -- chopper spawns, swats
	[105621] = { enemy = specials_no_shield, },
	[101433] = { enemy = specials_no_shield, },  -- heavies
	[105620] = { enemy = specials_no_shield, },
	[101785] = { enemy = dozers_any, },  -- dozers
	[101786] = { enemy = dozers_any, },
	[dog_abuser_ids()] = { enemy = Idstring("units/payday2/characters/civ_male_dog_abuser_2/civ_male_dog_abuser_2"), },  -- civs, john wick civs
	[dog_abuser_ids()] = { enemy = Idstring("units/payday2/characters/civ_male_dog_abuser_1/civ_male_dog_abuser_1"), },
	[105339] = { enemy = all_casual, },  -- random outside spawn
	[103492] = { enemy = all_casual, },  -- walkers
	[103493] = { enemy = all_casual, },
	[103495] = { enemy = all_casual, },
	[103511] = { enemy = all_casual, },
	[103513] = { enemy = all_casual, },
	[103514] = { enemy = all_casual, },
	[103841] = { enemy = all_casual, },
	[103842] = { enemy = all_casual, },
	[103843] = { enemy = all_casual, },
	[100401] = { enemy = all_casual, },
	[104695] = { enemy = all_casual, },
	[104696] = { enemy = all_casual, },
	[104697] = { enemy = all_casual, },
	[104698] = { enemy = all_casual, },
	[104260] = { enemy = all_casual, },
	[104265] = { enemy = all_casual, },
	[104269] = { enemy = all_casual, },
	[104271] = { enemy = all_casual, },
	[104272] = { enemy = all_casual, },
	[104274] = { enemy = all_casual, },
	[male_casual_ids()] = { enemy = get_male_casual(), },  -- "X" male civ 2
	[male_casual_ids()] = { enemy = get_male_casual(), },  -- "X" male civ
	[male_casual_ids()] = { enemy = get_male_casual(), },  -- upset male civs
	[male_casual_ids()] = { enemy = get_male_casual(), },
	[male_casual_ids()] = { enemy = get_male_casual(), },  -- talking male civ
	[male_casual_ids()] = { enemy = get_male_casual(), },
	[male_casual_ids()] = { enemy = get_male_casual(), },
	[male_casual_ids()] = { enemy = get_male_casual(), },
	[male_casual_ids()] = { enemy = get_male_casual(), },
	[male_casual_ids()] = { enemy = get_male_casual(), },  -- employee unit, yet, this seems like a guy waiting on an employee ? (100702)
	[100713] = { enemy = female_casual, },  -- "X" female civ
	[101662] = { enemy = female_casual, },  -- "Y" female civ
	[100707] = { enemy = female_casual, },  -- sitting female civ
	[103580] = { enemy = female_casual, },
	[100708] = { enemy = female_casual, },  -- standing
	[103502] = { enemy = female_casual, },
	[100695] = { enemy = male_business, },  -- employees
	[100698] = { enemy = male_business, },
	[100705] = { enemy = male_business, },
	[100701] = { enemy = male_business, },
}
