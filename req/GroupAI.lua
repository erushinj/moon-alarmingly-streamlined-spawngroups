local GroupAI = {
	enemy_spawn_groups = {},
	unit_categories = {},
	task_data = {},
}

function GroupAI.enemy_spawn_groups.marshal_disabled_levels()
	return {
		jewelry_store = true,
		four_stores = true,
		ukrainian_job_prof = true,
		alex_1 = true,
		alex_2 = true,
		mia_2 = true,
		rat = true,
		chew = true,
		flat = true,
		nmh = true,
		mad = true,
		hvh = true,
		bph = true,
		vit = true,
		bex = true,
		skm_bex = true,
		pex = true,
		fex = true,
	}
end

function GroupAI.enemy_spawn_groups.super_serious_tweaks(groups)
	local unit_mapping = {
		CS_tazer = {
			rifle = "CS_heavy_M4",
			shotgun = "CS_heavy_R870",
			default = "CS_shield",
		},
		FBI_tazer = {
			rifle = "FBI_heavy_G36",
			shotgun = "FBI_heavy_R870",
			default = "FBI_shield",
		},
		CS_spooc = {
			rifle = "CS_cop_C45_MP5",
			shotgun = "CS_cop_stealth_R870",
			default = "CS_cop_C45_R870",
		},
		FBI_spooc = {
			rifle = "FBI_suit_C45_M4",
			shotgun = "FBI_suit_stealth_MP5",
			default = "FBI_suit_C45_MP5",
		},
		CS_tank = { default = "CS_heavy_M4_R870", },
		FBI_tank = { default = "FBI_heavy_G36_R870", },
		FBI_medic_M4 = { default = "FBI_suit_C45_M4", },
		FBI_medic_R870 = { default = "FBI_suit_stealth_MP5", },
		FBI_medic_M4_R870 = { default = "FBI_suit_C45_MP5", },
		-- just in case SSS reenables marshals at any point
		marshal_marksman = { default = "FBI_swat_M4", },
		marshal_shield = { default = "FBI_shield", }
	}
	local type_mapping = {
		spooc = "shotgun",
		shotgun = "shotgun",
		charge = "shotgun",
		recon = "shotgun",
		rifle = "rifle",
		ranged = "rifle",
		flank = "rifle",
		rescue = "rifle",
	}

	for id, data in pairs(groups) do
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

