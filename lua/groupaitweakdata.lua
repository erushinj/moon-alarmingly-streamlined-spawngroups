local sss = BLT.Mods:GetModByName("Super Serious Shooter")
local is_super_serious = sss and sss:IsEnabled() and true
local supported_continents = table.set("america", "russia", "zombie", "murkywater", "federales")
local difficulty_index = ASS:get_var("difficulty_index")
local f = (difficulty_index - 2) / 6

function GroupAITweakData:moon_swap_units(prefixes)
	local tweak_data = self.tweak_data
	local enemy_replacements, enemy_mapping = tweak_data.levels:moon_enemy_replacements(), tweak_data.levels:moon_enemy_mapping()

	for prefix, difficulty in pairs(prefixes) do
		for id, data in pairs(self.unit_categories) do
			if id:match(prefix) then
				for _, units in pairs(data.unit_types) do
					for i = 1, #units do
						local unit = units[i]
						local mapped = enemy_mapping[unit:key()]
						local replacement = enemy_replacements[difficulty] and enemy_replacements[difficulty][mapped]

						if replacement and unit ~= replacement then
							units[i] = replacement
						end
					end
				end
			end
		end
	end

	self.moon_last_prefixes = prefixes
end

-- deprecated name
GroupAITweakData._moon_swap_units = GroupAITweakData.moon_swap_units

function GroupAITweakData:_moon_init_unit_categories_normal()
	self:moon_swap_units({ CS = "normal", FBI = "normal", })
end

function GroupAITweakData:_moon_init_unit_categories_hard()
	self:_moon_init_unit_categories_normal()
end

function GroupAITweakData:_moon_init_unit_categories_overkill()
	self:moon_swap_units({ CS = "normal", FBI = "overkill_145", })

	table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
	table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
	table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"))
	table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"))
	table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"))
end

function GroupAITweakData:_moon_init_unit_categories_overkill_145()
	self:moon_swap_units({ CS = "overkill_145", FBI = "overkill_145", })
end

function GroupAITweakData:_moon_init_unit_categories_easy_wish()
	self:moon_swap_units({ CS = "overkill_145", FBI = "overkill_290", })
end

function GroupAITweakData:_moon_init_unit_categories_overkill_290()
	self:moon_swap_units({ CS = "overkill_290", FBI = "overkill_290", })

	if not ASS:get_setting("minigun_dozers") then
		table.delete(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.delete(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.delete(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.delete(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.delete(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
	end
end

function GroupAITweakData:_moon_init_unit_categories_sm_wish()
	self:moon_swap_units({ CS = "sm_wish", FBI = "sm_wish", })
end

function GroupAITweakData:_moon_level_mod_CS_normal()
	self:moon_swap_units({ CS = "CS_normal", FBI = "CS_normal", })
end

function GroupAITweakData:_moon_level_mod_CS_FBI_overkill()
	self:moon_swap_units({ CS = "CS_normal", FBI = "FBI_overkill_145", })
end

function GroupAITweakData:_moon_level_mod_FBI_overkill_145()
	self:moon_swap_units({ CS = "FBI_overkill_145", FBI = "FBI_overkill_145", })
end

function GroupAITweakData:_moon_level_mod_FBI_office()
	self:_moon_level_mod_FBI_overkill_145()

	self.unit_categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
		Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
	}
	self.unit_categories.CS_cop_C45_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
		Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
		Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"),
		Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"),
	}
	self.unit_categories.CS_cop_MP5_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"),
		Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"),
		Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"),
		Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"),
	}
	self.unit_categories.CS_cop_C45.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
		Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
	}
	self.unit_categories.CS_cop_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"),
		Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"),
		Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"),
		Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"),
	}
	self.unit_categories.CS_cop_stealth_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"),
		Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"),
	}
end

function GroupAITweakData:_moon_level_mod_FBI_mcmansion()
	self:moon_swap_units({ CS = "FBI_mcmansion", FBI = "FBI_overkill_145", })
end

function GroupAITweakData:_moon_level_mod_FBI_CITY_easy_wish()
	self:moon_swap_units({ CS = "FBI_overkill_145", FBI = "CITY_overkill_290", })
end

function GroupAITweakData:_moon_level_mod_CITY_overkill_290()
	self:moon_swap_units({ CS = "CITY_overkill_290", FBI = "CITY_overkill_290", })
end

function GroupAITweakData:_moon_set_weights(new_weights)
	for task, new_groups in pairs(new_weights) do
		local groups = self.besiege[task].groups

		for group in pairs(groups) do
			groups[group] = { 0, 0, 0, }
		end

		for group, weights in pairs(new_groups) do
			groups[group] = weights
		end
	end
