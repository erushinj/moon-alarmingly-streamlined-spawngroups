-- Don't replace spawns on custom enemy spawner map
if ASS.is_spawner then
	return
end

local mappings = {
	dozer_1 = "dozers_no_cs",
	dozer_2 = "dozers_no_cs",
	dozer_3 = "dozers_no_cs",
	swat_1 = "swats_far",
	swat_3 = "swats_far",
}
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

		self.static_continent = moon_data.continent
		self.static_tier = moon_data.tier
		self._values.moon_data = nil
	end

	if self._patched_enemy_name == nil and getmetatable(self) == ElementSpawnEnemyDummy then
		local mapped = tweak_data.moon.enemy_mapping[self._enemy_name:key()]
		local typ = mappings[mapped]

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
end

Hooks:PostHook( ElementSpawnCivilian, "init", "ass_init", ElementSpawnCivilian.moon_init_hook )

local idles = {
	female = {
		{ "cf_sp_stand_idle_var1", 3, },
		{ "cf_sp_stand_idle_var3", 3, },
		{ "cf_sp_stand_arms_crossed", 1, },
	},
	male = {
		{ "cm_sp_stand_idle", 2, },
		{ "cm_sp_standing_idle_var2", 2, },
		{ "cm_sp_stand_waiting", 2, },
		{ "cm_sp_stand_arms_crossed", 1, },
	},
}
for key, list in pairs(idles) do
	local selector = WeightedSelector:new()

	for _, data in pairs(list) do
		if type(data) == "table" then
			selector:add(unpack(data))
		else
			selector:add(data, 1)
		end
	end

	idles[key] = selector
end

-- allow randomization of scripted spawns, even when the same element is used multiple times
local bad_access = table.set("cop", "fbi")
local replace_access = "swat"
ElementSpawnCivilian.produce_original = ElementSpawnCivilian.produce
function ElementSpawnCivilian:produce(params, ...)
	local level_enemy_replacements = tweak_data.moon.level_enemy_replacements

	-- params.name means groupai spawn and everything after this check doesnt apply
	if params and params.name then
		params.name = level_enemy_replacements[params.name:key()] or params.name

		-- give assault-spawned cops and fbis the same access as swat
		local unit = self:produce_original(params, ...)
		if alive(unit) then
			local u_brain = unit:brain()
			local logic_data = u_brain and u_brain._logic_data

			if logic_data then
				local u_base = unit:base()
				local char_tweak = u_base and u_base:char_tweak()

				if bad_access[char_tweak and char_tweak.access] then
					local converted_access = managers.navigation:convert_access_flag(replace_access)

					u_brain._SO_access = converted_access
					logic_data.SO_access = converted_access
					logic_data.SO_access_str = replace_access
				end
			end
		end

		return unit
	end

	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	elseif self._patched_enemy_name then
		self._enemy_name = self._patched_enemy_name
	end

	-- everything coming after this civ check only applies to enemies
	if getmetatable(self) == ElementSpawnCivilian then
		if self.moon_needs_state == nil then
			self.moon_needs_state = not self._values.state or self._values.state == "none" or false
		end

		if self.moon_needs_state then
			local anim_set = tweak_data.moon.female_civs_map[self._enemy_name:key()] and "female" or "male"
			local state = table.get_vector_index(CopActionAct._act_redirects.civilian_spawn, idles[anim_set]:select())

			self._values.state = state
		end

		return self:moon_produce_helper(params, ...)
	end

	self._enemy_name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", self._enemy_name)

	local name_key = self._enemy_name:key()
	local level_enemy_replacement = level_enemy_replacements[name_key]
	if level_enemy_replacement then
		self._enemy_name = level_enemy_replacement

		return self:moon_produce_helper(params, ...)
	end

	-- static_tier = false means scripted cops/fbis can be replaced depending on level mod
	local static_continent, static_tier = self.static_continent, self.static_tier
	local mapped_name = tweak_data.moon.enemy_mapping[name_key]
	if not static_continent and static_tier == nil then
		if tweak_data.moon.forbidden_scripted_replacements[mapped_name] then
			return self:moon_produce_helper(params, ...)
		end
	end

	local replacement = static_tier or managers.groupai:state():moon_get_scripted_prefix()
	local enemy_replacements = tweak_data.moon:enemy_replacements(static_continent)
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	if mapped_unit then
		self._enemy_name = level_enemy_replacements[mapped_unit:key()] or mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end

function ElementSpawnCivilian:moon_produce_helper(params, ...)
	local unit = self:produce_original(params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
