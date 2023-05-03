-- unit category and task data changes are different with and without streamlined heisting
-- similarly, different enemy spawn groups as well as more different task data are used with vanilla style groups
local GroupAIUnitCategories = ASS:require("GroupAIUnitCategories")
local GroupAIEnemySpawnGroups = ASS:require("GroupAIEnemySpawnGroups")
local GroupAITaskData = ASS:require("GroupAITaskData")

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local func = ASS:req_func_name()
local level_mod = ASS:level_mod()

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	-- these are used later to set new factions to america if any are added
	-- there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
	local faction_reference = clone(self.unit_categories.spooc.unit_types)
	local supported_factions = {
		america = true,
		russia = true,
		zombie = true,
		murkywater = true,
		federales = true
	}

	-- merc marshals makes no sense for zombies
	self.unit_categories.marshal_marksman.unit_types.zombie = self.unit_categories.marshal_marksman.unit_types.america
	self.unit_categories.marshal_shield.unit_types.zombie = self.unit_categories.marshal_shield.unit_types.america

	GroupAIUnitCategories[difficulty](self.unit_categories)

	-- used to determine special spawn limits
	local special_limit_index = ASS.settings.max_intensity and 8 or math.clamp(difficulty_index, 2, 8)
	GroupAIUnitCategories[func](self, difficulty_index, special_limit_index)

	if GroupAIUnitCategories[level_mod] then
		GroupAIUnitCategories[level_mod](self.unit_categories)

		if difficulty_index > 7 then
			GroupAIUnitCategories.revert_zeal_specials(self.unit_categories)
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
	self.unit_categories.CS_swat_MP5_R870 = combined_category(self.unit_categories.CS_swat_MP5, self.unit_categories.CS_swat_R870)
	self.unit_categories.FBI_swat_M4_R870 = combined_category(self.unit_categories.FBI_swat_M4, self.unit_categories.FBI_swat_R870)
	self.unit_categories.FBI_heavy_G36_R870 = combined_category(self.unit_categories.FBI_heavy_G36, self.unit_categories.FBI_heavy_R870)

	for faction, _ in pairs(faction_reference) do
		if not supported_factions[faction] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[faction] = clone(category.unit_types.america)
				end
			end
		end
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)
	local freq_base = ASS:get_skill_dependent_value("freq_base")
	local base_cooldown_base = ASS:get_skill_dependent_value("base_cooldown_base")

	-- remove preexisting timed groups
	for _, group_data in pairs(self.enemy_spawn_groups) do
		if group_data.max_nr_simultaneous_groups then
			group_data.max_nr_simultaneous_groups = 0
			group_data.spawn_cooldown = 300000
			group_data.initial_spawn_delay = 300000
		end
	end

	local difficulty_index = ASS.settings.max_intensity and 8 or math.clamp(difficulty_index, 2, 8)
	local f = ASS.settings.max_intensity and 1 or (difficulty_index - 2) / 6

	local function lerp(val)
		return math.lerp(val / 3, val, f)
	end

	-- every group needs at least one baseline unit
	-- chance of other units spawning increases with difficulty
	local freq = {
		baseline = freq_base.baseline,
		common = lerp(freq_base.common),
		uncommon = lerp(freq_base.uncommon),
		rare = lerp(freq_base.rare),
		elite = lerp(freq_base.elite),
	}

	local base_cooldown = math.lerp(base_cooldown_base * 4, base_cooldown_base, f)

	GroupAIEnemySpawnGroups[func](self.enemy_spawn_groups, freq, base_cooldown)

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)
	local special_weight_base = ASS:get_skill_dependent_value("special_weight_base")

	if not ASS.settings.captain_winters then
		self.phalanx.spawn_chance.start = 0
		self.phalanx.spawn_chance.increase = 0
		self.phalanx.spawn_chance.max = 0
	end

	local f = ASS.settings.max_intensity and 1 or math.clamp(difficulty_index - 2, 0, 6) / 6

	local special_weight = math.lerp(special_weight_base[1], special_weight_base[2], f)

	GroupAITaskData[func](self, f, special_weight)

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end )
