local normal, hard, overkill = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local get_table_index_func = ASS:require("get_table_index_func", true)
local i = 0
local replace_target = normal and 4 or hard and 3 or 2
local vault_dozer_ids = get_table_index_func({ 104169, 104170, 100763, 104131, 104132, })
local function vault_dozers()
	i = i + 1

	return { enemy = tweak_data.levels:moon_random_unit(i <= replace_target and "specials_agg" or "dozers_no_med"), }
end
local guards_downstairs_amounts = normal and 2 or hard and 4 or 6
local guards_stationary_amounts = normal and 1 or hard and 2 or 3
local guards_upstairs_amounts = normal and 1 or hard and 2 or 3
local guards_vault_amounts = normal and 2 or hard and 4 or 6  -- just in case it wasnt clear this is a loud-focused mod :3
local civs_male_ids = get_table_index_func({ 103592, 103594, 102144, 102147, 102159, 102158, 103707, 103703, })
local oops_all_bo = math.random() < 0.01 and Idstring("units/payday2/characters/civ_male_bank_manager_5/civ_male_bank_manager_5") or nil
local bo_replacement = oops_all_bo and { enemy = Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1"), } or nil
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", nil, oops_all_bo, oops_all_bo or {
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_5/civ_male_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_casual_7/civ_male_casual_7"),
})
local clients_female = oops_all_bo or {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"),
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_1/civ_female_casino_1"),
}
local staff_male = oops_all_bo or {
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
	Idstring("units/payday2/characters/civ_male_bank_1/civ_male_bank_1"),
	Idstring("units/payday2/characters/civ_male_bank_2/civ_male_bank_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
}
local staff_female = oops_all_bo or {
	Idstring("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"),
	Idstring("units/payday2/characters/civ_female_bank_manager_1/civ_female_bank_manager_1"),
	Idstring("units/pd2_dlc_cage/characters/civ_female_bank_2/civ_female_bank_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_2/civ_female_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_female_casino_3/civ_female_casino_3"),
}

return {
	-- guard amounts
	[102024] = { group_amount = guards_downstairs_amounts, },
	[102047] = { group_amount = guards_downstairs_amounts, },
	[102138] = { group_amount = guards_downstairs_amounts, },
	[105382] = { group_amount = guards_stationary_amounts, },
	[105490] = { group_amount = guards_stationary_amounts, },
	[105491] = { group_amount = guards_stationary_amounts, },
	[100129] = { group_amount = guards_upstairs_amounts, },
	[102139] = { group_amount = guards_upstairs_amounts, },
	[102141] = { group_amount = guards_upstairs_amounts, },
	[102900] = { group_amount = guards_vault_amounts, },
	[102882] = { group_amount = guards_vault_amounts, },
	[102887] = { group_amount = guards_vault_amounts, },
	-- cams
	[100448] = {  -- no titan
		values = {
			enabled = false,
		},
	},
	[100855] = {  -- amount, "up right"
		values = {
			amount = normal and 1 or hard and 2 or 4,
		},
	},
	[100081] = {  -- "office left"
		values = {
			amount = normal and 1 or hard and 2 or 4,
		},
	},
	[100082] = {  -- "lobby"
		values = {
			amount = normal and 3 or hard and 5 or 7,
		},
	},
	[100083] = {  -- "vault right"
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[100841] = {  -- "Bo's office001"
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[100847] = {  -- "server room right"
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[100937] = {  -- "vault left"
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101151] = {  -- "pre vault left"
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[101196] = {  -- "after pillar"
		values = {
			amount = normal and 1 or hard and 3 or 5,
		},
	},
	[105663] = {  -- "server room left"
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[103996] = {  -- cloaker ambush on entering the vault area in loud
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101188] = {  -- logic toggle 91, should enable cloaker surprise from alternate vault area entrance
		values = {
			toggle = "on",
		},
	},
	[101561] = {  -- area trigger for cloaker surprise, play teammate comment if activated
		on_executed = {
			{ id = 106647, delay = 0, }
		},
	},
	-- post-vault
	[100569] = {  -- random specials
		values = {
			amount = normal and 2 or hard and 4 or 6,
			amount_random = normal and 4 or hard and 2 or 0,
		},
	},
	[105114] = { group_amount = overkill and 6 or 3, },  -- random swats
	-- vault dozer stuff
	[103998] = {
		values = set_difficulty_groups("disable"),
	},
	[103377] = {
		values = set_difficulty_groups("disable"),
	},
	[104041] = {
		values = set_difficulty_groups("disable"),
	},
	[100114] = {
		values = set_difficulty_groups("normal_above"),
	},
	[100225] = {
		values = {
			amount = 5,
		},
	},
	[102271] = {
		on_executed = {
			{ id = 102974, delay = 0, },
		},
	},
	[100811] = {
		values = set_difficulty_groups("disable"),
	},
	[100875] = {
		on_executed = {
			{ id = 101616, delay = 0, },
		},
	},
	[102783] = {
		on_executed = {
			{ id = 102802, delay = 0, },
		},
	},
	[102802] = {
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._values.on_executed = {
					{ id = normal and 102276 or hard and 102271 or 102279, delay = 0, },
				}
			end
		end,
	},
	[103333] = {
		on_executed = {
			{ id = 102691, delay = 0, },
		},
	},
	[102691] = {
		pre_func = function(self)
			if not self._values.on_executed_original then
				self._values.on_executed_original = self._values.on_executed
				self._values.on_executed = {
					{ id = normal and 102245 or hard and 100875 or 102270, delay = 0, },
				}
			end
		end,
	},
	-- dozers
	[vault_dozer_ids()] = vault_dozers(),  -- vault (geez, who knew)
	[vault_dozer_ids()] = vault_dozers(),
	[vault_dozer_ids()] = vault_dozers(),
	[vault_dozer_ids()] = vault_dozers(),
	[vault_dozer_ids()] = vault_dozers(),
	[103603] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },  -- escape, office
	[103390] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103231] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },  -- basement
	[103198] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103163] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103162] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	-- after vault
	[104319] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- heavies
	[104330] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100570] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103704] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[105108] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[105110] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[104317] = { enemy = tweak_data.levels:moon_random_unit("specials_any"), },  -- tasers
	[104318] = { enemy = tweak_data.levels:moon_random_unit("specials_any"), },
	-- vault area guards
	[102286] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },  -- security
	[102288] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102289] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102291] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102299] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102810] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102837] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102881] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[104001] = { enemy = tweak_data.levels:moon_random_unit("cops"), },  -- cop inside vault
	-- office
	[106586] = { enemy = tweak_data.levels:moon_random_unit("cops_heavy"), },  -- cops
	[106586] = { enemy = tweak_data.levels:moon_random_unit("cops_heavy"), },
	[100686] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },  -- fbis
	[100687] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },
	[103609] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },
	-- patrolling guards outside vault
	[100863] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100753] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102045] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102054] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100743] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102053] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100672] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102058] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100628] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	-- stationary guards
	[100614] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100646] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100661] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100663] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100787] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100671] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100920] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100872] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102059] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102046] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100752] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100694] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[105493] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[105494] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[105383] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	-- management office window scripteed spawns
	[102501] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },  -- left
	[102974] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	[100618] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	[100621] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	[101705] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },  -- right
	[100616] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	[100617] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	[100620] = { enemy = tweak_data.levels:moon_random_unit("specials_agg"), },
	-- one-time cops, outside
	[103536] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103670] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106853] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106854] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106857] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106865] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106877] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106878] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106879] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106880] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	-- civilians
	[100642] = bo_replacement,  -- bo
	[102313] = bo_replacement,
	[104286] = bo_replacement,
	[103918] = bo_replacement,
	[102504] = bo_replacement,
	[101333] = bo_replacement,
	[101517] = bo_replacement,
	[103585] = bo_replacement,
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- outside, 103592
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- 103594
	[102157] = { enemy = clients_female, },
	[103593] = { enemy = clients_female, },
	[103584] = { enemy = staff_male, },  -- lobby
	[100643] = { enemy = staff_male, },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- 102144
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- 102147
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- 102159
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- 102158
	[100381] = { enemy = staff_female, },
	[100644] = { enemy = staff_female, },
	[102146] = { enemy = staff_female, },
	[102156] = { enemy = clients_female, },
	[102586] = { enemy = clients_female, },
	[102085] = { enemy = staff_male, },  -- lower right canteen
	[100417] = { enemy = staff_male, },
	[100415] = { enemy = staff_male, },
	[100418] = { enemy = staff_male, },
	[100414] = { enemy = staff_female, },
	[100416] = { enemy = staff_female, },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- lower left office, 103707
	[100388] = { enemy = staff_male, },
	[100389] = { enemy = staff_male, },
	[103708] = { enemy = staff_female, },
	[100398] = { enemy = staff_female, },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- upstairs, 103703
	[103711] = { enemy = staff_male, },
	[103712] = { enemy = staff_male, },
	[100423] = { enemy = staff_male, },
	[100422] = { enemy = staff_male, },
	[104068] = { enemy = staff_female, },
	[103701] = { enemy = staff_female, },
	[103702] = { enemy = staff_female, },
	[102989] = { enemy = staff_male, },  -- vault area
	[102587] = { enemy = staff_male, },
	[103869] = { enemy = staff_male, },
	[103865] = { enemy = staff_male, },
	[102988] = { enemy = staff_female, },
	[102262] = { enemy = staff_female, },
}
