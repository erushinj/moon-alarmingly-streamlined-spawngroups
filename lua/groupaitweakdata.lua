-- unit category and task data changes are different with and without streamlined heisting
-- similarly, different enemy spawn groups as well as more different task data are used with vanilla style groups
local GroupAIUnitCategories = ASS:require("GroupAIUnitCategories")
local GroupAIEnemySpawnGroups = ASS:require("GroupAIEnemySpawnGroups")
local GroupAITaskData = ASS:require("GroupAITaskData")

local func = ASS:req_func_name()

if not GroupAIUnitCategories[func] then
	ASS:func_missing_error(func, "GroupAIUnitCategories")
end

if not GroupAIEnemySpawnGroups[func] then
	ASS:func_missing_error(func, "GroupAIEnemySpawnGroups")
end

if not GroupAITaskData[func] then
	ASS:func_missing_error(func, "GroupAITaskData")
end

if Global.ass_was_poked_with_stick then
	return
end

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	-- these are used later to set new factions to america if any are added
	-- there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
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

	-- merc marshals makes no sense for zombies
	self.unit_categories.marshal_marksman.unit_types.zombie = self.unit_categories.marshal_marksman.unit_types.america
	self.unit_categories.marshal_shield.unit_types.zombie = self.unit_categories.marshal_shield.unit_types.america

	GroupAIUnitCategories[func](self, difficulty_index)

	local level_mod = ASS:level_mod()
	if GroupAIUnitCategories[level_mod] then
		GroupAIUnitCategories[level_mod](self)

		if difficulty_index > 7 then
			GroupAIUnitCategories.revert_zeal_specials(self)
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

	for faction, _ in pairs(faction_reference) do
		if not current_factions[faction] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[faction] = clone(category.unit_types.america)
				end
			end
		end
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local difficulty_index = ASS.settings.max_intensity and 8 or math.clamp(difficulty_index, 2, 8)
	local f = ASS.settings.max_intensity and 1 or (difficulty_index - 2) / 6

	local function lerp_freq(val)
		return math.lerp(val / 3, val, f)
	end

	-- every group needs at least one baseline unit
	-- chance of other units spawning increases with difficulty
	local freq = {
		baseline = 1,
		common = lerp_freq(1),
		uncommon = lerp_freq(0.5),
		rare = lerp_freq(0.35),
		elite = lerp_freq(0.2),
	}

	-- 80s on normal, decreases 10s per difficulty down to 20s on ds
	local base_cooldown = (10 - difficulty_index) * 10

	GroupAIEnemySpawnGroups[func](self, freq, base_cooldown)

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local f = ASS.settings.max_intensity and 1 or math.clamp(difficulty_index - 2, 0, 6) / 6

	-- avoiding issues if new groups are added in vanilla, new groups are added from GroupAITaskData
	for group, _ in pairs(self.besiege.assault.groups) do
		self.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, _ in pairs(self.besiege.recon.groups) do
		self.besiege.recon.groups[group] = { 0, 0, 0 }
	end

	-- nuke winters, he isnt fun and theres a replacement for him
	self.phalanx.spawn_chance.start = 0
	self.phalanx.spawn_chance.increase = 0
	self.phalanx.spawn_chance.max = 0

	GroupAITaskData[func](self, f)

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )