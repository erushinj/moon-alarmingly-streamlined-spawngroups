if ASS:get_var("is_client") then
	return
end

-- if you're a map maker with a level using swats as pager-less guards, add it to this table
-- true = pager disabled, false = pager enabled
CharacterTweakData.moon_swat_pager_disable_map = CharacterTweakData.moon_swat_pager_disable_map or {}
CharacterTweakData.moon_swat_pager_disable_map.sample_level_id = {
	swat = true,
	fbi_swat = true,
	city_swat = true,
	zeal_swat = true,
	heavy_swat = true,
	fbi_heavy_swat = true,
	zeal_heavy_swat = true,
	heavy_swat_sniper = true,
}
local swat_pager_tweak_names = clone(CharacterTweakData.moon_swat_pager_disable_map.sample_level_id)

local level_id = ASS:get_var("level_id")
local difficulty_index = ASS:get_var("difficulty_index")
local f = (difficulty_index - 2) / 6

local shield_arms = ASS:get_var("shield_arms")
local doms_scale = ASS:get_setting("doms_scale")
local doms_all_hard = ASS:get_setting("doms_all_hard")

function CharacterTweakData:moon_oops_all_bo(is_first_world_problem)
	local flee_type = self.civilian.flee_type
	local run_away_delay = self.civilian.run_away_delay

	-- prevent bob from running away on fwb, since he replaces the normal bo spawn
	if is_first_world_problem ~= false then
		self.civilian.flee_type = self.bank_manager.flee_type
		self.civilian.run_away_delay = self.bank_manager.run_away_delay  -- nil
	end

	self.bank_manager.flee_type = flee_type
	self.bank_manager.run_away_delay = run_away_delay
end

function CharacterTweakData:moon_access_filters(preset)
	local access_filters = self._moon_access_filters

	if not access_filters then
		access_filters = {
			any = {},
			swats = {},
			specials = {},
			lightweight = {},  -- no shields/dozers
			heavyweight = {},  -- only shields/dozers
			snipers = {},
		}

		for _, data in pairs(self) do
			if type(data) == "table" then
				local access = data.access
				local tags = access and data.tags and table.list_to_set(data.tags)

				if tags and tags.law then
					access_filters.any[access] = true

					if tags.special then
						access_filters.specials[access] = true
					else
						access_filters.swats[access] = true
					end

					if tags.shield or tags.tank then
						access_filters.heavyweight[access] = true
					else
						access_filters.lightweight[access] = true
					end

					if tags.sniper or tags.marksman then
						access_filters.snipers[access] = true
					end
				end
			end
		end

		for id, data in pairs(access_filters) do
			access_filters[id] = table.map_keys(data)
		end

		self._moon_access_filters = access_filters
	end

	return access_filters[preset]
end

function CharacterTweakData:moon_weapon_mapping(name)
	local weapon_mapping = self._moon_weapon_mapping

	if not weapon_mapping then
		local shield_weapons_by_setting = {
			default = {},
			pistols = {
				swat = "c45",
				zeal = "deagle",
				russia = "deagle",
				murkywater = "deagle",
				constantine_cartel = "deagle",
			},
			smgs = {
				swat = "mp9",
				russia = "sr2_smg",
			},
			both = {
				swat = { "c45", "mp9", },
				zeal = { "deagle", "mp9", },
				russia = { "deagle", "sr2_smg", },
				murkywater = { "deagle", "mp9", },
				constantine_cartel = { "beretta92", "mp9", },
			},
		}
		local shield_weapons = shield_weapons_by_setting[shield_arms] or shield_weapons_by_setting.default
		local function get_shield_weapon(typ)
			return shield_weapons[typ] or shield_weapons.swat
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
		}
		level_overrides.short2_stage2b = level_overrides.short2_stage1

		weapon_mapping = {
			-- appropriate weaponry for unique units
			-- [("units/payday2/characters/npc_old_hoxton_prisonsuit_1/npc_old_hoxton_prisonsuit_1"):key()] = "x_c45",  -- npc hox (no mask, looks funny)
			[("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "spas12",  -- npc hox (mask)
			[("units/pd2_mcmansion/characters/ene_male_hector_1/ene_male_hector_1"):key()] = "raging_bull",  -- hector (stealth)
			[("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "deagle",  -- locke (beneath the mountain)
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

			-- shields, for "Shield Arms" setting
			[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = get_shield_weapon("swat"),
			[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = get_shield_weapon("fbi"),
			[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = get_shield_weapon("city"),
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = get_shield_weapon("zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = get_shield_weapon("russia"),
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = get_shield_weapon("russia"),
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = get_shield_weapon("russia"),
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = get_shield_weapon("swat"),
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = get_shield_weapon("fbi"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = get_shield_weapon("murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = get_shield_weapon("federales"),
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = get_shield_weapon("federales"),

			[("units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield"):key()] = get_shield_weapon("swat"),  -- custom shield units
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield"):key()] = get_shield_weapon("city"),
			[("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"):key()] = get_shield_weapon("constantine_cartel"),
			[("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = get_shield_weapon("russia") or "deagle",
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = get_shield_weapon("russia"),
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = get_shield_weapon("russia"),

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
			[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = "m4",
			[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = "c45",
			[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = "m4",
			[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = "c45",
			[("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = "spas12",
			[("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = "m4",
			[("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = "spas12",
			[("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = "m4",
			[("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = murkywater,
			[("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = murkywater,
			[("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = murkywater,
			[("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"):key()] = murkywater,
			[("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"):key()] = murkywater,
			[("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"):key()] = murkywater,
			[("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = murkywater,
			[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "m4",
			[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "spas12",
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
			[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = "raging_bull",
			[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = "c45",
			[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = "spas12",

			-- constantine scores units
			[("units/pd2_mod_ttr/characters/ene_friendly_backup_1/ene_friendly_backup_1"):key()] = "deagle",  -- friendly backup units
			[("units/pd2_mod_ttr/characters/ene_friendly_backup_1_vehicle/ene_friendly_backup_1_vehicle"):key()] = "deagle",
			[("units/pd2_mod_ttr/characters/ene_friendly_backup_2/ene_friendly_backup_2"):key()] = "deagle",
			[("units/pd2_mod_ttr/characters/ene_friendly_backup_2_vehicle/ene_friendly_backup_2_vehicle"):key()] = "deagle",
			[("units/pd2_mod_ttr/characters/ene_friendly_backup_diego_crew/ene_friendly_backup_diego_crew"):key()] = "deagle",
			-- [("units/pd2_mod_ttr/characters/ene_diego_backup/ene_diego_backup"):key()] = "deagle",  -- already uses one
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
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"):key()] = "ump",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1"):key()] = "ak47",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2"):key()] = "beretta92",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"):key()] = "r870",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4"):key()] = "ump",
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
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = "ak47",  -- specials
			[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"):key()] = "rpk_lmg",
			[("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"):key()] = "ak47",  -- rough medicdozer equivalent
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

			-- cold stones units
			[("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = "akmsu_smg",  -- security
			[("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = "deagle",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = "akmsu_smg",  -- cops/hrts
			[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"):key()] = "akmsu_smg",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = "akmsu_smg",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "ak47_ass",  -- swats
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "ak47_ass",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "asval_smg",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "ak47_ass",  -- heavies
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "ak47_ass",
		}

		local level_override = level_overrides[level_id]
		if level_override then
			for unit, weapon in pairs(level_override) do
				weapon_mapping[unit] = weapon
			end
		end

		local valid_ids = {}
		for _, id in pairs(self.weap_ids) do
			valid_ids[id] = true
		end

		local invalid_ids = {}
		for unit, weapon in pairs(weapon_mapping) do
			if type(weapon) == "table" then
				for i = #weapon, 1, -1 do
					local id = weapon[i]

					if not valid_ids[id] then
						invalid_ids[id] = true

						table.remove(weapon, i)
					end
				end

				if not next(weapon) then
					weapon_mapping[unit] = nil
				end
			else
				if not valid_ids[weapon] then
					invalid_ids[weapon] = true

					weapon_mapping[unit] = nil
				end
			end
		end

		for id in pairs(invalid_ids) do
			ASS:log("warn", "Invalid weapon ID \"%s\" in CharacterTweakData:moon_weapon_mapping", id)
		end

		self._moon_weapon_mapping = weapon_mapping
	end

	if name then
		return weapon_mapping[name]
	end

	return weapon_mapping
end

if doms_scale then
	ASS:log("info", "Resistive Responders setting enabled, tweaking \"CharacterTweakData:_presets\"...")
	ASS:post_hook( CharacterTweakData, "_presets", function(self, tweak_data)
		local presets = Hooks:GetReturn()

		if not presets then
			ASS:log("warn", "\"CharacterTweakData:_presets\" unavailable!")

			return
		end

		-- only change SH's tweaked surrender presets
		-- allow any factor to count as a surrender reason
		for _, preset in pairs(presets.surrender) do
			if preset.reasons and preset.factors and preset.factors.health then
				local min, max = math.min_max(preset.significant_chance or 0, 0.5)

				preset.significant_chance = math.lerp(min, max, f)
				preset.base_chance = 0
				preset.factors_original = preset.factors
				preset.reasons = table.map_append(preset.reasons, preset.factors)
				preset.factors = {}
			end
		end

		return presets
	end )
end

local level_funcs = {
	fex = function(self)  -- replaced secret service with the more fitting outdoor guards, but they lack pagers, so give them pagers
		self.security_mex_no_pager.has_alarm_pager = true
	end,
}
CharacterTweakData._moon_level_funcs = level_funcs

ASS:post_hook( CharacterTweakData, "init", function(self, tweak_data)
	if doms_all_hard then
		ASS:log("info", "Difficult Dominations setting enabled, changing assigned surrender presets...")
		local surrender_map = {
			[self.presets.surrender.easy] = self.presets.surrender.hard,
			[self.presets.surrender.normal] = self.presets.surrender.hard,
		}

		for _, data in pairs(self) do
			if type(data) == "table" then
				data.surrender = surrender_map[data.surrender] or data.surrender
			end
		end
	end


	local level_func = level_funcs[level_id]
	if level_func then
		level_func(self)
	end

	-- ASS makes the heavies modifier replace scripted spawns, including the Ready Team on hox revenge, so give all swats pagers by default
	local pager_disable_map = self.moon_swat_pager_disable_map[level_id] or {}
	for id in pairs(swat_pager_tweak_names) do
		local character = self[id]

		if not character then
			ASS:log("warn", "Character \"%s\" is nil!", id)
		else
			if not pager_disable_map[id] then
				character.has_alarm_pager = true
			else
				ASS:log("info", "Character \"%s\" has had alarm pagers disabled...", id)

				character.has_alarm_pager = nil
			end
		end
	end

	self:moon_weapon_mapping()
end )
