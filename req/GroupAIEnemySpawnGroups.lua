local GroupAIEnemySpawnGroups = {}

function GroupAIEnemySpawnGroups.old_style_streamlined(group_ai, freq, base_cooldown)
	local tactics = {
		swat_shotgun_rush = {
			"charge",
			"smoke_grenade",
			"deathguard"
		},
		swat_shotgun_flank = {
			"charge",
			"flank",
			"flash_grenade",
			"deathguard"
		},
		swat_rifle = {
			"ranged_fire"
		},
		swat_rifle_flank = {
			"flank",
			"flash_grenade"
		},
		shield_ranged = {
			"shield",
			"ranged_fire",
			"deathguard"
		},
		shield_ranged_cover = {
			"shield_cover",
			"ranged_fire",
			"smoke_grenade",
			"deathguard"
		},
		shield_charge = {
			"shield",
			"charge",
			"deathguard"
		},
		shield_charge_cover = {
			"shield_cover",
			"charge",
			"smoke_grenade",
			"flash_grenade",
			"deathguard"
		},
		tazer = {
			"shield_cover",
			"charge",
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"murder"
		},
		tazer_shield = {
			"charge",
			"flank",
			"murder",
			StreamHeist and "shield" or nil
		},
		tank = {
			"shield",
			"charge",
			"flash_grenade",
			"smoke_grenade",
			"murder"
		},
		tank_cover = {
			"shield_cover",
			"charge",
			"murder"
		},
		spooc = {
			"flank",
			"smoke_grenade"
		},
		marshal_marksman = {
			"shield_cover",
			"flank",
			"ranged_fire",
			"deathguard"
		},
		marshal_shield = {
			"shield",
			"flank",
			"ranged_fire",
			"deathguard"
		},
		hostage_rescue = {
			"ranged_fire",
			"smoke_grenade"
		}
	}

	group_ai.enemy_spawn_groups.tac_swats_a = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_swat_MP5",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "CS_swat_MP5",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "CS_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.swat_rifle,
				amount_max = 1,
				freq = freq.elite
			},
		}
	}
	group_ai.enemy_spawn_groups.tac_swats_b = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 2,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "medic_M4_R870",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.rare
			}
		}
	}

	group_ai.enemy_spawn_groups.tac_heavys_a = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_heavy_M4",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "CS_heavy_M4",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "CS_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
		}
	}
	group_ai.enemy_spawn_groups.tac_heavys_b = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 2,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "medic_M4_R870",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.uncommon
			}
		}
	}

	group_ai.enemy_spawn_groups.tac_shields_a = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_shield",
				tactics = tactics.shield_ranged,
				amount_min = 1,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_heavy_M4",
				tactics = tactics.shield_ranged_cover,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_shield_wall_ranged = true,
			tac_shield_wall = true,
			tac_shield_wall_charge = true
		}
	}
	group_ai.enemy_spawn_groups.tac_shields_b = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = tactics.shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "FBI_heavy_G36_R870",
				tactics = tactics.shield_charge_cover,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.shield_charge_cover,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = group_ai.enemy_spawn_groups.tac_shields_a.spawn_point_chk_ref
	}

	group_ai.enemy_spawn_groups.tac_tazers_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tazer,
				amount_min = 1,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_tazer_flanking = true,
			tac_tazer_charge = true
		}
	}
	group_ai.enemy_spawn_groups.tac_tazers_b = {
		amount = { 2, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tazer,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_swat_M4_R870",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.tazer_shield,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = group_ai.enemy_spawn_groups.tac_tazers_a.spawn_point_chk_ref
	}

	group_ai.enemy_spawn_groups.tac_tanks_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = tactics.tank,
				amount_min = 1,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_MP5_R870",
				tactics = tactics.tank_cover,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_bull_rush = true
		}
	}
	group_ai.enemy_spawn_groups.tac_tanks_b = {
		amount = { 2, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_tank",
				tactics = tactics.tank,
				amount_min = 1,
				amount_max = 2,
				freq = freq.elite
			},
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tank_cover,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_heavy_G36",
				tactics = tactics.tank_cover,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = tactics.tank_cover,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = group_ai.enemy_spawn_groups.tac_tanks_a.spawn_point_chk_ref
	}

	group_ai.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.spooc,
				freq = freq.baseline
			}
		}
	}
	group_ai.enemy_spawn_groups.FBI_spoocs = group_ai.enemy_spawn_groups.single_spooc

	group_ai.enemy_spawn_groups.tac_spoocs_a = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.spooc,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			FBI_spoocs = true
		}
	}
	group_ai.enemy_spawn_groups.tac_spoocs_b = {
		amount = { 2, 2 },
		spawn = {
			{
				rank = 2,
				unit = "spooc",
				tactics = tactics.spooc,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.spooc,
				amount_max = 1,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = group_ai.enemy_spawn_groups.tac_spoocs_a.spawn_point_chk_ref
	}

	-- occasional fbi agent for support if players get close
	-- would make marshals spawn normally but that disables their spawn limit
	group_ai.enemy_spawn_groups.marshal_squad = {
		max_nr_simultaneous_groups = 2,
		spawn_cooldown = base_cooldown,
		amount = { 1, 2 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_marksman",
				tactics = tactics.marshal_marksman,
				amount_min = 1,
				amount_max = 2,
				freq = freq.common
			},
			{
				rank = 2,
				unit = "marshal_shield",
				tactics = tactics.marshal_shield,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.marshal_marksman,
				freq = freq.baseline
			}
		}
	}

	group_ai.enemy_spawn_groups.recon_a = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_MP5",
				tactics = tactics.hostage_rescue,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.hostage_rescue,
				amount_max = 1,
				freq = freq.common
			}
		}
	}
	group_ai.enemy_spawn_groups.recon_b = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.hostage_rescue,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = tactics.hostage_rescue,
				freq = freq.uncommon
			}
		}
	}
	group_ai.enemy_spawn_groups.recon_c = {
		max_nr_simultaneous_groups = 1,
		spawn_cooldown = base_cooldown * 2,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = tactics.hostage_rescue,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.hostage_rescue,
				amount_max = 1,
				freq = freq.rare
			}
		}
	}

	group_ai.enemy_spawn_groups.reenforce_a = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_MP5",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.swat_rifle,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_cop_stealth_R870",
				tactics = tactics.swat_shotgun_rush,
				freq = freq.common
			}
		}
	}
	group_ai.enemy_spawn_groups.reenforce_b = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_MP5_R870",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = tactics.swat_rifle,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				freq = freq.common
			}
		}
	}
	group_ai.enemy_spawn_groups.reenforce_c = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_heavy_M4",
				tactics = tactics.swat_rifle,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "CS_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				freq = freq.common
			}
		}
	}
	group_ai.enemy_spawn_groups.reenforce_d = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_heavy_M4",
				tactics = tactics.swat_rifle,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				freq = freq.baseline
			}
		}
	}

	local no_spawn_point_chk_ref = {
		tac_swat_shotgun_rush_no_medic = true,
		tac_swat_shotgun_flank_no_medic = true,
		tac_swat_rifle_no_medic = true,
		tac_swat_rifle_flank_no_medic = true,
		tac_swat_shotgun_rush = true,
		tac_swat_shotgun_flank = true,
		tac_swat_rifle = true,
		tac_shield_wall_ranged = true,
		tac_shield_wall_charge = true,
		tac_shield_wall = true,
		tac_tazer_flanking = true,
		tac_tazer_charge = true,
		tac_bull_rush = true,
		Phalanx = true,
		single_spooc = true,
		FBI_spoocs = true,
		snowman_boss = true
	}
	for group_name, group in pairs(group_ai.enemy_spawn_groups) do
		if not no_spawn_point_chk_ref[group_name] and not group.spawn_point_chk_ref then
			group.spawn_point_chk_ref = {
				tac_swat_rifle_flank = true
			}
		end
	end