end

function GroupAITweakData:_moon_super_serious_tweaks()
	local unit_mapping = {
		CS_tazer = {
			rifle = "CS_heavy_MP5",
			shotgun = "CS_heavy_R870",
			default = "CS_shield",
		},
		FBI_tazer = {
			rifle = "FBI_heavy_M4",
			shotgun = "FBI_heavy_R870",
			default = "FBI_shield",
		},
		CS_spooc = {
			rifle = "CS_cop_MP5",
			shotgun = "CS_cop_stealth_R870",
			default = "CS_cop_MP5_R870",
			chicken_plate = "CS_heavy_MP5_R870",
		},
		FBI_spooc = {
			rifle = "FBI_suit_M4",
			shotgun = "FBI_suit_stealth_R870",
			default = "FBI_suit_M4_MP5",
			chicken_plate = "FBI_heavy_M4_R870",
		},
		CS_tank = {
			default = "CS_heavy_MP5_R870",
			chicken_plate = "CS_shield",
		},
		FBI_tank = {
			default = "FBI_heavy_M4_R870",
			chicken_plate = "FBI_shield",
		},
		CS_medic_MP5 = {
			default = "CS_cop_MP5",
			chicken_plate = "CS_heavy_MP5",
		},
		CS_medic_R870 = {
			default = "CS_cop_stealth_R870",
			chicken_plate = "CS_heavy_R870",
		},
		CS_medic_MP5_R870 = {
			default = "CS_cop_MP5_R870",
			chicken_plate = "CS_heavy_MP5_R870",
		},
		FBI_medic_M4 = {
			default = "FBI_suit_M4",
			chicken_plate = "FBI_heavy_M4",
		},
		FBI_medic_R870 = {
			default = "FBI_suit_stealth_R870",
			chicken_plate = "FBI_heavy_R870",
		},
		FBI_medic_M4_R870 = {
			default = "FBI_suit_M4_MP5",
			chicken_plate = "FBI_heavy_M4_R870",
		},
		-- just in case SSS reenables marshals at any point
		marshal_marksman = { default = "FBI_heavy_M4", },
		marshal_shield = { default = "FBI_shield", },
	}
	unit_mapping.medic_M4 = unit_mapping.FBI_medic_M4
	unit_mapping.medic_R870 = unit_mapping.FBI_medic_R870
	unit_mapping.spooc = unit_mapping.FBI_spooc
	unit_mapping.FBI_marshal_marksman = unit_mapping.marshal_marksman
	unit_mapping.FBI_marshal_shield = unit_mapping.marshal_shield

	local type_mapping = {
		spooc = "shotgun",
		shotgun = "shotgun",
		charge = "shotgun",
		recon = "shotgun",
		rifle = "rifle",
		ranged = "rifle",
		flank = "rifle",
		rescue = "rifle",
		chicken_plate = "chicken_plate",
	}

	for id, data in pairs(self.enemy_spawn_groups) do
		local unit_type = nil

		for name, typ in pairs(type_mapping) do
			if id:match(name) then
				unit_type = typ
			end
		end

		for _, enemy in ipairs(data.spawn) do
			local mapped = unit_mapping[enemy.unit]
			local mapped_unit = mapped and (mapped[unit_type] or mapped.default)

			if mapped_unit then
				enemy.unit = mapped_unit
			end
		end
	end
end

