local level_id = ASS.level_id
local clean_level_id = ASS.clean_level_id
local real_difficulty_index = ASS.real_difficulty_index

MoonTweakData = MoonTweakData or class()

-- initialize stuff only when accessed
-- WeightedSelector isnt available on class init
function MoonTweakData:init(tweak_data)
	self.tweak_data = tweak_data

	local meta = getmetatable(self)
	function meta.__index(t, k)
		local init_func = rawget(meta, "init_" .. k)

		if init_func then
			init_func(t)

			return rawget(t, k)
		end

		return rawget(meta, k)
	end
end

function MoonTweakData:init_replace_access()
	self.replace_access = {
		cop = "swat",
		fbi = "swat",
	}
end

-- used to give randomization to scripted spawns automatically, even if not patched
function MoonTweakData:init_default_scripted_spawn_mappings()
	self.default_scripted_spawn_mappings = {
		dozer_1 = "dozers_no_cs",
		dozer_2 = "dozers_no_cs",
		dozer_3 = "dozers_no_cs",
		swat_1 = "swats_far",
		swat_3 = "swats_far",
		heavy_1 = "heavys_far",
		heavy_3 = "heavys_far",
	}
end

-- used to replace vanilla unit categories with ASS's own
function MoonTweakData:init_vanilla_category_translations()
	self.vanilla_category_translations = {
		spooc = "FBI_spooc",
		CS_cop_C45_R870 = "CS_hrt_1_2_3",
		CS_cop_stealth_MP5 = "CS_hrt_3",
		CS_swat_MP5 = "CS_swat_1",
		CS_swat_R870 = "CS_swat_2",
		CS_heavy_M4 = "CS_heavy_1",
		CS_heavy_R870 = "CS_heavy_2",
		FBI_suit_C45_M4 = "FBI_hrt_1_2",
		FBI_suit_M4_MP5 = "FBI_hrt_2_3",
		FBI_suit_stealth_MP5 = "FBI_hrt_3",
		FBI_swat_M4 = "FBI_swat_1",
		FBI_swat_R870 = "FBI_swat_2",
		FBI_heavy_G36 = "FBI_heavy_1",
		FBI_heavy_R870 = "FBI_heavy_2",
		medic_M4 = "FBI_medic_1",
		medic_R870 = "FBI_medic_2",
		marshal_marksman = "FBI_marshal_marksman",
		marshal_shield = "FBI_marshal_shield",
	}
end

-- used to add ASS's groups to spawn points, and generate preferred groups presets
function MoonTweakData:init_spawn_group_mapping()
	self.spawn_group_mapping = {
		tac_swat_rifle_flank = {
			"tac_swat_rifle",
			"tac_swat_rifle_no_medic",
			"tac_swat_rifle_flank",
			"tac_swat_rifle_flank_no_medic",
			"tac_swat_shotgun_rush",
			"tac_swat_shotgun_rush_no_medic",
			"tac_swat_shotgun_flank",
			"tac_swat_shotgun_flank_no_medic",
			"hostage_rescue",
			"reenforce_init",
			"reenforce_light",
			"reenforce_heavy",
			"marshal_squad",
			"original_swats_a",
			"original_swats_b",
			"original_heavys_a",
			"original_heavys_b",
			"original_recon_a",
			"original_recon_b",
			"original_recon_c",
			"original_recon_d",
			"original_reenforce_a",
			"original_reenforce_b",
			"original_reenforce_c",
			"streamlined_shotgun_rush_a",
			"streamlined_shotgun_rush_b",
			"streamlined_shotgun_flank_a",
			"streamlined_shotgun_flank_b",
			"streamlined_rifle_ranged_a",
			"streamlined_rifle_ranged_b",
			"streamlined_rifle_flank_a",
			"streamlined_rifle_flank_b",
			"streamlined_hostage_rescue",
			"streamlined_reenforce_a",
			"streamlined_reenforce_b",
			"streamlined_reenforce_c",
			"chicken_plate_hrt_a",
			"chicken_plate_hrt_b",
			"chicken_plate_swat_a",
			"chicken_plate_swat_b",
			"chicken_plate_heavy_a",
			"chicken_plate_heavy_b",
		},
		tac_shield_wall = {
			"tac_shield_wall_ranged",
			"tac_shield_wall_charge",
			"original_shields_a",
			"original_shields_b",
			"streamlined_shield_ranged",
			"streamlined_shield_charge",
			"chicken_plate_shield",
		},
		tac_tazer_flanking = {
			"tac_tazer_flanking",
			"tac_tazer_charge",
			"original_tazers_a",
			"original_tazers_b",
			"streamlined_tazer_flank",
			"streamlined_tazer_charge",
			"chicken_plate_taser",
			"chicken_plate_medic",
		},
		tac_bull_rush = {
			"tac_bull_rush",
			"original_tanks_a",
			"original_tanks_b",
			"streamlined_tank",
			"chicken_plate_tank",
		},
		FBI_spoocs = {
			"FBI_spoocs",
			"original_spoocs_a",
			"original_spoocs_b",
			"streamlined_spooc",
			"chicken_plate_spooc",
		},
	}
end

-- difficulty value threshold to use FBI-tier scripted spawns rather than CS-tier
-- 0 means always FBI, 1 means always CS, anything between can change dynamically
function MoonTweakData:init_swap_scripted_prefix_threshold()
	self.swap_scripted_prefix_threshold = ({
		jewelry_store = 1,
		four_stores = 1,
		nightclub = 1,
		mallcrasher = 1,
		ukrainian_job_prof = 1,
		branchbank_deposit = 1,
		branchbank_cash = 1,
		branchbank_prof = 1,
		branchbank_gold_prof = 1,
		family = 1,
		flat = 0.75,
	})[clean_level_id] or 0.9
end

-- level mod data for each wave in holdout up to 9
function MoonTweakData:init_skirmish_wave_tiers()
	self.skirmish_wave_tiers = {
		{ CS = "normal", FBI = "normal", },
		{ CS = "normal", FBI = "normal", },
		{ CS = "normal", FBI = "overkill_145", },
		{ CS = "overkill_145", FBI = "overkill_145", },
		{ CS = "overkill_145", FBI = "overkill_290", },
		{ CS = "overkill_290", FBI = "overkill_290", },
		{ CS = "overkill_290", FBI = "sm_wish", },
		{ CS = "sm_wish", FBI = "sm_wish", },
		{ CS = "sm_wish", FBI = "sm_wish", },
	}
end

-- replacement unit category names for enemy replacer mutators
function MoonTweakData:init_replacement_category_names()
	self.replacement_category_names = {
		tank_hw = "titan",
		tank = "tank",
		taser = "tazer",
		shield = "shield",
		spooc = "spooc",
		medic = "medic_1_2",
	}
end

