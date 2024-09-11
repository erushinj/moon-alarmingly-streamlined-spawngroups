-- Don't replace spawns on custom enemy spawner map
if ASS.is_spawner then
	return
end

function ElementSpawnCivilian:moon_init_hook()
	self._original_enemy_name = self._enemy_name

	local moon_data = self._values.moon_data
	if moon_data then
		if type(moon_data.enemy) == "table" then
			self._possible_enemies = moon_data.enemy
			self._patched_enemy_name = moon_data.enemy[1]
		else
			self._patched_enemy_name = moon_data.enemy
		end

		local run_func_on_unit = moon_data.run_func_on_unit
		if run_func_on_unit then
			Hooks:PostHook( self, "produce", "sh_produce_run_func_on_unit_" .. self._id, function()
				run_func_on_unit(Hooks:GetReturn())
			end )
		end

		self.static_continent = moon_data.continent
		self.static_tier = moon_data.tier
		self._values.moon_data = nil
	end
end

Hooks:PostHook( ElementSpawnCivilian, "init", "ass_init", ElementSpawnCivilian.moon_init_hook )

-- allow randomization of scripted spawns, even when the same element is used multiple times
local produce_original = ElementSpawnCivilian.produce
function ElementSpawnCivilian:produce(params, ...)
	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	elseif self._patched_enemy_name then
		self._enemy_name = self._patched_enemy_name
	end

	if self.moon_needs_state == nil then
		self.moon_needs_state = not self._values.state or self._values.state == "none" or false
	end

	if self.moon_needs_state then
		local anim_set = tweak_data.moon.female_civs_map[self._enemy_name:key()] and "female" or "male"
		local idles = tweak_data.moon.civ_idles[anim_set]
		local state = table.get_vector_index(CopActionAct._act_redirects.civilian_spawn, idles:select())

		self._values.state = state
	end

	local unit = produce_original(self, params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
