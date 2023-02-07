--	unit category and task data changes are different with and without streamlined heisting
--	similarly, different enemy spawn groups as well as more different task data are used in """beta""" mode
local GroupAIUnitCategoriesModule = ASS:require("GroupAIUnitCategoriesModule")
local GroupAILevelModModule = ASS:require("GroupAILevelModModule")
local GroupAIEnemySpawnGroupsModule = ASS:require("GroupAIEnemySpawnGroupsModule")
local GroupAITaskDataModule = ASS:require("GroupAITaskDataModule")

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
						category.unit_types[faction] = clone(category.unit_types.america)
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

	GroupAIUnitCategoriesModule[ASS:req_func_name()](self, difficulty_index)

	local level_mod = ASS:level_mod()
	if level_mod then
		GroupAILevelModModule[level_mod](self)
	end

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

	--	every group needs at least one baseline unit
	--	chance of other units spawning increases with difficulty
	local numerator = ASS.settings.fixed_freq and 8 or difficulty_index
	local freq = {
		baseline = 1,
		common = numerator / 8,
		uncommon = numerator / 16,
		rare = numerator / 24,
		elite = numerator / 32
	}

	--	80s on normal, decreases 10s per difficulty down to 20s on ds
	local base_cooldown = (10 - difficulty_index) * 10

	GroupAIEnemySpawnGroupsModule[ASS:req_func_name()](self, freq, base_cooldown)

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local f = math.clamp(difficulty_index - 2, 0, 6) / 6

	GroupAITaskDataModule[ASS:req_func_name()](self, f)

	--	needs refinement, same as "beta" weights
	if ASS.settings.street_assaults and ASS:street_level() then
		self.besiege.assault.sustain_duration_min = { math.lerp(50, 100, f), math.lerp(75, 120, f), math.lerp(100, 140, f) }
		self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
		self.besiege.assault.delay = { math.lerp(40, 20, f), math.lerp(30, 15, f), math.lerp(20, 10, f) }
		self.besiege.assault.hostage_hesitation_delay = { 5, 3.75, 2.5 }

		self.besiege.regroup.duration = { 20, 15, 10 }
	end

	local recon_weights = {
		hostage_rescue = { 1, 1, 1 },
		hostage_rescue_assault = { 0, 0, 0 },
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

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )