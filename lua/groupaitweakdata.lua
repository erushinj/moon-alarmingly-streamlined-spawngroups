--	unit category and task data changes are different with and without streamlined heisting
--	similarly, different enemy spawn groups as well as more different task data are used in """beta""" mode
local ASSGroupAITweakDataModule = ASS:require("ASSGroupAITweakDataModule")

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	--	sets new factions to america if any are added
	--	there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
	local faction_reference = clone(self.unit_categories.spooc.unit_types)
	local current_factions = {
		"america",
		"russia",
		"zombie",
		"murkywater",
		"federales"
	}
	local function check_new_factions_func()
		for faction, _ in pairs(faction_reference) do
			if not table.contains(current_factions, faction) then
				for _, category in pairs(self.unit_categories) do
					if category.unit_types and category.unit_types.america then
						category.unit_types[faction] = deep_clone(category.unit_types.america)
					end
				end
			end
		end
	end

	self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	self.unit_categories.FBI_suit_M4_MP5.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}

	--	correct vh federales dozer, all dozer types for ds zombies
	if difficulty_index < 5 then
		self.unit_categories.FBI_tank.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
		}
	elseif difficulty_index > 7 then
		self.unit_categories.FBI_tank.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
	end

	--	merc marshals makes no sense for zombies
	self.unit_categories.marshal_marksman.unit_types.zombie = self.unit_categories.marshal_marksman.unit_types.america
	self.unit_categories.marshal_shield.unit_types.zombie = self.unit_categories.marshal_shield.unit_types.america

	ASSGroupAITweakDataModule["unit_categories_" .. ASS:req_func_suffix()](self, difficulty_index)

	local function combined_category(category_1, category_2)
		local new_category = deep_clone(category_1)

		for faction, units in pairs(category_2.unit_types) do
			for _, unit in pairs(units) do
				table.insert(new_category.unit_types[faction], unit)
			end
		end

		return new_category
	end

	self.unit_categories.medic_M4_R870 = combined_category(self.unit_categories.medic_M4, self.unit_categories.medic_R870)
	self.unit_categories.FBI_swat_M4_R870 = combined_category(self.unit_categories.FBI_swat_M4, self.unit_categories.FBI_swat_R870)
	self.unit_categories.FBI_heavy_G36_R870 = combined_category(self.unit_categories.FBI_heavy_G36, self.unit_categories.FBI_heavy_R870)
	self.unit_categories.FBI_swat_heavy_M4_G36_R870 = combined_category(self.unit_categories.FBI_swat_M4_R870, self.unit_categories.FBI_heavy_G36_R870)

	check_new_factions_func()

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local difficulty_index = math.clamp(difficulty_index, 2, 8)

	--	shame most tactics do little to nothing in vanilla

	--	non-flankers use smoke bombs (helps conceal their approach)
	--	but flankers use flashbangs (if they used smoke, youd be prepared for them, defeating the point of flanking)
	--	"rescue_hostages" tactic is used for sh

	--	shields stay in front of their backup and keep guard if they take you down
	--	taser makes sure youre down for good, and hides behind backup in sh (shield tactics do nothing in vanilla)
	--	bulldozer also makes sure youre down for good, and is his own shield
	--	despite being a flanker, cloaker uses smoke to conceal his charge until its too late
	--	marshals find an alternate route and keep guard after a takedown
	--	phalanx come in for a takedown, put you down, and move on to the next target

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
		shield = {
			"shield",
			"ranged_fire",
			"deathguard"
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
		tazer = {
			"shield_cover",
			"charge",
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"murder"
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
			"shield",
			"murder"
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
		phalanx_shield = {
			"shield",
			"murder"
		},
		phalanx_cover = {
			"shield_cover",
			"murder"
		},
		hostage_rescue = {
			"ranged_fire",
			"smoke_grenade",
			"rescue_hostages"
		}
	}

	--	every group needs at least one baseline unit
	--	chance of other units spawning increases with difficulty
	local freq = {
		baseline = 1,
		common = difficulty_index / 8,
		uncommon = difficulty_index / 16,
		rare = difficulty_index / 24,
		elite = difficulty_index / 32
	}

	local function automagic(original_group, amount, spawn_values)
		local g = deep_clone(original_group)

		g.amount = amount or g.amount

		if spawn_values then
			for i = #spawn_values, 1, -1 do
				g.spawn[i] = g.spawn[i] or {}

				if spawn_values[i].remove then
					table.remove(g.spawn, i)
				else
					for k, v in pairs(spawn_values[i]) do
						g.spawn[i][k] = v
					end
				end
			end
		end

		return g
	end

	self.enemy_spawn_groups.tac_swats_a = {
		amount = { 2, 3 },
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
				unit = "FBI_swat_R870",
				tactics = tactics.swat_shotgun_rush,
				amount_max = 1,
				freq = freq.common
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	self.enemy_spawn_groups.tac_swats_b = automagic(self.enemy_spawn_groups.tac_swats_a, nil, {
		{
			tactics = tactics.swat_rifle_flank
		},
		{
			tactics = tactics.swat_shotgun_flank
		}
	})
	self.enemy_spawn_groups.tac_swats_c = automagic(self.enemy_spawn_groups.tac_swats_a, { 3, 4 }, {
		{},
		{},
		{
			rank = 1,
			unit = "FBI_suit_M4_MP5",
			tactics = tactics.swat_rifle,
			amount_max = 1,
			freq = freq.rare
		},
		{
			rank = 1,
			unit = "medic_M4_R870",
			tactics = tactics.swat_rifle,
			amount_max = 1,
			freq = freq.uncommon
		}
	})
	self.enemy_spawn_groups.tac_swats_d = automagic(self.enemy_spawn_groups.tac_swats_b, { 3, 4 }, {
		{},
		{},
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
			tactics = tactics.swat_shotgun_flank,
			amount_max = 1,
			freq = freq.rare
		}
	})

	self.enemy_spawn_groups.tac_heavys_a = automagic(self.enemy_spawn_groups.tac_swats_a, nil, {
		{
			unit = "FBI_heavy_G36"
		},
		{
			unit = "FBI_heavy_R870"
		}
	})
	self.enemy_spawn_groups.tac_heavys_b = automagic(self.enemy_spawn_groups.tac_heavys_a, nil, {
		{
			tactics = tactics.swat_rifle_flank
		},
		{
			tactics = tactics.swat_shotgun_flank
		}
	})
	self.enemy_spawn_groups.tac_heavys_c = automagic(self.enemy_spawn_groups.tac_heavys_a, { 3, 4 }, {
		{},
		{},
		{
			rank = 1,
			unit = "FBI_suit_M4_MP5",
			tactics = tactics.swat_rifle,
			amount_max = 1,
			freq = freq.rare
		},
		{
			rank = 1,
			unit = "medic_M4_R870",
			tactics = tactics.swat_rifle,
			amount_max = 1,
			freq = freq.uncommon
		}
	})
	self.enemy_spawn_groups.tac_heavys_d = automagic(self.enemy_spawn_groups.tac_heavys_b, { 3, 4 }, {
		{},
		{},
		{
			rank = 1,
			unit = "CS_tazer",
			tactics = tactics.swat_rifle_flank,
			amount_max = 1,
			freq = freq.elite
		},
		{
			rank = 1,
			unit = "medic_M4_R870",
			tactics = tactics.swat_shotgun_flank,
			amount_max = 1,
			freq = freq.rare
		}
	})

	self.enemy_spawn_groups.tac_shields_a = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = tactics.shield_ranged,
				amount_min = 1,
				amount_max = 1,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_swat_M4_R870",
				tactics = tactics.shield_cover,
				amount_min = 1,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_shield_wall_ranged = true,
			tac_shield_wall = true,
			tac_shield_wall_charge = true
		}
	}
	self.enemy_spawn_groups.tac_shields_b = automagic(self.enemy_spawn_groups.tac_shields_a, { 3, 4 }, {
		{
			tactics = tactics.shield_charge,
			amount_max = 2
		},
		{
			unit = "FBI_heavy_G36_R870",
		},
		{
			rank = 1,
			unit = "medic_M4_R870",
			tactics = tactics.shield_cover,
			amount_max = 1,
			freq = freq.elite
		}
	})

	self.enemy_spawn_groups.tac_tazers_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = tactics.tazer,
				amount_min = 1,
				amount_max = 1,
				freq = freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_swat_M4_R870",
				tactics = tactics.tazer_shield,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_tazer_flanking = true,
			tac_tazer_charge = true
		}
	}
	self.enemy_spawn_groups.tac_tazers_b = automagic(self.enemy_spawn_groups.tac_tazers_a, { 2, 4 }, {
		{
			amount_max = 2
		},
		{
			unit = "FBI_swat_heavy_M4_G36_R870",
			amount_min = 1
		},
		{
			rank = 1,
			unit = "FBI_shield",
			tactics = tactics.tazer_shield,
			amount_max = 1,
			freq = freq.elite
		},
	})

	self.enemy_spawn_groups.tac_tanks_a = {
		amount = { 1, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_tank",
				tactics = tactics.tank,
				amount_min = 1,
				amount_max = 1,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_swat_M4_R870",
				tactics = tactics.tank_cover,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_bull_rush = true
		}
	}
	self.enemy_spawn_groups.tac_tanks_b = automagic(self.enemy_spawn_groups.tac_tanks_a, { 2, 4 }, {
		{
			amount_max = 2
		},
		{
			unit = "FBI_swat_heavy_M4_G36_R870"
		},
		{
			rank = 1,
			unit = "CS_tazer",
			tactics = tactics.tank_cover,
			amount_max = 1,
			freq = freq.elite
		}
	})

	self.enemy_spawn_groups.single_spooc = {
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
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc

	self.enemy_spawn_groups.tac_spoocs_a = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "spooc",
				tactics = tactics.spooc,
				freq = freq.rare
			}
		},
		spawn_point_chk_ref = {
			FBI_spoocs = true
		}
	}
	self.enemy_spawn_groups.tac_spoocs_b = automagic(self.enemy_spawn_groups.tac_spoocs_a, { 1, 2 }, {
		{
			amount_max = 2
		},
		{
			rank = 1,
			unit = "FBI_suit_stealth_MP5",
			tactics = tactics.spooc,
			amount_max = 1,
			freq = freq.baseline
		}
	})

	--	2 special groups
	--	marshal group, and an alternative to winters

	--	80s on normal, decreases 10s per difficulty down to 20s on ds
	local base_cooldown = (10 - difficulty_index) * 10

	--	occasional fbi agent for support if players get close
	--	would make marshals spawn normally but that disables their spawn limit
	--	marshal shield is used on lost in transit
	self.enemy_spawn_groups.marshal_squad = {
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
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.marshal_marksman,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	local is_trai = true	--	Global.level_data and Global.level_data.level_id == "trai" or Global.game_settings and Global.game_settings.level_id == "trai"
	if is_trai then
		table.insert(self.enemy_spawn_groups.marshal_squad.spawn, {
			rank = 1,
			unit = "marshal_shield",
			tactics = tactics.marshal_shield,
			amount_max = 1,
			freq = freq.elite
		})
	end

	--	occasional takedown squad with 1-2 phalanx shields
	--	spawn with light swat and very rarely a cowardly dozer for a swift takedown
	self.enemy_spawn_groups.phalanx_squad = {
		max_nr_simultaneous_groups = 1,
		spawn_cooldown = base_cooldown * 3,
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "Phalanx_minion",
				tactics = tactics.phalanx_shield,
				amount_min = 1,
				amount_max = 2,
				freq = freq.rare
			},
			{
				rank = 1,
				unit = "FBI_tank",
				tactics = tactics.phalanx_cover,
				amount_max = 1,
				freq = freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = tactics.phalanx_cover,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = tactics.phalanx_cover,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_shield_wall_ranged = true,
			tac_shield_wall_charge = true,
			tac_shield_wall = true
		}
	}

	self.enemy_spawn_groups.hostage_rescue = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_M4_MP5",
				tactics = tactics.hostage_rescue,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.hostage_rescue,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	self.enemy_spawn_groups.hostage_rescue_assault = automagic(self.enemy_spawn_groups.hostage_rescue, { 3, 4 }, {
		{},
		{
			unit = "FBI_suit_stealth_MP5"
		},
		{
			rank = 1,
			unit = "CS_tazer",
			tactics = tactics.hostage_rescue,
			amount_max = 1,
			freq = freq.elite
		}
	})
	self.enemy_spawn_groups.hostage_rescue_assault.max_nr_simultaneous_groups = 1
	self.enemy_spawn_groups.hostage_rescue_assault.spawn_cooldown = base_cooldown * 2

	self.enemy_spawn_groups.reenforce_a = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.swat_rifle,
				amount_min = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_M4_MP5",
				tactics = tactics.swat_rifle,
				freq = freq.common
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = tactics.swat_shotgun_rush,
				freq = freq.common
			},
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	self.enemy_spawn_groups.reenforce_b = automagic(self.enemy_spawn_groups.reenforce_a, nil, {
		{
			unit = "FBI_suit_M4_MP5"
		},
		{
			unit = "FBI_swat_M4"
		},
		{
			unit = "FBI_swat_R870"
		}
	})
	self.enemy_spawn_groups.reenforce_c = automagic(self.enemy_spawn_groups.reenforce_b, nil, {
		{
			unit = "FBI_swat_M4"
		},
		{
			unit = "FBI_heavy_G36"
		},
		{
			unit = "FBI_heavy_R870"
		}
	})
	self.enemy_spawn_groups.reenforce_d = automagic(self.enemy_spawn_groups.reenforce_c, nil, {
		{
			remove = true
		}
	})

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local f = math.clamp(difficulty_index - 2, 0, 6) / 6

	local recon_weights = {
		hostage_rescue = { 1, 1, 1 },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, _ in pairs(self.besiege.recon.groups) do
		self.besiege.recon.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(recon_weights) do
		self.besiege.recon.groups[group] = weights
	end

	--	nuke winters, he isnt fun
	self.phalanx.spawn_chance.start = 0
	self.phalanx.spawn_chance.increase = 0
	self.phalanx.spawn_chance.max = 0

	ASSGroupAITweakDataModule["task_data_" .. ASS:req_func_suffix()](self, f)

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )