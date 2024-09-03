if ASS.is_client then
	return
end

local sss = BLT.Mods:GetModByName("Super Serious Shooter")
local is_super_serious = sss and sss:IsEnabled() and true
local difficulty_index = ASS.difficulty_index
local f = (difficulty_index - 2) / 6
local real_difficulty_index = ASS.real_difficulty_index
local difficulty = ASS.difficulty
local is_editor = ASS.is_editor
local clean_level_id = ASS.clean_level_id

local ignore_unit_categories = table.list_to_set({
	"CS_heavy_M4_w",
	"FBI_heavy_G36_w",
	"Phalanx_minion",
	"Phalanx_vip",
	"piggydozer",
	"snowman_boss",
})
function GroupAITweakData:moon_swap_units(tiers)
	self.moon_last_tiers = tiers or self.moon_last_tiers or {}

	local enemy_mapping = self.tweak_data.moon.enemy_mapping
	local enemy_replacements = self.tweak_data.moon:enemy_replacements(true)
	for prefix, tier in pairs(self.moon_last_tiers) do
		for id, data in pairs(self.unit_categories) do
			if ignore_unit_categories[id] then
				-- nothing
			elseif not data.moon_u_keys then
				ASS:log("warn", "Unit category \"%s\" has no associated unit keys!", id)
			elseif id:match(prefix) then
				for continent in pairs(data.unit_types) do
					local continent_data = enemy_replacements[continent]
					local tier_data = continent_data and continent_data[tier]

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

-- replace specials with more heavies and hrts in Super Serious Shooter (most specials are disabled)
function GroupAITweakData:_moon_super_serious_tweaks()
	if not is_super_serious then
		return
	end

	local unit_mapping = {
		CS_tazer = {
			rifle = "CS_heavy_1",
			shotgun = "CS_heavy_2",
			default = "CS_shield",
		},
		FBI_tazer = {
			rifle = "FBI_heavy_1",
			shotgun = "FBI_heavy_2",
			default = "FBI_shield",
		},
		CS_spooc = {
			rifle = "CS_hrt_2",
			shotgun = "CS_hrt_3",
			default = "CS_hrt_2_3",
			chicken_plate = "CS_heavy_1_2",
		},
		FBI_spooc = {
			rifle = "FBI_hrt_2",
			shotgun = "FBI_hrt_3",
			default = "FBI_hrt_2_3",
			chicken_plate = "FBI_heavy_1_2",
		},
		CS_tank = {
			default = "CS_heavy_1_2",
			chicken_plate = "CS_shield",
		},
		FBI_tank = {
			default = "FBI_heavy_1_2",
			chicken_plate = "FBI_shield",
		},
		CS_medic_1 = {
			default = "CS_hrt_2",
			chicken_plate = "CS_heavy_1",
		},
		CS_medic_2 = {
			default = "CS_hrt_3",
			chicken_plate = "CS_heavy_2",
		},
		CS_medic_1_2 = {
			default = "CS_hrt_2_3",
			chicken_plate = "CS_heavy_1_2",
		},
		FBI_medic_1 = {
			default = "FBI_hrt_2",
			chicken_plate = "FBI_heavy_1",
		},
		FBI_medic_2 = {
			default = "FBI_hrt_3",
			chicken_plate = "FBI_heavy_2",
		},
		FBI_medic_1_2 = {
			default = "FBI_hrt_2_3",
			chicken_plate = "FBI_heavy_1_2",
		},
		-- just in case SSS reenables marshals at any point
		CS_marshal_marksman = { default = "CS_heavy_1", },
		CS_marshal_shield = { default = "CS_shield", },
		FBI_marshal_marksman = { default = "FBI_heavy_1", },
		FBI_marshal_shield = { default = "FBI_shield", },
	}
	unit_mapping.medic_M4 = unit_mapping.FBI_medic_1
	unit_mapping.medic_R870 = unit_mapping.FBI_medic_2
	unit_mapping.spooc = unit_mapping.FBI_spooc
	unit_mapping.marshal_marksman = unit_mapping.FBI_marshal_marksman
	unit_mapping.marshal_shield = unit_mapping.FBI_marshal_shield

	local type_mapping = self.tweak_data.moon.spawn_group_type_mapping
	for id, data in pairs(self.enemy_spawn_groups) do
		local unit_type = nil

		for name, typ in pairs(type_mapping) do
			if id:match(name) then
				unit_type = typ

				break
			end
		end

		for i = 1, #data.spawn do
			local enemy = data.spawn[i]
			local mapped = unit_mapping[enemy.unit]
			local mapped_unit = mapped and (mapped[unit_type] or mapped.default)

			if mapped_unit then
				enemy.unit = mapped_unit
			end
		end
	end
