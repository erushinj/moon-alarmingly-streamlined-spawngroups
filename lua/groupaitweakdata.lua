-- unit category and task data changes are different with and without streamlined heisting
-- similarly, different enemy spawn groups as well as more different task data are used with vanilla style groups
local Utils = ASS:utils()
local GroupAIUnitCategories = ASS:require("GroupAIUnitCategories")
local GroupAIEnemySpawnGroups = ASS:require("GroupAIEnemySpawnGroups")
local GroupAITaskData = ASS:require("GroupAITaskData")

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local assault_style = ASS:assault_style()
local level_mod = ASS:level_mod()

local max_values = ASS:get_intensity_dependent_boolean("max_values")

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	local special_limit_mul = ASS:get_skill_dependent_value("special_limit_mul")

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

	if level_mod and GroupAIUnitCategories[level_mod] then
		GroupAIUnitCategories[level_mod](self.unit_categories)

		if difficulty_index > 7 then
			GroupAIUnitCategories.revert_zeal_specials(self.unit_categories)
		end
	end

	-- for better holdout support
	self.unit_categories.CS_tank = deep_clone(self.unit_categories.FBI_tank)
	self.unit_categories.CS_spooc = deep_clone(self.unit_categories.spooc)
	self.unit_categories.FBI_tazer = deep_clone(self.unit_categories.CS_tazer)
	self.unit_categories.FBI_spooc = deep_clone(self.unit_categories.spooc)
	self.unit_categories.FBI_medic_M4 = deep_clone(self.unit_categories.medic_M4)
	self.unit_categories.FBI_medic_R870 = deep_clone(self.unit_categories.medic_R870)

	-- combined categories
	local function combined_category(category_1, category_2)
		local new_category = deep_clone(category_1)

		for faction, units in pairs(category_2.unit_types) do
			for _, unit in pairs(units) do
				table.insert(new_category.unit_types[faction], unit)
			end
		end

		return new_category
	end

	self.unit_categories.CS_swat_MP5_R870 = combined_category(self.unit_categories.CS_swat_MP5, self.unit_categories.CS_swat_R870)
	self.unit_categories.CS_heavy_M4_R870 = combined_category(self.unit_categories.CS_heavy_M4, self.unit_categories.CS_heavy_R870)
	self.unit_categories.FBI_suit_C45_MP5 = combined_category(self.unit_categories.FBI_suit_C45_M4, self.unit_categories.FBI_suit_stealth_MP5)
	self.unit_categories.FBI_heavy_G36_R870 = combined_category(self.unit_categories.FBI_heavy_G36, self.unit_categories.FBI_heavy_R870)
	self.unit_categories.FBI_medic_M4_R870 = combined_category(self.unit_categories.FBI_medic_M4, self.unit_categories.FBI_medic_R870)

	for faction, _ in pairs(faction_reference) do
		if not supported_factions[faction] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[faction] = clone(category.unit_types.america)
				end
			end
		end
	end

	-- used to determine special spawn limits
	local special_limit_index = max_values and 8 or math.clamp(difficulty_index, 2, 8)

	-- new special limits, from easy to death sentence
	local limits = {
		shield = { 0, 2, 2, 3, 3, 4, 4, 5 },
		medic = { 0, 0, 0, 0, 1, 2, 3, 4 },
		taser = { 0, 0, 1, 1, 2, 2, 3, 3 },
		tank = { 0, 0, 1, 1, 1, 2, 2, 3 },
		spooc = { 0, 0, 0, 1, 1, 2, 2, 3 }
	}
	for special, limit in pairs(limits) do
		self.special_unit_spawn_limits[special] = math.round(limit[special_limit_index] * special_limit_mul)
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local freq_base = ASS:get_skill_dependent_value("freq_base")
	local spawn_cooldown_base = ASS:get_skill_dependent_value("spawn_cooldown_base")

	-- effectively remove preexisting timed groups
	for _, group_data in pairs(self.enemy_spawn_groups) do
		if group_data.max_nr_simultaneous_groups then
			group_data.spawn_cooldown = 300000
		end
	end

	local f = max_values and 1 or (math.clamp(difficulty_index, 2, 8) - 2) / 6

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

	local spawn_cooldown = math.lerp(spawn_cooldown_base * 4, spawn_cooldown_base, f)

	GroupAIEnemySpawnGroups[assault_style](self.enemy_spawn_groups, freq, spawn_cooldown)

	if SuperSeriousShooter then
		GroupAIEnemySpawnGroups.super_serious_tweaks(self.enemy_spawn_groups)
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local special_weight_base = ASS:get_skill_dependent_value("special_weight_base")
	local grenade_cooldown_mul = ASS:get_skill_dependent_value("grenade_cooldown_mul")
	local smoke_grenade_lifetime = ASS:get_skill_dependent_value("smoke_grenade_lifetime")
	local cs_grenade_chance_times = ASS:get_skill_dependent_value("cs_grenade_chance_times")
	local min_grenade_timeout = ASS:get_skill_dependent_value("min_grenade_timeout")
	local no_grenade_push_delay = ASS:get_skill_dependent_value("no_grenade_push_delay")
	local spawn_cooldowns = ASS:get_skill_dependent_value("spawn_cooldowns")
	local sustain_duration_mul = ASS:get_skill_dependent_value("sustain_duration_mul")
	local force_pool_mul = ASS:get_skill_dependent_value("force_pool_mul")
	local break_duration_mul = ASS:get_skill_dependent_value("break_duration_mul")

	local max_balance_muls = ASS:get_intensity_dependent_boolean("max_balance_muls")

	local f = max_values and 1 or math.clamp(difficulty_index - 2, 0, 6) / 6

	local special_weight = math.lerp(special_weight_base[1], special_weight_base[2], f)

	GroupAITaskData[assault_style](self, special_weight)

	self.smoke_grenade_timeout = Utils.collect({ 25, 35 }, grenade_cooldown_mul)
	self.smoke_grenade_lifetime = math.lerp(smoke_grenade_lifetime[1], smoke_grenade_lifetime[2], f)
	self.flash_grenade_timeout = Utils.collect({ 15, 20 }, grenade_cooldown_mul)
	self.cs_grenade_timeout = Utils.collect({ 60, 90 }, grenade_cooldown_mul)
	self.cs_grenade_lifetime = math.lerp(20, 40, f)
	self.cs_grenade_chance_times = cs_grenade_chance_times

	self.min_grenade_timeout = min_grenade_timeout
	self.no_grenade_push_delay = no_grenade_push_delay

	self.spawn_cooldown_mul = math.lerp(spawn_cooldowns[1], spawn_cooldowns[2], f)
	self.spawn_kill_cooldown = spawn_cooldowns[2] * 10

	self.besiege.assault.force_pool = Utils.collect({ 60, 70, 80 }, force_pool_mul)
	self.besiege.assault.sustain_duration_min = Utils.collect({ math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }, sustain_duration_mul)
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.delay = Utils.collect({ math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }, break_duration_mul)
	self.besiege.assault.hostage_hesitation_delay = Utils.collect({ 10, 7.5, 5 }, break_duration_mul)

	self.besiege.recon.interval = { 0, 0, 0 }
	self.besiege.recon.interval_variation = 0

	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.huge, math.huge }

	if max_balance_muls then
		local max_force_mul = self.besiege.assault.force_balance_mul[#self.besiege.assault.force_balance_mul]
		local max_force_pool_mul = self.besiege.assault.force_pool_balance_mul[#self.besiege.assault.force_pool_balance_mul]

		self.besiege.assault.force_balance_mul = table.collect(self.besiege.assault.force_balance_mul, function(val)
			return max_force_mul
		end)
		self.besiege.assault.force_pool_balance_mul = table.collect(self.besiege.assault.force_pool_balance_mul, function(val)
			return max_force_pool_mul
		end)
	end

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

	if not ASS.settings.captain_winters then
		self.phalanx.spawn_chance.start = 0
		self.phalanx.spawn_chance.increase = 0
		self.phalanx.spawn_chance.max = 0
	end

end )
