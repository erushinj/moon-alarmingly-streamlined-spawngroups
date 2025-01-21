if ASS.is_client then
	return
end

local sss = BLT.Mods:GetModByName("Super Serious Shooter")
local is_super_serious = sss and sss:IsEnabled() and true
local difficulty_index = ASS.difficulty_index
local f = (difficulty_index - 2) / 6
local real_difficulty_index = ASS.real_difficulty_index
local clean_level_id = ASS.clean_level_id
local one_down = ASS.one_down

local ignore_unit_categories = table.list_to_set({
	"spooc",
	"CS_cop_C45_R870",
	"CS_cop_stealth_MP5",
	"CS_swat_MP5",
	"CS_swat_R870",
	"CS_heavy_M4",
	"CS_heavy_R870",
	"CS_heavy_M4_w",
	"CS_tazer",
	"FBI_suit_C45_M4",
	"FBI_suit_M4_MP5",
	"FBI_suit_stealth_MP5",
	"FBI_swat_M4",
	"FBI_swat_R870",
	"FBI_heavy_G36",
	"FBI_heavy_R870",
	"FBI_heavy_G36_w",
	"medic_M4",
	"medic_R870",
	"Phalanx_minion",
	"Phalanx_vip",
	"marshal_marksman",
	"marshal_shield",
	"snowman_boss",
	"piggydozer",
})
function GroupAITweakData:moon_swap_units(tiers)
	self.moon_last_tiers = tiers or self.moon_last_tiers or {}

	local enemy_replacements = self.tweak_data.moon.enemy_replacements
	for prefix, tier in pairs(self.moon_last_tiers) do
		for id, data in pairs(self.unit_categories) do
			if ignore_unit_categories[id] then
				-- nothing
			elseif not data.moon_u_keys then
				ASS:log("warn", "Unit category \"%s\" has no associated unit keys!", id)
			elseif id:match(prefix) then
				for continent in pairs(data.unit_types) do
					local continent_data = enemy_replacements[continent] or enemy_replacements.america
					local tier_data = continent_data[tier]

					if not tier_data then
						ASS:log("warn", "Missing data for tier \"%s\" and/or continent \"%s\"!", tier, continent)
					else
						data.unit_types[continent] = {}

						for u_key, amount in pairs(data.moon_u_keys) do
							local replacement = tier_data[u_key]

							if replacement and amount > 0 then
								for _ = 1, amount do
									table.insert(data.unit_types[continent], replacement)
								end
							end
						end
					end
				end
			end
		end
	end
end

function GroupAITweakData:_moon_add_tactics(tactics)
	for id, data in pairs(tactics) do
		self._tactics[id] = data
	end
end

-- set group weights for the specified tasks, set all others to 0 instead of overwriting the task's groups table
function GroupAITweakData:_moon_set_weights(new_weights)
	for task, new_groups in pairs(new_weights) do
		local task_data = self.besiege[task]
		local groups = task_data and task_data.groups

		if not groups then
			ASS:log("error", "Task name \"%s\" is invalid in GroupAITweakData:_moon_set_weights!", task)
		else
			for group in pairs(groups) do
				groups[group] = { 0, 0, 0, }
			end

			for group, weights in pairs(new_groups) do
				groups[group] = weights
			end
		end
	end
end

-- replace disabled specials with more heavies and hrts during standard play in Super Serious Shooter
function GroupAITweakData:_moon_super_serious_tweaks()
	if not is_super_serious then
		return
	end

	-- specials are re-enabled with "Special Operation" enabled
	local unit_mapping
	if one_down then
		unit_mapping = {}
	else
		unit_mapping = {
			CS_taser = {
				rifle = "CS_heavy_1",
				shotgun = "CS_heavy_2",
				default = "CS_shield",
			},
			CS_spooc = {
				rifle = "CS_hrt_1_2",
				shotgun = "CS_hrt_3_4",
				default = "CS_hrt_1_2_3_4",
				chicken_plate = "CS_heavy_1_2_3",
			},
			CS_tank = {
				default = "CS_heavy_1_2_3",
				chicken_plate = "CS_shield",
			},
			CS_medic_1 = {
				default = "CS_hrt_1_2",
				chicken_plate = "CS_heavy_1",
			},
			CS_medic_2 = {
				default = "CS_hrt_3_4",
				chicken_plate = "CS_heavy_2",
			},
			CS_medic_1_2 = {
				default = "CS_hrt_1_2_3_4",
				chicken_plate = "CS_heavy_1_2_3",
			},
		}
	end

	-- just in case SSS reenables marshals at any point
	unit_mapping.CS_marshal_marksman = { default = "CS_heavy_1", }
	unit_mapping.CS_marshal_shield = { default = "CS_shield", }

	for unit, cs_mapping in pairs(unit_mapping) do
		local fbi_mapping = clone(cs_mapping)

		for name, mapped in pairs(fbi_mapping) do
			fbi_mapping[name] = self:moon_get_equivalent_unit_category(mapped) or nil
		end

		unit_mapping[self:moon_get_equivalent_unit_category(unit) or false] = fbi_mapping
	end

	unit_mapping.medic_M4 = unit_mapping.FBI_medic_1
	unit_mapping.medic_R870 = unit_mapping.FBI_medic_2
	unit_mapping.spooc = unit_mapping.FBI_spooc
	unit_mapping.CS_tazer = unit_mapping.FBI_taser
	unit_mapping.marshal_marksman = unit_mapping.FBI_marshal_marksman
	unit_mapping.marshal_shield = unit_mapping.FBI_marshal_shield

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

				break
			end
		end

		for _, enemy in pairs(data.spawn) do
			local mapped = unit_mapping[enemy.unit]
			local mapped_unit = mapped and (mapped[unit_type] or mapped.default)

			if mapped_unit then
				enemy.unit = mapped_unit
				enemy.random_unit = nil
			end
		end
	end
end

GroupAITweakData._moon_assault_styles = {}

-- modernized and tweaked restoration of the pre-crimefest 2016 groups, mostly based around the old OVK difficulty groups
GroupAITweakData._moon_assault_styles.original = function(self, special_weight)
	self:_moon_add_tactics({
		empty = {},
		original_swat_ranged = { "ranged_fire", },
		original_swat_charge = { "charge", "smoke_grenade", "deathguard", },
		original_swat_flank = { "flank", "flash_grenade", },
		original_swat_support = { "unit_cover", },
		original_shield_ranged = { "shield", "ranged_fire", "smoke_grenade", "deathguard", },
		original_shield_charge = { "shield", "charge", "flash_grenade", "deathguard", },
		original_shield_support = { "shield_cover", "ranged_fire", "deathguard", },
		original_tazer_flank = { "shield_cover", "flank", "smoke_grenade", "murder", },
		original_tazer_charge = { "shield_cover", "charge", "flash_grenade", "murder", },
		original_tazer_support = { "shield", "ranged_fire", "murder", },
		original_tank_passive = { "shield", "flash_grenade", "murder", },
		original_tank_aggressive = { "shield", "charge", "flash_grenade", "murder", },
		original_tank_support = { "shield_cover", "ranged_fire", "murder", },
		original_spooc_camper = { "no_push", },
		original_spooc_assault = { "flank", "smoke_grenade", },
	})

	local FBI_spooc_medic = { "FBI_spooc", "FBI_medic_1_2", }
	local FBI_taser_medic = { "FBI_taser", "FBI_medic_1_2", }

	self.enemy_spawn_groups.original_swats_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_swat_1",
				tactics = self._tactics.original_swat_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_swat_3",
				tactics = self._tactics.original_swat_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_swat_2",
				tactics = self._tactics.original_swat_charge,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2_3_4",
				tactics = self._tactics.original_swat_support,
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
				unit = "FBI_swat_1",
				tactics = self._tactics.original_swat_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_3",
				tactics = self._tactics.original_swat_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_swat_2",
				tactics = self._tactics.original_swat_charge,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				random_unit = FBI_spooc_medic,
				tactics = self._tactics.original_swat_support,
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
				unit = "CS_heavy_1",
				tactics = self._tactics.original_swat_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_heavy_3",
				tactics = self._tactics.original_swat_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_heavy_2",
				tactics = self._tactics.original_swat_charge,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2_3_4",
				tactics = self._tactics.original_swat_support,
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
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_swat_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_3",
				tactics = self._tactics.original_swat_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_2",
				tactics = self._tactics.original_swat_charge,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_taser",
				random_unit = FBI_taser_medic,
				tactics = self._tactics.original_swat_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}

	local shield_random_tactics = { self._tactics.original_shield_ranged, self._tactics.original_shield_charge, }
	self.enemy_spawn_groups.original_shields_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_shield",
				tactics = self._tactics.original_shield_ranged,
				random_tactics = shield_random_tactics,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_1",
				tactics = self._tactics.original_shield_support,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_shields_b = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.original_shield_ranged,
				random_tactics = shield_random_tactics,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_shield_support,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_2",
				tactics = self._tactics.original_shield_support,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_hrt_1_2_3_4",
				tactics = self._tactics.original_shield_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_taser",
				random_unit = FBI_taser_medic,
				tactics = self._tactics.original_shield_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}

	local tazer_random_tactics = { self._tactics.original_tazer_flank, self._tactics.original_tazer_charge, }
	self.enemy_spawn_groups.original_tazers_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_taser",
				tactics = self._tactics.original_tazer_flank,
				random_tactics = tazer_random_tactics,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.original_tazer_support,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_tazers_b = {
		amount = { 2, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_taser",
				tactics = self._tactics.original_tazer_flank,
				random_tactics = tazer_random_tactics,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_swat_1",
				tactics = self._tactics.original_tazer_support,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_2",
				tactics = self._tactics.original_tazer_support,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				random_unit = FBI_spooc_medic,
				tactics = self._tactics.original_tazer_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}

	local tank_random_tactics = { self._tactics.original_tank_passive, self._tactics.original_tank_aggressive, }
	self.enemy_spawn_groups.original_tanks_a = {
		amount = { 1, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_tank",
				tactics = self._tactics.original_tank_passive,
				random_tactics = tank_random_tactics,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.original_tank_support,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.original_tank_support,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.original_tanks_b = {
		amount = { 2, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = self._tactics.original_tank_passive,
				random_tactics = tank_random_tactics,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_tank_support,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.original_tank_support,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_taser",
				random_unit = FBI_taser_medic,
				tactics = self._tactics.original_tank_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
		},
	}

	local spooc_random_tactics = { self._tactics.original_spooc_camper, self._tactics.original_spooc_assault, }
	self.enemy_spawn_groups.original_spoocs_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_spooc",
				tactics = self._tactics.original_spooc_camper,
				random_tactics = spooc_random_tactics,
				amount_min = 1,
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
				tactics = self._tactics.original_spooc_camper,
				random_tactics = spooc_random_tactics,
				amount_min = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.original_spooc_camper,
				random_tactics = spooc_random_tactics,
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
				unit = "CS_hrt_1_2",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.original_recon_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.empty,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.original_recon_c = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_taser",
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
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_taser",
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
				unit = "CS_hrt_1_2_3_4",
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
				unit = "CS_swat_1_2_3",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.original_reenforce_c = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_1_2_3",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
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
			original_heavys_a = { 0, 0, 0, },
			original_heavys_b = { 0, 0, 0, },
			original_spoocs_a = { 0, 0, 0, },
			original_spoocs_b = { 0, 0, 0, },
			original_recon_a = { 1, 2, 0, },
			original_recon_b = { 0, 1, 2, },
			original_recon_c = { 0, 0, 1, },
			original_recon_d = { 0, 0, 0, },
		},
		reenforce = {
			original_reenforce_a = { 2, 1, 0, },
			original_reenforce_b = { 0, 2, 1, },
			original_reenforce_c = { 0, 0, 2, },
		},
	})
