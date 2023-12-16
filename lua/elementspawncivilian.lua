-- Don't replace spawns on custom enemy spawner map
if ASS:get_var("is_spawner")  then
	return
end

function ElementSpawnCivilian:moon_init_hook()
	if self._values.possible_enemies then
		self._possible_enemies = self._values.possible_enemies

		self._values.possible_enemies = nil
	end

	self._original_enemy_name = self._enemy_name
end

ASS:post_hook( ElementSpawnCivilian, "init", ElementSpawnCivilian.moon_init_hook )

local function i_hate_scripted_spawns()
	local skm = managers.skirmish

	if skm and skm:is_skirmish() then
		local wave_unit_categories = tweak_data.skirmish:moon_wave_unit_categories()
		local wave_categories = wave_unit_categories[skm:current_wave_number()] or wave_unit_categories[#wave_unit_categories]

		return wave_categories and wave_categories.CS
	end
end
local level = tweak_data.levels[ASS:get_var("level_id")]
local is_skirmish = level and level.group_ai_state == "skirmish"
local difficulty = is_skirmish and i_hate_scripted_spawns or ASS:get_var("difficulty")
local level_mod = not is_skirmish and ASS:get_var("level_mod") or nil

-- allow randomization of scripted spawns, even when the same element is used multiple times
local enemy_replacements, enemy_mapping = tweak_data.levels:moon_enemy_replacements(), tweak_data.levels:moon_enemy_mapping()
local level_enemy_replacements = tweak_data.levels:moon_level_enemy_replacements()
local forbidden_scripted_replacements = table.set("hrt_1", "hrt_2", "hrt_3")
ElementSpawnCivilian.produce_original = ElementSpawnCivilian.produce
function ElementSpawnCivilian:produce(params, ...)
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
	if mapped_unit then
		self._enemy_name = mapped_unit
	end

	return self:moon_produce_helper(params, ...)
end

function ElementSpawnCivilian:moon_produce_helper(params, ...)
	local unit = self:produce_original(params, ...)

	self._enemy_name = self._original_enemy_name

	return unit
end