function GroupAI.enemy_spawn_groups.original(groups, freq, spawn_cooldown)
	local tactics = {
		swat_shotgun_rush = {
			"charge",
			"smoke_grenade",
			"deathguard",
		},
		swat_shotgun_flank = {
			"charge",
			"flank",
			"flash_grenade",
			"deathguard",
		},
		swat_rifle = {
			"ranged_fire",
		},
		swat_rifle_flank = {
			"flank",
			"flash_grenade",
		},
		shield_ranged = {
			"shield",
			"ranged_fire",
			"deathguard",
		},
		shield_ranged_cover = {
			"shield_cover",
			"ranged_fire",
			"smoke_grenade",
			"deathguard",
		},
		shield_charge = {
			"shield",
			"charge",
			"deathguard",
		},
		shield_charge_cover = {
			"shield_cover",
			"charge",
			"smoke_grenade",
			"flash_grenade",
			"deathguard",
		},
		tazer = {
			"shield_cover",
			"charge",
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"murder",
		},
		tazer_shield = {
			"shield",
			"charge",
			"flank",
			"murder",
		},
		tank = {
			"shield",
			"charge",
			"flash_grenade",
			"smoke_grenade",
			"murder",
		},
		tank_cover = {
			"shield_cover",
			"charge",
			"murder",
		},
		spooc = {
			"flank",
			"smoke_grenade",
		},
		marshal_marksman = {
			"shield_cover",
			"flank",
			"ranged_fire",
			"deathguard",
		},
		marshal_shield = {
			"shield",
			"flank",
			"ranged_fire",
			"deathguard",
		},
		recon_def = {
			"ranged_fire",
			"flank",
		},
		recon_agg = {
			"smoke_grenade",
		},
		reenforce_def = {
			"ranged_fire",
		},
		reenforce_agg = {
			"smoke_grenade",
			"flash_grenade",
		}
	}

	groups.tac_swats_a = {
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
				unit = "CS_cop_C45_R870",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.elite
			},
		}
	}
	groups.tac_swats_b = {
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
				unit = "FBI_spooc",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_medic_M4_R870",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.rare
			}
		}
	}

	groups.tac_heavys_a = {
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
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.elite
			},
		}
	}
	groups.tac_heavys_b = {
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
				unit = "FBI_tazer",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_medic_M4_R870",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.uncommon
			}
		}
	}

	groups.tac_shields_a = {
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
	groups.tac_shields_b = {
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
				unit = "FBI_heavy_G36",
				tactics = tactics.shield_charge_cover,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = tactics.shield_charge_cover,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "FBI_suit_M4_MP5",
				tactics = tactics.shield_charge_cover,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = tactics.shield_charge_cover,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = groups.tac_shields_a.spawn_point_chk_ref
	}

	groups.tac_tazers_a = {
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
	groups.tac_tazers_b = {
		amount = { 2, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = tactics.tazer,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = tactics.tazer_shield,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = tactics.tazer_shield,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = groups.tac_tazers_a.spawn_point_chk_ref
	}

	groups.tac_tanks_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tank",
				tactics = tactics.tank,
				amount_min = 1,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_MP5",
				tactics = tactics.tank_cover,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_swat_R870",
				tactics = tactics.tank_cover,
				freq = freq.common
			}
		},
		spawn_point_chk_ref = {
			tac_bull_rush = true
		}
	}
	groups.tac_tanks_b = {
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
				unit = "FBI_tazer",
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
				freq = freq.common
			}
		},
		spawn_point_chk_ref = groups.tac_tanks_a.spawn_point_chk_ref
	}

	groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = tactics.spooc,
				freq = freq.baseline
			}
		}
	}
	groups.FBI_spoocs = groups.single_spooc

	groups.tac_spoocs_a = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "CS_spooc",
				tactics = tactics.spooc,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			FBI_spoocs = true
		}
	}
	groups.tac_spoocs_b = {
		amount = { 2, 2 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_spooc",
				tactics = tactics.spooc,
				amount_min = 1,
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
		spawn_point_chk_ref = groups.tac_spoocs_a.spawn_point_chk_ref
	}

	-- occasional fbi agent for support if players get close
	-- would make marshals spawn normally but that disables their spawn limit
	groups.marshal_squad = {
		max_nr_simultaneous_groups = ASS:marshal_squads_allowed(),
		spawn_cooldown = spawn_cooldown,
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

	local function recon_group(unit_1, unit_2, unit_2_freq)
		return {
			amount = { 2, 3 },
			spawn = {
				{
					rank = 1,
					unit = unit_1,
					tactics = tactics.recon_def,
					freq = freq.baseline
				},
				{
					rank = 1,
					unit = unit_2,
					tactics = tactics.recon_agg,
					amount_max = 1,
					freq = unit_2_freq
				}
			}
		}
	end
	groups.recon_a = recon_group("CS_cop_C45_MP5", "CS_cop_MP5_R870", freq.common)
	groups.recon_b = recon_group("CS_cop_MP5_R870", "CS_swat_MP5", freq.uncommon)
	groups.recon_c = recon_group("CS_cop_stealth_R870", "CS_tazer", freq.rare)
	-- not a real recon group, just recon_c but able to spawn rarely mid-assault
	groups.recon_d = recon_group("FBI_suit_stealth_MP5", "FBI_tazer", freq.elite)

	local function reenforce_group(unit_1, unit_2)
		return {
			amount = { 2, 3 },
			spawn = {
				{
					rank = 1,
					unit = unit_1,
					tactics = tactics.reenforce_def,
					freq = freq.baseline
				},
				{
					rank = 1,
					unit = unit_2,
					tactics = tactics.reenforce_agg,
					amount_max = 1,
					freq = freq.common
				}
			}
		}
	end
	groups.reenforce_a = reenforce_group("CS_cop_C45_MP5", "CS_cop_stealth_R870")
	groups.reenforce_b = reenforce_group("CS_cop_C45_R870", "CS_swat_MP5_R870")
	groups.reenforce_c = reenforce_group("CS_heavy_M4", "CS_heavy_R870")

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
		snowman_boss = true,
	}
	for id, data in pairs(groups) do
		if not no_spawn_point_chk_ref[id] and not data.spawn_point_chk_ref then
			data.spawn_point_chk_ref = {
				tac_swat_rifle_flank = true
			}
		end
	end
end

-- non-flankers use smoke bombs (helps conceal their approach)
-- but flankers use flashbangs (if they used smoke, youd be prepared for them, defeating the point of flanking)

-- shields stay in front of their backup and keep guard if they take you down
-- taser makes sure youre down for good, and hides behind backup in sh (shield tactics do nothing in vanilla)
-- bulldozer also makes sure youre down for good, and is his own shield
-- despite being a flanker, cloaker uses smoke to conceal his charge until its too late
-- marshals find an alternate route and keep guard after a takedown
-- phalanx come in for a takedown, put you down, and move on to the next target

function GroupAI.enemy_spawn_groups.streamlined(groups, freq, spawn_cooldown)
	local tactics = {
		swat_shotgun_rush = {
			"charge",
			"smoke_grenade",
			"deathguard",
		},
		swat_shotgun_flank = {
			"charge",
			"flank",
			"flash_grenade",
			"deathguard",
		},
		swat_rifle = {
			"ranged_fire",
			"smoke_grenade",
		},
		swat_rifle_flank = {
			"flank",
			"flash_grenade",
		},
		shield_ranged = {
			"shield",
			"ranged_fire",
			"deathguard",
		},
		shield_charge = {
			"shield",
			"charge",
			"deathguard",
		},
		shield_cover = {
			"shield_cover",
			"deathguard",
		},
		tazer_flanking = {
			"shield_cover",
			"flank",
			"flash_grenade",
			"murder",
		},
		tazer_charge = {
			"shield_cover",
			"charge",
			"smoke_grenade",
			"murder",
		},
		tazer_shield = {
			"shield",
			"murder",
		},
		tank_rush = {
			"shield",
			"charge",
			"murder",
		},
		tank_cover = {
			"shield_cover",
			"murder",
		},
		spooc = {
			"flank",
			"smoke_grenade",
		},
		marshal_marksman = {
			"shield_cover",
			"flank",
			"ranged_fire",
			"deathguard",
		},
		marshal_shield = {
			"shield",
			"flank",
			"ranged_fire",
			"deathguard",
		}
	}

	local unit_names_map = {
		FBI_swat_M4 = "CS_swat_MP5",
		FBI_swat_R870 = "CS_swat_R870",
		FBI_heavy_G36 = "CS_heavy_M4",
		FBI_heavy_R870 = "CS_heavy_R870",
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

	-- 4 regular swat groups, non-flank/flank shotgunners/riflemen
	-- non-flankers can spawn with an fbi agent
	-- flankers can spawn with an extra special

	groups.tac_swat_shotgun_rush = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	groups.tac_swat_shotgun_rush_no_medic = no_medic_group(groups.tac_swat_shotgun_rush)

	-- occasional cloaker helps force player to not pick their targets like a dingus
	groups.tac_swat_shotgun_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	groups.tac_swat_shotgun_flank_no_medic = no_medic_group(groups.tac_swat_shotgun_flank)

	groups.tac_swat_rifle = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.swat_rifle,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = tactics.swat_rifle,
				amount_max = 1,
				freq = freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	groups.tac_swat_rifle_no_medic = no_medic_group(groups.tac_swat_rifle)

	-- riflemen deal consistent damage to taser's victim, but these guys arent as coordinated as in the taser or dozer groups
	groups.tac_swat_rifle_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle_flank,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.swat_rifle_flank,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_tazer",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.uncommon
			}
		}
	}
	groups.tac_swat_rifle_flank_no_medic = no_medic_group(groups.tac_swat_rifle_flank)

	-- 2 shield groups (tac_shield_wall is disgusting and not needed, set to the same as ranged)
	-- spawn with heavies/medic who have a health pool worth protecting and fbi agents who have damage worth protecting

	groups.tac_shield_wall_ranged = {
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
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.shield_cover,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_medic_M4",
				tactics = tactics.shield_cover,
				amount_max = 1,
				freq = freq.elite
			}
		}
	}
	groups.tac_shield_wall = groups.tac_shield_wall_ranged

	groups.tac_shield_wall_charge = {
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
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.shield_cover,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_medic_R870",
				tactics = tactics.shield_cover,
				amount_max = 1,
				freq = freq.elite
			}
		}
	}

	-- 2 taser groups
	-- spawn with light swat to assist in taking down the player while taser has them immobilized
	-- they can and will throw themselves in front of taser too, to keep him from being interrupted when playing with sh

	-- flank taser sneaks around and, if a cloaker is with him, forces a decision between an instant down or a possible down from damage
	groups.tac_tazer_flanking = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = tactics.tazer_flanking,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = tactics.tazer_shield,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			}
		}
	}

	-- charge taser can have a shield so he can rush in and not get shot so easily
	groups.tac_tazer_charge = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tazer",
				tactics = tactics.tazer_charge,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = tactics.tazer_shield,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			}
		}
	}

	-- 1 bulldozer group

	-- spawns with rifle and shotgun heavies who are bulky enough to not go down immediately if caught not hiding behind the dozer
	-- if a taser spawns with him, well, shame if you get immobilized in front of the walking tank
	groups.tac_bull_rush = {
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
				unit = "FBI_tazer",
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
		}
	}

	-- 2 cloaker groups

	-- this one is only used on old maps as part of SO spawns, 1 cloaker only to reduce spam
	groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_spooc",
				tactics = tactics.spooc,
				freq = freq.baseline
			}
		}
	}

	-- cloaker can spawn by himself, or with an extra unit
	-- additional cloaker for extra stress, or more commonly an fbi agent to, as you may guess, force target prioritization
	groups.FBI_spoocs = {
		amount = { 1, 2 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_spooc",
				tactics = tactics.spooc,
				amount_min = 1,
				amount_max = 2,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.spooc,
				amount_max = 1,
				freq = freq.baseline
			}
		}
	}

	-- occasional fbi agent for support if players get close
	-- would make marshals spawn normally but that disables their spawn limit
	groups.marshal_squad = {
		max_nr_simultaneous_groups = ASS:marshal_squads_allowed(),
		spawn_cooldown = spawn_cooldown,
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
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "marshal_shield",
				tactics = tactics.marshal_shield,
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
	groups.hostage_rescue = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "CS_cop_C45_R870",
				tactics = tactics.swat_rifle_flank,
				amount_min = 2,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = tactics.swat_rifle_flank,
				amount_max = 1,
				freq = freq.elite
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	local function reenforce_group(unit_1, unit_2)
		return {
			amount = { 2, 3 },
			spawn = {
				{
					rank = 1,
					unit = unit_1,
					tactics = tactics.swat_rifle,
					freq = freq.baseline
				},
				{
					rank = 1,
					unit = unit_2,
					tactics = tactics.swat_shotgun_rush,
					freq = freq.common
				}
			},
			spawn_point_chk_ref = {
				tac_swat_rifle_flank = true
			}
		}
	end

	groups.reenforce_init = reenforce_group("CS_cop_C45_MP5", "CS_cop_stealth_R870")
	groups.reenforce_light = reenforce_group("CS_swat_MP5", "CS_swat_R870")
	groups.reenforce_heavy = reenforce_group("CS_heavy_M4", "CS_heavy_R870")
end

local function set_cs_to_fbi(categories)
	local category_map = {
		CS_cop_C45_MP5 = "FBI_suit_C45_M4",
		CS_cop_MP5_R870 = "FBI_suit_M4_MP5",
		CS_cop_stealth_R870 = "FBI_suit_stealth_MP5",
		CS_swat_MP5 = "FBI_swat_M4",
		CS_swat_R870 = "FBI_swat_R870",
		CS_heavy_M4 = "FBI_heavy_G36",
		CS_heavy_R870 = "FBI_heavy_R870",
		CS_shield = "FBI_shield",
	}

	for cs, fbi in pairs(category_map) do
		if categories[cs] and categories[fbi] then
			categories[cs].unit_types = clone(categories[fbi].unit_types)
		end
	end
end

function GroupAI.unit_categories.normal(categories)
	categories.CS_cop_C45_R870 = {
		access = clone(categories.spooc.access),
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
			}
		}
	}
	categories.CS_cop_C45_MP5 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_C45_MP5.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
		}
	}
	categories.CS_cop_MP5_R870 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_MP5_R870.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
		}
	}
	categories.CS_cop_stealth_R870 = deep_clone(categories.CS_cop_C45_R870)
	categories.CS_cop_stealth_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"), }
	}
	categories.CS_swat_MP5.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"), }
	}
	categories.CS_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"), }
	}
	categories.CS_heavy_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"), }
	}
	categories.CS_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"), }
	}
	categories.CS_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"), }
	}
	categories.FBI_suit_C45_M4 = deep_clone(categories.CS_cop_C45_MP5)
	categories.FBI_suit_M4_MP5 = deep_clone(categories.CS_cop_MP5_R870)
	categories.FBI_suit_stealth_MP5 = deep_clone(categories.CS_cop_stealth_R870)
	categories.FBI_swat_M4 = deep_clone(categories.CS_swat_MP5)
	categories.FBI_swat_R870 = deep_clone(categories.CS_swat_R870)
	categories.FBI_heavy_G36 = deep_clone(categories.CS_heavy_M4)
	categories.FBI_heavy_R870 = deep_clone(categories.CS_heavy_R870)
	categories.FBI_shield = deep_clone(categories.CS_shield)
	categories.FBI_tank.unit_types = {
		america = { Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"), }
	}
end

function GroupAI.unit_categories.hard(categories)
	GroupAI.unit_categories.normal(categories)
end

function GroupAI.unit_categories.overkill(categories)
	GroupAI.unit_categories.hard(categories)

	categories.FBI_suit_C45_M4.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
		}
	}
	categories.FBI_suit_M4_MP5.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
		}
	}
	categories.FBI_suit_stealth_MP5.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"), }
	}
	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"), }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"), }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"), }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"), }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"), }
	}

	table.insert(categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
	table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
	table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"))
	table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"))
	table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"))
end

function GroupAI.unit_categories.overkill_145(categories)
	GroupAI.unit_categories.overkill(categories)

	categories.CS_cop_C45_R870.unit_types = {
		america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
			Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
		}
	}

	set_cs_to_fbi(categories)