end

-- shame most tactics do little to nothing in vanilla

-- non-flankers use smoke bombs (helps conceal their approach)
-- but flankers use flashbangs (if they used smoke, youd be prepared for them, defeating the point of flanking)

-- shields stay in front of their backup and keep guard if they take you down
-- taser makes sure youre down for good, and hides behind backup in sh (shield tactics do nothing in vanilla)
-- bulldozer also makes sure youre down for good, and is his own shield
-- despite being a flanker, cloaker uses smoke to conceal his charge until its too late
-- marshals find an alternate route and keep guard after a takedown
-- phalanx come in for a takedown, put you down, and move on to the next target

function GroupAIEnemySpawnGroups.van_style_streamlined(group_ai, freq, base_cooldown)
	local tactics = {
		swat_shotgun_rush = {
			"charge",
			"smoke_grenade",
			"deathguard"
		},
		swat_shotgun_flank = {
			"charge",
			"flank",
			"flash_grenade",
			"deathguard"
		},
		swat_rifle = {
			"ranged_fire",
			"smoke_grenade"
		},
		swat_rifle_flank = {
			"flank",
			"flash_grenade"
		},
		shield_ranged = {
			"shield",
			"ranged_fire",
			"deathguard"
		},
		shield_charge = {
			"shield",
			"charge",
			"deathguard"
		},
		shield_cover = {
			"shield_cover",
			"deathguard"
		},
		tazer_flanking = {
			"shield_cover",
			"flank",
			"flash_grenade",
			"murder"
		},
		tazer_charge = {
			"shield_cover",
			"charge",
			"smoke_grenade",
			"murder"
		},
		tazer_shield = {
			"murder",
			StreamHeist and "shield"
		},
		tank_rush = {
			"shield",
			"charge",
			"murder"
		},
		tank_cover = {
			"shield_cover",
			"murder"
		},
		spooc = {
			"flank",
			"smoke_grenade"
		},
		marshal_marksman = {
			"shield_cover",
			"flank",
			"ranged_fire",
			"deathguard"
		},
		marshal_shield = {
			"shield",
			"flank",
			"ranged_fire",
			"deathguard"
		}
	}

	local unit_names_map = {
		FBI_swat_M4 = "CS_swat_MP5",
		FBI_swat_R870 = "CS_swat_R870",
		FBI_heavy_G36 = "CS_heavy_M4",
		FBI_heavy_R870 = "CS_heavy_R870"
	}

	-- copies a group, then removes units that arent lights or heavies, lowers heavy frequency,
	-- and ensures a spawn point check reference is set
	local function no_medic_group(original_group)
		local g = deep_clone(original_group)

		for i = #g.spawn, 1, -1 do
			local enemy = g.spawn[i]
			local unit = enemy.unit
			local mapped_unit = unit_names_map[unit]

			if mapped_unit then
				unit = mapped_unit

				if unit:match("heavy") then
					enemy.freq = freq.common
				end
			else
				table.remove(g.spawn, i)
			end
		end

		g.spawn_point_chk_ref = g.spawn_point_chk_ref or {
			tac_swat_rifle_flank = true
		}

		return g
	end

	-- no reenforce groups.
	-- reenforce doesnt work properly in vanilla thanks to u173, they end up behaving more like regular assault units if spawned
	-- sh restores reenforce, and its reenforce groups are fine for this mode
	local sh_reenforce_groups = {
		reenforce_init = true,
		reenforce_light = true,
		reenforce_heavy = true
	}
	for group in pairs(sh_reenforce_groups) do
		if group_ai.enemy_spawn_groups[group] then
			local spawn = group_ai.enemy_spawn_groups[group].spawn

			for i = #spawn, 1, -1 do
				local unit = spawn[i].unit
				local mapped_unit = unit_names_map[unit]

				if mapped_unit then
					unit = mapped_unit
				end
			end
		end
	end

	-- 4 regular swat groups, non-flank/flank shotgunners/riflemen
	-- non-flankers can spawn with an fbi agent
	-- flankers can spawn with an extra special

	group_ai.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	group_ai.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic = no_medic_group(group_ai.enemy_spawn_groups.tac_swat_shotgun_rush)

	-- occasional cloaker helps force player to not pick their targets like a dingus
	group_ai.enemy_spawn_groups.tac_swat_shotgun_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	group_ai.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic = no_medic_group(group_ai.enemy_spawn_groups.tac_swat_shotgun_flank)

	group_ai.enemy_spawn_groups.tac_swat_rifle = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.swat_rifle,
				amount_min = 0,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = tactics.swat_rifle,
				amount_min = 0,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	group_ai.enemy_spawn_groups.tac_swat_rifle_no_medic = no_medic_group(group_ai.enemy_spawn_groups.tac_swat_rifle)

	-- riflemen deal consistent damage to taser's victim, but these guys arent as coordinated as in the taser or dozer groups
	group_ai.enemy_spawn_groups.tac_swat_rifle_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = freq.uncommon
			}
		}
	}
	group_ai.enemy_spawn_groups.tac_swat_rifle_flank_no_medic = no_medic_group(group_ai.enemy_spawn_groups.tac_swat_rifle_flank)

	-- 2 shield groups (tac_shield_wall is disgusting and not needed, set to the same as ranged)
	-- spawn with heavies/medic who have a health pool worth protecting and fbi agents who have damage worth protecting

	group_ai.enemy_spawn_groups.tac_shield_wall_ranged = {
		amount = { 4, 5 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = tactics.shield_ranged,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_heavy_G36",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			}
		}
	}
	group_ai.enemy_spawn_groups.tac_shield_wall = group_ai.enemy_spawn_groups.tac_shield_wall_ranged

	group_ai.enemy_spawn_groups.tac_shield_wall_charge = {
		amount = { 4, 5 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = tactics.shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 4,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			}
		}
	}

	-- 2 taser groups
	-- spawn with light swat to assist in taking down the player while taser has them immobilized
	-- they can and will throw themselves in front of taser too, to keep him from being interrupted when playing with sh

	-- flank taser sneaks around and, if a cloaker is with him, forces a decision between an instant down or a possible down from damage
	group_ai.enemy_spawn_groups.tac_tazer_flanking = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tazer_flanking,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.tazer_shield,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = tactics.tazer_shield,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			}
		}
	}

	-- charge taser can have a shield so he can rush in and not get shot so easily
	group_ai.enemy_spawn_groups.tac_tazer_charge = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tazer_charge,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = tactics.tazer_shield,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = tactics.tazer_shield,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			}
		}
	}

	-- 1 bulldozer group

	-- spawns with rifle and shotgun heavies who are bulky enough to not go down immediately if caught not hiding behind the dozer
	-- if a taser spawns with him, well, shame if you get immobilized in front of the walking tank
	group_ai.enemy_spawn_groups.tac_bull_rush = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = tactics.tank_rush,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.tank_cover,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_heavy_G36",
				tactics = tactics.tank_cover,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = tactics.tank_cover,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			}
		}
	}

	-- 2 cloaker groups

	-- this one is only used on old maps as part of SO spawns, 1 cloaker only to reduce spam
	group_ai.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.spooc,
				amount_min = 1,
				amount_max = 1,
				freq = freq.baseline
			}
		}
	}

	-- cloaker can spawn by himself, or with an extra unit
	-- additional cloaker for extra stress, or more commonly an fbi agent to, as you may guess, force target prioritization
	group_ai.enemy_spawn_groups.FBI_spoocs = {
		amount = { 1, 2 },
		spawn = {
			{
				rank = 2,
				unit = "spooc",
				tactics = tactics.spooc,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.spooc,
				amount_min = 0,
				amount_max = 1,
				freq = freq.baseline
			}
		}
	}

	-- occasional fbi agent for support if players get close
	-- would make marshals spawn normally but that disables their spawn limit
	group_ai.enemy_spawn_groups.marshal_squad = {
		max_nr_simultaneous_groups = 2,
		spawn_cooldown = base_cooldown,
		amount = { 1, 2 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_marksman",
				tactics = tactics.marshal_marksman,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.marshal_marksman,
				amount_min = 0,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "marshal_shield",
				tactics = tactics.marshal_shield,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	-- 1 recon group

	-- can spawn with a taser to help keep companions alive if a player comes to hunt them down
	group_ai.enemy_spawn_groups.hostage_rescue = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
end

GroupAIEnemySpawnGroups.old_style_vanilla = GroupAIEnemySpawnGroups.old_style_streamlined
GroupAIEnemySpawnGroups.van_style_vanilla = GroupAIEnemySpawnGroups.van_style_streamlined

return GroupAIEnemySpawnGroups