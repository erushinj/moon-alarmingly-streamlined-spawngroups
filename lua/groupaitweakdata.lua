Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)
	--	sets new factions to america if any are added
	--	there will likely be inconsistencies, and crash typos in fbi agent unit names otherwise
	for faction, _ in pairs(self.unit_categories.spooc.unit_types) do
		local current_factions = {
			"america",
			"russia",
			"zombie",
			"murkywater",
			"federales"
		}
		if not table.contains(current_factions, faction) then
			for category_k, category_v in pairs(self.unit_categories) do
				if category_v.unit_types and category_v.unit_types.america then
					self.unit_categories[category_k].unit_types[faction] = deep_clone(category_v.unit_types.america)
				end
			end
		end
	end

	self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
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

	--	merc marshal makes no sense for zombies
	self.unit_categories.marshal_marksman.unit_types.zombie = self.unit_categories.marshal_marksman.unit_types.america
	self.unit_categories.marshal_shield.unit_types.zombie = self.unit_categories.marshal_shield.unit_types.america

	--	with sh, separate russian hrt by weapon type, and make no further changes
	if StreamHeist then
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		}
		return
	end

	--	oh boy.
	if difficulty_index < 4 then
		self.unit_categories.FBI_swat_M4 = self.unit_categories.CS_swat_MP5
		--	enemy damage is negligible on normal and hard, im fine with this if it means i can use the basic-tier for pistol "fbi"
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
		}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
		}
		self.unit_categories.FBI_swat_R870 = self.unit_categories.CS_swat_R870
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
		}
		self.unit_categories.FBI_heavy_G36 = self.unit_categories.CS_heavy_M4
		self.unit_categories.FBI_heavy_R870 = self.unit_categories.CS_heavy_R870
		self.unit_categories.FBI_shield = self.unit_categories.CS_shield
		self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1")
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
		if difficulty_index < 6 then
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
	end

	--	overkill hates fbi agents
	self.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	--	add lmg dozers to mayhem
	if difficulty_index == 6 then
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
		table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
		table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
		table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
	end

	--	new special limits, from the unused easy up to death sentence
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
end)


Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)
	local tactics = self._tactics

	--	shame most tactics do little to nothing in vanilla

	--	non-flankers use smoke bombs (helps conceal their approach)
	--	but flankers use flashbangs (if they used smoke, youd be prepared for them, defeating the point of flanking)
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
		"rescue_hostages"	--	used for sh
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

	--	shields stay in front of their backup and keep guard if they take you down
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

	--	taser makes sure youre down for good
	tactics.tazer_flanking = {
		"shield_cover",	--	hide behind backup to better keep you immobilized without interruption (in sh, does nothing in vanilla)
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
	tactics.tazer_shield = {
		"shield",
		"murder"
	}

	--	bulldozer also makes sure youre down for good
	tactics.tank_rush = {
		"shield",	--	bulldozer is his own shield
		"charge",
		"murder"
	}
	tactics.tank_cover = {
		"shield_cover",
		"murder"
	}

	--	despite being a flanker, cloaker uses smoke to conceal his charge until its too late
	tactics.spooc = {
		"flank",
		"deathguard",
		"smoke_grenade"
	}

	--	marshals find an alternate route and keep guard after a takedown
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

	--	every group needs at least one baseline unit
	--	chance of non-baseline units being selected to spawn increases with difficulty
	local freq = {
		baseline = 1,
		common = difficulty_index / 8,
		uncommon = difficulty_index / 16,
		rare = difficulty_index / 24,
		elite = difficulty_index / 32
	}

	--	clones a group, removes units that arent lights or heavies, lowers heavy freq, ensures spawn point chk ref is set
	--	theres likely a better way to iterate over the spawn table but i cant be bothered
	local function no_medic_group(original_group)
		local g = deep_clone(original_group)

		local freq_set = false
		for size = 1, #g.spawn do
			for i, v in ipairs(g.spawn) do
				if not (v.unit:match("heavy") or v.unit:match("swat")) then
					table.remove(g.spawn, i)
				end
				if not freq_set and v.unit:match("heavy") then
					v.freq = freq.common
					freq_set = true
				end
			end
		end

		g.spawn_point_chk_ref = g.spawn_point_chk_ref or {
			tac_swat_rifle_flank = true
		}

		return g
	end

	--	4 regular swat groups, non-flank/flank shotgunners/riflemen
	--	non-flankers can spawn with an fbi agent
	--	flankers can spawn with an extra special

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
	self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_shotgun_rush)

	--	occasional cloaker helps force player to not pick their targets like a dingus
	self.enemy_spawn_groups.tac_swat_shotgun_flank = {
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
	self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_shotgun_flank)

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
	self.enemy_spawn_groups.tac_swat_rifle_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_rifle)

	--	riflemen deal consistent damage to taser's victim
	self.enemy_spawn_groups.tac_swat_rifle_flank = {
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
	self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic = no_medic_group(self.enemy_spawn_groups.tac_swat_rifle_flank)

	--	2 shield groups (tac_shield_wall is disgusting and not needed, set to the same as ranged)

	--	spawn with heavies/medic who have a health pool worth protecting and fbi agents who have damage worth protecting
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

	--	2 taser groups
	--	spawn with light swat to assist in taking down the player while taser has them immobilized
	--	they can and will throw themselves in front of taser too, to keep him from being interrupted when playing with sh

	--	flank taser sneaks around and, if a cloaker is with him, forces a decision between an instant down or a possible down from damage
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

	--	charge taser can have a shield so he can rush in and not get shot so easily
	self.enemy_spawn_groups.tac_tazer_charge = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",	--	if only there were a shotgun taser
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

	--	1 bulldozer group
	--	spawns with rifle and shotgun heavies who are bulky enough to not go down immediately if caught not hiding behind the dozer
	--	if a taser spawns with him, well, shame if you get immobilized in front of the walking tank

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

	--	2 cloaker groups

	--	this one is only used on old maps as part of SO spawns, 1 cloaker only to reduce spam
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

	--	cloaker can spawn by himself, or with an extra unit
	--	additional cloaker for extra stress, or more commonly an fbi agent to, as you may guess, force target prioritization
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

	--	1 marshal group

	--	can spawn single or with an extra unit, usually an fbi agent for support if player gets close
	--	would make marshals spawn normally but that disables their spawn limit
	--	makes no sense for initial spawn delay and spawn cooldown to differ, so theyre the same
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
				tactics = tactics.marshal_marksman,
				amount_min = 0,
				amount_max = 1,
				freq = freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	--	marshal group is changed to add marshal shield if he is loaded in and usable, either on lost in transit or offline
	--	spawns in duo or trio, possible to get only one type of marshal
	if ASS.check_job({"trai"}) or ASS.is_offline then
		self.enemy_spawn_groups.marshal_squad.amount = { 2, 3 }
		self.enemy_spawn_groups.marshal_squad.spawn = {
			{
				rank = 2,
				unit = "marshal_marksman",
				tactics = tactics.marshal_marksman,
				amount_min = 0,
				amount_max = 2,
				freq = freq.elite
			},
			{
				rank = 2,
				unit = "marshal_shield",
				tactics = tactics.marshal_shield,
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
		}
		self.enemy_spawn_groups.marshal_squad.spawn_point_chk_ref = {
			tac_shield_wall_ranged = true,
			tac_shield_wall_charge = true,
			tac_shield_wall = true
		}
	end

	--	1 recon group

	--	only really seen in sh, vanilla doesnt really use recon spawn limit correctly and counts assault units towards it
	--	can spawn with a taser to help keep companions alive if a player comes to hunt them down
	self.enemy_spawn_groups.hostage_rescue = {
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

	--	no reenforce groups.
	--	reenforce doesnt work properly in vanilla thanks to u173, they end up behaving like regular assault units if spawned
	--	sh restores reenforce, and its reenforce groups are fine
end)


Hooks:PostHook(GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)
	local f = math.max(0, difficulty_index - 2) / 6

	--	spawn group weights (based on sh, no medic groups are more common early on)
	local special_weight = math.lerp(3, 5, f)
	local assault_weights = {
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
	for group, weights in pairs(assault_weights) do
		self.besiege.assault.groups[group] = weights
	end

	local recon_weights = {
		hostage_rescue = { 1, 1, 1 }
	}
	for group, _ in pairs(self.besiege.recon.groups) do
		self.besiege.recon.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(recon_weights) do
		self.besiege.recon.groups[group] = weights
	end

	--	make no further task data changes with sh
	if StreamHeist then
		self.street = deep_clone(self.besiege)
		self.safehouse = deep_clone(self.besiege)
		return
	end

	--	vanilla's flashbang timer is too long
	self.flash_grenade.timer = math.lerp(2, 1, f)

	--	assault length, force, etc settings
	self.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	self.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	self.besiege.assault.force = { 12, 14, 16 }
	self.besiege.assault.force_pool = { 40, 50, 60 }
	self.besiege.assault.force_balance_mul = { 1, 2, 3, 4 }
	self.besiege.assault.force_pool_balance_mul = { 1, 2, 3, 4 }

	self.besiege.regroup.duration = { 30, 25, 20 }

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
end)