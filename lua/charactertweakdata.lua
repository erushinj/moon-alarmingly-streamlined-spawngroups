if ASS.is_client then
	return
end

local level_id = ASS.level_id
local difficulty_index = ASS.difficulty_index
local f = (difficulty_index - 2) / 6

local real_difficulty_index = ASS.real_difficulty_index
local shield_arms = ASS.shield_arms
local taser_dazers = ASS.taser_dazers
local cloaker_balance = ASS.cloaker_balance
local medic_ordnance = ASS.medic_ordnance
local medical_ordinance = ASS.medical_ordinance

local doms_scale = ASS:setting("doms_scale")
local doms_all_hard = ASS:setting("doms_all_hard")

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
			law = {},  -- only police
			light_law = {},  -- police, no shields/dozers
			heavy_law = {},  -- police, only shields/dozers
		}

		for _, data in pairs(self) do
			if type(data) == "table" then
				local access = data.access

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
		end

		for id, data in pairs(access_filters) do
			access_filters[id] = table.map_keys(data)
		end

		self._moon_access_filters = access_filters
	end

	return access_filters[preset]
end

-- not comprehensive (yet)
function CharacterTweakData:moon_female_civs_map(name)
	local female_civs_map = self._moon_female_civs_map

	if not female_civs_map then
		female_civs_map = table.list_to_set({
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

		self._moon_female_civs_map = female_civs_map
	end

	if name then
		return female_civs_map[name] and "female" or "male"
	end

	return female_civs_map
end

function CharacterTweakData:moon_weapon_mapping(name)
	local weapon_mapping = self._moon_weapon_mapping

	if not weapon_mapping then
		local special_weapons = {
			shield = {
				reference = shield_arms,
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
				reference = taser_dazers,
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
				reference = cloaker_balance,
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
				reference = medic_ordnance,
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
				reference = medical_ordinance,
				default = {
					swat = "r870",
					fbi = "spas12",
					zeal = "ksg",
					murkywater = "spas12",
					constantine_cartel = "saiga",
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
		}
		for special, settings in pairs(special_weapons) do
			local reference = settings.reference

			for name in pairs(settings) do
				if name ~= "reference" and name == reference then
					reference = nil
					special_weapons[special] = settings[name]

					break
				end
			end

			-- didnt find weapons, fallback on default
			if reference then
				special_weapons[special] = settings.default
			end
		end

		local function get_special_weapon(special, typ)
			local weapons = special_weapons[special]

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
			physics_citystreets = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "deagle",
				[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "ksg",
				[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "shepheard",
				[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "beretta92",
				[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "r870",
				[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = get_special_weapon("taser", "bo_sbz"),
				[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = get_special_weapon("cloaker", "bo_ovk"),
				[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "ksg",
				[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "s552",
			},
		}
		level_overrides.short2_stage2b = level_overrides.short2_stage1
		level_overrides.physics_tower = level_overrides.physics_citystreets
		level_overrides.physics_core = level_overrides.physics_citystreets

		weapon_mapping = {
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

			-- faction weaponry for some dozers
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "ksg",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "shepheard",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "spas12",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "scar_murky",

			-- shields, for "Shield Arms" setting
			[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = get_special_weapon("shield", "swat"),
			[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = get_special_weapon("shield", "fbi"),
			[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = get_special_weapon("shield", "city"),
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = get_special_weapon("shield", "zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = get_special_weapon("shield", "russia_c45"),
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = get_special_weapon("shield", "russia_sr2"),
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = get_special_weapon("shield", "russia_sr2"),
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = get_special_weapon("shield", "swat"),
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = get_special_weapon("shield", "fbi"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = get_special_weapon("shield", "murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = get_special_weapon("shield", "federales_c45"),
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = get_special_weapon("shield", "federales_mp9"),
			[("units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield"):key()] = get_special_weapon("shield", "swat"),  -- constantine scores
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield"):key()] = get_special_weapon("shield", "fbi"),
			[("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"):key()] = get_special_weapon("shield", "constantine_cartel"),
			[("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = get_special_weapon("shield", "russia_c45"),  -- constantine fsb
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = get_special_weapon("shield", "russia_sr2"),
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = get_special_weapon("shield", "russia_sr2"),
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"):key()] = get_special_weapon("shield", "bo_sbz"),  -- boworks
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_mp9/ene_sbz_shield_mp9"):key()] = get_special_weapon("shield", "bo_sbz"),
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_c45/ene_ovk_shield_c45"):key()] = get_special_weapon("shield", "bo_ovk"),
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"):key()] = get_special_weapon("shield", "bo_ovk"),
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_c45/ene_bofa_shield_c45"):key()] = get_special_weapon("shield", "bo_bofa"),
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"):key()] = get_special_weapon("shield", "bo_bofa"),
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"):key()] = get_special_weapon("shield", "bo_bofa"),

			-- tasers, for "Taser Dazers" setting
			[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = get_special_weapon("taser", "swat"),
			[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = get_special_weapon("taser", "zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = get_special_weapon("taser", "russia"),
			[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = get_special_weapon("taser", "swat"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = get_special_weapon("taser", "murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = get_special_weapon("taser", "federales"),
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = get_special_weapon("taser", "constantine_cartel"),  -- constantine scores
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"):key()] = get_special_weapon("taser", "constantine_cartel"),
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_taser/ene_bofa_taser"):key()] = get_special_weapon("taser", "bo_sbz"),  -- boworks

			-- cloakers, for "Cloaker Balance" setting
			[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = get_special_weapon("cloaker", "fbi"),
			[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = get_special_weapon("cloaker", "zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = get_special_weapon("cloaker", "russia"),
			[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = get_special_weapon("cloaker", "fbi"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = get_special_weapon("cloaker", "murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = get_special_weapon("cloaker", "federales"),
			[("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"):key()] = get_special_weapon("cloaker", "constantine_cartel"),  -- constantine scores

			-- rifle medics, for "Medic Ordnance" setting
			[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = get_special_weapon("medic_rifle", "fbi"),  -- rifle
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = get_special_weapon("medic_rifle", "zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = get_special_weapon("medic_rifle", "russia"),
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = get_special_weapon("medic_rifle", "fbi"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = get_special_weapon("medic_rifle", "murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = get_special_weapon("medic_rifle", "federales"),
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"):key()] = get_special_weapon("medic_rifle", "constantine_cartel"),  -- constantine scores, not actually a medic but eh
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"):key()] = get_special_weapon("medic_rifle", "bo_ovk"),  -- boworks

			-- shotgun medics, for "Medical Ordinance" setting
			[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = get_special_weapon("medic_shotgun", "fbi"),  -- shotgun
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = get_special_weapon("medic_shotgun", "zeal"),
			[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = get_special_weapon("medic_shotgun", "russia"),
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = get_special_weapon("medic_shotgun", "fbi"),
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = get_special_weapon("medic_shotgun", "murkywater"),
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = get_special_weapon("medic_shotgun", "federales"),
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"):key()] = get_special_weapon("medic_shotgun", "constantine_cartel"),  -- constantine scores, not actually a medic but eh
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"):key()] = get_special_weapon("medic_shotgun", "bo_ovk"),  -- boworks,

			-- assorted law
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "deagle",
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

			-- constantine russia campaign units
			[("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = "akmsu_smg",  -- general, security
			[("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = "deagle",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = "akmsu_smg",  -- cops/hrts
			[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "r870",
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
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "r870",
			[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "ak47_ass",
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
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"):key()] = "s552",

			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"):key()] = "shepheard",  -- heavies
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"):key()] = "ksg",
			-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"):key()] = "m4",
			-- [("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"):key()] = "r870",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"):key()] = "s552",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"):key()] = "benelli",
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"):key()] = "s552",

			[("units/pd2_mod_bofa/characters/misc_units/ene_stockos_security/ene_stockos_security"):key()] = "shepheard",  -- security
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
		else
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
end )

-- add missing custom heist units to the character map
-- some of them go to copbase to add materials directly, but this does not work for my purposes
local beardlib_map = BeardLib and BeardLib.current_level and BeardLib.current_level._mod
if not beardlib_map then
	return
end

local try_insert = ASS:require("try_insert", true)
local custom_map_char_maps = {
	["Mallbank"] = {  -- crashing capitol
		friday = {
			path = "units/pd2_mod_friday/characters/",
			list = {
				"npc_manager",
				"ene_security_fri_1",
				"ene_security_fri_2",
				"ene_security_fri_3",
				"ene_security_fri_4",
				"ene_security_fri_5",
			},
		},
	},
	["Flatline"] = {
		basic = {
			list = {
				"npc_backup_2",
			},
		},
	},
	["A House of Pleasure"] = {
		basic = {
			list = {
				"npc_backup_2",
				"ene_russian_club_owner_stealth",
			},
		},
	},
	["BOWORKS"] = {  -- why.
		bofa_misc = {
			path = "units/pd2_mod_bofa/characters/misc_units/",
			list = {
				"ene_stockos_security",
				"ene_stockos_security_head",
			},
		},
		bofa_swat = {
			path = "units/pd2_mod_bofa/characters/sbz_units/",
			list = {
				"ene_sbz_mp5",
				"ene_sbz_r870",
				"ene_sbz_heavy_m4",
				"ene_sbz_heavy_r870",
				"ene_sbz_shield_c45",
				"ene_sbz_shield_mp9",
			},
		},
		bofa_fbi = {
			path = "units/pd2_mod_bofa/characters/ovk_units/",
			list = {
				"ene_ovk_m4",
				"ene_ovk_r870",
				"ene_ovk_heavy_m4",
				"ene_ovk_heavy_r870",
				"ene_ovk_shield_c45",
				"ene_ovk_shield_mp9",
			},
		},
		bofa_city = {
			path = "units/pd2_mod_bofa/characters/bofa_units/",
			list = {
				"ene_bofa_g36",
				"ene_bofa_benelli",
				"ene_bofa_ump",
				"ene_bofa_r870",
				"ene_bofa_heavy_g36",
				"ene_bofa_heavy_r870",
				"ene_bofa_shield_c45",
				"ene_bofa_shield_mp9",
			},
		},
		bofa_zeal = {
			path = "units/pd2_mod_bofa/characters/bofa_zeal_units/",
			list = {
				"ene_bofa_zeal",
				"ene_bofa_zeal_heavy",
				"ene_bofa_zeal_shield",
			},
		},
		bofa_specials = {
			path = "units/pd2_mod_bofa/characters/special_units/",
			list = {
				"ene_bofa_medic_m4",
				"ene_bofa_medic_r870",
				"ene_bofa_sniper",
				"ene_bofa_taser",  -- unused but whatever
			},
		},
	},
	["Constantine Scores"] = {  -- dear god
		triadyacht = {
			path = "units/pd2_mod_ttr/characters/",
			list = {
				"ene_agent_soldier_2",
				"ene_agent_soldier_3",
				"ene_cartel_bulldozer_2",
				"ene_cartel_bulldozer_3",
				"ene_cartel_commando",
				"ene_cartel_grenadier",
				"ene_cartel_shield",
				"ene_cartel_soldier_fbi_1",
				"ene_cartel_soldier_city_1",
				"ene_cartel_soldier_zeal_1",
				"ene_cartel_soldier_shotgun_1",
				"ene_cartel_soldier_fbi_shotgun_1",
				"ene_cartel_soldier_city_shotgun_1",
				"ene_cartel_soldier_2",
				"ene_cartel_soldier_fbi_2",
				"ene_cartel_soldier_city_2",
				"ene_cartel_soldier_zeal_2",
				"ene_cartel_soldier_shotgun_2",
				"ene_cartel_soldier_fbi_shotgun_2",
				"ene_cartel_soldier_city_shotgun_2",
				"ene_cartel_soldier_3",
				"ene_cartel_soldier_fbi_3",
				"ene_cartel_soldier_city_3",
				"ene_cartel_soldier_zeal_3",
				"ene_cartel_soldier_shotgun_3",
				"ene_cartel_soldier_fbi_shotgun_3",
				"ene_cartel_soldier_city_shotgun_3",
				"ene_cartel_soldier_4",
				"ene_cartel_soldier_fbi_4",
				"ene_cartel_soldier_city_4",
				"ene_cartel_soldier_zeal_4",
				"ene_cartel_soldier_shotgun_4",
				"ene_cartel_soldier_fbi_shotgun_4",
				"ene_cartel_soldier_city_shotgun_4",
				"ene_cartel_soldier_heavy_fbi",
				"ene_cartel_soldier_heavy_city",
				"ene_cartel_soldier_heavy_zeal",
				"ene_cartel_soldier_heavy_shotgun",
				"ene_cartel_soldier_heavy_fbi_shotgun",
				"ene_cartel_tazer_normal",
				"ene_diego_backup",
				"ene_friendly_backup_1_vehicle",
				"ene_friendly_backup_2",
				"ene_friendly_backup_2_vehicle",
				"ene_friendly_security_winter_1",
				"ene_gang_mobster_5_pager",
				"ene_gang_mobster_6_pager",
				"ene_gang_mobster_armored_2",
				"ene_swat_gensec_1",
				"ene_fbi_gensec_1",
				"ene_zeal_gensec_1",
				"ene_swat_gensec_2",
				"ene_fbi_gensec_2",
				"ene_swat_gensec_heavy_1",
				"ene_fbi_gensec_heavy",
				"ene_zeal_gensec_heavy_1",
				"ene_swat_gensec_heavy_2",
				"ene_fbi_gensec_heavy_r870",
				"ene_city_heavy_r870",
				"ene_swat_gensec_shield",
				"ene_fbi_gensec_shield",
				"ene_marshal_gensec_shield",
			},
		},
	},
}
custom_map_char_maps["Hunter and Hunted"] = custom_map_char_maps["Flatline"]

local custom_char_maps = custom_map_char_maps[beardlib_map.Name]
if not custom_char_maps then
	return
end

ASS:post_hook( CharacterTweakData, "character_map", function()
	local char_map = Hooks:GetReturn()

	if not char_map then
		ASS:log("error", "CharacterTweakData:character_map is broken by another mod!")
	else
		for name, data in pairs(custom_char_maps) do
			local map = char_map[name] or {}
			map.path = map.path or data.path or ""
			map.list = map.list or {}

			for _, unit in pairs(data.list) do
				try_insert(map.list, unit)
			end

			char_map[name] = map
		end
	end

	return char_map
end )
