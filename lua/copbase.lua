if Network:is_client() then
	return
end

local level_id = ASS:get_var("level_id")
local level_mod = ASS:get_var("level_mod")

local panic_room = { "c45", "raging_bull", "mac11", "ak47", "r870", "mossberg", }
local murkywater = { "scar_murky", "spas12", "ump", }
local fbi_ready_team = { "m4", "spas12", }

local weapon_mapping = {
	-- level mod specific overrides
	FBI_office = {
		[("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"):key()] = { "m4", "spas12", },
		[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = "m4",
		[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = "c45",
		[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = "m4",
		[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = "c45",
		[("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = "spas12",
		[("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = "m4",
		[("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = "spas12",
		[("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = "m4",
	},
	FBI_mcmansion = {
		[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "m4",
		[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "spas12",
	},

	-- level id specific overrides
	man = {
		[("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = "m4",
		[("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = "raging_bull",
		[("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = "m4",
		[("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = "raging_bull",
	},
	flat = {
		[("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = panic_room,
		[("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = panic_room,
	},
	moon = {
		[("units/payday2/characters/ene_security_4/ene_security_4"):key()] = "c45",
		[("units/payday2/characters/ene_security_5/ene_security_5"):key()] = "mp5",
		[("units/payday2/characters/ene_security_8/ene_security_8"):key()] = "r870",
	},
	short2_stage1 = {
		[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "c45",  -- loud tutorial cop, old versions reference
	},
	short2_stage2b = {
		[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "c45",  -- loud tutorial cop, old versions reference
	},

	-- appropriate weaponry for unique units
	-- [("units/payday2/characters/npc_old_hoxton_prisonsuit_1/npc_old_hoxton_prisonsuit_1"):key()] = "x_c45",  -- npc hox (no mask, looks funny)
	[("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "spas12",  -- npc hox (mask)
	[("units/pd2_mcmansion/characters/ene_male_hector_1/ene_male_hector_1"):key()] = "raging_bull",  -- hector (stealth)
	[("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "ump",  -- locke (beneath the mountain)
	[("units/pd2_dlc_wwh/characters/ene_locke/ene_locke"):key()] = "deagle",  -- locke (alaskan deal)
	[("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"):key()] = panic_room,  -- panic room dealer
	[("units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss"):key()] = { "x_c45", "rpk_lmg", "saiga", },  -- commissar
	[("units/pd2_mcmansion/characters/ene_male_hector_2/ene_male_hector_2"):key()] = { "m249", "saiga", "spas12" },  -- hector (loud, cant use x_c45)
	[("units/pd2_dlc_born/characters/ene_gang_biker_boss/ene_gang_biker_boss"):key()] = { "m249", "saiga", "spas12", },  -- biker boss
	[("units/pd2_dlc_flat/characters/npc_chavez/npc_chavez"):key()] = { "x_c45", "rpk_lmg", "saiga", },  -- chavez
	-- [("units/pd2_dlc_spa/characters/npc_spa/npc_spa"):key()] = "benelli",  -- charon (looks funny)
	[("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover"):key()] = "raging_bull",  -- undercover civilian on reservoir dogs
	[("units/pd2_dlc_tag/characters/ene_male_commissioner/ene_male_commissioner"):key()] = "raging_bull",  -- commissioner garrett
	[("units/pd2_dlc_pent/characters/npc_male_yufuwang/npc_male_yufuwang"):key()] = "raging_bull",  -- yufu wang (stealth)
	[("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = "deagle",  -- esteban santiago
	[("units/pd2_dlc_deep/characters/ene_gabriel_nomask/ene_gabriel_nomask"):key()] = { "deagle", "ump", "benelli", },  -- gabriel santiago (stealth)

	-- appropriate weaponry for special units
	[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "mp5",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "shepheard",
	[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "mp5",
	[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "scar_murky",
	[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "mp5",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "ksg",
	[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "shepheard",
	[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "spas12",
	[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "scar_murky",

	-- assorted law
	[("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = "r870",
	[("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = "mp5",
	[("units/payday2/characters/ene_security_1/ene_security_1"):key()] = "c45",
	[("units/payday2/characters/ene_security_2/ene_security_2"):key()] = "mp5",
	[("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "r870",
	[("units/payday2/characters/ene_security_4/ene_security_4"):key()] = "c45",
	[("units/payday2/characters/ene_security_5/ene_security_5"):key()] = "raging_bull",
	[("units/payday2/characters/ene_security_6/ene_security_6"):key()] = "mp5",
	[("units/payday2/characters/ene_security_7/ene_security_7"):key()] = "r870",
	[("units/payday2/characters/ene_security_8/ene_security_8"):key()] = "r870",
	[("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = "mp5",
	[("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = "mp5",
	[("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = "mp5",
	[("units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = "r870",
	[("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = "r870",
	[("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = "mp5",
	[("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = "mp5",
	[("units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1"):key()] = "m4",
	[("units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1"):key()] = "spas12",
	[("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"):key()] = "spas12",
	[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = "raging_bull",
	[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = "m4",
	[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = "raging_bull",
	[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = "m4",
	[("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = "spas12",
	[("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = "raging_bull",
	[("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = "spas12",
	[("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = "raging_bull",
	[("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = murkywater,
	[("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = murkywater,
	[("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = murkywater,
	[("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"):key()] = murkywater,
	[("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"):key()] = murkywater,
	[("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"):key()] = murkywater,
	[("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = murkywater,
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = fbi_ready_team,
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = fbi_ready_team,
	[("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"):key()] = "mp5",
	[("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"):key()] = "r870",
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"):key()] = "m4",
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"):key()] = "spas12",
	[("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"):key()] = "deagle",
	[("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"):key()] = "ump",
	[("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"):key()] = "benelli",
	[("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = "raging_bull",
	[("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = "r870",
	[("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = "mp5",
	[("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = "r870",
	[("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = "mp5",
	[("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = "raging_bull",
	[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "mp5",
	[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "r870",
	[("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01"):key()] = "c45",
	[("units/pd2_dlc_pex/characters/ene_male_office_cop_02/ene_male_office_cop_02"):key()] = "raging_bull",
	[("units/pd2_dlc_pex/characters/ene_male_office_cop_03/ene_male_office_cop_03"):key()] = "mp5",
	[("units/pd2_dlc_pex/characters/ene_male_office_cop_04/ene_male_office_cop_04"):key()] = "spas12",
	[("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = "mp5",
	[("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = "m4",
	[("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = "spas12",
	[("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = "raging_bull",
	[("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = "m4",
	[("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = "spas12",
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = "spas12",
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = "raging_bull",
	[("units/pd2_dlc_short/characters/ene_cop_2_shr/ene_cop_2_shr"):key()] = "c45",  -- loud tutorial cop, old versions reference
	[("units/pd2_dlc_short/characters/ene_security_1_undominatable/ene_security_1_undominatable"):key()] = "c45",  -- stealth tutorial
	[("units/pd2_dlc_short/characters/ene_security_2_undominatable/ene_security_2_undominatable"):key()] = "mp5",  -- stealth tutorial
	[("units/pd2_dlc_short/characters/ene_security_3_undominatable/ene_security_3_undominatable"):key()] = "r870",  -- stealth tutorial
	[("units/pd2_dlc_short/characters/ene_secret_service_1_undominatable/ene_secret_service_1_undominatable"):key()] = "mp5",  -- stealth tutorial

	-- assorted gangsters
	[("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = "mac11",
	[("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = "spas12",
	[("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = "mossberg",
	[("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = "m4",
	[("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = "spas12",
	[("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = "raging_bull",
	[("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = "mossberg",
	[("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = "mac11",
	[("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = "raging_bull",
	[("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = "ak47",
	[("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = "mossberg",
	[("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = "r870",
	[("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = "ak47",
	[("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = "raging_bull",
	[("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = "mossberg",
	[("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1"):key()] = "ak47",
	[("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2"):key()] = "mossberg",
	[("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3"):key()] = "r870",
	[("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4"):key()] = "raging_bull",
	[("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = "ak47",
	[("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = "mac11",
	[("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = "mossberg",
	[("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = "raging_bull",
	[("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = "r870",
	[("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = { "raging_bull", "ak47", },
	[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = "raging_bull",
	[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = "ak47",
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = "ak47",
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = "mossberg",
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = "ak47",
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = "mossberg",
	[("units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"):key()] = { "ak47", "r870", },
	[("units/pd2_dlc_mex/characters/ene_mex_thug_outdoor_02/ene_mex_thug_outdoor_02"):key()] = { "raging_bull", "mossberg", },
	[("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"):key()] = { "raging_bull", "ak47", "mossberg", "r870", },
	[("units/pd2_dlc_fex/characters/ene_guard_dog_mask/ene_guard_dog_mask"):key()] = "mossberg",
	[("units/pd2_dlc_fex/characters/ene_guard_dog_mask_no_pager/ene_guard_dog_mask_no_pager"):key()] = "mossberg",
	[("units/pd2_dlc_fex/characters/ene_guard_jaguar_mask/ene_guard_jaguar_mask"):key()] = "ak47",
	[("units/pd2_dlc_fex/characters/ene_guard_jaguar_mask_no_pager/ene_guard_jaguar_mask_no_pager"):key()] = "ak47",
	[("units/pd2_dlc_fex/characters/ene_guard_owl_mask/ene_guard_owl_mask"):key()] = "raging_bull",
	[("units/pd2_dlc_fex/characters/ene_guard_owl_mask_no_pager/ene_guard_owl_mask_no_pager"):key()] = "raging_bull",
	[("units/pd2_dlc_fex/characters/ene_guard_serpent_mask/ene_guard_serpent_mask"):key()] = "r870",
	[("units/pd2_dlc_fex/characters/ene_guard_serpent_mask_no_pager/ene_guard_serpent_mask_no_pager"):key()] = "r870",
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = "mp5",
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = "raging_bull",
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = "raging_bull",
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = "mp5",
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = "r870",
	[("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = "raging_bull",
	[("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = "spas12",
	[("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = "m4",
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = "m4",
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = "c45",
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = "raging_bull",
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = "spas12",
}

ASS:pre_hook( CopBase, "post_init", function(self)
	local name = self._unit:name():key()
	local level_swap = weapon_mapping[level_mod] or weapon_mapping[level_id]
	local weapon_swap = level_swap and level_swap[name] or weapon_mapping[name]

	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end )
