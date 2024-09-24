-- Don't replace spawns on custom enemy spawner map
if ASS.is_spawner then
	return
end

local patched_sss_replacements
Hooks:PostHook( ElementSpawnEnemyDummy, "init", "ass_init", function(self)
	ElementSpawnCivilian.moon_init_hook(self)

	if self._patched_enemy_name == nil then
		local mapped = tweak_data.moon.enemy_mapping[self._enemy_name:key()]
		local typ = tweak_data.moon.default_scripted_spawn_mappings[mapped]

		if typ then
			local units = tweak_data.moon.units[typ]

			if type(units) == "table" then
				self._possible_enemies = units
				self._patched_enemy_name = units[1]
			else
				self._patched_enemy_name = units
			end
		end
	end

	if not patched_sss_replacements then
		patched_sss_replacements = true

		if self.sss_replacements then
			local tank_replacement = self.sss_replacements[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] or { "tank", 1, "FBI_heavy_R870" }
			local sniper_replacement = self.sss_replacements[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] or { "sniper", 2, "FBI_swat_M4", "sniper" }
			local mapped_replacements = {
				dozer_1 = tank_replacement,
				dozer_2 = tank_replacement,
				dozer_3 = tank_replacement,
				dozer_4 = tank_replacement,
				dozer_5 = tank_replacement,
				sniper = sniper_replacement,
			}

			for unit, mapped in pairs(tweak_data.moon.enemy_mapping) do
				self.sss_replacements[unit] = mapped_replacements[mapped] or nil
			end
		end
	end
end )

local produce_original = ElementSpawnEnemyDummy.produce
function ElementSpawnEnemyDummy:moon_produce_helper(params, ...)
	local dummy_mapping = tweak_data.moon.dummy_mapping[self._enemy_name:key()]

	if dummy_mapping then
		ASS:log("error", "Element \"%s\" (%s) tried spawning a dummy unit \"%s\"!", self._editor_name, self._id, dummy_mapping)

		self._enemy_name = self._original_enemy_name
	end

	local unit = produce_original(self, params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end

-- allow randomization of scripted spawns, even when the same element is used multiple times
function ElementSpawnEnemyDummy:produce(params, ...)
	if params and params.name then  -- params.name means groupai spawn
		params.name = tweak_data.moon.level_enemy_replacements[params.name:key()] or params.name

		-- give assault-spawned cops and fbis the same access as swat
		local unit = produce_original(self, params, ...)
		local u_brain = alive(unit) and unit:brain()
		local logic_data = u_brain and u_brain._logic_data
		local replace_access = tweak_data.moon.replace_access[logic_data and logic_data.SO_access_str]
		local converted_access = replace_access and managers.navigation:convert_access_flag(replace_access)

		if converted_access then
			u_brain._SO_access = converted_access
			logic_data.SO_access = converted_access
			logic_data.SO_access_str = replace_access
		end

		return unit
	end

	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	elseif self._patched_enemy_name then
		self._enemy_name = self._patched_enemy_name
	end

	self._enemy_name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", self._enemy_name)

	local name_key = self._enemy_name:key()
	local level_enemy_replacement = tweak_data.moon.level_enemy_replacements[name_key]
	if level_enemy_replacement then
		self._enemy_name = level_enemy_replacement

		return self:moon_produce_helper(params, ...)
	end

	-- static_tier = false means scripted cops/fbis can be replaced depending on level mod
	local mapped_name = tweak_data.moon.enemy_mapping[name_key]
	if not self.static_continent and self.static_tier == nil then
		if tweak_data.moon.forbidden_scripted_replacements[mapped_name] then
			return self:moon_produce_helper(params, ...)
		end
	end

	local replacement = self.static_tier or managers.groupai:state():moon_get_scripted_tier()
	local enemy_replacements = tweak_data.moon:enemy_replacements(self.static_continent)
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	if mapped_unit then
		self._enemy_name = tweak_data.moon.level_enemy_replacements[mapped_unit:key()] or mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end

-- base SH uses this, the changes it made to let enemy spawns randomize each time (for MH/DW light riflemen) doesnt seem to play nice with ASS
-- ultimately ASS does a lot of the same, so just make SH's implementation not do anything
ElementSpawnEnemyDummy.faction_mapping = {}
ElementSpawnEnemyDummy.enemy_mapping = {}