end

-- spicier version of SH's default groups, featuring more shotgunners
GroupAITweakData._moon_assault_styles.streamlined = function(self, special_weight)
	self:_moon_add_tactics({
		empty = {},
		streamlined_shotgun_rush = { "charge", "smoke_grenade", "deathguard", },
		streamlined_shotgun_flank = { "charge", "flank", "flash_grenade", "deathguard", },
		streamlined_shotgun_support = { "charge", "unit_cover", "deathguard", },
		streamlined_rifle_ranged = { "ranged_fire", "smoke_grenade", },
		streamlined_rifle_flank = { "flank", "flash_grenade", },
		streamlined_rifle_support = { "unit_cover", },
		streamlined_shield_ranged = { "shield", "ranged_fire", "deathguard", },
		streamlined_shield_support_ranged = { "shield_cover", "deathguard", },
		streamlined_shield_charge = { "shield", "charge", "deathguard", },
		streamlined_shield_support_charge = { "shield_cover", "deathguard", },
		streamlined_tazer_flank = { "shield_cover", "flank", "flash_grenade", "murder", },
		streamlined_tazer_support_flank = { "shield", "murder", },
		streamlined_tazer_charge = { "shield_cover", "charge", "smoke_grenade", "murder", },
		streamlined_tazer_support_charge = { "shield", "murder", },
		streamlined_tank = { "shield", "charge", "murder", },
		streamlined_tank_support = { "shield_cover", "murder", },
		streamlined_spooc = { "flank", "smoke_grenade", },
	})

	-- copies a group, then removes units that arent lights or heavies, lowers heavy frequency,
	-- and ensures a spawn point check reference is set
	local unit_mapping = {
		FBI_swat_1 = "light",
		FBI_swat_2 = "light",
		FBI_swat_3 = "light",
		FBI_heavy_1 = "heavy",
		FBI_heavy_2 = "heavy",
		FBI_heavy_3 = "heavy",
	}
	local function no_medic_group(original_group)
		local g = deep_clone(original_group)

		local unit_type, swap_unit
		for i, enemy in table.reverse_ipairs(g.spawn) do
			unit_type = unit_mapping[enemy.unit] or nil

			if not unit_type then
				table.remove(g.spawn, i)
			else
				swap_unit = self:moon_get_equivalent_unit_category(enemy.unit) or nil

				if swap_unit then
					enemy.unit = swap_unit
				else
					ASS:log("warn", "No equivalent unit category found for unit category \"%s\"!", enemy.unit)
				end

				if unit_type == "heavy" then
					enemy.freq = self._freq.common
				end
			end
		end

		return g
	end

	local FBI_hrt_medic_2 = { "FBI_hrt_3_4", "FBI_medic_2", }
	local FBI_spooc_medic = { "FBI_spooc", "FBI_medic_2", }
	local FBI_hrt_medic_1 = { "FBI_hrt_1_2", "FBI_medic_1", }
	local FBI_taser_medic = { "FBI_taser", "FBI_medic_1", }

	self.enemy_spawn_groups.streamlined_shotgun_rush_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_2",
				tactics = self._tactics.streamlined_shotgun_rush,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_2",
				tactics = self._tactics.streamlined_shotgun_rush,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				random_unit = FBI_hrt_medic_2,
				tactics = self._tactics.streamlined_shotgun_support,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_shotgun_rush_a = no_medic_group(self.enemy_spawn_groups.streamlined_shotgun_rush_b)

	self.enemy_spawn_groups.streamlined_shotgun_flank_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_2",
				tactics = self._tactics.streamlined_shotgun_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_2",
				tactics = self._tactics.streamlined_shotgun_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				random_unit = FBI_spooc_medic,
				tactics = self._tactics.streamlined_shotgun_support,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_shotgun_flank_a = no_medic_group(self.enemy_spawn_groups.streamlined_shotgun_flank_b)

	self.enemy_spawn_groups.streamlined_rifle_ranged_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_1",
				tactics = self._tactics.streamlined_rifle_ranged,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_1",
				tactics = self._tactics.streamlined_rifle_ranged,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_1_2",
				random_unit = FBI_hrt_medic_1,
				tactics = self._tactics.streamlined_rifle_support,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_rifle_ranged_a = no_medic_group(self.enemy_spawn_groups.streamlined_rifle_ranged_b)

	self.enemy_spawn_groups.streamlined_rifle_flank_b = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_3",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_3",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_taser",
				random_unit = FBI_taser_medic,
				tactics = self._tactics.streamlined_rifle_support,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_rifle_flank_a = no_medic_group(self.enemy_spawn_groups.streamlined_rifle_flank_b)

	self.enemy_spawn_groups.streamlined_shield_ranged = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = self._tactics.streamlined_shield_ranged,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1",
				tactics = self._tactics.streamlined_shield_support_ranged,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_1_2",
				tactics = self._tactics.streamlined_shield_support_ranged,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.streamlined_shield_support_ranged,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_shield_charge = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = self._tactics.streamlined_shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.streamlined_shield_support_charge,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.streamlined_shield_support_charge,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
				tactics = self._tactics.streamlined_shield_support_charge,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_tazer_flank = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_taser",
				tactics = self._tactics.streamlined_tazer_flank,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.streamlined_tazer_support_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_swat_3",
				tactics = self._tactics.streamlined_tazer_support_flank,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_tazer_charge = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_taser",
				tactics = self._tactics.streamlined_tazer_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.streamlined_tazer_support_charge,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_swat_2",
				tactics = self._tactics.streamlined_tazer_support_charge,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_tank = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = self._tactics.streamlined_tank,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_taser",
				tactics = self._tactics.streamlined_tank_support,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_swat_1_2_3",
				tactics = self._tactics.streamlined_tank_support,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1_2_3",
				tactics = self._tactics.streamlined_tank_support,
				freq = self._freq.common,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_spooc = {
		amount = { 1, 2, },
		spawn = {
			{
				rank = 2,
				unit = "FBI_spooc",
				tactics = self._tactics.streamlined_spooc,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.streamlined_spooc,
				amount_max = 1,
				freq = self._freq.baseline,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_hostage_rescue = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_1_2_3_4",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_min = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_taser",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
		},
	}

	self.enemy_spawn_groups.streamlined_reenforce_a = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_1_2",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_reenforce_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.streamlined_reenforce_c = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_1",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_heavy_3",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
		},
	}

	self:_moon_set_weights({
		assault = {
			streamlined_shotgun_rush_a = { 2, 1, 0, },
			streamlined_shotgun_rush_b = { 2, 3, 4, },
			streamlined_shotgun_flank_a = { 1, 0.5, 0, },
			streamlined_shotgun_flank_b = { 1, 1.5, 2, },
			streamlined_rifle_ranged_a = { 7, 3.5, 0, },
			streamlined_rifle_ranged_b = { 7, 10.5, 14, },
			streamlined_rifle_flank_a = { 3.5, 1.75, 0, },
			streamlined_rifle_flank_b = { 3.5, 5.25, 7, },
			streamlined_shield_ranged = { 0, special_weight * 0.5, special_weight, },
			streamlined_shield_charge = { 0, special_weight * 0.5, special_weight, },
			streamlined_tazer_flank = { 0, special_weight * 0.5, special_weight, },
			streamlined_tazer_charge = { 0, special_weight * 0.5, special_weight, },
			streamlined_tank = { 0, special_weight * 0.5, special_weight, },
			streamlined_spooc = { 0, special_weight * 0.5, special_weight, },
		},
		recon = {
			streamlined_hostage_rescue = { 1, 2, 3, },
			streamlined_shotgun_flank_a = { 0, 0, 1, },
			streamlined_shotgun_flank_b = { 0, 0, 0, },
			streamlined_rifle_flank_a = { 0, 0, 1, },
			streamlined_rifle_flank_b = { 0, 0, 0, },
			streamlined_tazer_flank = { 0, 0, 0, },
			streamlined_spooc = { 0, 0, 0, },
		},
		reenforce = {
			streamlined_reenforce_a = { 1, 0, 0, },
			streamlined_reenforce_b = { 0, 1, 0, },
			streamlined_reenforce_c = { 0, 0, 1, },
		},
	})
end

-- dont do anything but make SH's default groups work with level mod and skill level
GroupAITweakData._moon_assault_styles.default = function(self, special_weight)
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

-- pd3-styled spawns
GroupAITweakData._moon_assault_styles.chicken_plate = function(self, special_weight)
	self:_moon_add_tactics({
		empty = {},
		chicken_plate_hrt_pistol = { "shield_cover", "flank", "deathguard", "ranged_fire", },
		chicken_plate_hrt_shotgun = { "shield_cover", "flank", "deathguard", "charge", },
		chicken_plate_swat_rifle = { "shield_cover", "ranged_fire", },
		chicken_plate_swat_shotgun = { "shield_cover", "smoke_grenade", "deathguard", },
		chicken_plate_swat_smg = { "shield_cover", "murder", "flank", "flash_grenade", },
		chicken_plate_heavy_rifle = { "shield_cover", "flash_grenade", "deathguard", },
		chicken_plate_heavy_shotgun = { "shield_cover", "charge", "smoke_grenade", },
		chicken_plate_heavy_smg = { "shield_cover", "murder", "flank", "deathguard", },
		chicken_plate_shield = { "shield", "deathguard", "ranged_fire", },
		chicken_plate_taser = { "unit_cover", "murder", "charge", "flank", },
		chicken_plate_tank = { "shield", "murder", "charge", "smoke_grenade", },
		chicken_plate_spooc = { "shield_cover", "murder", "flank", "smoke_grenade", },
		chicken_plate_medic_rifle = { "unit_cover", "flank", "ranged_fire", "no_push", },
		chicken_plate_medic_shotgun = { "unit_cover", "flank", "deathguard", "no_push", },
	})

	local meta = {
		__index = function(t, k)
			local groups = rawget(t, "groups")

			if groups then
				local diff
				local skm = managers.skirmish

				if skm and skm:is_skirmish() then
					local _, max_wave = skm:wave_range()

					diff = math.clamp((skm:current_wave_number() or 0) / (max_wave or 9), 0, 1)
				else
					diff = managers.groupai and managers.groupai:state()._difficulty_value
				end

				diff = diff or 0
				for i = #groups, 1, -1 do
					if groups[i][1] <= diff then
						return groups[i][2][k]
					end
				end

				return groups[#groups][2][k]
			end
		end,
	}
	local function gen_meta(groups)
		return setmetatable({ groups = groups, }, meta)
	end

	self.enemy_spawn_groups.chicken_plate_hrt_a = {
		amount = { 2, 2, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_d = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_hrt_3_4",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				amount_min = 2,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_hrt_1_2",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_hrt_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_hrt_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_hrt_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_hrt_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_hrt_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_hrt_f, },
	})

	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_a = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_b = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_d = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_heavy_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 2,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_heavy_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 2,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_ar_smg = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_assault_ar_smg_f, },
	})

	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_a = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_d = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 2,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 2,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_assault_smg_sg = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_assault_smg_sg_f, },
	})

	self.enemy_spawn_groups.chicken_plate_shield_a = {
		amount = { 2, 2, },
		spawn = {
			{
				rank = 1,
				unit = "CS_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.chicken_plate_heavy_shotgun,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield_d = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "CS_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.chicken_plate_heavy_shotgun,
				amount_min = 1,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
				tactics = self._tactics.chicken_plate_medic_shotgun,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.chicken_plate_shield,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
				tactics = self._tactics.chicken_plate_medic_shotgun,
				amount_max = 1,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_shield = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_shield_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_shield_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_shield_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_shield_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_shield_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_shield_f, },
	})

	self.enemy_spawn_groups.chicken_plate_taser_a = {
		amount = { 2, 2, },
		spawn = {
			{
				rank = 1,
				unit = "CS_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_3",
				tactics = self._tactics.chicken_plate_heavy_smg,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser_d = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "CS_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_3",
				tactics = self._tactics.chicken_plate_heavy_smg,
				amount_min = 1,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "FBI_heavy_3",
				tactics = self._tactics.chicken_plate_heavy_smg,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.chicken_plate_medic_rifle,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_taser",
				tactics = self._tactics.chicken_plate_taser,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_heavy_3",
				tactics = self._tactics.chicken_plate_heavy_smg,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.chicken_plate_medic_rifle,
				amount_max = 1,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_taser = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_taser_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_taser_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_taser_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_taser_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_taser_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_taser_f, },
	})

	self.enemy_spawn_groups.chicken_plate_tank_a = {
		amount = { 2, 2, },
		spawn = {
			{
				rank = 1,
				unit = "CS_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank_b = {
		amount = { 2, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank_c = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				amount_min = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_1",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank_d = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 1,
				unit = "CS_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_1",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				amount_min = 1,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank_e = {
		amount = { 3, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.chicken_plate_medic_rifle,
				amount_max = 1,
				freq = self._freq.uncommon,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank_f = {
		amount = { 4, 4, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_tank",
				tactics = self._tactics.chicken_plate_tank,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_heavy_1",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.chicken_plate_medic_rifle,
				amount_max = 1,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_tank = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_tank_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_tank_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_tank_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_tank_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_tank_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_tank_f, },
	})

	self.enemy_spawn_groups.chicken_plate_spooc_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_spooc",
				tactics = self._tactics.chicken_plate_spooc,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_spooc_b = self.enemy_spawn_groups.chicken_plate_spooc_a
	self.enemy_spawn_groups.chicken_plate_spooc_c = self.enemy_spawn_groups.chicken_plate_spooc_b
	self.enemy_spawn_groups.chicken_plate_spooc_d = self.enemy_spawn_groups.chicken_plate_spooc_c
	self.enemy_spawn_groups.chicken_plate_spooc_e = {
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
	self.enemy_spawn_groups.chicken_plate_spooc_f = {
		amount = { 1, 2, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = self._tactics.chicken_plate_spooc,
				freq = self._freq.baseline,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_spooc = gen_meta({
		{ 0.0, self.enemy_spawn_groups.chicken_plate_spooc_a, },
		{ 0.2, self.enemy_spawn_groups.chicken_plate_spooc_b, },
		{ 0.4, self.enemy_spawn_groups.chicken_plate_spooc_c, },
		{ 0.6, self.enemy_spawn_groups.chicken_plate_spooc_d, },
		{ 0.8, self.enemy_spawn_groups.chicken_plate_spooc_e, },
		{ 1.0, self.enemy_spawn_groups.chicken_plate_spooc_f, },
	})

	self:_moon_set_weights({
		assault = {
			chicken_plate_assault_ar_smg = { 27, 18, 9, },
			chicken_plate_assault_smg_sg = { 0, 9, 18, },
			chicken_plate_shield = { special_weight, special_weight, special_weight, },
			chicken_plate_taser = { special_weight * 0.5, special_weight * 0.75, special_weight, },
			chicken_plate_spooc = { special_weight * 0.25, special_weight * 0.675, special_weight, },
			chicken_plate_tank = { 0, special_weight * 0.5, special_weight, },
		},
		recon = {
			chicken_plate_hrt = { 27, 27, 27, },
			chicken_plate_assault_ar_smg = { 0, 0, 0, },
			chicken_plate_assault_smg_sg = { 0, 0, 0, },
			chicken_plate_taser = { 0, 0, 0, },
			chicken_plate_spooc = { 0, 0, 0, },
		},
		reenforce = {
			chicken_plate_hrt = { 2, 0, 0, },
			chicken_plate_assault_ar_smg = { 1, 1, 1, },
			chicken_plate_assault_smg_sg = { 0, 0, 2, },
		},
	})
end

-- groups for BeardLib Editor, clean up spawn group element view
GroupAITweakData._moon_assault_styles.editor = function(self, special_weight)
	local vanilla_groups = table.list_to_set({
		"tac_swat_shotgun_rush",
		"tac_swat_shotgun_flank",
		"tac_swat_rifle",
		"tac_swat_rifle_flank",
		"tac_shield_wall_ranged",
		"tac_shield_wall_charge",
		"tac_shield_wall",
		"tac_tazer_flanking",
		"tac_tazer_charge",
		"tac_bull_rush",
		"FBI_spoocs",
		"single_spooc",
		"Phalanx",
	})

	for id in pairs(self.enemy_spawn_groups) do
		if not vanilla_groups[id] then
			self.enemy_spawn_groups[id] = nil
		end
	end

	self:_moon_set_weights({
		assault = {
			tac_swat_shotgun_rush = { 1, 1, 1, },  -- in case of a custom map that supports these
			tac_swat_shotgun_flank = { 1, 1, 1, },
			tac_swat_rifle = { 1, 1, 1, },
			tac_swat_rifle_flank = { 6, 6, 6, },
			tac_shield_wall_ranged = { 1, 1, 1, },
			tac_shield_wall_charge = { 1, 1, 1, },
			tac_tazer_flanking = { 1, 1, 1, },
			tac_tazer_charge = { 1, 1, 1, },
			tac_bull_rush = { 1, 1, 1, },
			FBI_spoocs = { 1, 1, 1, },
		},
		recon = {
			tac_swat_shotgun_flank = { 1, 1, 1, },
			tac_swat_rifle_flank = { 1, 1, 1, },
		},
		reenforce = {
			tac_swat_shotgun_rush = { 1, 1, 1, },
			tac_swat_rifle = { 1, 1, 1, },
			tac_swat_rifle_flank = { 0.001, 0.001, 0.001, },
		},
	})
end

function GroupAITweakData:_moon_init_enemy_spawn_groups()
	local assault_styles = self._moon_assault_styles
	local wanted_assault_style = assault_styles[ASS.assault_style] and ASS.assault_style or "default"
	local assault_style_func = assault_styles[wanted_assault_style]
	local special_weight = math.lerp(ASS.tweaks.special_weight_base[1], ASS.tweaks.special_weight_base[2], f)

	self.moon_assault_style = wanted_assault_style

	local id_matches = table.set("no_medic", "rescue", "reenforce")
	local default_medic_freq = difficulty_index / 16
	local default_shield_freq = default_medic_freq
	local medic_freq = {
		flank = difficulty_index / 20,
		shield = difficulty_index / 32,
		bull = difficulty_index / 64,
	}
	local function get_medic_freq(id)
		for n, freq in pairs(medic_freq) do
			if id:match(n) then
				return freq
			end
		end
	end

	-- swap vanilla units in all preexisting groups to ASS's naming scheme
	local vanilla_category_translations = self.tweak_data.moon.vanilla_category_translations
	for id, data in pairs(self.enemy_spawn_groups) do
		for _, enemy in pairs(data.spawn) do
			enemy.unit = vanilla_category_translations[enemy.unit] or enemy.unit

			local category = self.unit_categories[enemy.unit]
			local special_type = category and not category.is_captain and category.special_type
			if special_type == "medic" then
				enemy.freq = get_medic_freq(id) or default_medic_freq
			elseif special_type == "shield" then
				enemy.freq = default_shield_freq
			end

			for name in pairs(id_matches) do
				if id:match(name) then
					enemy.unit = self:moon_get_equivalent_unit_category(enemy.unit) or enemy.unit

					break
				end
			end
		end
	end

	if assault_style_func == assault_styles.default or assault_style_func == assault_styles.editor then
		assault_style_func(self, special_weight)

		return
	end

	self._freq = {}
	for typ, val in pairs(ASS.tweaks.freq_base) do
		self._freq[typ] = math.lerp(val[1], val[2], f)
	end

	-- effectively remove preexisting timed groups
	-- this means no marshals
	local ignore_log_groups = table.set("marshal_squad")
	for id, data in pairs(self.enemy_spawn_groups) do
		if data.max_nr_simultaneous_groups then
			if not ignore_log_groups[id] then
				ASS:log("warn", "Found unknown timed group \"%s\"!", id)
			end

			data.initial_spawn_delay = math.huge
			data.spawn_cooldown = math.huge

			self.besiege.assault.groups[id] = nil
			self.besiege.recon.groups[id] = nil
			self.besiege.reenforce.groups[id] = nil
		end
	end

	assault_style_func(self, special_weight)

	self:_moon_super_serious_tweaks()
end

function GroupAITweakData:_moon_init_task_data()
	local level_assault_tweaks = self.tweak_data.moon.level_assault_tweaks

	-- special limits, from easy to death sentence
	-- identical to sh at base, minus allowing dozers on hard
	for special, limits in pairs({
		shield = { 0, 2, 2, 3, 3, 4, 4, 5, },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4, },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3, },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3, },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3, },
	}) do
		local limit = limits[difficulty_index]
		local add = level_assault_tweaks.special_limit_add[special] or 0

		-- dont add disabled specials, dont remove enabled specials
		if limit < 1 then
			-- nothing
		elseif limit + add < 1 then
			limit = math.ceil(1 * ASS.tweaks.special_limit_mul)
		else
			limit = math.ceil((limit + add) * ASS.tweaks.special_limit_mul)
		end

		self.special_unit_spawn_limits[special] = limit
	end

	local grenade_cooldown_func = function(val) return val * ASS.tweaks.grenade_cooldown_mul end
	local break_duration_func = function(val) return val * ASS.tweaks.break_duration_mul end

	self.smoke_grenade_timeout = table.collect(self.smoke_grenade_timeout, grenade_cooldown_func)
	self.smoke_grenade_lifetime = math.lerp(ASS.tweaks.smoke_grenade_lifetime[1], ASS.tweaks.smoke_grenade_lifetime[2], f)
	self.flash_grenade_timeout = table.collect(self.flash_grenade_timeout, grenade_cooldown_func)
	self.cs_grenade_timeout = table.collect(self.cs_grenade_timeout, grenade_cooldown_func)
	self.cs_grenade_lifetime = math.lerp(20, 40, f)
	self.cs_grenade_chance_times = table.collect(ASS.tweaks.cs_grenade_chance_times, function(val) return val * level_assault_tweaks.cs_grenade_chance_times_mul end)
	self.min_grenade_timeout = ASS.tweaks.min_grenade_timeout
	self.no_grenade_push_delay = ASS.tweaks.no_grenade_push_delay
	self.spawn_cooldown_mul = math.lerp(ASS.tweaks.spawn_cooldowns[1], ASS.tweaks.spawn_cooldowns[2], f)
	self.spawn_kill_cooldown = ASS.tweaks.spawn_cooldowns[2] * 10

	self.besiege.assault.force = table.collect(self.besiege.assault.force, function(val) return val * level_assault_tweaks.force_mul end)
	self.besiege.assault.force_pool = table.collect(self.besiege.assault.force_pool, function(val) return val * ASS.tweaks.force_pool_mul end)
	self.besiege.assault.sustain_duration_base = table.collect(self.besiege.assault.sustain_duration_min, function(val) return val * level_assault_tweaks.sustain_duration_mul end)
	self.besiege.assault.sustain_duration_min = table.collect(self.besiege.assault.sustain_duration_base, function(val) return val * ASS.tweaks.sustain_duration_muls[1] end)
	self.besiege.assault.sustain_duration_max = table.collect(self.besiege.assault.sustain_duration_base, function(val) return val * ASS.tweaks.sustain_duration_muls[2] end)
	self.besiege.assault.sustain_duration_balance_mul = table.collect(self.besiege.assault.sustain_duration_balance_mul, function(val) return 1 end)
	self.besiege.assault.delay = table.collect(self.besiege.assault.delay, break_duration_func)
	self.besiege.assault.hostage_hesitation_delay = table.collect(self.besiege.assault.hostage_hesitation_delay, break_duration_func)
	self.besiege.reenforce.interval = table.collect(ASS.tweaks.reenforce_interval, function(val) return val * level_assault_tweaks.reenforce_interval_mul end)
	self.besiege.recon.force = table.collect(self.besiege.assault.force, function(val) return val * ASS.tweaks.recon_force_mul end)
	self.besiege.recon.interval_variation = self.besiege.recon.interval_variation * level_assault_tweaks.recon_interval_variation_mul * ASS.tweaks.recon_interval_variation_mul
	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.huge, math.huge, }

	self:moon_regular_custom_group()

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end

-- make custom_task groups behave like vanilla custom group on certain maps
-- may be expanded to allow switching whether to use this behaviour mid-heist
local regular_custom_group = table.list_to_set({
	"man",  -- dozer spawn loop + all swats
	"dah",  -- you get to see all the pretty suited men trying to kill you even if you dont want to :3
	"hox_3",  -- you get to see all the pretty suited men trying to kill you even if you dont want to :3
	"flat",  -- all swats
	"chca",  -- triads onboard
	"dinner",  -- all murkies/swats
	"pbr",  -- all murkies
	"wwh",  -- all swats
	"born",  -- all cops/swats
	"chew",  -- all swats
	"watchdogs_1",  -- all cops/swats
	"watchdogs_2",  -- all cops/swats
	"shoutout_raid",  -- all murkies/swats

	-- custom heists
	"thechase",  -- corporate bullshit
	"physics_citystreets",  -- corporate bullshit
	"physics_tower",  -- corporate bullshit
	"physics_core",  -- corporate bullshit
})[clean_level_id] or false
function GroupAITweakData:moon_regular_custom_group(enable)
	if enable == nil then
		enable = regular_custom_group
	end

	if enable then
		self.besiege.recon.groups.custom_assault = { 0, 0, 0, }
		self.besiege.assault.groups.custom_recon = { 0, 0, 0, }
	else
		self.besiege.recon.groups.custom_assault = nil
		self.besiege.assault.groups.custom_recon = nil
	end
end

function GroupAITweakData:moon_get_equivalent_unit_category(id, return_data)
	if not self.unit_categories[id] then
		ASS:log("warn", "Unit category \"%s\" does not exist!", id)

		return
	end

	local equivalent_id
	if id:match("CS_") then
		equivalent_id = id:gsub("CS_", "FBI_")
	else
		equivalent_id = id:gsub("FBI_", "CS_")
	end

	if self.unit_categories[equivalent_id] then
		return return_data and self.unit_categories[equivalent_id] or equivalent_id
	end

	ASS:log("warn", "No equivalent unit category found for unit category \"%s\"!", id)
end

function GroupAITweakData:_moon_init_unit_categories()
	local unit_types

	for _, data in pairs(self.unit_categories) do
		if data.unit_types then
			unit_types = table.map_keys(data.unit_types)

			break
		end
	end

	unit_types = unit_types or { "america", "russia", "zombie", "murkywater", "federales", }

	local access_all = table.set("walk", "acrobatic")
	local access_walk = table.set("walk")
	local function dozer_difficulty_threshold(typ)
		local threshold = ASS.dozer_rainbow[typ] or 1

		return real_difficulty_index >= threshold and 1 or 0
	end

	local function generate_category(data)
		local category = {
			moon_u_keys = data.u_keys,
			special_type = data.special_type or nil,
			access = data.access or access_all,
			unit_types = {},
		}

		for _, continent in pairs(unit_types) do
			category.unit_types[continent] = {}
		end

		return category
	end

	for id, data in pairs({
		spooc = {
			special_type = "spooc",
			u_keys = {
				cloaker = 1,
			},
		},
		hrt_1 = {
			u_keys = {
				hrt_1 = 1,
			},
		},
		hrt_2 = {
			u_keys = {
				hrt_2 = 1,
			},
		},
		hrt_3 = {
			u_keys = {
				hrt_3 = 1,
			},
		},
		hrt_4 = {
			u_keys = {
				hrt_4 = 1,
			},
		},
		hrt_1_2 = {
			u_keys = {
				hrt_1 = 1,
				hrt_2 = 1,
			},
		},
		hrt_3_4 = {
			u_keys = {
				hrt_3 = 1,
				hrt_4 = 1,
			},
		},
		hrt_1_2_3_4 = {
			u_keys = {
				hrt_1 = 1,
				hrt_2 = 1,
				hrt_3 = 1,
				hrt_4 = 1,
			},
		},
		swat_1 = {
			u_keys = {
				swat_1 = 1,
			},
		},
		swat_2 = {
			u_keys = {
				swat_2 = 1,
			},
		},
		swat_3 = {
			u_keys = {
				swat_3 = 1,
			},
		},
		swat_1_2_3 = {
			u_keys = {
				swat_1 = 1,
				swat_2 = 1,
				swat_3 = 1,
			},
		},
		heavy_1 = {
			u_keys = {
				heavy_1 = 1,
			},
		},
		heavy_2 = {
			u_keys = {
				heavy_2 = 1,
			},
		},
		heavy_3 = {
			u_keys = {
				heavy_3 = 1,
			},
		},
		heavy_1_2_3 = {
			u_keys = {
				heavy_1 = 1,
				heavy_2 = 1,
				heavy_3 = 1,
			},
		},
		shield = {
			access = access_walk,
			special_type = "shield",
			u_keys = {
				shield = 1,
			},
		},
		taser = {
			special_type = "taser",
			u_keys = {
				taser = 1,
			},
		},
		tank = {
			special_type = "tank",
			u_keys = {
				dozer_1 = 1,  -- always present
				dozer_2 = dozer_difficulty_threshold("dozer_2"),
				dozer_3 = dozer_difficulty_threshold("dozer_3"),
				dozer_4 = dozer_difficulty_threshold("dozer_4"),
				dozer_5 = dozer_difficulty_threshold("dozer_5"),
			},
		},
		titan = {
			special_type = "tank",
			u_keys = {
				dozer_hw = 1,
			},
		},
		medic_1 = {
			special_type = "medic",
			u_keys = {
				medic_1 = 1,
			},
		},
		medic_2 = {
			special_type = "medic",
			u_keys = {
				medic_2 = 1,
			},
		},
		medic_1_2 = {
			special_type = "medic",
			u_keys = {
				medic_1 = 1,
				medic_2 = 1,
			},
		},
		marshal_marksman = {
			u_keys = {
				marshal_1 = 1,
			},
		},
		marshal_shield = {
			access = access_walk,
			u_keys = {
				marshal_2 = 1,
			},
		},
	}) do
		self.unit_categories["CS_" .. id] = generate_category(data)
		self.unit_categories["FBI_" .. id] = generate_category(data)
	end

	for id, based_on in pairs(self.tweak_data.moon.vanilla_category_translations) do
		self.unit_categories[id] = self.unit_categories[based_on]
	end

	local tiers_by_difficulty = {
		normal = { CS = "normal", FBI = "normal", },
		hard = { CS = "normal", FBI = "normal", },
		overkill = { CS = "normal", FBI = "overkill_145", },
		overkill_145 = { CS = "overkill_145", FBI = "overkill_145", },
		easy_wish = { CS = "overkill_145", FBI = "overkill_290", },
		overkill_290 = { CS = "overkill_290", FBI = "overkill_290", },
		awesome_difficulty_name = { CS = "overkill_290", FBI = "sm_wish", },
		sm_wish = { CS = "sm_wish", FBI = "sm_wish", },
	}

	self:moon_swap_units(tiers_by_difficulty[ASS.level_mod])
end

-- only run ASS hooks during the set difficulty functions
Hooks:PostHook( GroupAITweakData, "init", "ass_init", function(self, tweak_data)
	if not tweak_data.moon then
		return
	end

	self.tweak_data = tweak_data

	self:_moon_init_unit_categories()
	self:_moon_init_enemy_spawn_groups()
	self:_moon_init_task_data()
end )
