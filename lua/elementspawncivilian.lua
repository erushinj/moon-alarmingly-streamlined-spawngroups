-- Don't replace spawns on custom enemy spawner map
if ASS:get_var("is_spawner")  then
	return
end

function ElementSpawnCivilian:moon_init_hook()
	if self._values.patched_enemy_name then
		self._patched_enemy_name = self._values.patched_enemy_name
		self._values.patched_enemy_name = nil
	end

	if self._values.possible_enemies then
		self._possible_enemies = self._values.possible_enemies
		self._values.possible_enemies = nil
	end

	if self._values.static_spawn then
		self.static_continent = self._values.static_spawn.continent
		self.static_tier = self._values.static_spawn.tier
		self._values.static_spawn = nil
	end

	self._original_enemy_name = self._enemy_name
end

ASS:post_hook( ElementSpawnCivilian, "init", ElementSpawnCivilian.moon_init_hook )

-- allow randomization of scripted spawns, even when the same element is used multiple times
local difficulty = ASS:get_var("difficulty")
local level_mod = ASS:get_var("level_mod")
ASS:override( ElementSpawnCivilian, "produce", function(self, params, ...)
	local level_enemy_replacements = tweak_data.levels:moon_level_enemy_replacements()

	if params and params.name then
		params.name = level_enemy_replacements[params.name:key()] or params.name

		return self:produce_original(params, ...)
	end

	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	elseif self._patched_enemy_name then
		self._enemy_name = self._patched_enemy_name
	end

	self._enemy_name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", self._enemy_name)

	local name_key = self._enemy_name:key()
	local level_enemy_replacement = level_enemy_replacements[name_key]
	if level_enemy_replacement then
		self._enemy_name = level_enemy_replacement

		return self:moon_produce_helper(params, ...)
	end

	local static_continent = self.static_continent
	local enemy_mapping = tweak_data.levels:moon_enemy_mapping()
	local mapped_name = enemy_mapping[name_key]
	if not static_continent then
		local forbidden_scripted_replacements = tweak_data.levels:moon_forbidden_scripted_replacements()

		if forbidden_scripted_replacements[mapped_name] then
			return self:moon_produce_helper(params, ...)
		end
	end

	local wave_categories
	if managers.skirmish and managers.skirmish:is_skirmish() then
		local wave_unit_categories = tweak_data.skirmish:moon_wave_unit_categories()

		wave_categories = wave_unit_categories[managers.skirmish:current_wave_number()]
	end

	local replacement = self.static_tier or wave_categories and wave_categories.CS or level_mod or difficulty
	local enemy_replacements = tweak_data.levels:moon_enemy_replacements(static_continent)
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	if mapped_unit then
		self._enemy_name = mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end )

function ElementSpawnCivilian:moon_produce_helper(params, ...)
	local unit = self:produce_original(params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