end

function GroupAI.unit_categories.easy_wish(categories)
	GroupAI.unit_categories.overkill_145(categories)

	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"), }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"), }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"), }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"), }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"), }
	}

	table.insert(categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
	table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
	table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
	table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
	table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
end

function GroupAI.unit_categories.overkill_290(categories)
	GroupAI.unit_categories.easy_wish(categories)

	if ASS.settings.minigun_dozers then
		table.insert(categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
	end

	set_cs_to_fbi(categories)
end

function GroupAI.unit_categories.sm_wish(categories)
	GroupAI.unit_categories.overkill_290(categories)

	categories.FBI_swat_M4.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"), }
	}
	categories.FBI_swat_R870.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"), }
	}
	categories.FBI_heavy_G36.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"), }
	}
	categories.FBI_heavy_R870.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"), }
	}
	categories.FBI_shield.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"), }
	}
	categories.FBI_tank.unit_types = {
		america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
		}
	}

	set_cs_to_fbi(categories)
end

function GroupAI.unit_categories.revert_zeal_specials(categories)
	categories.spooc.unit_types.america = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"), }
	categories.CS_tazer.unit_types.america = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"), }
	categories.FBI_tank.unit_types.america = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
		Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
	}
	categories.medic_M4.unit_types.america = { Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"), }
	categories.medic_R870.unit_types.america = { Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"), }
end

function GroupAI.unit_categories.CS_normal(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"), }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"), }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"), }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"), }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"), }

	set_cs_to_fbi(categories)
