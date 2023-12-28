local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local switch_dog_abusers = math.random() < 0.5
local male_casual = {
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_trucker_1/civ_male_trucker_1"),
}
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
local all_business = table.list_add(male_business, {
	Idstring("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"),
})

return {
	[103072] = {  -- logic chance operator
		values = {
			chance = normal and 40 or hard and 60 or 80,
		},
	},
	[105563] = {  -- player filters
		values = {
			player_1 = true,
		},
	},
	[105574] = {
		values = {
			player_1 = true,
		},
	},
	[105588] = {
		values = {
			player_1 = true,
		},
	},
	[105571] = {  -- cloaker spawns
		values = {
			enabled = true,
		},
	},
	[105584] = {
		values = {
			enabled = true,
		},
	},
	[105607] = {
		values = {
			enabled = true,
		},
	},
	[103879] = overkill and {  -- amount per time cop cars pull in (vanilla is 1)
		values = {
			amount = 2,
		},
	} or nil,
	-- gas heli now loops like tweaked undercover
	[105496] = {  -- ovk and below heli chance (vanilla is 50)
		chance = 100,
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
	-- cams
	[104328] = {  -- no titan
		values = {
			enabled = false,
		},
	},
	[101318] = {  -- amount
		values = {
			amount = normal and 4 or hard and 6 or 8,
		},
	},
	-- snipers amount
	[101200] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	-- chance of no safe in manager's office (vanilla is 75)
	[102194] = {
		chance = normal and 5 or hard and 15 or 25,
	},
	-- forced skylights, "overkill" difficulty group only
	[101930] = {
		values = set_difficulty_groups("overkill"),
	},
	[101934] = {
		values = set_difficulty_groups("hard_below"),
	},
	[104324] = {  -- but raise the chance on ovk/mh
		chance = normal and 20 or hard and 60 or 100,
	},
	-- tear gas (3 locations always active, theres 3 more but only 1 of those is active based on escape location)
	[102195] = {
		values = {
			amount = overkill and 4 or 2,
		}
	},
	[101355] = {
		values = {
			amount = overkill and 4 or 2,
		}
	},
	-- reenforce
	[100369] = {  -- street
		values = {
			amount = 3,
		},
	},
	[102091] = {
		values = {
			amount = 3,
		},
	},
	[100370] = {
		values = {
			amount = 3,
		},
	},
	[101125] = {  -- on the lance. kindly fuck off.
		values = {
			enabled = false,
		},
	},
	[101126] = {
		values = {
			enabled = false,
		},
	},
	[105331] = {  -- by the furthest escape. no other escape has reenforce, and sh already adds reenforce to escapes automatically.
		values = {
			enabled = false,
		},
	},
	-- security guards
	[100294] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100296] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100297] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101063] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[101219] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },  -- surv guys
	[105100] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	-- ambush dozers
	[105280] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[102283] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[105606] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	-- chopper spawns
	[101432] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },  -- swats
	[105621] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	[101433] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },  -- heavies
	[105620] = { enemy = tweak_data.levels:moon_random_unit("specials_no_shield"), },
	[101785] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },  -- dozers
	[101786] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },
	-- civs
	[105663] = switch_dog_abusers and { enemy = Idstring("units/payday2/characters/civ_male_dog_abuser_2/civ_male_dog_abuser_2"), } or nil,  -- john wick civs
	[105664] = switch_dog_abusers and { enemy = Idstring("units/payday2/characters/civ_male_dog_abuser_1/civ_male_dog_abuser_1"), } or nil,
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
	[103565] = { enemy = male_casual, },  -- "X" male civ 2
	[100706] = { enemy = male_casual, },  -- "X" male civ
	[100710] = { enemy = male_casual, },  -- upset male civs
	[101667] = { enemy = male_casual, },
	[103522] = { enemy = Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1"), },  -- talking male civ
	[100696] = { enemy = male_casual, },
	[100709] = { enemy = male_casual, },
	[100711] = { enemy = male_casual, },
	[100712] = { enemy = male_casual, },
	[100713] = { enemy = female_casual, },  -- "X" female civ
	[101662] = { enemy = female_casual, },  -- "Y" female civ
	[100707] = { enemy = female_casual, },  -- sitting female civ
	[103580] = { enemy = female_casual, },
	[100708] = { enemy = female_casual, },  -- standing
	[103502] = { enemy = female_casual, },
	[100702] = { enemy = male_casual, },  -- employee unit, yet, this seems like a guy waiting on an employee ?
	[100695] = { enemy = male_business, },  -- employees
	[100698] = { enemy = male_business, },
	[100705] = { enemy = male_business, },
	[100701] = { enemy = male_business, },
	-- [100697] = { enemy = all_business, },
	-- [100703] = { enemy = all_business, },
}