function GroupAITweakData:_moon_original(special_weight)
	self.enemy_spawn_groups.original_swats_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_swat_MP5",
				tactics = self._tactics.original_rifle,
				-- amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_swat_MP5",
				tactics = self._tactics.original_rifle_flank,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_swat_R870",
				tactics = self._tactics.original_shotgun,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_cop_C45_R870",
				tactics = self._tactics.original_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}
	self.enemy_spawn_groups.original_swats_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.original_rifle,
				-- amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.original_rifle_flank,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.original_shotgun,
				-- amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.original_shotgun_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_M4_R870",
				tactics = self._tactics.original_rifle_flank,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}

	self.enemy_spawn_groups.original_heavys_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.original_rifle,
				-- amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.original_rifle_flank,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_heavy_R870",
				tactics = self._tactics.original_shotgun,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = self._tactics.original_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}
	self.enemy_spawn_groups.original_heavys_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.original_rifle,
				-- amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.original_rifle_flank,
				-- amount_max = 1,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.original_shotgun,
				-- amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.original_shotgun_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_M4_R870",
				tactics = self._tactics.original_rifle_flank,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}

	self.enemy_spawn_groups.original_shields_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_shield",
				tactics = self._tactics.original_shield_ranged,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.original_shield_ranged_cover,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_shields_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.original_shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.original_shield_charge_cover,
				-- amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.original_shield_charge_cover,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_suit_M4_MP5",
				tactics = self._tactics.original_shield_charge_cover,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.original_shield_charge_cover,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.original_tazers_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.original_tazer,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = self._tactics.original_tazer_shield,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_tazers_b = {
		amount = { 2, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = self._tactics.original_tazer,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = self._tactics.original_tazer_shield,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = self._tactics.original_tazer_shield,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.original_tazer_shield,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.original_tanks_a = {
		amount = { 1, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_tank",
				tactics = self._tactics.original_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_R870",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.original_tanks_b = {
		amount = { 2, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_tank",
				tactics = self._tactics.original_tank,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = self._tactics.original_tank_cover,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.common,
			},
		},
	}

	self.enemy_spawn_groups.original_spoocs_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_spooc",
				tactics = self._tactics.original_spooc,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_spoocs_b = {
		amount = { 2, 2, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_spooc",
				tactics = self._tactics.original_spooc,
				amount_min = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.original_spooc,
				amount_max = 1,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.original_recon_a = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_MP5",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = self._tactics.empty,
				-- amount_max = 1,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.original_recon_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = self._tactics.empty,
				-- amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.original_recon_c = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = self._tactics.empty,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}
	self.enemy_spawn_groups.original_recon_d = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.empty,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.original_reenforce_a = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_R870",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_reenforce_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_MP5_R870",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = self._tactics.empty,
				amount_max = 1,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.original_reenforce_c = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_R870",
				tactics = self._tactics.empty,
				amount_max = 1,
				freq = self._freq.common,
			},
		},
	}

	self:_moon_set_weights({
		assault = {
			original_swats_a = { 6.75, 3.375, 0, },
			original_swats_b = { 6.75, 10.125, 13.5, },
			original_heavys_a = { 6.75, 3.375, 0, },
			original_heavys_b = { 6.75, 10.125, 13.5, },
			original_shields_a = { 0, special_weight, 0, },
			original_shields_b = { 0, 0, special_weight * 2, },
			original_tazers_a = { 0, special_weight, 0, },
			original_tazers_b = { 0, 0, special_weight * 2, },
			original_tanks_a = { 0, special_weight * 0.5, 0, },
			original_tanks_b = { 0, 0, special_weight, },
			original_spoocs_a = { 0, special_weight * 0.5, 0, },
			original_spoocs_b = { 0, 0, special_weight, },
			original_recon_d = { 0, special_weight * 0.1, special_weight * 0.2, },
		},
		recon = {
			original_swats_a = { 0, 0, 0, },
			original_swats_b = { 0, 0, 0, },
			original_spoocs_a = { 0, 0, 0, },
			original_spoocs_b = { 0, 0, 0, },
			original_recon_a = { 1, 1, 0, },
			original_recon_b = { 0, 1, 1, },
			original_recon_c = { 0, 0, 1, },
			original_recon_d = { 0, 0, 0, },
		},
		reenforce = {
			original_reenforce_a = { 1, 1, 0, },
			original_reenforce_b = { 0, 1, 1, },
			original_reenforce_c = { 0, 0, 1, },
		},
	})
end

