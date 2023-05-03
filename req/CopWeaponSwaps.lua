local CopWeaponSwaps = {}

local is_undercover = Global.level_data and Global.level_data.level_id == "man" or Global.game_settings and Global.game_settings.level_id == "man"
local is_panic_room = Global.level_data and Global.level_data.level_id == "flat" or Global.game_settings and Global.game_settings.level_id == "flat"

local panic_room = {
	"c45",
	"raging_bull",
	"mac11",
	"ak47",
	"r870",
	"mossberg"
}

local sh_spas12_r870 = StreamHeist and "spas12" or "r870"
local sh_spas12_benelli = StreamHeist and "spas12" or "benelli"

local security = {
	basic = {
		"c45",
		"mp5"
	},
	heavy = {
		"mp5",
		"r870"
	},
	murkywater = {
		"scar_murky",
		sh_spas12_benelli,
		"ump"
	},
	hox = {
		"m4",
		sh_spas12_r870
	},
	fbi_office = {
		"raging_bull",
		"m4"
	},
	triads = {
		"raging_bull",
		"m4"
	},
	ranc = {
		"raging_bull",
		"m4",
		sh_spas12_r870
	}
}
local gangsters = {
	bikers_slim = {
		"c45",
		"mac11",
		"mossberg"
	},
	bikers_fat = {
		"raging_bull",
		"m4",
		sh_spas12_r870
	},
	bikers_female = {
		"mossberg",
		sh_spas12_r870
	},
	mexicans_slim = is_panic_room and panic_room or  {
		"c45",
		"raging_bull"
	},
	mexicans_fat = is_panic_room and panic_room or  {
		"ak47",
		"r870"
	},
	cobras = is_undercover and clone(security.fbi_office) or is_panic_room and panic_room or {
		"c45",
		"mac11",
		"mossberg"
	},
	russians_bruiser = is_panic_room and panic_room or  {
		"c45",
		"mac11"
	},
	russians_enforcer = is_panic_room and panic_room or  {
		"ak47",
		"mossberg"
	},
	mobsters_bruiser = {
		"raging_bull",
		"ak47"
	},
	mobsters_enforcer = {
		"ak47",
		"r870"
	},
	sosa_outdoor = {
		"raging_bull",
		"ak47"
	},
	sosa_indoor = {
		"ak47",
		"r870"
	},
	mex = {
		"raging_bull",
		"ak47",
		"mossberg"
	},
	fex = {
		"ak47",
		"mossberg"
	},
	triads_street = {
		"raging_bull",
		"mp5",
		"r870"
	},
	triads_suit = {
		"m4",
		sh_spas12_r870
	}
}

