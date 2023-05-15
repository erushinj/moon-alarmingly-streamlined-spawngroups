-- Make enemy units switch difficulty factions over waves
local wave_unit_categories = {
	[2] = {
		CS_cop_C45_R870 = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		CS_cop_C45_MP5 = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		CS_cop_MP5_R870 = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		CS_cop_stealth_R870 = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
		CS_swat_MP5 = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") },
		CS_swat_R870 = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") },
		CS_heavy_M4  = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") },
		CS_heavy_R870 = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") },
		CS_shield = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") },

		FBI_suit_C45_M4 = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		FBI_suit_M4_MP5 = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		FBI_suit_stealth_MP5 = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
		FBI_swat_M4 = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") },
		FBI_swat_R870 = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") },
		FBI_heavy_G36 = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") },
		FBI_heavy_R870 = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") },
		FBI_shield = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") },

		medic_M4 = { Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4") },
		medic_R870 = { Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870") },
		CS_tazer = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1") },
		spooc = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1") }
	},
	[3] = {
		FBI_suit_C45_M4 = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		},
		FBI_suit_M4_MP5 = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		FBI_suit_stealth_MP5 = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
		FBI_swat_M4 = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") },
		FBI_swat_R870 = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") },
		FBI_heavy_G36 = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") },
		FBI_heavy_R870 = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") },
		FBI_shield = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }
	},
	[4] = {
		CS_cop_C45_R870 = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		CS_cop_C45_MP5 = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		},
		CS_cop_MP5_R870 = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		CS_cop_stealth_R870 = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
		CS_swat_MP5 = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") },
		CS_swat_R870 = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") },
		CS_heavy_M4  = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") },
		CS_heavy_R870 = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") },
		CS_shield = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }
	},
	[5] = {
		FBI_swat_M4 = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") },
		FBI_swat_R870 = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") },
		FBI_heavy_G36 = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") },
		FBI_heavy_R870 = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") },
		FBI_shield = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }
	},
	[6] = {
		CS_swat_MP5 = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") },
		CS_swat_R870 = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") },
		CS_heavy_M4  = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") },
		CS_heavy_R870 = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") },
		CS_shield = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }
	},
	[7] = {
		FBI_swat_M4 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") },
		FBI_swat_R870 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2") },
		FBI_heavy_G36 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") },
		FBI_heavy_R870 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2") },
		FBI_shield = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield") },

		medic_M4 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4") },
		medic_R870 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870") },
		CS_tazer = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer") },
		spooc = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker") }
	},
	[8] = {
		CS_swat_MP5 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") },
		CS_swat_R870 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2") },
		CS_heavy_M4  = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") },
		CS_heavy_R870 = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2") },
		CS_shield = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield") }
	}
}

local first_i = 2
local last_i = 8
local first_zeal_i = 7

Hooks:PostHook( SkirmishManager, "init_finalize", "ass_init_finalize", function(self)
	if not self:is_skirmish() then
		return
	end

	local unit_categories = tweak_data.group_ai.unit_categories
	local first = wave_unit_categories[first_i]
	for category, units in pairs(first) do
		unit_categories[category].unit_types.america = units
	end
end )

local tank_mapping = {
	to_zeal = {
		[Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		[Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
		[Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
		[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	},
	from_zeal = {
		[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	}
}

Hooks:PostHook( SkirmishManager, "_apply_modifiers_for_wave", "ass__apply_modifiers_for_wave", function(self, wave_number)

	self._unit_wave_index = wave_unit_categories[wave_number] and wave_number or self._unit_wave_index or first_i
	local next_unit_wave_index = last_i
	for i = wave_number + 1, next_unit_wave_index do
		if wave_unit_categories[i] then
			next_unit_wave_index = i
			break
		end
	end

	local amount, progress
	if next_unit_wave_index == self._unit_wave_index then
		amount = 1
		progress = 0
	else
		amount = next_unit_wave_index - self._unit_wave_index
		progress = wave_number - self._unit_wave_index
	end

	local unit_categories = tweak_data.group_ai.unit_categories
	for category, units in pairs(wave_unit_categories[self._unit_wave_index]) do
		unit_categories[category].unit_types.america = units
	end

	local FBI_tank = unit_categories.FBI_tank.unit_types.america
	local mapping_type = wave_number < first_zeal_i and "from_zeal" or "to_zeal"
	for i, tank in ipairs(FBI_tank) do
		local mapped_tank = tank_mapping[mapping_type][tank:key()]

		if mapped_tank then
			FBI_tank[i] = mapped_tank
		end
	end

end )