function GroupAITweakData:_moon_streamlined(special_weight)
	local unit_names_map = {
		FBI_swat_M4 = "CS_swat_MP5",
		FBI_swat_R870 = "CS_swat_R870",
		FBI_heavy_M4 = "CS_heavy_MP5",
		FBI_heavy_R870 = "CS_heavy_R870",
	}

	-- copies a group, then removes units that arent lights or heavies, lowers heavy frequency,
	-- and ensures a spawn point check reference is set
	local function no_medic_group(original_group)
		local g = deep_clone(original_group)

		for i = #g.spawn, 1, -1 do
			local enemy = g.spawn[i]
			local mapped_unit = unit_names_map[enemy.unit]

			if mapped_unit then
				enemy.unit = mapped_unit

				if enemy.unit:match("heavy") then
					enemy.freq = self._freq.common
				end
			else
				table.remove(g.spawn, i)
			end
		end

		return g
	end

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_shotgun_rush)

	self.enemy_spawn_groups.tac_swat_shotgun_flank = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_shotgun_flank)

	self.enemy_spawn_groups.tac_swat_rifle = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.swat_rifle,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = self._tactics.swat_rifle,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.tac_swat_rifle_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_rifle)

	self.enemy_spawn_groups.tac_swat_rifle_flank = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.swat_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_rifle_flank)

	self.enemy_spawn_groups.tac_shield_wall_ranged = {
		amount = { 4, 5, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = self._tactics.shield_wall_ranged,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.shield_support_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.shield_support_ranged,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = self._tactics.shield_support_ranged,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}
	self.enemy_spawn_groups.tac_shield_wall = self.enemy_spawn_groups.tac_shield_wall_ranged

	self.enemy_spawn_groups.tac_shield_wall_charge = {
		amount = { 4, 5, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = self._tactics.shield_wall_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.shield_support_charge,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.shield_support_charge,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = self._tactics.shield_support_charge,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.tac_tazer_flanking = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = self._tactics.tazer_flanking,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.tazer_shield,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = self._tactics.tazer_shield,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.tac_tazer_charge = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = self._tactics.tazer_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.tazer_shield,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = self._tactics.tazer_shield,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.tac_bull_rush = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = self._tactics.tank_rush,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.tank_cover,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.tank_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.tank_cover,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.FBI_spoocs = {
		amount = { 1, 2, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_spooc",
				tactics = self._tactics.spooc,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.spooc,
				amount_max = 1,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.hostage_rescue = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_R870",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = self._tactics.swat_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.reenforce_init = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_MP5",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.reenforce_light = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_R870",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.reenforce_heavy = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_R870",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}

	self:_moon_set_weights({
		assault = {
			tac_swat_shotgun_rush = { 2, 3, 4, },
			tac_swat_shotgun_rush_no_medic = { 2, 1, 0, },
			tac_swat_shotgun_flank = { 1, 1.5, 2, },
			tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0, },
			tac_swat_rifle = { 7, 10.5, 14, },
			tac_swat_rifle_no_medic = { 7, 3.5, 0, },
			tac_swat_rifle_flank = { 3.5, 5.25, 7, },
			tac_swat_rifle_flank_no_medic = { 3.5, 1.75, 0, },
			tac_shield_wall_ranged = { 0, special_weight * 0.5, special_weight, },
			tac_shield_wall_charge = { 0, special_weight * 0.5, special_weight, },
			tac_tazer_flanking = { 0, special_weight * 0.5, special_weight, },
			tac_tazer_charge = { 0, special_weight * 0.5, special_weight, },
			tac_bull_rush = { 0, special_weight * 0.5, special_weight, },
			FBI_spoocs = { 0, special_weight * 0.5, special_weight, },
		},
		recon = {
			hostage_rescue = { 1, 1, 1, },
			FBI_spoocs = { 0, 0, 0, },
		},
		reenforce = {
			reenforce_init = { 1, 0, 0, },
			reenforce_light = { 0, 1, 0, },
			reenforce_heavy = { 0, 0, 1, },
		},
	})
end

function GroupAITweakData:_moon_default(special_weight)
	local id_matches = table.set("no_medic", "rescue", "reenforce")
	local unit_names_map = {
		FBI_swat_M4 = "CS_swat_MP5",
		FBI_swat_R870 = "CS_swat_R870",
		FBI_heavy_M4 = "CS_heavy_MP5",
		FBI_heavy_G36 = "CS_heavy_MP5",
		FBI_heavy_R870 = "CS_heavy_R870",
		FBI_suit_C45_M4 = "CS_cop_C45_MP5",
		FBI_suit_M4_MP5 = "CS_cop_MP5_R870",
		FBI_suit_M4_R870 = "CS_cop_MP5_R870",
	}
	local default_medic_freq = difficulty_index / 16
	local medic_freq = {
		flank = difficulty_index / 20,
		shield = difficulty_index / 32,
	}

	for id, data in pairs(self.enemy_spawn_groups) do
		for i = #data.spawn, 1, -1 do
			local enemy = data.spawn[i]

			if enemy.unit:match("tazer") then
				enemy.unit = "FBI_tazer"
			elseif enemy.unit:match("medic") then
				enemy.unit = enemy.unit:match("R870") and "FBI_medic_R870" or "FBI_medic_M4"

				local freq_set = false
				for n, freq in pairs(medic_freq) do
					if id:match(n) then
						enemy.freq = freq
						freq_set = true

						break
					end
				end

				if not freq_set then
					enemy.freq = default_medic_freq
				end
			end

			for name in pairs(id_matches) do
				if id:match(name) then
					enemy.unit = unit_names_map[enemy.unit] or enemy.unit

					break
				end
			end
		end
	end

	self:_moon_set_weights({
		assault = {
			tac_swat_shotgun_rush = { 1, 1.5, 2, },
			tac_swat_shotgun_rush_no_medic = { 1, 0.5, 0, },
			tac_swat_shotgun_flank = { 0.5, 0.75, 1, },
			tac_swat_shotgun_flank_no_medic = { 0.5, 0.25, 0, },
			tac_swat_rifle = { 8, 12, 16, },
			tac_swat_rifle_no_medic = { 8, 4, 0, },
			tac_swat_rifle_flank = { 4, 6, 8, },
			tac_swat_rifle_flank_no_medic = { 4, 2, 0, },
			tac_shield_wall_ranged = { 0, special_weight * 0.5, special_weight, },
			tac_shield_wall_charge = { 0, special_weight * 0.5, special_weight, },
			tac_tazer_flanking = { 0, special_weight * 0.5, special_weight, },
			tac_tazer_charge = { 0, special_weight * 0.5, special_weight, },
			tac_bull_rush = { 0, special_weight * 0.5, special_weight, },
			FBI_spoocs = { 0, special_weight * 0.5, special_weight, },
		},
	})
end

function GroupAITweakData:_moon_chicken_plate(special_weight)
	self.enemy_spawn_groups.chicken_plate_hrt_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "CS_cop_MP5",
				tactics = self._tactics.chicken_plate_hrt_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_b = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_C45",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_suit_M4",
				tactics = self._tactics.chicken_plate_hrt_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_R870",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_swat_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_R870",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_swat_b = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_heavy_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_MP5",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_R870",
				tactics = self._tactics.chicken_plate_heavy_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_heavy_b = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_heavy_M4",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.chicken_plate_heavy_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.chicken_plate_shield,
				freq = self._freq.baseline
			},
		}
	}
	self.enemy_spawn_groups.chicken_plate_taser = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = self._tactics.chicken_plate_taser,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_tank",
				tactics = self._tactics.chicken_plate_tank,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_spooc = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.chicken_plate_spooc,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_medic = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = self._tactics.chicken_plate_medic_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = self._tactics.chicken_plate_medic_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc

	self:_moon_set_weights({
		assault = {
			chicken_plate_hrt_a = { 0, 0, 0, },
			chicken_plate_hrt_b = { 15, 1.5, 1.5, },
			chicken_plate_swat_a = { 0, 0, 0, },
			chicken_plate_swat_b = { 6, 15, 6, },
			chicken_plate_heavy_a = { 0, 0, 0, },
			chicken_plate_heavy_b = { 1.5, 6, 15, },
			chicken_plate_shield = { 0, special_weight * 0.5, special_weight, },
			chicken_plate_taser = { 0, special_weight * 0.5, special_weight, },
			chicken_plate_tank = { 0, special_weight * 0.5, special_weight, },
			chicken_plate_spooc = { 0, special_weight * 0.5, special_weight, },
			chicken_plate_medic = { 0, special_weight * 0.5, special_weight, },
		},
		recon = {
			chicken_plate_hrt_a = { 5, 3, 1, },
			chicken_plate_hrt_b = { 0, 0, 0, },
			chicken_plate_swat_a = { 1, 1, 1, },
			chicken_plate_swat_b = { 0, 0, 0, },
			chicken_plate_spooc = { 0, 0, 0, },
			chicken_plate_medic = { 0, 0, 0, },
		},
		reenforce = {
			chicken_plate_hrt_a = { 1, 1, 1, },
			chicken_plate_swat_a = { 0, 1, 2, },
			chicken_plate_heavy_a = { 0, 3, 6, },
		},
	})
