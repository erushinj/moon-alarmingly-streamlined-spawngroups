-- Don't replace spawns on custom enemy spawner map
local level_id = ASS:get_var("level_id")
if Global.editor_mode or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	return
end

local mission_script_patches = ASS:mission_script_patches()
function ElementSpawnEnemyDummy:moon_init_hook()
	if self._values.possible_enemies then
		self._possible_enemies = self._values.possible_enemies

		self._values.possible_enemies = nil
	end

	self._original_enemy_name = self._enemy_name

	if mission_script_patches then
		local element_mapping = mission_script_patches[self._id]

		if element_mapping then
			local enemy = element_mapping.enemy

			if enemy then
				if type(enemy) == "table" then
					self._possible_enemies = enemy
					self._patched_enemy_name = enemy[1]
				else
					self._patched_enemy_name = enemy
				end
			end
		end
	end
end

ASS:post_hook( ElementSpawnEnemyDummy, "init", ElementSpawnEnemyDummy.moon_init_hook )

local function i_hate_scripted_spawns()
	local skm = managers.skirmish

	if skm and skm:is_skirmish() then
		local wave_unit_categories = tweak_data.skirmish:moon_wave_unit_categories()
		local wave_categories = wave_unit_categories[skm:current_wave_number()] or wave_unit_categories[#wave_unit_categories]

		return wave_categories and wave_categories.CS
	end
end
local is_skirmish = tweak_data.levels[level_id] and tweak_data.levels[level_id].group_ai_state == "skirmish"
local difficulty = is_skirmish and i_hate_scripted_spawns or ASS:get_var("difficulty")
local level_mod = not is_skirmish and ASS:get_var("level_mod") or nil

-- allow randomization of scripted spawns, even when the same element is used multiple times
local enemy_replacements, enemy_mapping = tweak_data.levels:moon_enemy_replacements(), tweak_data.levels:moon_enemy_mapping()
local level_enemy_replacements = tweak_data.levels:moon_level_enemy_replacements()
local forbidden_scripted_replacements = table.set("hrt_1", "hrt_2", "hrt_3")
ElementSpawnEnemyDummy.produce_original = ElementSpawnEnemyDummy.produce
function ElementSpawnEnemyDummy:produce(params, ...)
	if params and params.name then
		params.name = level_enemy_replacements[params.name:key()] or params.name

		return self:produce_original(params, ...)
	end

	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	else
		self._enemy_name = self._patched_enemy_name or self._enemy_name
	end

	self._enemy_name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", self._enemy_name)

	local level_enemy_replacement = level_enemy_replacements[self._enemy_name:key()]
	if level_enemy_replacement then
		self._enemy_name = level_enemy_replacement

		return self:moon_produce_helper(params, ...)
	end

	local mapped_name = enemy_mapping[self._enemy_name:key()]
	if forbidden_scripted_replacements[mapped_name] then
		return self:moon_produce_helper(params, ...)
	end

	local replacement = level_mod or type(difficulty) == "function" and difficulty() or difficulty or "normal"
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	-- if mapped_unit and mapped_unit ~= self._enemy_name then
	if mapped_unit then
		self._enemy_name = mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end

function ElementSpawnEnemyDummy:moon_produce_helper(params, ...)
	local unit = self:produce_original(params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
