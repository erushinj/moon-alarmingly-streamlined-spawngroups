local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local get_table_index_func = ASS:require("get_table_index_func", true)
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", true)
local vault_dozer_ids = get_table_index_func({ 104169, 104170, 100763, 104131, 104132, })
local vault_dozers = scripted_swat_squads({
	hard_target = normal and 1 or hard and 2 or 3,
	hard_spawn = "dozers_any",
	normal_spawn = "specials_agg",
})
local filters_disable = {
	values = set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = set_difficulty_groups("normal_above"),
}
local guards_downstairs_amounts = {
	values = {
		amount = normal and 2 or hard and 4 or 6,
	},
}
local guards_vault_amounts = guards_downstairs_amounts  -- just in case it wasnt clear this is a loud-focused mod :3
local guards_stationary_amounts = {
	values = {
		amount = normal and 1 or hard and 2 or 3,
	},
}
local guards_upstairs_amounts = guards_stationary_amounts
local civs_male_ids = get_table_index_func({ 103592, 103594, 102144, 102147, 102159, 102158, 103707, 103703, })
local oops_all_bo = math.random() < 0.01 and Idstring("units/payday2/characters/civ_male_bank_manager_5/civ_male_bank_manager_5") or nil
local bo_replacement = oops_all_bo and { enemy = Idstring("units/payday2/characters/civ_male_casual_1/civ_male_casual_1"), } or nil
local civs_male = try_pick_bobblehead_bob(oops_all_bo, oops_all_bo or {
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

if oops_all_bo then
	tweak_data.character:moon_oops_all_bo(true)
end

local dozers_no_med = tweak_data.levels:moon_units("dozers_no_med")
local heavys = tweak_data.levels:moon_units("heavys")
local specials_any = tweak_data.levels:moon_units("specials_any")
local securitys_heavy = tweak_data.levels:moon_units("securitys_heavy")
local cops = tweak_data.levels:moon_units("cops")
local cops_heavy = tweak_data.levels:moon_units("cops_heavy")
local fbis_heavy = tweak_data.levels:moon_units("fbis_heavy")
local securitys = tweak_data.levels:moon_units("securitys")
local specials_agg = tweak_data.levels:moon_units("specials_agg")

return {
	[102024] = guards_downstairs_amounts,  -- guard amounts
	[102047] = guards_downstairs_amounts,
	[102138] = guards_downstairs_amounts,
	[105382] = guards_stationary_amounts,
	[105490] = guards_stationary_amounts,
	[105491] = guards_stationary_amounts,
	[100129] = guards_upstairs_amounts,
	[102139] = guards_upstairs_amounts,
	[102141] = guards_upstairs_amounts,
	[102900] = guards_vault_amounts,
	[102882] = guards_vault_amounts,
	[102887] = guards_vault_amounts,
	[100448] = {  -- cams, no titan
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
	[105114] = {  -- random swats
		values = {
			amount = overkill and 6 or 3,
		},
	},
	[103998] = filters_disable,  -- vault dozer stuff
	[103377] = filters_disable,
	[104041] = filters_disable,
	[100114] = filters_normal_above,
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
	[100811] = filters_disable,
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
	[103603] = { enemy = dozers_no_med, },  -- escape, office
	[103390] = { enemy = dozers_no_med, },
	[103231] = { enemy = dozers_no_med, },  -- basement
	[103198] = { enemy = dozers_no_med, },
	[103163] = { enemy = dozers_no_med, },
	[103162] = { enemy = dozers_no_med, },
	-- after vault
	[104319] = { enemy = heavys, },  -- heavies
	[104330] = { enemy = heavys, },
	[100570] = { enemy = heavys, },
	[103704] = { enemy = heavys, },
	[105108] = { enemy = heavys, },
	[105110] = { enemy = heavys, },
	[104317] = { enemy = specials_any, },  -- tasers
	[104318] = { enemy = specials_any, },
	-- vault area guards
	[102286] = { enemy = securitys_heavy, },  -- security
	[102288] = { enemy = securitys_heavy, },
	[102289] = { enemy = securitys_heavy, },
	[102291] = { enemy = securitys_heavy, },
	[102299] = { enemy = securitys_heavy, },
	[102810] = { enemy = securitys_heavy, },
	[102837] = { enemy = securitys_heavy, },
	[102881] = { enemy = securitys_heavy, },
	[104001] = { enemy = cops, },  -- cop inside vault
	-- office
	[106586] = { enemy = cops_heavy, },  -- cops
	[106586] = { enemy = cops_heavy, },
	[100686] = { enemy = fbis_heavy, },  -- fbis
	[100687] = { enemy = fbis_heavy, },
	[103609] = { enemy = fbis_heavy, },
	-- patrolling guards outside vault
	[100863] = { enemy = securitys, },
	[100753] = { enemy = securitys, },
	[102045] = { enemy = securitys, },
	[102054] = { enemy = securitys, },
	[100743] = { enemy = securitys, },
	[102053] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[102058] = { enemy = securitys, },
	[100628] = { enemy = securitys, },
	-- stationary guards
	[100614] = { enemy = securitys, },
	[100646] = { enemy = securitys, },
	[100661] = { enemy = securitys, },
	[100663] = { enemy = securitys, },
	[100787] = { enemy = securitys, },
	[100671] = { enemy = securitys, },
	[100920] = { enemy = securitys, },
	[100872] = { enemy = securitys, },
	[102059] = { enemy = securitys, },
	[102046] = { enemy = securitys, },
	[100752] = { enemy = securitys, },
	[100694] = { enemy = securitys, },
	[105493] = { enemy = securitys, },
	[105494] = { enemy = securitys, },
	[105383] = { enemy = securitys, },
	-- management office window scripteed spawns
	[102501] = { enemy = specials_agg, },  -- left
	[102974] = { enemy = specials_agg, },
	[100618] = { enemy = specials_agg, },
	[100621] = { enemy = specials_agg, },
	[101705] = { enemy = specials_agg, },  -- right
	[100616] = { enemy = specials_agg, },
	[100617] = { enemy = specials_agg, },
	[100620] = { enemy = specials_agg, },
	-- one-time cops, outside
	[103536] = { enemy = cops, },
	[103670] = { enemy = cops, },
	[106853] = { enemy = cops, },
	[106854] = { enemy = cops, },
	[106857] = { enemy = cops, },
	[106865] = { enemy = cops, },
	[106877] = { enemy = cops, },
	[106878] = { enemy = cops, },
	[106879] = { enemy = cops, },
	[106880] = { enemy = cops, },
	-- civilians
	[100642] = bo_replacement,  -- bo
	[102313] = bo_replacement,
	[104286] = bo_replacement,
	[103918] = bo_replacement,
	[102504] = bo_replacement,
	[101333] = bo_replacement,
	[101517] = bo_replacement,
	[103585] = bo_replacement,
	[civs_male_ids()] = { enemy = civs_male(), },  -- outside, 103592
	[civs_male_ids()] = { enemy = civs_male(), },  -- 103594
	[102157] = { enemy = clients_female, },
	[103593] = { enemy = clients_female, },
	[103584] = { enemy = staff_male, },  -- lobby
	[100643] = { enemy = staff_male, },
	[civs_male_ids()] = { enemy = civs_male(), },  -- 102144
	[civs_male_ids()] = { enemy = civs_male(), },  -- 102147
	[civs_male_ids()] = { enemy = civs_male(), },  -- 102159
	[civs_male_ids()] = { enemy = civs_male(), },  -- 102158
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
	[civs_male_ids()] = { enemy = civs_male(), },  -- lower left office, 103707
	[100388] = { enemy = staff_male, },
	[100389] = { enemy = staff_male, },
	[103708] = { enemy = staff_female, },
	[100398] = { enemy = staff_female, },
	[civs_male_ids()] = { enemy = civs_male(), },  -- upstairs, 103703
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