end

function GroupAI.unit_categories.CS_FBI_overkill(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	categories.CS_cop_C45_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	}
	categories.CS_cop_MP5_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
	}
	categories.CS_cop_stealth_R870.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), }

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"), }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"), }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"), }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"), }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"), }

	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"), }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"), }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"), }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"), }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"), }
end

function GroupAI.unit_categories.FBI_overkill_145(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"), }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"), }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"), }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"), }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"), }

	set_cs_to_fbi(categories)
end

function GroupAI.unit_categories.FBI_with_office(categories)
	GroupAI.unit_categories.FBI_overkill_145(categories)

	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
		Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
	}
	categories.CS_cop_C45_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"),
		Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"),
		Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"),
		Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"),
	}
	categories.CS_cop_MP5_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1"),
		Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"),
		Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"),
		Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"),
		Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"),
	}
	categories.CS_cop_stealth_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"),
		Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"),
	}
end

function GroupAI.unit_categories.FBI_mcmansion(categories)
	GroupAI.unit_categories.FBI_overkill_145(categories)

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"), }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"), }
end

function GroupAI.unit_categories.FBI_CITY_easy_wish(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), }

	set_cs_to_fbi(categories)

	categories.CS_swat_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"), }
	categories.CS_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"), }
	categories.CS_heavy_M4.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"), }
	categories.CS_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"), }
	categories.CS_shield.unit_types.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"), }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"), }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"), }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"), }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"), }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"), }
