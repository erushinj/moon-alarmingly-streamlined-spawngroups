--	unit category and task data changes are different with and without streamlined heisting
--	similarly, different enemy spawn groups as well as more different task data are used in """beta""" mode
local GroupAIUnitCategoriesModule = ASS:require("GroupAIUnitCategoriesModule")
local GroupAIEnemySpawnGroupsModule = ASS:require("GroupAIEnemySpawnGroupsModule")
local GroupAITaskDataModule = ASS:require("GroupAITaskDataModule")

local func = ASS:req_func_name()

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	--	these are used later to set new factions to america if any are added
	--	there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
	local faction_reference = clone(self.unit_categories.spooc.unit_types)
	local current_factions = {
		america = true,
		russia = true,
		zombie = true,
		murkywater = true,
		federales = true
	}

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

	--	all dozer types for ds zombies
	if difficulty_index > 7 then
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

	if GroupAIUnitCategoriesModule[func] then
		GroupAIUnitCategoriesModule[func](self, difficulty_index)
	end

	local level_mod = ASS:level_mod()
	if level_mod and GroupAIUnitCategoriesModule[level_mod] then
		GroupAIUnitCategoriesModule[level_mod](self)
		if difficulty_index > 7 then
			GroupAIUnitCategoriesModule.revert_zeal_specials(self)
		end
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

	self.unit_categories.FBI_wtf = combined_category(self.unit_categories.medic_M4, self.unit_categories.CS_tazer)
	self.unit_categories.FBI_wtf = combined_category(self.unit_categories.FBI_wtf, self.unit_categories.spooc)
	for faction, units in pairs(self.unit_categories.FBI_tank.unit_types) do
		table.insert(self.unit_categories.FBI_wtf.unit_types[faction], units[#units])
	end
	self.unit_categories.FBI_wtf.special_type = nil
	if difficulty_index < 5 then
		--	nothing
	elseif difficulty_index < 6 then
		self.unit_categories.FBI_wtf.unit_types.russia[4] = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")
		self.unit_categories.FBI_wtf.unit_types.federales[4] = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
	elseif difficulty_index < 7 then
		--	nothing
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_wtf.unit_types.murkywater[4] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1")
	else
		self.unit_categories.FBI_wtf.unit_types.america[4] = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		self.unit_categories.FBI_wtf.unit_types.russia[4] = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		self.unit_categories.FBI_wtf.unit_types.zombie[4] = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
	end

	for faction, _ in pairs(faction_reference) do
		if not current_factions[faction] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[faction] = clone(category.unit_types.america)
				end
			end
		end
	end

	if func == "beta_streamheist" and self.special_unit_spawn_limits.taser == 1 then
		self.special_unit_spawn_limits.taser = 2
	end
end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local difficulty_index = ASS.settings.max_intensity and 8 or math.clamp(difficulty_index, 2, 8)

	--	every group needs at least one baseline unit
	--	chance of other units spawning increases with difficulty
	local freq = {
		baseline = 1,
		common = difficulty_index / 8,
		uncommon = difficulty_index / 16,
		rare = difficulty_index / 24,
		elite = difficulty_index / 32
	}

	--	80s on normal, decreases 10s per difficulty down to 20s on ds
	local base_cooldown = (10 - difficulty_index) * 10

	if GroupAIEnemySpawnGroupsModule[func] then
		GroupAIEnemySpawnGroupsModule[func](self, freq, base_cooldown)
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local f = ASS.settings.max_intensity and 1 or math.clamp(difficulty_index - 2, 0, 6) / 6

	--	avoiding issues if new groups are added in vanilla, new groups are added from GroupAITaskDataModule
	for group, _ in pairs(self.besiege.assault.groups) do
		self.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, _ in pairs(self.besiege.recon.groups) do
		self.besiege.recon.groups[group] = { 0, 0, 0 }
	end

	--	nuke winters, he isnt fun and theres a replacement for him
	self.phalanx.spawn_chance.start = 0
	self.phalanx.spawn_chance.increase = 0
	self.phalanx.spawn_chance.max = 0

	if GroupAITaskDataModule[func] then
		GroupAITaskDataModule[func](self, f)
	end

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )