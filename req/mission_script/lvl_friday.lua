-- crashing capitol, version 1.0.2.3, https://modworkshop.net/mod/44630
local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local event_copdude_ids = ASS.utils.gen_remove_random_value({ 302014, 302015, 302016, })
local event_copdude = ASS.utils.gen_remove_random_value(clone(tweak_data.moon.units.cops))
local event_copdudes_chance = {
	values = {
		chance = normal and 10 or hard and 30 or 70,
	}
}

local casual_male = {
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_5/civ_male_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
}
local casual_female = {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
}
local casual_any = table.list_add(casual_male, casual_female)
local casual_male_ids = ASS.utils.gen_remove_random_value({
	302362,
	302365,
	302866,
	302873,
	302874,
	301374,
	300126,
	301418,
	301419,
	300130,
	300154,
	300030,
	300035,
	300036,
	300037,
	300038,
	300039,
	300040,
	300041,
	300044,
	300045,
	300046,
	300047,
	300048,
	300049,
	300050,
	300051,
	300052,
	300053,
	300054,
	300057,
	300058,
	300059,
	300060,
})
casual_male = ASS.utils.try_pick_bobblehead_bob(nil, casual_male)

local staff_female = {
	Idstring("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"),
	Idstring("units/payday2/characters/civ_female_bank_manager_1/civ_female_bank_manager_1"),
}
local staff_male = {
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
}
local pear_staff_ids = ASS.utils.gen_remove_random_value({ 301344, 301345, })
local pear_staff = ASS.utils.gen_remove_random_value(clone(staff_male))
local bank_female = staff_female
local bank_male = {
	Idstring("units/payday2/characters/civ_male_bank_1/civ_male_bank_1"),
	Idstring("units/payday2/characters/civ_male_bank_2/civ_male_bank_2"),
}
local securitys = {
	Idstring("units/pd2_mod_friday/characters/ene_security_fri_1/ene_security_fri_1"),
	Idstring("units/pd2_mod_friday/characters/ene_security_fri_2/ene_security_fri_2"),
	Idstring("units/pd2_mod_friday/characters/ene_security_fri_3/ene_security_fri_3"),
	Idstring("units/pd2_mod_friday/characters/ene_security_fri_4/ene_security_fri_4"),
	Idstring("units/pd2_mod_friday/characters/ene_security_fri_5/ene_security_fri_5"),
}

local reenforce_points_inside_amount = {  -- randomly chosen reenforce points
	values = {
		amount = normal and 2 or hard and 3 or 4,
	}
}
local disable = {
	values = {
		enabled = false,
	},
}
local no_participate_to_group_ai = {
	values = {
		participate_to_group_ai = false,
	},
}
local sniper_so = {  -- snipers randomly get stuck and dont end up in position
	pre_func = function(self)
		local values = self._values

		if not values.use_instigator then
			values.use_instigator = true
			values.rotation = mrotation.yaw(Rotation(90, 0, 0))
			values.pose = table.get_vector_index(self._POSES, "stand")
			values.path_haste = nil
			values.ai_group = nil
			values.interval = nil
			values.search_distance = nil
			values.search_position = nil
		end
	end,
}

return {
	[303044] = disable,  -- "force winters new", not hooked up to anything but eh
	[300448] = disable,  -- garbage diff elements that also dont execute anything
	[300449] = disable,
	[300466] = disable,
	[300467] = disable,
	[300777] = disable,
	[300778] = disable,
	[300779] = disable,
	[300780] = disable,
	[300781] = disable,
	[302399] = {  -- diff element normally reducing diff to 0.3 after each assault ends, this is a bit low for sh gradual diff increase
		values = {
			difficulty = 0.5,
		},
	},
	[302673] = {  -- random ambush event
		values = {
			amount = normal and 3 or hard and 4 or 5,
		},
	},
	[301716] = reenforce_points_inside_amount,
	[301717] = reenforce_points_inside_amount,
	[301718] = reenforce_points_inside_amount,
	[300963] = disable,  -- garbage reenforce points (placed outside the map, same as mallcrasher has)
	[300962] = disable,
	[300959] = disable,
	[300960] = disable,
	[300961] = disable,
	[300422] = sniper_so,  -- rooftop across from vault
	[300451] = sniper_so,
	[300454] = sniper_so,
	[300455] = sniper_so,
	[300456] = sniper_so,
	[300457] = sniper_so,
	[300458] = sniper_so,
	[300459] = sniper_so,
	[302017] = sniper_so,  -- escape
	[302577] = sniper_so,
	[300277] = sniper_so,
	[302632] = sniper_so,
	[301991] = event_copdudes_chance,  -- cops that can spawn at the start
	[301992] = event_copdudes_chance,
	[302000] = event_copdudes_chance,
	[302001] = event_copdudes_chance,
	[301988] = {  -- delay needed to prevent alert on start
		values = {
			base_delay = 0.5,
			enabled = true,
		},
	},
	[300377] = no_participate_to_group_ai,
	[300378] = no_participate_to_group_ai,
	[300379] = no_participate_to_group_ai,
	[300380] = no_participate_to_group_ai,
	[300381] = no_participate_to_group_ai,
	[300382] = no_participate_to_group_ai,
	[300383] = no_participate_to_group_ai,
	[300384] = no_participate_to_group_ai,
	[event_copdude_ids()] = { enemy = event_copdude(), },
	[event_copdude_ids()] = { enemy = event_copdude(), },
	[event_copdude_ids()] = { enemy = event_copdude(), },
	[301899] = { enemy = securitys, },  -- "guard_X_00Y"
	[301900] = { enemy = securitys, },
	[301901] = { enemy = securitys, },
	[301902] = { enemy = securitys, },
	[301903] = { enemy = securitys, },
	[301904] = { enemy = securitys, },
	[302462] = { enemy = securitys, },  -- "guard fall down"
	[302463] = { enemy = securitys, },
	[302415] = { enemy = securitys, },  -- "bnk ambush guard"
	[302416] = { enemy = securitys, },
	[302417] = { enemy = securitys, },
	[302418] = { enemy = securitys, },
	[302419] = { enemy = securitys, },
	[300511] = { enemy = securitys, },  -- "bnk guard"
	[300515] = { enemy = securitys, },
	[300521] = { enemy = securitys, },
	[300522] = { enemy = securitys, },
	[300523] = { enemy = securitys, },
	[300524] = { enemy = securitys, },
	[300520] = { enemy = securitys, },  -- "bnk guard lobby"
	[300512] = { enemy = securitys, },  -- "office guard"
	[300513] = { enemy = securitys, },
	[300514] = { enemy = securitys, },
	[300469] = { enemy = securitys, },  -- "security fucker"
	[302428] = { enemy = securitys, },
	[302420] = { enemy = securitys, },  -- "lazy dumbfuck"
	[302867] = { enemy = bank_male, },  -- bank staff
	[302868] = { enemy = bank_male, },
	[302872] = { enemy = bank_male, },
	[302363] = { enemy = bank_male, },
	[302869] = { enemy = bank_female, },
	[302870] = { enemy = bank_female, },
	[302364] = { enemy = bank_female, },
	[300450] = { enemy = staff_female, },  -- store staff
	[300802] = { enemy = staff_female, },
	[301384] = { enemy = staff_female, },
	[300221] = { enemy = staff_female, },
	[301479] = { enemy = staff_female, },
	[301565] = { enemy = staff_female, },
	[pear_staff_ids()] = { enemy = pear_staff(), },
	[pear_staff_ids()] = { enemy = pear_staff(), },
	[300690] = { enemy = staff_male, },
	[300453] = { enemy = staff_male, },
	[301428] = { enemy = staff_male, },
	[301637] = { enemy = casual_any, },  -- walkers
	[302274] = { enemy = casual_any, },
	[302282] = { enemy = casual_any, },
	[302395] = { enemy = casual_any, },
	[302397] = { enemy = casual_any, },
	[300120] = { enemy = casual_female, },  -- civs in mall
	[300127] = { enemy = casual_female, },
	[301417] = { enemy = casual_female, },
	[301427] = { enemy = casual_female, },
	[300061] = { enemy = casual_female, },
	[300062] = { enemy = casual_female, },
	[300063] = { enemy = casual_female, },
	[300064] = { enemy = casual_female, },
	[300066] = { enemy = casual_female, },
	[300067] = { enemy = casual_female, },
	[300068] = { enemy = casual_female, },
	[300069] = { enemy = casual_female, },
	[300070] = { enemy = casual_female, },
	[300071] = { enemy = casual_female, },
	[300072] = { enemy = casual_female, },
	[300074] = { enemy = casual_female, },
	[300075] = { enemy = casual_female, },
	[300076] = { enemy = casual_female, },
	[300077] = { enemy = casual_female, },
	[300078] = { enemy = casual_female, },
	[300080] = { enemy = casual_female, },
	[300081] = { enemy = casual_female, },
	[300082] = { enemy = casual_female, },
	[300083] = { enemy = casual_female, },
	[300084] = { enemy = casual_female, },
	[300085] = { enemy = casual_female, },
	[300086] = { enemy = casual_female, },
	[300087] = { enemy = casual_female, },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
	[casual_male_ids()] = { enemy = casual_male(), },
}
