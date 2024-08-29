if ASS.is_client then
	return
end

local level_id = ASS.level_id
local difficulty_index = ASS.difficulty_index
local f = (difficulty_index - 2) / 6

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

if ASS:setting("doms_scale") then
	ASS:log("info", "Resistive Responders setting enabled, tweaking \"CharacterTweakData:_presets\"...")

	Hooks:PostHook( CharacterTweakData, "_presets", "ass__presets", function()
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

CharacterTweakData.moon_level_funcs = {
	fex = function(self)  -- replaced secret service with the more fitting outdoor guards, but they lack pagers, so give them pagers
		self.security_mex_no_pager.has_alarm_pager = true
	end,
}

local doms_all_hard = ASS:setting("doms_all_hard")
Hooks:PostHook( CharacterTweakData, "init", "ass_init", function(self)
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

	local level_func = self.moon_level_funcs[level_id]
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
custom_map_char_maps["Stalk Fraud"] = custom_map_char_maps["BOWORKS"]

local custom_char_maps = custom_map_char_maps[beardlib_map.Name]
if not custom_char_maps then
	return
end

Hooks:PostHook( CharacterTweakData, "character_map", "ass_character_map", function()
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