-- unit names for various female civilians
-- not comprehensive (yet)
function MoonTweakData:init_female_civs_map()
	self.female_civs_map = table.list_to_set({
		("units/payday2/characters/civ_female_bank_1/civ_female_bank_1"):key(),
		("units/payday2/characters/civ_female_bank_manager_1/civ_female_bank_manager_1"):key(),
		("units/payday2/characters/civ_female_hostess_jacket_1/civ_female_hostess_jacket_1"):key(),
		("units/payday2/characters/civ_female_party_1/civ_female_party_1"):key(),
		("units/payday2/characters/civ_female_party_2/civ_female_party_2"):key(),
		("units/payday2/characters/civ_female_party_3/civ_female_party_3"):key(),
		("units/payday2/characters/civ_female_party_4/civ_female_party_4"):key(),
		("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"):key(),
		("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"):key(),
		("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"):key(),
		("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"):key(),
		("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"):key(),
		("units/pd2_dlc2/characters/civ_female_bank_assistant_1/civ_female_bank_assistant_1"):key(),
		("units/pd2_dlc2/characters/civ_female_bank_assistant_2/civ_female_bank_assistant_2"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_doctor_01/civ_female_doctor_01"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_hotpants/civ_female_hotpants"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_scrubs_01/civ_female_scrubs_01"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_scrubs_02/civ_female_scrubs_02"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_scrubs_03/civ_female_scrubs_03"):key(),
		("units/pd2_dlc_nmh/characters/civ_female_scrubs_04/civ_female_scrubs_04"):key(),
		("units/payday2/characters/civ_female_stripper_asian_1/civ_female_stripper_asian_1"):key(),  -- custom heists, a house of pleasure
		("units/payday2/characters/civ_female_stripper_asian_2/civ_female_stripper_asian_2"):key(),
		("units/payday2/characters/civ_female_stripper_russian_1/civ_female_stripper_russian_1"):key(),
		("units/payday2/characters/civ_female_stripper_russian_2/civ_female_stripper_russian_2"):key(),
		("units/payday2/characters/civ_female_stripper_russian_3/civ_female_stripper_russian_3"):key(),
		("units/payday2/characters/civ_female_stripper_russian_4/civ_female_stripper_russian_4"):key(),
		("units/pd2_mod_ttr/characters/civ_female_african_party_1/civ_female_african_party_1"):key(),  -- constantine scores
		("units/pd2_mod_ttr/characters/civ_female_african_party_1/civ_female_african_party_killable_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_african_party_2/civ_female_african_party_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_african_party_2/civ_female_african_party_killable_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_african_1/civ_female_bikini_african_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_asian_1/civ_female_bikini_asian_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_asian_2/civ_female_bikini_asian_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_blonde_1/civ_female_bikini_blonde_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_blonde_2/civ_female_bikini_blonde_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_brunette_1/civ_female_bikini_brunette_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_mexican_1/civ_female_bikini_mexican_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_bikini_mexican_5/civ_female_bikini_mexican_5"):key(),
		("units/pd2_mod_ttr/characters/civ_female_mex_party_1/civ_female_mex_party_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_mex_party_1/civ_female_mex_party_killable_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_mex_party_2/civ_female_mex_party_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_mex_party_2/civ_female_mex_party_killable_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_african_1/civ_female_stripper_african_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_african_1/civ_female_stripper_african_killable_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_african_2/civ_female_stripper_african_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_african_2/civ_female_stripper_african_killable_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_asian_1/civ_female_stripper_asian_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_asian_2/civ_female_stripper_asian_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_blonde_1/civ_female_stripper_blonde_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_blonde_2/civ_female_stripper_blonde_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_brunette_1/civ_female_stripper_brunette_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_brunette_2/civ_female_stripper_brunette_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_mexican_1/civ_female_stripper_mexican_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_mexican_1/civ_female_stripper_mexican_killable_1"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_mexican_2/civ_female_stripper_mexican_2"):key(),
		("units/pd2_mod_ttr/characters/civ_female_stripper_mexican_2/civ_female_stripper_mexican_killable_2"):key(),
	})
end

-- unit key mappings for supported enemies
function MoonTweakData:init_enemy_mapping()
	self.enemy_mapping = {
		[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "hrt_1",
		[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "hrt_1",
		[("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"):key()] = "hrt_1",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "hrt_1",
		[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = "hrt_1",
		[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = "hrt_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"):key()] = "hrt_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2"):key()] = "hrt_1",

		[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "hrt_2",
		[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "hrt_2",
		[("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = "hrt_2",
		[("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"):key()] = "hrt_2",
		[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"):key()] = "hrt_2",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = "hrt_2",
		[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "hrt_2",
		[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = "hrt_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "hrt_2",
		[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "hrt_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"):key()] = "hrt_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1"):key()] = "hrt_2",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = "hrt_2",

		[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "hrt_3",
		[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "hrt_3",
		[("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = "hrt_3",
		[("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"):key()] = "hrt_3",
		[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"):key()] = "hrt_3",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = "hrt_3",
		[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "hrt_3",
		[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "hrt_3",
		[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "hrt_3",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "hrt_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"):key()] = "hrt_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"):key()] = "hrt_3",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "hrt_3",

		[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "hrt_4",  -- for mutators
		[("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"):key()] = "hrt_4",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = "hrt_4",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"):key()] = "hrt_4",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4"):key()] = "hrt_4",

		[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",
		[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "swat_1",
		[("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "swat_1",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "swat_1",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = "swat_1",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = "swat_1",
		[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "swat_1",
		[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = "swat_1",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = "swat_1",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = "swat_1",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "swat_1",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = "swat_1",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_1/ene_cartel_soldier_zeal_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_1/ene_swat_gensec_1"):key()] = "swat_1",  -- gensecs
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
		[("units/pd2_mod_ttr/characters/ene_zeal_gensec_1/ene_zeal_gensec_1"):key()] = "swat_1",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"):key()] = "swat_1",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "swat_1",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"):key()] = "swat_1",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"):key()] = "swat_1",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_g36/ene_bofa_g36"):key()] = "swat_1",
		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"):key()] = "swat_1",

		[("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",
		[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "swat_2",
		[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
		[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = "swat_2",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = "swat_2",
		[("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = "swat_2",
		[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = "swat_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = "swat_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = "swat_2",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = "swat_2",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = "swat_2",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_3/ene_cartel_soldier_zeal_3"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_2/ene_swat_gensec_2"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2"):key()] = "swat_2",
		[("units/pd2_mod_ttr/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "swat_2",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "swat_2",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_r870/ene_sbz_r870"):key()] = "swat_2",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_r870/ene_ovk_r870"):key()] = "swat_2",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_benelli/ene_bofa_benelli"):key()] = "swat_2",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_r870/ene_bofa_r870"):key()] = "swat_2",

		[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"):key()] = "swat_3",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2"):key()] = "swat_3",  -- only tagged as swat 3 for mutator hydra
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2"):key()] = "swat_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2"):key()] = "swat_3",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_ump/ene_bofa_ump"):key()] = "swat_3",

		[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "heavy_1",
		[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "heavy_1",
		[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "heavy_1",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = "heavy_1",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "heavy_1",
		[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = "heavy_1",
		[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = "heavy_1",
		[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = "heavy_1",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = "heavy_1",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_1/ene_swat_gensec_heavy_1"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
		[("units/pd2_mod_ttr/characters/ene_zeal_gensec_heavy_1/ene_zeal_gensec_heavy_1"):key()] = "heavy_1",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "heavy_1",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = "heavy_1",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"):key()] = "heavy_1",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"):key()] = "heavy_1",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"):key()] = "heavy_1",
		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"):key()] = "heavy_1",

		[("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "heavy_2",
		[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "heavy_2",
		[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"):key()] = "heavy_2",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = "heavy_2",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = "heavy_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"):key()] = "heavy_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"):key()] = "heavy_2",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_2/ene_swat_gensec_heavy_2"):key()] = "heavy_2",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_mod_ttr/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "heavy_2",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = "heavy_2",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"):key()] = "heavy_2",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"):key()] = "heavy_2",

		[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "heavy_3",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "heavy_3",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = "heavy_3",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "heavy_3",

		[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield",
		[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield",
		[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = "shield",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = "shield",
		[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = "shield",
		[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = "shield",
		[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = "shield",
		[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = "shield",
		[("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = "shield",
		[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_mp9/ene_sbz_shield_mp9"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_c45/ene_ovk_shield_c45"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_c45/ene_bofa_shield_c45"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"):key()] = "shield",
		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"):key()] = "shield",

		[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
		[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
		[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"):key()] = "sniper",
		[("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"):key()] = "sniper",
		[("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"):key()] = "sniper",
		[("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"):key()] = "sniper",
		[("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"):key()] = "sniper",
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"):key()] = "sniper",

		[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer_1",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer_1",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"):key()] = "dozer_1",
		[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"):key()] = "dozer_1",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "dozer_1",
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"):key()] = "dozer_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"):key()] = "dozer_1",

		[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer_2",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer_2",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"):key()] = "dozer_2",
		[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = "dozer_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"):key()] = "dozer_2",
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "dozer_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"):key()] = "dozer_2",

		[("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer_3",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer_3",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"):key()] = "dozer_3",
		[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"):key()] = "dozer_3",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"):key()] = "dozer_3",
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "dozer_3",
		[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"):key()] = "dozer_3",

		[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer_4",
		[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer_4",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"):key()] = "dozer_4",
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"):key()] = "dozer_4",

		[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "dozer_5",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "dozer_5",
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = "dozer_5",
		[("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"):key()] = "dozer_5",

		[("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"):key()] = "dozer_hw",
		[("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween"):key()] = "dozer_hw",

		[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
		[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "medic_1",
		[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "medic_1",
		[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "medic_1",
		[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "medic_1",
		[("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"):key()] = "medic_1",
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"):key()] = "medic_1",

		[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2",
		[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "medic_2",
		[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "medic_2",
		[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = "medic_2",
		[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "medic_2",
		[("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"):key()] = "medic_2",
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"):key()] = "medic_2",

		[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "taser",
		[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "taser",
		[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "taser",
		[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "taser",
		[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = "taser",
		[("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"):key()] = "taser",
		[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "taser",
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_taser/ene_bofa_taser"):key()] = "taser",  -- does not appear to be used but eh

		[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
		[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = "cloaker",
		[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = "cloaker",
		[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = "cloaker",
		[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = "cloaker",
		[("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"):key()] = "cloaker",

		[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "marshal_1",
		[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "marshal_1",
		[("units/pd2_mod_ttr/characters/ene_marshal_gensec/ene_marshal_gensec"):key()] = "marshal_1",

		[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "marshal_2",
		[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "marshal_2",
		[("units/pd2_mod_ttr/characters/ene_marshal_gensec_shield/ene_marshal_gensec_shield"):key()] = "marshal_2",
	}

	for key, mapping in pairs(self.dummy_mapping) do
		self.enemy_mapping[key] = mapping
	end
end

function MoonTweakData:init_dummy_mapping()
	self.dummy_mapping = {}

	for _, mapping in pairs({
		"swat_1",
		"swat_2",
		"swat_3",
		"heavy_1",
		"heavy_2",
		"heavy_3",
		"shield",
		"sniper",
		"dozer_1",
		"dozer_2",
		"dozer_3",
		"dozer_4",
		"dozer_5",
		"dozer_hw",
		"medic_1",
		"medic_2",
		"taser",
		"cloaker",
		"marshal_1",
		"marshal_2",
	}) do
		self.dummy_mapping[mapping:key()] = mapping
	end
end

-- mapping of preferred groups
-- used for mission script patches
function MoonTweakData:init_preferred_groups_map()
	self.preferred_groups_map = {
		default = function(v) return true end,
		cloakers = function(v) return v == "FBI_spoocs" end,
		swats = function(v) return v == "tac_swat_rifle_flank" end,
		no_swats = function(v) return v ~= "tac_swat_rifle_flank" end,
		no_shields = function(v) return v ~= "tac_shield_wall" end,
		no_dozers = function(v) return v ~= "tac_bull_rush" end,
		no_shields_dozers = function(v) return v ~= "tac_shield_wall" and v ~= "tac_bull_rush" end,
	}

	for typ, func in pairs(self.preferred_groups_map) do
		local map = {}

		for base_name, mapping in pairs(self.spawn_group_mapping) do
			local enabled = func(base_name)

			for _, name in pairs(mapping) do
				map[name] = enabled
			end
		end

		self.preferred_groups_map[typ] = map
	end
end

-- list of preferred groups
-- used for instance script patches/custom script
function MoonTweakData:init_preferred_groups_list()
	self.preferred_groups_list = {}

	for typ, mapping in pairs(self.preferred_groups_map) do
		local list = {}

		for name, enabled in pairs(mapping) do
			if enabled then
				table.insert(list, name)
			end
		end

		self.preferred_groups_list[typ] = list
	end
end

-- mapped unit keys that are not dynamically replaced with the current tier (cops, fbis by default)
function MoonTweakData:init_forbidden_scripted_replacements()
	local all_forbidden = {
		default = table.set("hrt_1", "hrt_2", "hrt_3", "hrt_4"),
	}

	self.forbidden_scripted_replacements = all_forbidden[clean_level_id] or all_forbidden.default
end

-- forced enemy replacements for certain levels, primarily replacing dc beat cops with regional variants where available
function MoonTweakData:init_level_enemy_replacements()
	local all_lvl_replacements = {
		rvd1 = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
			[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"),
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"),
		},
		chas = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
			[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
		},
		ranc = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
			[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
		},
		deep = {
			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
		},

		-- custom heists
		branchbank_russia = {
			[("units/payday2/characters/ene_security_1/ene_security_1"):key()] = Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"),
			[("units/payday2/characters/ene_security_2/ene_security_2"):key()] = Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"),
			[("units/payday2/characters/ene_security_3/ene_security_3"):key()] = Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"),
		},
	}
	all_lvl_replacements.rvd2 = all_lvl_replacements.rvd1
	all_lvl_replacements.sand = all_lvl_replacements.chas
	all_lvl_replacements.pent = all_lvl_replacements.chas
	all_lvl_replacements.corp = ASS.utils.map_add(all_lvl_replacements.ranc, all_lvl_replacements.deep)

	self.level_enemy_replacements = all_lvl_replacements[clean_level_id] or {}
end

-- hydra splits for hydras mutator
function MoonTweakData:init_hydra_splits()
	local splits = {
		marshal_1 = {
			["marshal_1"] = 2,
			["heavy_1"] = 1,
			["heavy_3"] = 1,
		},
		marshal_2 = {
			["marshal_2"] = 2,
			["heavy_2"] = 1,
			["heavy_3"] = 1,
		},
		hrt_1 = {
			["hrt_1"] = 1,
			["hrt_2"] = 1,
			["hrt_3"] = 1,
			["hrt_4"] = 1,
		},
		swat_1 = {
			["hrt_1"] = 1,
			["hrt_2"] = 1,
			["hrt_3"] = 1,
			["hrt_4"] = 1,
			["swat_1"] = 1,
			["swat_2"] = 1,
			["swat_3"] = 1,
		},
		heavy_1 = {
			["swat_1"] = 1,
			["swat_2"] = 1,
			["swat_3"] = 1,
			["heavy_1"] = 1,
			["heavy_2"] = 1,
			["heavy_3"] = 1,
		},
		shield = {
			["shield"] = 2,
			["taser"] = 2,
			["cloaker"] = 2,
			["medic_1"] = 1,
			["medic_2"] = 1,
			["heavy_1"] = 3,
			["heavy_2"] = 3,
			["heavy_3"] = 3,
		},
		dozer_1 = {
			["dozer_1"] = 8,
			["dozer_2"] = 8,
			["dozer_3"] = 8,
			["dozer_4"] = 8,
			["dozer_5"] = 8,
			["shield"] = 10,
			["taser"] = 10,
			["cloaker"] = 10,
			["medic_1"] = 5,
			["medic_2"] = 5,
		},
	}
	for key, units in pairs(splits) do
		local selector = WeightedSelector:new()

		for k, wgt in pairs(units) do
			selector:add(k, wgt)
		end

		splits[key] = selector
	end

	for id, based_on in pairs({
		["hrt_2"] = "hrt_1",
		["hrt_3"] = "hrt_1",
		["hrt_4"] = "hrt_1",
		["swat_2"] = "swat_1",
		["swat_3"] = "swat_1",
		["heavy_2"] = "heavy_1",
		["taser"] = "shield",
		["medic_1"] = "shield",
		["medic_2"] = "shield",
		["cloaker"] = "shield",
		["dozer_2"] = "dozer_1",
		["dozer_3"] = "dozer_1",
		["dozer_4"] = "dozer_1",
		["dozer_5"] = "dozer_1",
		["dozer_hw"] = "dozer_1",
	}) do
		splits[id] = splits[based_on]
	end

	self.hydra_splits = splits
end

-- used to get a random civilian idle if they dont have a spawn state
-- civs spawned without a state seem to behave weirdly
function MoonTweakData:init_civ_idles()
	self.civ_idles = {
		female = {
			["cf_sp_stand_idle_var1"] = 3,
			["cf_sp_stand_idle_var3"] = 3,
			["cf_sp_stand_arms_crossed"] = 1,
		},
		male = {
			["cm_sp_stand_idle"] = 2,
			["cm_sp_standing_idle_var2"] = 2,
			["cm_sp_stand_waiting"] = 2,
			["cm_sp_stand_arms_crossed"] = 1,
		},
	}

	for key, anims in pairs(self.civ_idles) do
		local selector = WeightedSelector:new()

		for k, wgt in pairs(anims) do
			selector:add(k, wgt)
		end

		self.civ_idles[key] = selector
	end
end

-- special objective access filters
-- used in script patches
function MoonTweakData:init_access_filters()
	local access_filters = {
		any = {},
		law = {},  -- only police
		light_law = {},  -- police, no shields/dozers
		heavy_law = {},  -- police, only shields/dozers
	}

	for _, data in pairs(self.tweak_data.character) do
		local access = type(data) == "table" and data.access

		if access then
			access_filters.any[access] = true

			local tags = data.tags and table.list_to_set(data.tags)
			if tags and tags.law then
				access_filters.law[access] = true

				if tags.shield or tags.tank then
					access_filters.heavy_law[access] = true
				else
					access_filters.light_law[access] = true
				end
			end
		end
	end

	for id, data in pairs(access_filters) do
		access_filters[id] = table.map_keys(data)
	end

	self.access_filters = access_filters
end

-- weapon swaps for a great many units
-- can be static or random
function MoonTweakData:init_weapon_mapping()
	local enemy_weapon_tweaks = {
		shield = {
			default = {
				swat = "c45",
				fbi = "mp9",
				city = "mp9",
				zeal = "mp9",
				russia_c45 = "deagle",
				russia_sr2 = "sr2_smg",
				murkywater = real_difficulty_index < 4 and "deagle" or "mp9",
				federales_c45 = nil,
				federales_mp9 = "mp9",
				constantine_cartel = "beretta92",
				bo_sbz = "deagle",
				bo_ovk = "beretta92",
				bo_bofa = "mp9",
			},
			pistols = {
				swat = "c45",
				fbi = nil,
				city = nil,
				zeal = "deagle",
				russia_c45 = "deagle",
				russia_sr2 = "deagle",
				murkywater = "deagle",
				federales_c45 = nil,
				federales_mp9 = nil,
				constantine_cartel = "beretta92",
				bo_sbz = "deagle",
				bo_ovk = "beretta92",
				bo_bofa = "deagle",
			},
			smgs = {
				swat = "mp9",
				fbi = nil,
				city = nil,
				zeal = nil,
				russia_c45 = "sr2_smg",
				russia_sr2 = "sr2_smg",
				murkywater = nil,
				federales_c45 = nil,
				federales_mp9 = nil,
				constantine_cartel = nil,
				bo_sbz = nil,
				bo_ovk = nil,
				bo_bofa = nil,
			},
			both = {
				swat = { "c45", "mp9", },
				fbi = nil,
				city = nil,
				zeal = { "deagle", "mp9", },
				russia_c45 = { "deagle", "sr2_smg", },
				russia_sr2 = { "deagle", "sr2_smg", },
				murkywater = { "deagle", "mp9", },
				federales_c45 = nil,
				federales_mp9 = nil,
				constantine_cartel = { "beretta92", "mp9", },
				bo_sbz = { "deagle", "mp9", },
				bo_ovk = { "beretta92", "mp9", },
				bo_bofa = { "deagle", "mp9", },
			},
		},
		taser = {
			default = {
				swat = "mp5",
				zeal = "shepheard",
				russia = "ak47_ass",
				murkywater = "scar_murky",
				federales = nil,
				constantine_cartel = "sko12_conc",
				bo_sbz = "shepheard",
			},
			rifles = {
				swat = "mp5",
				zeal = "shepheard",
				russia = "ak47_ass",
				murkywater = "scar_murky",
				federales = nil,
				constantine_cartel = "ak47",
				bo_sbz = "shepheard",
			},
			sko12s = {
				swat = "sko12_conc",
				zeal = nil,
				russia = nil,
				murkywater = nil,
				federales = nil,
				constantine_cartel = nil,
				bo_sbz = nil,
			},
			both = {
				swat = { "mp5", "sko12_conc", },
				zeal = { "shepheard", "sko12_conc", },
				russia = { "ak47_ass", "sko12_conc", },
				murkywater = { "scar_murky", "sko12_conc", },
				federales = nil,
				constantine_cartel = { "ak47", "sko12_conc", },
				bo_sbz = { "shepheard", "sko12_conc", },
			},
		},
		cloaker = {
			default = {
				swat = "mp5_tactical",
				fbi = nil,
				zeal = nil,
				russia = "asval_smg",
				murkywater = "ump",
				federales = nil,
				constantine_cartel = "beretta92",
				bo_ovk = nil,
			},
			pistols = {
				swat = "beretta92",
				fbi = nil,
				zeal = nil,
				russia = nil,
				murkywater = nil,
				federales = nil,
				constantine_cartel = nil,
				bo_ovk = nil,
			},
			smgs = {
				swat = "mp5_tactical",
				fbi = nil,
				zeal = nil,
				russia = "asval_smg",
				murkywater = "ump",
				federales = nil,
				constantine_cartel = "ump",
				bo_ovk = nil,
			},
			both = {
				swat = { "beretta92", "mp5_tactical", },
				fbi = nil,
				zeal = nil,
				russia = { "beretta92", "asval_smg", },
				murkywater = { "beretta92", "ump", },
				federales = nil,
				constantine_cartel = { "beretta92", "ump", },
				bo_ovk = nil,
			},
		},
		medic_rifle = {
			default = {
				swat = "mp5",
				fbi = "m4",
				zeal = "shepheard",
				russia = "ak47_ass",
				murkywater = "scar_murky",
				federales = nil,
				constantine_cartel = "sg417",
				bo_ovk = "m4",
			},
			revolvers = {
				swat = "raging_bull",
				fbi = nil,
				zeal = nil,
				russia = nil,
				murkywater = nil,
				federales = nil,
				constantine_cartel = nil,
				bo_ovk = nil,
			},
			both = {
				swat = { "mp5", "raging_bull", },
				fbi = { "m4", "raging_bull", },
				zeal = { "shepheard", "raging_bull", },
				russia = { "ak47_ass", "raging_bull", },
				murkywater = { "scar_murky", "raging_bull", },
				federales = nil,
				constantine_cartel = { "sg417", "raging_bull", },
				bo_ovk = { "m4", "raging_bull", },
			},
		},
		medic_shotgun = {
			default = {
				swat = "r870",
				fbi = "spas12",
				zeal = "ksg",
				russia = nil,
				murkywater = "spas12",
				federales = nil,
				constantine_cartel = "saiga",
				bo_ovk = nil,
			},
			shotguns = {
				swat = "r870",
				fbi = "spas12",
				zeal = "ksg",
				russia = nil,
				murkywater = "spas12",
				federales = nil,
				constantine_cartel = nil,
				bo_ovk = nil,
			},
			saigas = {
				swat = "saiga",
				fbi = nil,
				zeal = nil,
				russia = nil,
				murkywater = nil,
				federales = nil,
				constantine_cartel = nil,
				bo_ovk = nil,
			},
			both = {
				swat = { "r870", "saiga", },
				fbi = { "spas12", "saiga", },
				zeal = { "ksg", "saiga", },
				russia = nil,
				murkywater = { "spas12", "saiga", },
				federales = nil,
				constantine_cartel = nil,
				bo_ovk = nil,
			},
		},
		medic_dozer = {
			default = {
				swat = "mp5",
				zeal = "shepheard",
				murkywater = "scar_murky",
				federales = nil,
				constantine_cartel = "ak47",
				bo_bofa = "s552",
			},
			rifles = {
				swat = "mp5",
				zeal = "shepheard",
				murkywater = "scar_murky",
				federales = nil,
				constantine_cartel = "ak47",
				bo_bofa = "s552",
			},
			sawed_offs = {
				swat = "mossberg",
				zeal = nil,
				murkywater = nil,
				federales = nil,
				constantine_cartel = nil,
				bo_bofa = nil,
			},
			both = {
				swat = { "mp5", "mossberg", },
				zeal = { "shepheard", "mossberg", },
				murkywater = { "scar_murky", "mossberg", },
				federales = nil,
				constantine_cartel = { "ak47", "mossberg", },
				bo_bofa = { "s552", "mossberg", },
			},
		},
		pistol_rifle_hrts = {
			default = {
				swat = "c45",
				fbi = nil,
				murkywater = "deagle",
				federales = nil,
				constantine_fsb = "deagle",
			},
			pistols = {
				swat = "c45",
				fbi = nil,
				murkywater = "deagle",
				federales = nil,
				constantine_fsb = "deagle",
			},
			rifles = {
				swat = "mp5",
				fbi = "m4",
				murkywater = "scar_murky",
				federales = nil,
				constantine_fsb = "akmsu_smg",
			},
			both = {
				swat = { "c45", "mp5", },
				fbi = { "c45", "m4", },
				murkywater = { "deagle", "scar_murky", },
				federales = nil,
				constantine_fsb = { "deagle", "akmsu_smg", },
			},
		},
	}

	for unit_name, settings in pairs(enemy_weapon_tweaks) do
		local reference = ASS.wanted_enemy_weapon_tweaks[unit_name]

		for name in pairs(settings) do
			if name == reference then
				reference = nil
				enemy_weapon_tweaks[unit_name] = settings[name]

				break
			end
		end

		-- didnt find weapons, fallback on default
		if reference or not enemy_weapon_tweaks[unit_name] then
			enemy_weapon_tweaks[unit_name] = settings.default
		end
	end

	local function get_tweaked_weapon(name, typ)
		local weapons = enemy_weapon_tweaks[name]

		if weapons then
			return weapons[typ] or weapons.swat
		end
	end

	local panic_room = { "c45", "raging_bull", "mac11", "ak47", "r870", "mossberg", }
	local murkywater = { "scar_murky", "spas12", "ump", }

	-- level id specific overrides
	local level_overrides = {
		pbr = {
			[("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = "ump",
			[("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = "scar_murky",
			[("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = "spas12",
		},
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
		constantine_dwtd_level = {
			[("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = "mossberg",
			[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = "beretta92",
			[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = "raging_bull",
		},
		thechase = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "deagle",
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "ksg",
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "shepheard",
			[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "beretta92",
			[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "r870",
			[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = get_tweaked_weapon("taser", "bo_sbz"),
			[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = get_tweaked_weapon("cloaker", "bo_ovk"),
			[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "ksg",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = get_tweaked_weapon("medic_dozer", "bo_bofa"),
		},
	}
	level_overrides.short2_stage2b = level_overrides.short2_stage1
	level_overrides.physics_citystreets = level_overrides.thechase
	level_overrides.physics_tower = level_overrides.thechase
	level_overrides.physics_core = level_overrides.thechase

	local weapon_mapping = {
		-- appropriate weaponry for unique units
		-- [("units/payday2/characters/npc_old_hoxton_prisonsuit_1/npc_old_hoxton_prisonsuit_1"):key()] = "c45",  -- npc hox (no mask)
		[("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "spas12",  -- npc hox (mask)
		[("units/pd2_mcmansion/characters/ene_male_hector_1/ene_male_hector_1"):key()] = "raging_bull",  -- hector (stealth)
		[("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "deagle",  -- locke (beneath the mountain)
		[("units/pd2_dlc_wwh/characters/ene_locke/ene_locke"):key()] = "deagle",  -- locke (alaskan deal)
		[("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"):key()] = panic_room,  -- panic room dealer
		[("units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss"):key()] = "saiga",  -- commissar
		-- [("units/pd2_mcmansion/characters/ene_male_hector_2/ene_male_hector_2"):key()] = "saiga",  -- hector (loud)
		[("units/pd2_dlc_born/characters/ene_gang_biker_boss/ene_gang_biker_boss"):key()] = "spas12",  -- biker boss
		-- [("units/pd2_dlc_flat/characters/npc_chavez/npc_chavez"):key()] = "x_c45",  -- chavez
		-- [("units/pd2_dlc_spa/characters/npc_spa/npc_spa"):key()] = "benelli",  -- charon (looks funny)
		[("units/pd2_dlc_rvd/characters/ene_female_civ_undercover/ene_female_civ_undercover"):key()] = "raging_bull",  -- undercover civilian on reservoir dogs
		[("units/pd2_dlc_tag/characters/ene_male_commissioner/ene_male_commissioner"):key()] = "raging_bull",  -- commissioner garrett
		[("units/pd2_dlc_pent/characters/npc_male_yufuwang/npc_male_yufuwang"):key()] = "raging_bull",  -- yufu wang (stealth)
		[("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = "deagle",  -- esteban santiago
		[("units/pd2_dlc_deep/characters/ene_gabriel/ene_gabriel"):key()] = "sko12_conc",  -- gabriel santiago (loud)
		[("units/pd2_dlc_deep/characters/ene_gabriel_nomask/ene_gabriel_nomask"):key()] = "sko12_conc",  -- gabriel santiago (stealth)

		-- faction weaponry for r870 dozers
		[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "ksg",
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "spas12",

		-- shields, for "Shield Arms" setting
		[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = get_tweaked_weapon("shield", "swat"),
		[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = get_tweaked_weapon("shield", "fbi"),
		[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = get_tweaked_weapon("shield", "city"),
		[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = get_tweaked_weapon("shield", "zeal"),
		[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = get_tweaked_weapon("shield", "russia_c45"),
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = get_tweaked_weapon("shield", "russia_sr2"),
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = get_tweaked_weapon("shield", "russia_sr2"),
		[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = get_tweaked_weapon("shield", "swat"),
		[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = get_tweaked_weapon("shield", "fbi"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = get_tweaked_weapon("shield", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = get_tweaked_weapon("shield", "federales_c45"),
		[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = get_tweaked_weapon("shield", "federales_mp9"),
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield"):key()] = get_tweaked_weapon("shield", "swat"),  -- constantine scores
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield"):key()] = get_tweaked_weapon("shield", "fbi"),
		[("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"):key()] = get_tweaked_weapon("shield", "constantine_cartel"),
		[("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = get_tweaked_weapon("shield", "russia_c45"),  -- constantine fsb
		[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = get_tweaked_weapon("shield", "russia_sr2"),
		[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = get_tweaked_weapon("shield", "russia_sr2"),
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"):key()] = get_tweaked_weapon("shield", "bo_sbz"),  -- boworks
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_mp9/ene_sbz_shield_mp9"):key()] = get_tweaked_weapon("shield", "bo_sbz"),
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_c45/ene_ovk_shield_c45"):key()] = get_tweaked_weapon("shield", "bo_ovk"),
		[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"):key()] = get_tweaked_weapon("shield", "bo_ovk"),
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_c45/ene_bofa_shield_c45"):key()] = get_tweaked_weapon("shield", "bo_bofa"),
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"):key()] = get_tweaked_weapon("shield", "bo_bofa"),

		-- tasers, for "Taser Dazers" setting
		[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = get_tweaked_weapon("taser", "swat"),
		[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = get_tweaked_weapon("taser", "zeal"),
		[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = get_tweaked_weapon("taser", "russia"),
		[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = get_tweaked_weapon("taser", "russia"),  -- constantine russia campaign
		[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = get_tweaked_weapon("taser", "swat"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = get_tweaked_weapon("taser", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = get_tweaked_weapon("taser", "federales"),
		[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = get_tweaked_weapon("taser", "constantine_cartel"),  -- constantine scores
		[("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"):key()] = get_tweaked_weapon("taser", "constantine_cartel"),
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_taser/ene_bofa_taser"):key()] = get_tweaked_weapon("taser", "bo_sbz"),  -- boworks

		-- cloakers, for "Cloaker Balance" setting
		[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = get_tweaked_weapon("cloaker", "fbi"),
		[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = get_tweaked_weapon("cloaker", "zeal"),
		[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = get_tweaked_weapon("cloaker", "russia"),
		[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = get_tweaked_weapon("cloaker", "fbi"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = get_tweaked_weapon("cloaker", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = get_tweaked_weapon("cloaker", "federales"),
		[("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"):key()] = get_tweaked_weapon("cloaker", "constantine_cartel"),  -- constantine scores

		-- rifle medics, for "Medic Ordnance" setting
		[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = get_tweaked_weapon("medic_rifle", "fbi"),
		[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = get_tweaked_weapon("medic_rifle", "zeal"),
		[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = get_tweaked_weapon("medic_rifle", "russia"),
		[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = get_tweaked_weapon("medic_rifle", "fbi"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = get_tweaked_weapon("medic_rifle", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = get_tweaked_weapon("medic_rifle", "federales"),
		[("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"):key()] = get_tweaked_weapon("medic_rifle", "constantine_cartel"),  -- constantine scores, not actually a medic but eh
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"):key()] = get_tweaked_weapon("medic_rifle", "bo_ovk"),  -- boworks

		-- shotgun medics, for "Medical Ordinance" setting
		[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = get_tweaked_weapon("medic_shotgun", "fbi"),
		[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = get_tweaked_weapon("medic_shotgun", "zeal"),
		[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = get_tweaked_weapon("medic_shotgun", "russia"),
		[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = get_tweaked_weapon("medic_shotgun", "fbi"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = get_tweaked_weapon("medic_shotgun", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = get_tweaked_weapon("medic_shotgun", "federales"),
		[("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"):key()] = get_tweaked_weapon("medic_shotgun", "constantine_cartel"),  -- constantine scores, not actually a medic but eh
		[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"):key()] = get_tweaked_weapon("medic_shotgun", "bo_ovk"),  -- boworks

		-- medic dozers, for "Geneva Suggestion" setting
		[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = get_tweaked_weapon("medic_dozer", "zeal"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = get_tweaked_weapon("medic_dozer", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = get_tweaked_weapon("medic_dozer", "federales"),
		[("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"):key()] = get_tweaked_weapon("medic_dozer", "constantine_cartel"),  -- constantine scores, rough medicdozer equivalent

		-- rifle hrts, for "Police Funding" setting
		[("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"):key()] = get_tweaked_weapon("pistol_rifle_hrts", "swat"),
		[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"):key()] = get_tweaked_weapon("pistol_rifle_hrts", "fbi"),
		[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = get_tweaked_weapon("pistol_rifle_hrts", "murkywater"),
		[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = get_tweaked_weapon("pistol_rifle_hrts", "federales"),
		[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = get_tweaked_weapon("pistol_rifle_hrts", "constantine_fsb"),  -- constantine scores

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
		[("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = "c45",
		[("units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = "r870",
		[("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = "r870",
		[("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = "mp5",
		[("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = "mp5",
		[("units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1"):key()] = "m4",
		[("units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1"):key()] = "spas12",
		[("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"):key()] = "spas12",
		[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = "m4",
		[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = "c45",
		[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = "m4",
		[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = "c45",
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
		[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "m4",
		[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "spas12",
		[("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"):key()] = "r870",
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
		[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "r870",
		[("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01"):key()] = "c45",
		[("units/pd2_dlc_pex/characters/ene_male_office_cop_02/ene_male_office_cop_02"):key()] = "raging_bull",
		[("units/pd2_dlc_pex/characters/ene_male_office_cop_03/ene_male_office_cop_03"):key()] = "mp5",
		[("units/pd2_dlc_pex/characters/ene_male_office_cop_04/ene_male_office_cop_04"):key()] = "r870",
		[("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = "mp5",
		[("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = "mp5",
		[("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = "r870",
		[("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = "raging_bull",
		[("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = "mac11",
		[("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = "mossberg",
		[("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = "spas12",
		[("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = "raging_bull",
		[("units/pd2_dlc_short/characters/ene_cop_2_shr/ene_cop_2_shr"):key()] = "c45",  -- loud tutorial cop, old versions reference
		[("units/pd2_dlc_short/characters/ene_security_1_undominatable/ene_security_1_undominatable"):key()] = "c45",  -- stealth tutorial
		[("units/pd2_dlc_short/characters/ene_security_2_undominatable/ene_security_2_undominatable"):key()] = "mp5",  -- stealth tutorial
		[("units/pd2_dlc_short/characters/ene_security_3_undominatable/ene_security_3_undominatable"):key()] = "r870",  -- stealth tutorial
		[("units/pd2_dlc_short/characters/ene_secret_service_1_undominatable/ene_secret_service_1_undominatable"):key()] = "mp5",  -- stealth tutorial
		[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "ump",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "ump",
		[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = "ump",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "deagle",
		[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = "raging_bull",

		-- assorted gangsters
		[("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = "deagle",
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
		[("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = "raging_bull",
		[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = "mac11",
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
		[("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = "c45",
		[("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = "raging_bull",
		[("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = "mossberg",
		[("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = "mac11",
		[("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = "r870",
		[("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = "raging_bull",
		[("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = "r870",
		[("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = "mp5",
		[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = "mp5",
		[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = "raging_bull",
		[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = "c45",
		[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = "r870",

		-- constantine scores units
		[("units/pd2_mod_ttr/characters/ene_friendly_backup_1/ene_friendly_backup_1"):key()] = "raging_bull",  -- friendly backup units
		[("units/pd2_mod_ttr/characters/ene_friendly_backup_1_vehicle/ene_friendly_backup_1_vehicle"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_friendly_backup_2/ene_friendly_backup_2"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_friendly_backup_2_vehicle/ene_friendly_backup_2_vehicle"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_friendly_backup_diego_crew/ene_friendly_backup_diego_crew"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_diego_backup/ene_diego_backup"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_cartel_rebel_1/ene_cartel_rebel_1"):key()] = "ump",  -- cartel, "rebels"
		[("units/pd2_mod_ttr/characters/ene_cartel_rebel_2/ene_cartel_rebel_2"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_rebel_3/ene_cartel_rebel_3"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_rebel_4/ene_cartel_rebel_4"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_suit_1/ene_cartel_suit_1"):key()] = "ak47",  -- "suits"
		[("units/pd2_mod_ttr/characters/ene_cartel_suit_2/ene_cartel_suit_2"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_suit_3/ene_cartel_suit_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_security_1/ene_cartel_security_1"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_security_2/ene_cartel_security_2"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_1/ene_cartel_bathrobe_1"):key()] = "mac11",  -- bathrobe idiots
		[("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_2/ene_cartel_bathrobe_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_3/ene_cartel_bathrobe_3"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_cartel_clubowner/ene_cartel_clubowner"):key()] = { "r870", "saiga", "rpk_lmg", },  -- some buluc guard with armour lol
		[("units/pd2_mod_ttr/characters/ene_cartel_vip_armor_1/ene_cartel_vip_armor_1"):key()] = "mossberg",  -- who
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"):key()] = "ak47",  -- scripted spawns, treated as hrts in ASS
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"):key()] = "ak47",  -- lights
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_1/ene_cartel_soldier_zeal_1"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_2/ene_cartel_soldier_zeal_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_3/ene_cartel_soldier_zeal_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2"):key()] = "beretta92",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"):key()] = "ump",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"):key()] = "ak47",  -- heavies
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"):key()] = "ak47",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"):key()] = "r870",
		[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"):key()] = "rpk_lmg",
		[("units/pd2_mod_ttr/characters/ene_security_resort_1/ene_security_resort_1"):key()] = "m4",  -- resort security
		[("units/pd2_mod_ttr/characters/ene_security_resort_2/ene_security_resort_2"):key()] = "spas12",
		[("units/pd2_mod_ttr/characters/ene_security_resort_3/ene_security_resort_3"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_security_resort_4/ene_security_resort_4"):key()] = "raging_bull",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_1/ene_swat_gensec_1"):key()] = "g36",  -- gensecs
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_zeal_gensec_1/ene_zeal_gensec_1"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_2/ene_swat_gensec_2"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_1/ene_swat_gensec_heavy_1"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_zeal_gensec_heavy_1/ene_zeal_gensec_heavy_1"):key()] = "g36",
		[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_2/ene_swat_gensec_heavy_2"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "benelli",
		[("units/pd2_mod_ttr/characters/ene_marshal_gensec_shield/ene_marshal_gensec_shield"):key()] = { secondary = "c45", },

		-- constantine russia campaign units
		[("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = "akmsu_smg",  -- general, security
		[("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = "deagle",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "r870",  -- cops/hrts
		[("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"):key()] = "akmsu_smg",  -- swats
		[("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "ak47_ass",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "asval_smg",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = "akmsu_smg",  -- heavies
		[("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "ak47_ass",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "r870",
		[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "ump",
		[("units/payday2/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager"):key()] = "ak47",  -- a house of pleasure mobsters
		[("units/payday2/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager"):key()] = "mossberg",
		[("units/payday2/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager"):key()] = "r870",
		[("units/payday2/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager"):key()] = "raging_bull",
		[("units/payday2/characters/ene_gang_mobster_5/ene_gang_mobster_5"):key()] = "deagle",
		[("units/payday2/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager"):key()] = "deagle",
		[("units/payday2/characters/ene_gang_mobster_6/ene_gang_mobster_6"):key()] = "mac11",
		[("units/payday2/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager"):key()] = "mac11",
		[("units/payday2/characters/ene_russian_club_owner_stealth/ene_russian_club_owner_stealth"):key()] = "deagle",
		[("units/payday2/characters/ene_russian_club_vip_1/ene_russian_club_vip_1"):key()] = "raging_bull",
		[("units/payday2/characters/ene_russian_club_vip_2/ene_russian_club_vip_2"):key()] = "mossberg",
		[("units/payday2/characters/npc_backup_1/npc_backup_1"):key()] = "raging_bull",
		[("units/payday2/characters/npc_backup_2/npc_backup_2"):key()] = "raging_bull",
		[("units/payday2/characters/ene_rus_prisoner_1/ene_rus_prisoner_1"):key()] = "akmsu_smg",  -- crime and punishment rioters
		[("units/payday2/characters/ene_rus_prisoner_2/ene_rus_prisoner_2"):key()] = "deagle",
		[("units/payday2/characters/ene_rus_prisoner_3/ene_rus_prisoner_3"):key()] = "deagle",
		[("units/payday2/characters/ene_rus_prisoner_4/ene_rus_prisoner_4"):key()] = "r870",
		[("units/payday2/characters/npc_nikolai_security/npc_nikolai_security"):key()] = "deagle",  -- hunter and hunted, nikolai guards
		[("units/payday2/characters/ene_rus_aleksandr/ene_rus_aleksandr"):key()] = "r870",  -- aleksandr

		-- boworks units
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"):key()] = "shepheard",  -- swats
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_r870/ene_sbz_r870"):key()] = "ksg",
		-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"):key()] = "m4",
		-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_r870/ene_ovk_r870"):key()] = "r870",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_g36/ene_bofa_g36"):key()] = "s552",
		-- [("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_benelli/ene_bofa_benelli"):key()] = "benelli",
		-- [("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_ump/ene_bofa_ump"):key()] = "ump",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_r870/ene_bofa_r870"):key()] = "benelli",

		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"):key()] = "shepheard",  -- heavies
		[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"):key()] = "ksg",
		-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"):key()] = "m4",
		-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"):key()] = "r870",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"):key()] = "s552",
		[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"):key()] = "benelli",

		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"):key()] = "mini",  -- zeal tier, scripted spawn exclusive in ASS, they get to be mean
		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"):key()] = "mini",
		[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"):key()] = "mini",

		[("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security/ene_stockos_security"):key()] = "deagle",  -- security
		[("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security_head/ene_stockos_security_head"):key()] = "ksg",

		[("units/matthelzor/characters/ford/ford"):key()] = "shepheard",  -- cocke
		-- [("units/mainman/characters/ene_the_boss/ene_the_boss"):key()] = "mini",  -- bo boss
		[("units/mainman/characters/ene_bo/ene_bo"):key()] = "deagle",  -- bo
	}

	local level_override = level_overrides[level_id]
	if level_override then
		for unit, weapon in pairs(level_override) do
			weapon_mapping[unit] = weapon
		end
	end

	local valid_ids = table.list_to_set(self.tweak_data.character.weap_ids)
	local invalid_ids = {}
	local nil_key = function(t, k) t[k] = nil end
	for unit, weapon in pairs(weapon_mapping) do
		if type(weapon) == "table" then
			local iterator = weapon[1] and table.reverse_ipairs or pairs
			local t_func = iterator == pairs and nil_key or table.remove

			for k, id in iterator(weapon) do
				if not valid_ids[id] then
					invalid_ids[id] = true

					t_func(weapon, k)
				end
			end

			if not next(weapon) then
				weapon_mapping[unit] = nil
			end
		elseif not valid_ids[weapon] then
			invalid_ids[weapon] = true

			weapon_mapping[unit] = nil
		end
	end

	for id in pairs(invalid_ids) do
		ASS:log("warn", "Invalid weapon ID \"%s\" in CharacterTweakData:weapon_mapping!", id)
	end

	self.weapon_mapping = weapon_mapping
end

-- fetches common units by a shorthand name
-- also includes tables of random common units
function MoonTweakData:init_units()
	local security_1 = Idstring("units/payday2/characters/ene_security_1/ene_security_1")
	local security_2 = Idstring("units/payday2/characters/ene_security_2/ene_security_2")
	local security_3 = Idstring("units/payday2/characters/ene_security_3/ene_security_3")
	local cop_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
	local cop_2 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
	local cop_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
	local cop_4 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	local fbi_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
	local fbi_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	local fbi_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
	local swat_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
	local swat_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
	local swat_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
	local heavy_1 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
	local heavy_2 = Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
	local heavy_3 = Idstring("heavy_3")  -- dummy name
	local shield = Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
	local sniper = Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1")
	local dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
	local dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
	local dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
	local dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	local dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
	local medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
	local medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
	local taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
	local cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
	local marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1")
	local marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1")
	local units = {
		security_1 = security_1,
		security_2 = security_2,
		security_3 = security_3,
		securitys = { security_1, security_2, security_3, },
		securitys_light = { security_1, security_2, },
		securitys_heavy = { security_2, security_3, },
		securitys_no_mp5 = { security_1, security_3, },

		cop_1 = cop_1,
		cop_2 = cop_2,
		cop_3 = cop_3,
		cop_4 = cop_4,
		cops = { cop_1, cop_2, cop_3, cop_4, },
		cops_light = { cop_1, cop_2, },
		cops_medium = { cop_2, cop_4, },
		cops_heavy = { cop_3, cop_4, },
		cops_no_c45 = { cop_2, cop_3, cop_4, },
		cops_no_bronco = { cop_1, cop_3, cop_4, },
		cops_no_r870 = { cop_1, cop_2, cop_4, },
		cops_no_mp5 = { cop_1, cop_2, cop_3, },

		fbi_1 = fbi_1,
		fbi_2 = fbi_2,
		fbi_3 = fbi_3,
		fbis = { fbi_1, fbi_2, fbi_3, },
		fbis_light = { fbi_1, fbi_2, },
		fbis_heavy = { fbi_2, fbi_3, },

		swat_1 = swat_1,
		swat_2 = swat_2,
		swat_3 = swat_3,
		swats = { swat_1, swat_2, swat_3, },
		swats_close = { swat_2, swat_3, },
		swats_far = { swat_1, swat_3, },

		heavy_1 = heavy_1,
		heavy_2 = heavy_2,
		heavy_3 = heavy_3,
		heavys = { heavy_1, heavy_2, heavy_3, },
		heavys_close = { heavy_2, heavy_3, },
		heavys_far = { heavy_1, heavy_3, },

		swats_heavys = { swat_1, swat_2, swat_3, heavy_1, heavy_2, heavy_3, },
		swats_heavys_close = { swat_2, swat_3, heavy_2, heavy_3, },
		swats_heavys_far = { swat_1, swat_3, heavy_1, heavy_3, },

		shield = shield,
		sniper = sniper,
		taser = taser,
		cloaker = cloaker,
		medic_1 = medic_1,
		medic_2 = medic_2,
		specials_agg = { taser, cloaker, },
		specials_def = { taser, shield, },
		specials_sup = { shield, shield, medic_1, medic_2, },
		specials_any = { shield, shield, taser, taser, cloaker, cloaker, medic_1, medic_2, },
		specials_no_med = { shield, taser, cloaker, },
		specials_no_clk = { shield, shield, taser, taser, medic_1, medic_2, },
		specials_no_shield = { taser, taser, cloaker, cloaker, medic_1, medic_2, },
		specials_taser_medic = { taser, taser, medic_1, medic_2, },
		specials_shield_clk = { shield, cloaker, },
		specials_med = { medic_1, medic_2, },

		dozer_1 = dozer_1,
		dozer_2 = dozer_2,
		dozer_3 = dozer_3,
		dozer_4 = dozer_4,
		dozer_5 = dozer_5,
		dozers_any = { dozer_1, },

		marshal_1 = marshal_1,
		marshal_2 = marshal_2,
		marshals = { marshal_1, marshal_2, heavy_1, heavy_2, },
		marshals_far = { marshal_1, heavy_1, },
		marshals_close = { marshal_2, heavy_2, },
		marshals_no_shield = { marshal_1, marshal_1, heavy_1, heavy_2, },
		marshals_no_marksman = { marshal_2, marshal_2, heavy_1, heavy_2, },
	}

	local function dozer_difficulty_threshold(typ)
		local threshold = tonumber(ASS.dozer_rainbow[typ]) or 1

		-- minidozers can start appearing in scripted spawns on dw even if set not to appear until ds
		if typ == "dozer_4" then
			threshold = math.min(threshold, 7)
		end

		return threshold
	end
	for dozer, threshold in pairs({
		dozer_2 = dozer_difficulty_threshold("dozer_2"),
		dozer_3 = dozer_difficulty_threshold("dozer_3"),
		dozer_4 = dozer_difficulty_threshold("dozer_4"),
		dozer_5 = dozer_difficulty_threshold("dozer_5"),
	}) do
		if real_difficulty_index >= threshold then
			table.insert(units.dozers_any, units[dozer])
		end
	end

	units.dozers_no_mini = clone(units.dozers_any)
	table.delete(units.dozers_no_mini, dozer_4)

	units.dozers_no_med = clone(units.dozers_any)
	table.delete(units.dozers_no_med, dozer_5)

	units.dozers_no_cs = clone(units.dozers_any)
	table.delete(units.dozers_no_cs, dozer_4)
	table.delete(units.dozers_no_cs, dozer_5)

	self.units = units
end

-- replacements based on mapped enemy key
function MoonTweakData:enemy_replacements(continent)
	local replacements = self._enemy_replacements

	if not replacements then
		replacements = {
			america = {
				normal = {
					hrt_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
					hrt_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),
					swat_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					heavy_1 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					heavy_2 = Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
					heavy_3 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					shield = Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
					sniper = Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					heavy_1 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					heavy_2 = Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					heavy_3 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					shield = Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					sniper = Idstring("units/payday2/characters/ene_sniper_2/ene_sniper_2"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					heavy_1 = Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					heavy_2 = Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
					heavy_3 = Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					shield = Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
					sniper = Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				sm_wish = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
					swat_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					swat_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
					heavy_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					heavy_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"),
					heavy_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					shield = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					sniper = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween"),
					medic_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"),
					medic_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"),
					taser = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					cloaker = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			russia = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					hrt_4 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
					heavy_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					hrt_4 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					heavy_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					hrt_4 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					heavy_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			zombie = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					hrt_2 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
					hrt_3 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					hrt_4 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"),
					swat_1 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					swat_2 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
					swat_3 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					heavy_1 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
					heavy_2 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"),
					heavy_3 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
					shield = Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"),
					sniper = Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"),
					dozer_1 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					dozer_2 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
					dozer_3 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
					medic_2 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
					taser = Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					cloaker = Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
					hrt_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					hrt_3 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					hrt_4 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					swat_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					swat_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					swat_3 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					heavy_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
					heavy_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					heavy_3 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
					shield = Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					sniper = Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"),
					dozer_1 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					dozer_2 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
					dozer_3 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
					medic_2 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
					taser = Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					cloaker = Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
			},
			murkywater = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					hrt_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					heavy_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					hrt_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					heavy_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					hrt_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					heavy_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			federales = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					hrt_4 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
					heavy_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					hrt_4 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					heavy_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					hrt_4 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					heavy_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			constantine_cartel = {
				normal = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					hrt_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"),
					heavy_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					hrt_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					heavy_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					hrt_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					heavy_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				sm_wish = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					hrt_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_1/ene_cartel_soldier_zeal_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_3/ene_cartel_soldier_zeal_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					heavy_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
			},
			constantine_fsb = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					hrt_4 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"),  -- apparently this is a light swat.
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"),  -- and apparently this is a heavy swat.
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"),
					heavy_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					hrt_4 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"),
					heavy_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"),  -- wish there was a second non-camo fsb heavy
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			bo = {
				normal = {
					hrt_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
					hrt_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_r870/ene_sbz_r870"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"),
					heavy_3 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"),
					shield = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_r870/ene_ovk_r870"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"),
					heavy_3 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"),
					shield = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					hrt_4 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_g36/ene_bofa_g36"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_benelli/ene_bofa_benelli"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_ump/ene_bofa_ump"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"),
					heavy_3 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"),
					shield = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			bo_scripted = {  -- bo-force scripted spawns, not to be used for unit categories
				normal = {
					hrt_1 = Idstring("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security/ene_stockos_security"),
					hrt_2 = Idstring("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security/ene_stockos_security"),
					hrt_3 = Idstring("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security_head/ene_stockos_security_head"),
					hrt_4 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),  -- boworks day 3 friendly unit
					swat_1 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"),
					heavy_3 = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"),
					shield = Idstring("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"),
					sniper = Idstring("units/payday2/characters/ene_sniper_2/ene_sniper_2"),  -- boworks day 3 friendly unit
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),  -- boworks day 3 friendly unit
				},
			},
		}

		for _, tbl in ipairs({
			{
				easy = "normal",
				hard = "normal",
				overkill = "normal",
				overkill_145 = "normal",
			},
			{
				easy_wish = "overkill_145",
				overkill_290 = "overkill_145",
			},
			{
				sm_wish = "overkill_290",
			},
		}) do
			for diff, based_on in pairs(tbl) do
				for _, v in pairs(replacements) do
					v[diff] = v[diff] or v[based_on]
				end
			end
		end

		-- check for levels that need some faction mappings swapped
		local constantine_fsb = { "russia", "constantine_fsb", }
		local constantine_cartel = { "federales", "constantine_cartel", }
		local fucked, use
		for _, func in ipairs({
			function()  -- check level ids where package auto-detect is known not to work
				return unpack(({
					branchbank_russia = constantine_fsb,
					ruswl = constantine_fsb,
					rusdl = constantine_fsb,
					ahopl = constantine_fsb,
					crimepunishlvl = constantine_fsb,
					flatline_lvl = constantine_fsb,
					hunter_party = constantine_fsb,
					hunter_departure = constantine_fsb,
					hunter_fall = constantine_fsb,
				})[level_id] or {})
			end,
			function()  -- then check packages if not found
				local level = self.tweak_data.levels[level_id] or {}
				local packages = {}

				for _, data in pairs({
					level.package or nil,
					level.custom_packages or nil,
				}) do
					if type(data) == "table" then
						table.list_append(packages, data)
					else
						table.insert(packages, data)
					end
				end

				packages = table.list_to_set(packages)

				if next(packages) then
					for pkg, data in pairs({
						["packages/levels/constantine_cartel_faction/world/world"] = constantine_cartel,
					}) do
						if packages[pkg] then
							return unpack(data)
						end
					end
				end
			end,
		}) do
			fucked, use = func()

			if fucked and use then
				break
			end
		end

		if replacements[fucked] and replacements[use] then
			replacements["actual_" .. fucked] = replacements[fucked]
			replacements[fucked] = replacements[use]
		end

		self._enemy_replacements = replacements
	end

	if continent == true then
		return replacements
	end

	return replacements[continent] or replacements[self.tweak_data.levels:get_ai_group_type()] or replacements.america
end