local weapon_mapping = {
	-- assorted basic security
	[Idstring("units/payday2/characters/ene_security_1/ene_security_1"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_security_2/ene_security_2"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_security_4/ene_security_4"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_security_5/ene_security_5"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_security_6/ene_security_6"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_security_8/ene_security_8"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = security.basic,
	[Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = security.basic,
	[Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01"):key()] = security.basic,
	[Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_02/ene_male_office_cop_02"):key()] = security.basic,
	[Idstring("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = security.basic,

	-- assorted "heavy" security
	[Idstring("units/payday2/characters/ene_security_3/ene_security_3"):key()] = security.heavy,
	[Idstring("units/payday2/characters/ene_security_7/ene_security_7"):key()] = security.heavy,
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = security.heavy,
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_03/ene_male_office_cop_03"):key()] = security.heavy,
	[Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_04/ene_male_office_cop_04"):key()] = security.heavy,

	-- hoxton breakout/revenge guards
	[Idstring("units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1"):key()] = security.hox,
	[Idstring("units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1"):key()] = security.hox,

	-- black cat and mountain master penthouse security
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = security.triads,
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = security.triads,
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = security.triads,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = security.triads,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = security.triads,

	-- midland ranch security
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = security.ranc,
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = security.ranc,
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = security.ranc,

	-- fbi office agents (hoxton breakout day 2, undercover)
	[Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = security.fbi_office,
	[Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = security.fbi_office,

	-- murkywater
	[Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = security.murkywater,
	[Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = security.murkywater,
	[Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = security.murkywater,
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"):key()] = security.murkywater,
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"):key()] = security.murkywater,
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"):key()] = security.murkywater,
	[Idstring("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = security.murkywater,

	-- bikers
	[Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = gangsters.bikers_slim,
	[Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = gangsters.bikers_fat,
	[Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = gangsters.bikers_slim,
	[Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = gangsters.bikers_fat,
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = gangsters.bikers_female,
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = gangsters.bikers_female,
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = gangsters.bikers_female,

	-- mexican gangsters
	[Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = gangsters.mexicans_fat,
	[Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = gangsters.mexicans_fat,
	[Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = gangsters.mexicans_slim,
	[Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = gangsters.mexicans_slim,

	-- russian gangsters (launch)
	[Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = gangsters.russians_enforcer,
	[Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = gangsters.russians_bruiser,
	[Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = gangsters.russians_enforcer,
	[Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = gangsters.russians_bruiser,
	[Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = gangsters.russians_enforcer,

	-- cobras (fbi agents on undercover, gangsters otherwise)
	[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = gangsters.cobras,
	[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = gangsters.cobras,
	[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = gangsters.cobras,
	[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = gangsters.cobras,

	-- russian mobsters (hotline miami)
	[Idstring("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1"):key()] = gangsters.mobsters_bruiser,
	[Idstring("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2"):key()] = gangsters.mobsters_enforcer,
	[Idstring("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3"):key()] = gangsters.mobsters_bruiser,
	[Idstring("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4"):key()] = gangsters.mobsters_enforcer,

	-- panic room guy that isnt chavez
	[Idstring("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"):key()] = panic_room,

	-- sosa cartel (scarface mansion)
	[Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = gangsters.sosa_outdoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = gangsters.sosa_outdoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = gangsters.sosa_outdoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = gangsters.sosa_indoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = gangsters.sosa_indoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = gangsters.sosa_indoor,
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = gangsters.sosa_indoor,

	-- mexican security (border crossing)
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"):key()] = gangsters.mex,
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_thug_outdoor_02/ene_mex_thug_outdoor_02"):key()] = gangsters.mex,

	[Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_dog_mask/ene_guard_dog_mask"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_dog_mask_no_pager/ene_guard_dog_mask_no_pager"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_jaguar_mask/ene_guard_jaguar_mask"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_jaguar_mask_no_pager/ene_guard_jaguar_mask"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_owl_mask/ene_guard_owl_mask"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_owl_mask_no_pager/ene_guard_owl_mask_no_pager"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_serpent_mask/ene_guard_serpent_mask"):key()] = gangsters.fex,
	[Idstring("units/pd2_dlc_fex/characters/ene_guard_serpent_mask_no_pager/ene_guard_serpent_mask_no_pager"):key()] = gangsters.fex,

	-- street triads (dragon heist, mostly)
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = gangsters.triads_street,
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = gangsters.triads_street,
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = gangsters.triads_street,
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = gangsters.triads_street,
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = gangsters.triads_street,

	-- suit triads (black cat and mountain master penthouse)
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = gangsters.triads_suit,
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = gangsters.triads_suit,
}

local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

function CopWeaponSwaps.old_style_streamlined()
	local weapon_mapping = clone(weapon_mapping)

	local to_append = {
		[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "m4",
		[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "spas12",

		[Idstring("units/pd2_dlc_born/characters/ene_gang_biker_boss/ene_gang_biker_boss"):key()] = "spas12",

		[Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "mp5",
		[Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "r870",

		[Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "mp5",
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "shepheard",
		[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "mp5",
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "scar_murky",
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "mp5",

		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "ksg",
		[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "shepheard",
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "spas12",
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "scar_murky"
	}

	for unit, swap in pairs(to_append) do
		weapon_mapping[unit] = swap
	end

	return weapon_mapping
end

function CopWeaponSwaps.van_style_streamlined()
	return CopWeaponSwaps.old_style_streamlined()
end

function CopWeaponSwaps.old_style_vanilla()
	local weapon_mapping = clone(weapon_mapping)

	local fbi = difficulty_index > 3
	local city = difficulty_index > 5
	local zeal = difficulty_index > 7

	local light_rifle = zeal and "mp5" or city and "g36" or fbi and "m4" or "mp5"
	local heavy_rifle = zeal and "m4" or light_rifle
	local hrt_rifle = fbi and "m4" or "mp5"

	local light_shotgun = city and "benelli" or "r870"
	local heavy_shotgun = zeal and "r870" or light_shotgun
	local hrt_shotgun = zeal and "r870" or fbi and "mp5" or "r870"

	local shield_weapon = fbi and "mp9" or "c45"

	local to_append = {
		[Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = hrt_shotgun,
		[Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = hrt_rifle,
		[Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = hrt_rifle,
		[Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = hrt_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = hrt_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = hrt_shotgun,

		[Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = light_rifle,
		[Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = light_shotgun,
		[Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = light_rifle,
		[Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = light_shotgun,
		[Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = light_rifle,
		[Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = light_shotgun,
		[Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = light_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = light_shotgun,
		[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = light_rifle,
		[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = light_shotgun,

		[Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = heavy_rifle,
		[Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = heavy_shotgun,
		[Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = heavy_rifle,
		[Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = heavy_shotgun,
		[Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = heavy_rifle,
		[Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = heavy_shotgun,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = heavy_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = heavy_shotgun,

		[Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = shield_weapon,
		[Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = shield_weapon,
		[Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = shield_weapon,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = shield_weapon,

		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "m4_yellow",
		[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "m4_yellow"
	}

	for unit, swap in pairs(to_append) do
		weapon_mapping[unit] = swap
	end

	return weapon_mapping
end

function CopWeaponSwaps.van_style_vanilla()
	return CopWeaponSwaps.old_style_vanilla()
end

return CopWeaponSwaps