end

function GroupAI.unit_categories.CITY_overkill_290(categories)
	categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
	}
	categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
	}
	categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), }

	categories.FBI_swat_M4.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"), }
	categories.FBI_swat_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"), }
	categories.FBI_heavy_G36.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"), }
	categories.FBI_heavy_R870.unit_types.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"), }
	categories.FBI_shield.unit_types.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"), }

	set_cs_to_fbi(categories)
end

local function set_weights(typ, new_weights)
	local groups = typ.groups

	for group, _ in pairs(groups) do
		groups[group] = { 0, 0, 0 }
	end

	for group, weights in pairs(new_weights) do
		groups[group] = weights
	end
end

function GroupAI.task_data.original(group_ai, special_weight)
	set_weights(group_ai.besiege.assault, {
		tac_swats_a = { 6.75, 3.375, 0 },
		tac_swats_b = { 6.75, 10.125, 13.5 },
		tac_heavys_a = { 6.75, 3.375, 0 },
		tac_heavys_b = { 6.75, 10.125, 13.5 },
		tac_shields_a = { 0, special_weight, 0 },
		tac_shields_b = { 0, 0, special_weight * 2 },
		tac_tazers_a = { 0, special_weight, 0 },
		tac_tazers_b = { 0, 0, special_weight * 2 },
		tac_tanks_a = { 0, special_weight * 0.5, 0 },
		tac_tanks_b = { 0, 0, special_weight },
		tac_spoocs_a = { 0, special_weight * 0.5, 0 },
		tac_spoocs_b = { 0, 0, special_weight },
		recon_d = { 0, special_weight * 0.1, special_weight * 0.2 },
	})

	set_weights(group_ai.besiege.recon, {
		recon_a = { 1, 1, 0 },
		recon_b = { 0, 1, 1 },
		recon_c = { 0, 0, 1 },
		recon_d = { 0, 0, 0 },
	})

	set_weights(group_ai.besiege.reenforce, {
		reenforce_a = { 1, 1, 0 },
		reenforce_b = { 0, 1, 1 },
		reenforce_c = { 0, 0, 1 },
	})
