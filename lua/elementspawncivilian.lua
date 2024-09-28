-- Don't replace spawns on custom enemy spawner map
if ASS.is_spawner then
	return
end

function ElementSpawnCivilian:moon_init_hook()
	self._original_enemy_name = self._enemy_name

	local moon_data = self._values.moon_data
	local patch_funcs = managers.mission and managers.mission.mission_script_patch_funcs
	if not patch_funcs then
		ASS:log("error", "managers.mission.mission_script_patch_funcs unavailable!")
	elseif moon_data then
		if moon_data.continent or moon_data.tier then
			moon_data.static_spawn = {
				continent = moon_data.continent,
				tier = moon_data.tier,
			}
			moon_data.continent = nil
			moon_data.tier = nil
		end

		for id, data in pairs(moon_data) do
			if patch_funcs[id] then
				patch_funcs[id](managers.mission, self, data)
			else
				ASS:log("warn", "Mission script patch func \"%s\" does not exist!", id)
			end
		end
	end

	self._values.moon_data = nil
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
