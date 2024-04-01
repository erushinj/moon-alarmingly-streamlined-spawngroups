-- Don't replace spawns on custom enemy spawner map
if ASS:get_var("is_spawner")  then
	return
end

function ElementSpawnCivilian:moon_init_hook()
	local moon_data = self._values.moon_data

	if moon_data then
		if type(moon_data.enemy) == "table" then
			self._possible_enemies = moon_data.enemy
			self._patched_enemy_name = moon_data.enemy[1]
		else
			self._patched_enemy_name = moon_data.enemy
		end

		self.static_continent = moon_data.continent
		self.static_tier = moon_data.tier
		self._values.moon_data = nil
	end

	self._original_enemy_name = self._enemy_name
end

ASS:post_hook( ElementSpawnCivilian, "init", ElementSpawnCivilian.moon_init_hook )

-- allow randomization of scripted spawns, even when the same element is used multiple times
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
	local mapped_name = tweak_data.levels:moon_enemy_mapping(name_key)
	if not static_continent then
		if tweak_data.levels:moon_forbidden_scripted_replacements(mapped_name) then
			return self:moon_produce_helper(params, ...)
		end
	end

	local last_prefixes = tweak_data.group_ai.moon_last_prefixes
	local replacement = self.static_tier or last_prefixes and last_prefixes.CS
	local enemy_replacements = tweak_data.levels:moon_enemy_replacements(static_continent)
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	if mapped_unit then
		self._enemy_name = level_enemy_replacements[mapped_unit:key()] or mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end )

function ElementSpawnCivilian:moon_produce_helper(params, ...)
	local unit = self:produce_original(params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