end

function GroupAI.task_data.streamlined(group_ai, special_weight)
	set_weights(group_ai.besiege.assault, {
		tac_swat_shotgun_rush = { 2, 3, 4 },
		tac_swat_shotgun_rush_no_medic = { 2, 1, 0 },
		tac_swat_shotgun_flank = { 1, 1.5, 2 },
		tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0 },
		tac_swat_rifle = { 7, 10.5, 14 },
		tac_swat_rifle_no_medic = { 7, 3.5, 0 },
		tac_swat_rifle_flank = { 3.5, 5.25, 7 },
		tac_swat_rifle_flank_no_medic = { 3.5, 1.75, 0 },
		tac_shield_wall_ranged = { 0, special_weight * 0.5, special_weight },
		tac_shield_wall_charge = { 0, special_weight * 0.5, special_weight },
		tac_tazer_flanking = { 0, special_weight * 0.5, special_weight },
		tac_tazer_charge = { 0, special_weight * 0.5, special_weight },
		tac_bull_rush = { 0, special_weight * 0.5, special_weight },
		FBI_spoocs = { 0, special_weight * 0.5, special_weight },
	})

	set_weights(group_ai.besiege.recon, {
		hostage_rescue = { 1, 1, 1 },
	})

	set_weights(group_ai.besiege.reenforce, {
		reenforce_init = { 1, 0, 0 },
		reenforce_light = { 0, 1, 0 },
		reenforce_heavy = { 0, 0, 1 },
	})