end

GroupAITweakData._moon_assault_styles = {}

-- modernized and tweaked restoration of the pre-crimefest 2016 groups, mostly based around the old OVK difficulty groups
GroupAITweakData._moon_assault_styles.original = function(self, special_weight)
	self:_moon_add_tactics({
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
	})

	self.enemy_spawn_groups.original_swats_a = {
		amount = { 3, 3, },
		spawn = {
			{
				rank = 2,
				unit = "CS_swat_1",
				tactics = self._tactics.original_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_swat_3",
				tactics = self._tactics.original_rifle_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_swat_2",
				tactics = self._tactics.original_shotgun,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_hrt_1_2_3",
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
				unit = "FBI_swat_1",
				tactics = self._tactics.original_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_swat_3",
				tactics = self._tactics.original_rifle_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_swat_2",
				tactics = self._tactics.original_shotgun,
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
				unit = "FBI_medic_1_2",
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
				unit = "CS_heavy_1",
				tactics = self._tactics.original_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "CS_heavy_1",
				tactics = self._tactics.original_rifle_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "CS_heavy_2",
				tactics = self._tactics.original_shotgun,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_hrt_2_3",
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
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_rifle_flank,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_2",
				tactics = self._tactics.original_shotgun,
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
				unit = "FBI_medic_1_2",
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
				unit = "CS_heavy_1",
				tactics = self._tactics.original_shield_ranged_cover,
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
				tactics = self._tactics.original_shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.common,
			},
			{
				rank = 2,
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_shield_charge_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 2,
				unit = "FBI_heavy_2",
				tactics = self._tactics.original_shield_charge_cover,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "FBI_hrt_2_3",
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
				unit = "CS_swat_1",
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
				unit = "FBI_swat_1",
				tactics = self._tactics.original_tazer_shield,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_swat_2",
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
				unit = "CS_swat_1",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
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
				unit = "FBI_heavy_1",
				tactics = self._tactics.original_tank_cover,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_heavy_2",
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
				unit = "FBI_hrt_3",
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
				unit = "CS_hrt_1_2",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_2_3",
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
				unit = "CS_hrt_2_3",
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
				unit = "CS_hrt_3",
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
				unit = "FBI_hrt_3",
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
				unit = "CS_hrt_1_2_3",
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
				unit = "CS_heavy_1_2",
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
		streamlined_rifle_ranged = { "ranged_fire", "smoke_grenade", },
		streamlined_rifle_flank = { "flank", "flash_grenade", },
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
	}
	local function no_medic_group(original_group)
		local g = deep_clone(original_group)

		for i, enemy in table.reverse_ipairs(g.spawn) do
			local unit_type = unit_mapping[enemy.unit]

			if not unit_type then
				table.remove(g.spawn, i)
			else
				enemy.unit = self:moon_get_equivalent_unit_category(enemy.unit) or enemy.unit

				if unit_type == "heavy" then
					enemy.freq = self._freq.common
				end
			end
		end

		return g
	end

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
				unit = "FBI_hrt_3",
				tactics = self._tactics.streamlined_shotgun_rush,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
				tactics = self._tactics.streamlined_shotgun_rush,
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
				tactics = self._tactics.streamlined_shotgun_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
				tactics = self._tactics.streamlined_shotgun_flank,
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
				tactics = self._tactics.streamlined_rifle_ranged,
				amount_max = 1,
				freq = self._freq.rare,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.streamlined_rifle_ranged,
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
				unit = "FBI_heavy_1",
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
				unit = "FBI_tazer",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_max = 1,
				freq = self._freq.elite,
			},
			{
				rank = 1,
				unit = "FBI_medic_1",
				tactics = self._tactics.streamlined_rifle_flank,
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
				unit = "FBI_hrt_3",
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
				unit = "FBI_tazer",
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
				unit = "FBI_tazer",
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
				unit = "FBI_tazer",
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
				unit = "FBI_heavy_1_2",
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
				unit = "FBI_hrt_3",
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
				unit = "CS_hrt_1_2_3",
				tactics = self._tactics.streamlined_rifle_flank,
				amount_min = 2,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_tazer",
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
				unit = "CS_hrt_2",
				tactics = self._tactics.empty,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_1",
				tactics = self._tactics.empty,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_hrt_3",
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

-- pdth-styled spawns
GroupAITweakData._moon_assault_styles.chicken_plate = function(self, special_weight)
	self:_moon_add_tactics({
		empty = {},
		chicken_plate_hrt_pistol = { "flank", "deathguard", },
		chicken_plate_hrt_rifle = { "flank", "deathguard", "ranged_fire", },
		chicken_plate_hrt_shotgun = { "flank", "deathguard", "charge", },
		chicken_plate_swat_rifle = { "ranged_fire", },
		chicken_plate_swat_shotgun = { "smoke_grenade", "deathguard", },
		chicken_plate_swat_smg = { "flank", "flash_grenade", },
		chicken_plate_heavy_rifle = { "flash_grenade", "deathguard", },
		chicken_plate_heavy_shotgun = { "charge", "smoke_grenade", },
		chicken_plate_shield = { "murder", "deathguard", "ranged_fire", },
		chicken_plate_taser = { "murder", "charge", "flank", },
		chicken_plate_tank = { "murder", "charge", "smoke_grenade", },
		chicken_plate_spooc = { "murder", "flank", "smoke_grenade", },
		chicken_plate_medic_rifle = { "flank", "ranged_fire", "no_push", },
		chicken_plate_medic_shotgun = { "flank", "deathguard", "no_push", },
	})

	local function b_group(original_group)
		local g = deep_clone(original_group)

		for i, enemy in pairs(g.spawn) do
			enemy.unit = self:moon_get_equivalent_unit_category(enemy.unit) or enemy.unit
		end

		return g
	end

	self.enemy_spawn_groups.chicken_plate_hrt_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_hrt_1",
				tactics = self._tactics.chicken_plate_hrt_pistol,
				freq = self._freq.uncommon,
			},
			{
				rank = 1,
				unit = "CS_hrt_2",
				tactics = self._tactics.chicken_plate_hrt_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_hrt_3",
				tactics = self._tactics.chicken_plate_hrt_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_hrt_b = b_group(self.enemy_spawn_groups.chicken_plate_hrt_a)
	self.enemy_spawn_groups.chicken_plate_swat_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_1",
				tactics = self._tactics.chicken_plate_swat_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_swat_2",
				tactics = self._tactics.chicken_plate_swat_shotgun,
				freq = self._freq.common,
			},
			{
				rank = 1,
				unit = "CS_swat_3",
				tactics = self._tactics.chicken_plate_swat_smg,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_swat_b = b_group(self.enemy_spawn_groups.chicken_plate_swat_a)
	self.enemy_spawn_groups.chicken_plate_heavy_a = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_1",
				tactics = self._tactics.chicken_plate_heavy_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "CS_heavy_2",
				tactics = self._tactics.chicken_plate_heavy_shotgun,
				freq = self._freq.common,
			},
		},
	}
	self.enemy_spawn_groups.chicken_plate_heavy_b = b_group(self.enemy_spawn_groups.chicken_plate_heavy_a)
	self.enemy_spawn_groups.chicken_plate_shield = {
		amount = { 1, 1, },
		spawn = {
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.chicken_plate_shield,
				freq = self._freq.baseline,
			},
		},
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
				unit = "FBI_medic_1",
				tactics = self._tactics.chicken_plate_medic_rifle,
				freq = self._freq.baseline,
			},
			{
				rank = 1,
				unit = "FBI_medic_2",
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

	for id, data in pairs(self.enemy_spawn_groups) do
		if not vanilla_groups[id] then
			self.enemy_spawn_groups[id] = nil
		else
			for _, enemy in pairs(data.spawn) do
				if enemy.unit == "CS_tazer" then
					enemy.unit = "FBI_tazer"
				end
			end
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

local special_weight_min, special_weight_max = unpack(ASS.tweaks.special_weight_base)
local freq_base = ASS.tweaks.freq_base
local assault_style = ASS.assault_style
function GroupAITweakData:_moon_init_enemy_spawn_groups()
	local assault_styles = self._moon_assault_styles
	local wanted_assault_style = assault_styles[assault_style] and assault_style or "default"
	local assault_style_func = assault_styles[wanted_assault_style]
	local special_weight = math.lerp(special_weight_min, special_weight_max, f)

	self.moon_assault_style = wanted_assault_style

	local id_matches = table.set("no_medic", "rescue", "reenforce")
	local default_medic_freq = difficulty_index / 16
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
	local vanilla_category_translations = clone(self.tweak_data.moon.vanilla_category_translations)
	vanilla_category_translations.CS_tazer = "FBI_tazer"

	for id, data in pairs(self.enemy_spawn_groups) do
		for _, enemy in pairs(data.spawn) do
			enemy.unit = vanilla_category_translations[enemy.unit] or enemy.unit

			if enemy.unit:match("medic") then
				enemy.freq = get_medic_freq(id) or default_medic_freq
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
	for typ, val in pairs(freq_base) do
		self._freq[typ] = math.lerp(val[1], val[2], f)
	end

	-- effectively remove preexisting timed groups
	for _, data in pairs(self.enemy_spawn_groups) do
		if data.max_nr_simultaneous_groups then
			data.initial_spawn_delay = math.huge
			data.spawn_cooldown = math.huge
		end
	end

	assault_style_func(self, special_weight)

	-- no marshals
	self.besiege.assault.groups.marshal_squad = nil
	self.besiege.recon.groups.marshal_squad = nil

	self:_moon_super_serious_tweaks()
end

local grenade_cooldown_mul = ASS.tweaks.grenade_cooldown_mul
local smoke_lifetime_min, smoke_lifetime_max = unpack(ASS.tweaks.smoke_grenade_lifetime)
local spawn_cooldown_max, spawn_cooldown_min = unpack(ASS.tweaks.spawn_cooldowns)
local force_pool_mul = ASS.tweaks.force_pool_mul
local sustain_duration_mul_min, sustain_duration_mul_max = unpack(ASS.tweaks.sustain_duration_muls)
local break_duration_mul = ASS.tweaks.break_duration_mul
local recon_force_mul = ASS.tweaks.recon_force_mul
local cs_grenade_chance_times = ASS.tweaks.cs_grenade_chance_times
local min_grenade_timeout = ASS.tweaks.min_grenade_timeout
local no_grenade_push_delay = ASS.tweaks.no_grenade_push_delay
local reenforce_interval = ASS.tweaks.reenforce_interval
function GroupAITweakData:_moon_init_task_data()
	self.smoke_grenade_timeout = table.collect(self.smoke_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.smoke_grenade_lifetime = math.lerp(smoke_lifetime_min, smoke_lifetime_max, f)
	self.flash_grenade_timeout = table.collect(self.flash_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.cs_grenade_timeout = table.collect(self.cs_grenade_timeout, function(val) return val * grenade_cooldown_mul end)
	self.cs_grenade_lifetime = math.lerp(20, 40, f)
	self.cs_grenade_chance_times = cs_grenade_chance_times
	self.min_grenade_timeout = min_grenade_timeout
	self.no_grenade_push_delay = no_grenade_push_delay
	self.spawn_cooldown_mul = math.lerp(spawn_cooldown_max, spawn_cooldown_min, f)
	self.spawn_kill_cooldown = spawn_cooldown_min * 10

	self.besiege.assault.force_pool = table.collect(self.besiege.assault.force_pool, function(val) return val * force_pool_mul end)
	self.besiege.assault.sustain_duration_base = clone(self.besiege.assault.sustain_duration_min)
	self.besiege.assault.sustain_duration_min = table.collect(self.besiege.assault.sustain_duration_base, function(val) return val * sustain_duration_mul_min end)
	self.besiege.assault.sustain_duration_max = table.collect(self.besiege.assault.sustain_duration_base, function(val) return val * sustain_duration_mul_max end)
	self.besiege.assault.sustain_duration_balance_mul = table.collect(self.besiege.assault.sustain_duration_balance_mul, function(val) return 1 end)
	self.besiege.assault.delay = table.collect(self.besiege.assault.delay, function(val) return val * break_duration_mul end)
	self.besiege.assault.hostage_hesitation_delay = table.collect(self.besiege.assault.hostage_hesitation_delay, function(val) return val * break_duration_mul end)
	self.besiege.reenforce.interval = reenforce_interval
	self.besiege.recon.force = table.collect(self.besiege.assault.force, function(val) return val * recon_force_mul end)
	self.besiege.recon.interval = { 0, 0, 0, }
	self.besiege.recon.interval_variation = 0
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

local special_limit_mul = ASS.tweaks.special_limit_mul
local smg_units = ASS:setting("smg_units")
local level_mod = ASS.level_mod
local dozer_rainbow = clone(ASS.dozer_rainbow)
function GroupAITweakData:_moon_init_unit_categories()
	-- special limits, from easy to death sentence
	-- identical to sh at base, minus allowing dozers on hard
	for special, limit in pairs({
		shield = { 0, 2, 2, 3, 3, 4, 4, 5, },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4, },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3, },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3, },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3, },
	}) do
		self.special_unit_spawn_limits[special] = math.ceil(limit[difficulty_index] * special_limit_mul)
	end

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
		local threshold = dozer_rainbow[typ] or 1

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
		hrt_1_2 = {
			u_keys = {
				hrt_1 = 1,
				hrt_2 = 1,
			},
		},
		hrt_2_3 = {
			u_keys = {
				hrt_2 = 1,
				hrt_3 = 1,
			},
		},
		hrt_1_2_3 = {
			u_keys = {
				hrt_1 = 1,
				hrt_2 = 1,
				hrt_3 = 1,
			},
		},
		hrt_3 = {
			u_keys = {
				hrt_3 = 1,
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
				swat_1 = smg_units and 0 or 1,
				swat_3 = smg_units and 1 or 0,
			},
		},
		swat_1_2 = {
			u_keys = {
				swat_1 = 1,
				swat_2 = 1,
			},
		},
		swat_1_2_3 = {
			u_keys = {
				swat_1 = smg_units and 1 or 2,
				swat_2 = 1,
				swat_3 = smg_units and 1 or 0,
			},
		},
		swat_2_3 = {
			u_keys = {
				swat_1 = smg_units and 0 or 1,
				swat_2 = 1,
				swat_3 = smg_units and 1 or 0,
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
		heavy_1_2 = {
			u_keys = {
				heavy_1 = 1,
				heavy_2 = 1,
			},
		},
		shield = {
			access = access_walk,
			special_type = "shield",
			u_keys = {
				shield = 1,
			},
		},
		tazer = {
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

	self:moon_swap_units(tiers_by_difficulty[level_mod])
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