end

function GroupAITweakData:_moon_init_unit_categories()
	local special_limit_mul = ASS:get_tweak("special_limit_mul")

	local function combined_category(category_1, category_2)
		local new_category = deep_clone(category_1)

		for continent, units in pairs(category_2.unit_types) do
			for _, unit in ipairs(units) do
				table.insert(new_category.unit_types[continent], unit)
			end
		end

		return new_category
	end

	-- new special limits, from easy to death sentence
	-- identical to sh at base, minus allowing dozers on hard
	for special, limit in pairs({
		shield = { 0, 2, 2, 3, 3, 4, 4, 5, },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4, },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3, },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3, },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3, },
	}) do
		-- self.special_unit_spawn_limits[special] = math.round(limit[difficulty_index] * special_limit_mul)
		self.special_unit_spawn_limits[special] = math.ceil(limit[difficulty_index] * special_limit_mul)
	end

	-- these are used later to set new factions to america in the unlikely event any new ones are added
	-- there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
	local continent_reference = {}
	for continent in pairs(self.unit_categories.spooc.unit_types) do
		continent_reference[continent] = true
	end

	-- misc tweaks and fixes
	self.unit_categories.FBI_marshal_marksman = self.unit_categories.marshal_marksman
	self.unit_categories.FBI_marshal_shield = self.unit_categories.marshal_shield
	self.unit_categories.CS_cop_C45_R870.access = clone(self.unit_categories.spooc.access)
	self.unit_categories.CS_cop_stealth_R870 = self.unit_categories.CS_cop_stealth_MP5
	self.unit_categories.CS_cop_stealth_R870.access = clone(self.unit_categories.spooc.access)
	self.unit_categories.CS_cop_stealth_R870.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), }
	self.unit_categories.CS_cop_stealth_R870.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"), }
	self.unit_categories.CS_cop_stealth_R870.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"), }
	self.unit_categories.CS_cop_stealth_R870.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"), }
	self.unit_categories.CS_cop_stealth_R870.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"), }
	self.unit_categories.CS_heavy_MP5 = self.unit_categories.CS_heavy_M4
	self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"), }
	self.unit_categories.FBI_suit_C45_M4.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"), }
	self.unit_categories.FBI_suit_M4_R870 = self.unit_categories.FBI_suit_M4_MP5
	self.unit_categories.FBI_suit_stealth_R870 = self.unit_categories.FBI_suit_stealth_MP5
	self.unit_categories.FBI_suit_stealth_R870.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"), }
	self.unit_categories.FBI_suit_stealth_R870.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"), }
	self.unit_categories.FBI_heavy_M4 = self.unit_categories.FBI_heavy_G36

	-- new hrt unit categories
	self.unit_categories.CS_cop_C45_MP5 = deep_clone(self.unit_categories.FBI_suit_C45_M4)
	self.unit_categories.CS_cop_C45_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	self.unit_categories.CS_cop_C45_MP5.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"), }
	self.unit_categories.CS_cop_C45_MP5.unit_types.zombie = {
		Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
	}
	self.unit_categories.CS_cop_C45_MP5.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"), }
	self.unit_categories.CS_cop_C45_MP5.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"), }
	self.unit_categories.CS_cop_C45 = deep_clone(self.unit_categories.CS_cop_C45_MP5)
	self.unit_categories.CS_cop_C45.unit_types.america = { Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"), }
	self.unit_categories.CS_cop_C45.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"), }
	self.unit_categories.CS_cop_MP5 = deep_clone(self.unit_categories.CS_cop_C45_MP5)
	self.unit_categories.CS_cop_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"), }
	self.unit_categories.CS_cop_MP5.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"), }
	self.unit_categories.CS_cop_MP5_R870 = deep_clone(self.unit_categories.FBI_suit_M4_R870)
	self.unit_categories.CS_cop_MP5_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	self.unit_categories.CS_cop_MP5_R870.unit_types.zombie = {
		Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
		Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
	}
	self.unit_categories.FBI_suit_C45 = deep_clone(self.unit_categories.CS_cop_C45)
	self.unit_categories.FBI_suit_C45.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"), }
	self.unit_categories.FBI_suit_C45.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"), }
	self.unit_categories.FBI_suit_M4 = deep_clone(self.unit_categories.CS_cop_C45)
	self.unit_categories.FBI_suit_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"), }
	self.unit_categories.FBI_suit_M4.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"), }

	local difficulty_func = self["_moon_init_unit_categories_" .. ASS:get_var("difficulty")]
	if difficulty_func then
		difficulty_func(self)
	end

	-- for better holdout support
	self.unit_categories.CS_tank = deep_clone(self.unit_categories.FBI_tank)
	self.unit_categories.CS_spooc = deep_clone(self.unit_categories.spooc)
	self.unit_categories.CS_medic_MP5 = deep_clone(self.unit_categories.medic_M4)
	self.unit_categories.CS_medic_R870 = deep_clone(self.unit_categories.medic_R870)
	self.unit_categories.FBI_tazer = deep_clone(self.unit_categories.CS_tazer)
	self.unit_categories.FBI_spooc = self.unit_categories.spooc
	self.unit_categories.FBI_medic_M4 = self.unit_categories.medic_M4
	self.unit_categories.FBI_medic_R870 = self.unit_categories.medic_R870

	local level_mod_func = self["_moon_level_mod_" .. (ASS:get_var("level_mod") or "")]
	if level_mod_func then
		level_mod_func(self)
	end

	-- combined categories
	self.unit_categories.CS_swat_MP5_R870 = combined_category(self.unit_categories.CS_swat_MP5, self.unit_categories.CS_swat_R870)
	self.unit_categories.CS_heavy_MP5_R870 = combined_category(self.unit_categories.CS_heavy_MP5, self.unit_categories.CS_heavy_R870)
	self.unit_categories.CS_medic_MP5_R870 = combined_category(self.unit_categories.CS_medic_MP5, self.unit_categories.CS_medic_R870)
	self.unit_categories.FBI_suit_C45_R870 = combined_category(self.unit_categories.FBI_suit_C45_M4, self.unit_categories.FBI_suit_stealth_R870)
	self.unit_categories.FBI_swat_M4_R870 = combined_category(self.unit_categories.FBI_swat_M4, self.unit_categories.FBI_swat_R870)
	self.unit_categories.FBI_heavy_M4_R870 = combined_category(self.unit_categories.FBI_heavy_M4, self.unit_categories.FBI_heavy_R870)
	self.unit_categories.FBI_medic_M4_R870 = combined_category(self.unit_categories.FBI_medic_M4, self.unit_categories.FBI_medic_R870)

	for continent in pairs(continent_reference) do
		if not supported_continents[continent] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[continent] = clone(category.unit_types.america)
				end
			end
		end
	end
end

function GroupAITweakData:_moon_init_enemy_spawn_groups()
	local assault_style_func = self["_moon_" .. (ASS:get_var("assault_style") or "")] or self._moon_default
	local special_weight_base = ASS:get_tweak("special_weight_base")
	local special_weight = math.lerp(special_weight_base[1], special_weight_base[2], f)

	if assault_style_func == self._moon_default then
		assault_style_func(self, special_weight)

		return
	end

	local freq_base = ASS:get_tweak("freq_base")

	self._freq = {}
	for typ, val in pairs(freq_base) do
		self._freq[typ] = math.lerp(val[1], val[2], f)
	end

	-- effectively remove preexisting timed groups
	for _, group_data in pairs(self.enemy_spawn_groups) do
		if group_data.max_nr_simultaneous_groups then
			group_data.initial_spawn_delay = math.huge
			group_data.spawn_cooldown = math.huge
		end
	end

	for id, data in pairs({
		empty = {},
		original_shotgun = { "charge", "smoke_grenade", "deathguard", },
		original_shotgun_flank = { "charge", "flank", "flash_grenade", "deathguard", },
		original_rifle = { "ranged_fire", },
		original_rifle_flank = { "flank", "flash_grenade", },
		original_shield_ranged = { "shield", "ranged_fire", "deathguard", },
		original_shield_ranged_cover = { "shield_cover", "ranged_fire", "smoke_grenade", "deathguard", },
		original_shield_charge = { "shield", "charge", "deathguard", },
		original_shield_charge_cover = { "shield_cover", "charge", "smoke_grenade", "flash_grenade", "deathguard", },
		original_tazer = { "shield_cover", "charge", "flank", "flash_grenade", "smoke_grenade", "murder", },
		original_tazer_shield = { "shield", "charge", "flank", "murder", },
		original_tank = { "shield", "charge", "flash_grenade", "smoke_grenade", "murder", },
		original_tank_cover = { "shield_cover", "charge", "murder", },
		original_spooc = { "flank", "smoke_grenade", },
		swat_shotgun_rush = { "charge", "smoke_grenade", "deathguard", },
		swat_shotgun_flank = { "charge", "flank", "flash_grenade", "deathguard", },
		swat_rifle = { "ranged_fire", "smoke_grenade", },
		swat_rifle_flank = { "flank", "flash_grenade", },
		shield_wall_ranged = { "shield", "ranged_fire", "deathguard", },
		shield_support_ranged = { "shield_cover", "deathguard", },
		shield_wall_charge = { "shield", "charge", "deathguard", },
		shield_support_charge = { "shield_cover", "deathguard", },
		tazer_flanking = { "shield_cover", "flank", "flash_grenade", "murder", },
		tazer_charge = { "shield_cover", "charge", "smoke_grenade", "murder", },
		tazer_shield = { "shield", "murder", },
		tank_rush = { "shield", "charge", "murder", },
		tank_cover = { "shield_cover", "murder", },
		spooc = { "flank", "smoke_grenade", },
		chicken_plate_hrt_pistol = { "flank", "deathguard", },
		chicken_plate_hrt_rifle = { "flank", "deathguard", "ranged_fire", },
		chicken_plate_hrt_shotgun = { "flank", "deathguard", "charge", },
		chicken_plate_swat_rifle = { "flank", "flash_grenade", },
		chicken_plate_swat_shotgun = { "smoke_grenade", "deathguard", },
		chicken_plate_heavy_rifle = { "flash_grenade", "deathguard", },
		chicken_plate_heavy_shotgun = { "charge", "smoke_grenade", },
		chicken_plate_shield = { "murder", "deathguard", "ranged_fire", },
		chicken_plate_taser = { "murder", "deathguard", "flank", },
		chicken_plate_tank = { "murder", "charge", "smoke_grenade", },
		chicken_plate_spooc = { "murder", "flank", "smoke_grenade", },
		chicken_plate_medic_rifle = { "flank", "ranged_fire", "no_push", },
		chicken_plate_medic_shotgun = { "flank", "deathguard", "no_push", },
	}) do
		self._tactics[id] = data
	end

	self.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.spooc,
				freq = self._freq.baseline,
			},
		},
	}

	assault_style_func(self, special_weight)

	self.besiege.assault.groups.marshal_squad = nil
	self.besiege.assault.groups.custom_recon = { 0, 0, 0, }
	self.besiege.recon.groups.marshal_squad = nil
	self.besiege.recon.groups.custom_assault = { 0, 0, 0, }

	if is_super_serious then
		self:_moon_super_serious_tweaks()
	end
