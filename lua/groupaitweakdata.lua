--	so many incorrect units (eg, city heavy shotgunners for murkywater, or city-tier akan mercs on ds)
Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	local faction_ref = clone(self.unit_categories.CS_swat_MP5.unit_types)

	if StreamHeist then
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
	else
		if difficulty_index < 4 then
			self.unit_categories.FBI_swat_M4 = self.unit_categories.CS_swat_MP5
			self.unit_categories.FBI_swat_R870 = self.unit_categories.CS_swat_R870
			self.unit_categories.FBI_heavy_G36 = self.unit_categories.CS_heavy_M4
			self.unit_categories.FBI_heavy_R870 = self.unit_categories.CS_heavy_R870
			self.unit_categories.FBI_shield = self.unit_categories.CS_shield
		elseif difficulty_index < 6 then
			self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
			}
			self.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
			}
		elseif difficulty_index < 8 then
			self.unit_categories.FBI_swat_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
			}
			self.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			}
			self.unit_categories.FBI_swat_R870.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			}
			self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
			}
			self.unit_categories.FBI_shield.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
			}
		else
			self.unit_categories.FBI_swat_M4 = self.unit_categories.CS_swat_MP5
			self.unit_categories.FBI_swat_R870 = self.unit_categories.CS_swat_R870
			self.unit_categories.FBI_heavy_G36 = self.unit_categories.CS_heavy_M4
			self.unit_categories.FBI_heavy_R870 = self.unit_categories.CS_heavy_R870
			self.unit_categories.FBI_swat_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			}
			self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			}
			self.unit_categories.FBI_swat_R870.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			}
			self.unit_categories.FBI_heavy_R870.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			}
			self.unit_categories.FBI_heavy_R870.unit_types.murkywater = self.unit_categories.FBI_heavy_R870.unit_types.america
		end

		if difficulty_index < 4 then
			self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
			}
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			}
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = self.unit_categories.CS_cop_C45_R870.unit_types.russia
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			}
		else
			self.unit_categories.FBI_suit_C45_M4.unit_types.russia = self.unit_categories.CS_swat_MP5.unit_types.russia
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = self.unit_categories.CS_swat_R870.unit_types.russia
		end

		self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
		}

		--	add m249 dozers to mayhem
		if difficulty_index == 6 then
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
			table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
			table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
			table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
			table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
		end

		--	mayhem really should be closer to death wish than ovk
		local limits_shield = { 0, 2, 2, 4, 4, 6, 6, 8 }
		local limits_medic = { 0, 0, 0, 0, 1, 2, 3, 4 }
		local limits_taser = { 0, 0, 1, 1, 2, 3, 3, 4 }
		local limits_tank = { 0, 0, 0, 1, 1, 2, 2, 3 }
		local limits_spooc = { 0, 0, 0, 1, 2, 3, 3, 4 }
		self.special_unit_spawn_limits = {
			shield = limits_shield[difficulty_index],
			medic = limits_medic[difficulty_index],
			taser = limits_taser[difficulty_index],
			tank = limits_tank[difficulty_index],
			spooc = limits_spooc[difficulty_index]
		}
	end

	--	dozer fixes that happen with or without sh
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

	--	merc marshal makes no sense for basically-america enemies, including vanilla using regular medicdozers and minidozers, use us marshal instead
	self.unit_categories.marshal_marksman.unit_types.zombie = self.unit_categories.marshal_marksman.unit_types.america
	self.unit_categories.marshal_shield.unit_types.zombie = self.unit_categories.marshal_shield.unit_types.america

	--	sets new factions to america if any are added
	for faction, _ in pairs(faction_ref) do
		if not table.contains(ASS.current_factions, faction) then
			for category_k, category_v in pairs(self.unit_categories) do
				if category_v.unit_types and category_v.unit_types.america then
					self.unit_categories[category_k].unit_types[faction] = deep_clone(category_v.unit_types.america)
				end
			end
		end
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local tactics = self._tactics

	--	shame most of these tactics might as well or literally do nothing in vanilla
	tactics.swat_shotgun_rush = {
		"charge",
		"smoke_grenade",
		"deathguard"
	}
	tactics.swat_shotgun_flank = {
		"charge",
		"flank",
		"flash_grenade",
		"deathguard",
		"rescue_hostages"	--	used for sh, but doesnt need a particular sh check
	}
	tactics.swat_rifle = {
		"ranged_fire",
		"smoke_grenade"
	}
	tactics.swat_rifle_flank = {
		"flank",
		"flash_grenade",
		"rescue_hostages"
	}

	tactics.shield_ranged = {
		"shield",
		"ranged_fire",
		"deathguard"
	}
	tactics.shield_charge = {
		"shield",
		"charge",
		"deathguard"
	}
	tactics.shield_cover = {
		"shield_cover",
		"deathguard"
	}

	tactics.tazer_flanking = {
		"shield_cover",
		"flank",
		"flash_grenade",
		"murder"
	}
	tactics.tazer_charge = {
		"shield_cover",
		"charge",
		"smoke_grenade",
		"murder"
	}
	tactics.tazer_shield = {	--	taser backup is suicidal (in sh, since this tactic doesnt do anything in vanilla)
		"shield",
		"murder"
	}

	tactics.tank_rush = {
		"shield",
		"charge",
		"murder"
	}
	tactics.tank_cover = {
		"shield_cover",
		"murder"
	}

	tactics.spooc = {
		"flank",
		"deathguard",
		"smoke_grenade"
	}

	tactics.marshal_marksman = {
		"shield_cover",
		"flank",
		"ranged_fire",
		"deathguard"
	}
	tactics.marshal_shield = {
		"shield",
		"flank",
		"ranged_fire",
		"deathguard"
	}

	tactics.hostage_rescue_flank = {
		"flank",
		"ranged_fire",
		"rescue_hostages"
	}
	tactics.hostage_rescue_rush = {
		"charge",
		"flash_grenade",
		"rescue_hostages"
	}

	--	every group needs at least one baseline unit
	--	all other freqs remain constantly proportional to each other, its just that
	--	overall chance of a baseline unit being replaced increases with difficulty
	local freq = {
		baseline = 1,
		common = difficulty_index / 8,
		uncommon = difficulty_index / 16,
		rare = difficulty_index / 24,
		elite = difficulty_index / 32
	}

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
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
				freq = freq.uncommon
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

	self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_rush)
	table.remove(self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic.spawn)
	table.remove(self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic.spawn)

	self.enemy_spawn_groups.tac_swat_shotgun_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.common
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

	self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_flank)
	table.remove(self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic.spawn)
	table.remove(self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic.spawn)

	self.enemy_spawn_groups.tac_swat_rifle = {
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
				freq = freq.uncommon
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

	self.enemy_spawn_groups.tac_swat_rifle_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_rifle)
	table.remove(self.enemy_spawn_groups.tac_swat_rifle_no_medic.spawn)
	table.remove(self.enemy_spawn_groups.tac_swat_rifle_no_medic.spawn)

	self.enemy_spawn_groups.tac_swat_rifle_flank = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 4,
				freq = freq.common
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

	self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_rifle_flank)
	table.remove(self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic.spawn)
	table.remove(self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic.spawn)
	self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic.spawn_point_chk_ref = {
		tac_swat_rifle_flank = true
	}

	self.enemy_spawn_groups.tac_shield_wall_ranged = {
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
	--	this is a terrible group that has no good reason to exist
	self.enemy_spawn_groups.tac_shield_wall = self.enemy_spawn_groups.tac_shield_wall_ranged

	self.enemy_spawn_groups.tac_shield_wall_charge = {
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

	self.enemy_spawn_groups.tac_tazer_flanking = {
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

	self.enemy_spawn_groups.tac_tazer_charge = {
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

	self.enemy_spawn_groups.tac_bull_rush = {
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

	self.enemy_spawn_groups.single_spooc = {
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
	self.enemy_spawn_groups.FBI_spoocs = {
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

	local marshal_limits = { 0, 1, 1, 1, 2, 2, 2, 3 }
	local marshal_cooldown = { 100, 90, 80, 70, 60, 50, 40, 30 }
	self.enemy_spawn_groups.marshal_squad = {
		max_nr_simultaneous_groups = marshal_limits[difficulty_index],
		spawn_cooldown = marshal_cooldown[difficulty_index],
		initial_spawn_delay = marshal_cooldown[difficulty_index],
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
				tactics = tactics.marshal_shield,
				amount_min = 0,
				amount_max = 1,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	if ASS.check_job({"trai"}) or ASS.is_offline then
		ASS:log(ASS.check_job({"trai"}) and "Game is on Lost In Transit level" or "Game is in offline mode" .. ", tweaking Marshal spawn group...")
		self.enemy_spawn_groups.marshal_squad = {
			max_nr_simultaneous_groups = marshal_limits[difficulty_index],
			spawn_cooldown = marshal_cooldown[difficulty_index],
			initial_spawn_delay = marshal_cooldown[difficulty_index],
			amount = { 2, 3 },
			spawn = {
				{
					rank = 2,
					unit = "marshal_shield",
					tactics = tactics.marshal_shield,
					amount_min = 0,
					amount_max = 2,
					freq = freq.elite
				},
				{
					rank = 2,
					unit = "marshal_marksman",
					tactics = tactics.marshal_marksman,
					amount_min = 0,
					amount_max = 2,
					freq = freq.elite
				},
				{
					rank = 1,
					unit = "FBI_suit_C45_M4",
					tactics = tactics.marshal_marksman,
					amount_min = 0,
					amount_max = 1,
					freq = freq.baseline
				}
			},
			spawn_point_chk_ref = {
				tac_shield_wall_ranged = true,
				tac_shield_wall_charge = true,
				tac_shield_wall = true
			}
		}
	end

	self.enemy_spawn_groups.hostage_rescue_a = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = tactics.hostage_rescue_rush,
				amount_min = 0,
				amount_max = 1,
				freq = freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = tactics.hostage_rescue_flank,
				amount_min = 0,
				amount_max = 3,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}
	self.enemy_spawn_groups.hostage_rescue_b = deep_clone(self.enemy_spawn_groups.hostage_rescue_a)
	self.enemy_spawn_groups.hostage_rescue_b.spawn[1].unit = "FBI_swat_R870"
	self.enemy_spawn_groups.hostage_rescue_b.spawn[2].unit = "FBI_suit_stealth_MP5"

	if StreamHeist then
		self.enemy_spawn_groups.reenforce_a = {
			amount = { 2, 3 },
			spawn = {
				{
					rank = 1,
					unit = "FBI_suit_stealth_MP5",
					tactics = tactics.swat_shotgun_rush,
					amount_min = 0,
					amount_max = 3,
					freq = freq.baseline
				},
				{
					rank = 1,
					unit = "FBI_suit_C45_M4",
					tactics = tactics.swat_rifle,
					amount_min = 0,
					amount_max = 3,
					freq = freq.baseline
				}
			},
			spawn_point_chk_ref = {
				tac_swat_rifle_flank = true
			}
		}
		self.enemy_spawn_groups.reenforce_b = deep_clone(self.enemy_spawn_groups.reenforce_a)
		self.enemy_spawn_groups.reenforce_b.spawn[1].unit = "FBI_swat_R870"
		self.enemy_spawn_groups.reenforce_b.spawn[2].unit = "FBI_swat_M4"
		self.enemy_spawn_groups.reenforce_c = deep_clone(self.enemy_spawn_groups.reenforce_a)
		self.enemy_spawn_groups.reenforce_c.spawn[1].unit = "FBI_heavy_R870"
		self.enemy_spawn_groups.reenforce_c.spawn[2].unit = "FBI_heavy_G36"
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local f = math.max(0, difficulty_index - 2) / 6

	--	spawn group weights (based on sh)
	local special_weight = math.lerp(3, 5, f)
	local new_assault_weights = {
		tac_swat_shotgun_rush = { 0, 1, 2 },
		tac_swat_shotgun_rush_no_medic = { 2, 1, 0 },
		tac_swat_shotgun_flank = { 0, 0.5, 1 },
		tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0 },
		tac_swat_rifle = { 0, 8, 16 },
		tac_swat_rifle_no_medic = { 16, 8, 0 },
		tac_swat_rifle_flank = { 0, 4, 8 },
		tac_swat_rifle_flank_no_medic = { 8, 4, 0 },
		tac_shield_wall_ranged = { 0, special_weight * 0.5, special_weight },
		tac_shield_wall_charge = { 0, special_weight * 0.5, special_weight },
		tac_tazer_flanking = { 0, special_weight * 0.5, special_weight },
		tac_tazer_charge = { 0, special_weight * 0.5, special_weight },
		tac_bull_rush = { 0, special_weight * 0.5, special_weight },
		FBI_spoocs = { 0, special_weight * 0.5, special_weight }
	}
	--	avoiding issues if new groups are added in vanilla
	for group, _ in pairs(self.besiege.assault.groups) do
		self.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(new_assault_weights) do
		self.besiege.assault.groups[group] = weights
	end

	local new_recon_weights = {
		hostage_rescue_a = { 1, 1, 1 },
		hostage_rescue_b = { 1, 1, 1 }
	}
	for group, _ in pairs(self.besiege.recon.groups) do
		self.besiege.recon.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(new_recon_weights) do
		self.besiege.recon.groups[group] = weights
	end

	--	make no further task data changes with sh, sh settings are good
	if StreamHeist then
		local new_reenforce_weights = {
			reenforce_a = { 2, 1, 0 },
			reenforce_b = { 6, 4, 2 },
			reenforce_c = { 0, 2, 4 }
		}
		for group, _ in pairs(self.besiege.reenforce.groups) do
			self.besiege.reenforce.groups[group] = { 0, 0, 0 }
		end
		for group, weights in pairs(new_reenforce_weights) do
			self.besiege.reenforce.groups[group] = weights
		end
		self.street = deep_clone(self.besiege)
		self.safehouse = deep_clone(self.besiege)
		return
	end

	self.flash_grenade.timer = math.lerp(2, 1, f)

	--	assault length, force, etc settings (most apply only below ds)
	-- self.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	self.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 210, f), math.lerp(180, 300, f) }
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	if difficulty_index < 8 then
		self.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
		self.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
		self.besiege.assault.force = { 12, 14, 16 }
		self.besiege.assault.force_pool = { 60, 70, 80 }
		self.besiege.assault.force_balance_mul = { 1, 2, 3, 4 }
		self.besiege.assault.force_pool_balance_mul = { 1, 2, 3, 4 }
		self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
		self.besiege.regroup.duration = { 30, 25, 20 }
	end
	--	other assault stuff
	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 0, 0, 0 }
	self.besiege.recon.interval_variation = 0

	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }

	--	this is just the sh winters settings
	self.phalanx.vip.damage_reduction.start = 0.05
	self.phalanx.vip.damage_reduction.increase = 0.05
	self.phalanx.vip.damage_reduction.increase_intervall = 10

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )