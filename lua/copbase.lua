if Network:is_client() then
	return
end

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
		"spas12",
		"ump"
	},
	hox = {
		"m4",
		"spas12"
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
		"spas12"
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
		"spas12"
	},
	bikers_female = {
		"mossberg",
		"spas12"
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
		"spas12"
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

Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)
	local weapon_swap = weapon_mapping[self._unit:name():key()]
	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end )