end

function GroupAI.task_data.get_skirmish_groups()
	local skm_special_weights = ASS:get_skill_dependent_value("skm_special_weights")
	local w1, w2, w3 = skm_special_weights[1], skm_special_weights[2] * 0.5, skm_special_weights[3]

	local special_weights_original_a = { w1, w2, 0 }
	local special_weights_original_a_double = table.collect(special_weights_original_a, function(val) return val * 2 end)

	local special_weights_original_b = { 0, w2, w3 }
	local special_weights_original_b_double = table.collect(special_weights_original_b, function(val) return val * 2 end)

	local special_weights_original_c = table.collect(skm_special_weights, function(val) return val * 0.1 end)

	local special_weights_streamlined = skm_special_weights

	return {
		original = {
			tac_swats_a = { 6.75, 3.375, 0 },
			tac_swats_b = { 6.75, 10.125, 13.5 },
			tac_heavys_a = { 6.75, 3.375, 0 },
			tac_heavys_b = { 6.75, 10.125, 13.5 },
			tac_shields_a = special_weights_original_a_double,
			tac_shields_b =special_weights_original_b_double,
			tac_tazers_a = special_weights_original_a_double,
			tac_tazers_b = special_weights_original_b_double,
			tac_tanks_a = special_weights_original_a,
			tac_tanks_b = special_weights_original_b,
			tac_spoocs_a = special_weights_original_a,
			tac_spoocs_b = special_weights_original_b,
			recon_d = special_weights_original_c,
		},
		streamlined = {
			tac_swat_shotgun_rush = { 2, 3, 4 },
			tac_swat_shotgun_rush_no_medic = { 2, 1, 0 },
			tac_swat_shotgun_flank = { 1, 1.5, 2 },
			tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0 },
			tac_swat_rifle = { 7, 10.5, 14 },
			tac_swat_rifle_no_medic = { 7, 3.5, 0 },
			tac_swat_rifle_flank = { 3.5, 5.25, 7 },
			tac_swat_rifle_flank_no_medic = { 3.5, 1.75, 0 },
			tac_shield_wall_ranged = special_weights_streamlined,
			tac_shield_wall_charge = special_weights_streamlined,
			tac_tazer_flanking = special_weights_streamlined,
			tac_tazer_charge = special_weights_streamlined,
			tac_bull_rush = special_weights_streamlined,
			FBI_spoocs = special_weights_streamlined,
		},
	}
end

return GroupAI
