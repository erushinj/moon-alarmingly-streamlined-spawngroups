-- Don't replace spawns on custom enemy spawner map
local level_id = ASS:get_var("level_id")
if Global.editor_mode or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	return
end

ASS:post_hook( ElementSpawnEnemyDummy, "init", function(self)
	if self._values.possible_enemies then
		self._possible_enemies = self._values.possible_enemies

		self._values.possible_enemies = nil
	end

	local mission_script_patches = ASS:mission_script_patches()
	if mission_script_patches then
		local element_mapping = mission_script_patches[self._id]

		if element_mapping then
			local enemy = element_mapping.enemy

			if enemy then
				if type(enemy) == "table" then
					self._possible_enemies = enemy
				else
					self._enemy_name = enemy
				end
			end
		end
	end
end )

local wave_unit_categories = ASS:wave_unit_categories()
local is_skirmish = tweak_data.levels[level_id] and tweak_data.levels[level_id].group_ai_state == "skirmish"
local function i_hate_scripted_spawns()
	local skm = managers.skirmish

	if skm and skm:is_skirmish() then
		local wave_categories = wave_unit_categories[skm:current_wave_number()] or wave_unit_categories[#wave_unit_categories]

		if wave_categories then
			return wave_categories.CS
		end
	end
end
local difficulty = is_skirmish and i_hate_scripted_spawns or ASS:get_var("difficulty")
local level_mod = not is_skirmish and ASS:get_var("level_mod") or nil

-- allow randomization of scripted spawns, even when the same element is used multiple times
local enemy_replacements, enemy_mapping = ASS:enemy_replacements(), ASS:enemy_mapping()
local level_enemy_replacements = ASS:level_enemy_replacements()[level_id] or {}
local forbidden_enemy_replacements = table.set("hrt_1", "hrt_2", "hrt_3")
local produce_original = ElementSpawnEnemyDummy.produce
function ElementSpawnEnemyDummy:produce(params, ...)
	if params and params.name then
		params.name = level_enemy_replacements[params.name:key()] or params.name

		return produce_original(self, params, ...)
	end

	local original_enemy_name = self._enemy_name
	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	end

	self._enemy_name = level_enemy_replacements[self._enemy_name:key()] or self._enemy_name

	local mapped_name = enemy_mapping[self._enemy_name:key()]
	if forbidden_enemy_replacements[mapped_name] then
		return produce_original(self, params, ...)
	end

	local replacement = level_mod or type(difficulty) == "function" and difficulty() or difficulty or "normal"
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	local mapped_unit_ids = mapped_unit and Idstring(mapped_unit)
	if mapped_unit_ids and mapped_unit_ids ~= self._enemy_name then
		self._enemy_name = mapped_unit_ids
	end

	local unit = produce_original(self, params, ...)

	self._enemy_name = original_enemy_name

	return unit
end