end

function GroupAITweakData:_moon_init_task_data()
	local grenade_cooldown_mul = ASS:get_tweak("grenade_cooldown_mul")
	local smoke_grenade_lifetime = ASS:get_tweak("smoke_grenade_lifetime")
	local cs_grenade_chance_times = ASS:get_tweak("cs_grenade_chance_times")
	local min_grenade_timeout = ASS:get_tweak("min_grenade_timeout")
	local no_grenade_push_delay = ASS:get_tweak("no_grenade_push_delay")
	local spawn_cooldowns = ASS:get_tweak("spawn_cooldowns")
	local force_pool_mul = ASS:get_tweak("force_pool_mul")
	local sustain_duration_mul = ASS:get_tweak("sustain_duration_mul")
	local break_duration_mul = ASS:get_tweak("break_duration_mul")
	local reenforce_interval = ASS:get_tweak("reenforce_interval")

	self.smoke_grenade_timeout = table.collect(self.smoke_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.smoke_grenade_lifetime = math.lerp(smoke_grenade_lifetime[1], smoke_grenade_lifetime[2], f)
	self.flash_grenade_timeout = table.collect(self.flash_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.cs_grenade_timeout = table.collect(self.cs_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.cs_grenade_lifetime = math.lerp(20, 40, f)
	self.cs_grenade_chance_times = cs_grenade_chance_times
	self.min_grenade_timeout = min_grenade_timeout
	self.no_grenade_push_delay = no_grenade_push_delay
	self.spawn_cooldown_mul = math.lerp(spawn_cooldowns[1], spawn_cooldowns[2], f)
	self.spawn_kill_cooldown = spawn_cooldowns[2] * 10

	self.besiege.assault.force_pool = table.collect(self.besiege.assault.force_pool, function(val) return val * force_pool_mul end)
	self.besiege.assault.sustain_duration_min = table.collect(self.besiege.assault.sustain_duration_min, function(val) return val * sustain_duration_mul end)
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = table.collect(self.besiege.assault.sustain_duration_balance_mul, function(val) return 1 end)
	self.besiege.assault.delay = table.collect(self.besiege.assault.delay, function(val) return val * break_duration_mul end)
	self.besiege.assault.hostage_hesitation_delay = table.collect(self.besiege.assault.hostage_hesitation_delay, function(val) return val * break_duration_mul end)
	self.besiege.reenforce.interval = reenforce_interval
	self.besiege.recon.interval = { 0, 0, 0, }
	self.besiege.recon.interval_variation = 0
	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.huge, math.huge, }

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end

ASS:post_hook( GroupAITweakData, "init", function(self, tweak_data)
	self.tweak_data = tweak_data

	self:_moon_init_unit_categories()
	self:_moon_init_enemy_spawn_groups()
	self:_moon_init_task_data()
end )
