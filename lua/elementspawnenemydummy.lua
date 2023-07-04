-- Don't replace spawns on custom enemy spawner map
local level_id = ASS:get_level_id()
if Global.editor_mode or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	return
end

-- Map to correct incorrect faction spawns
local enemy_replacements = {
	normal = {
		swat_1 = "units/payday2/characters/ene_swat_1/ene_swat_1",
		swat_2 = "units/payday2/characters/ene_swat_2/ene_swat_2",
		swat_3 = "units/payday2/characters/ene_swat_1/ene_swat_1",
		heavy_1 = "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		heavy_2 = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		shield = "units/payday2/characters/ene_shield_2/ene_shield_2",
		sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
	},
	overkill_145 = {
		swat_1 = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		swat_2 = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		swat_3 = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		heavy_1 = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		heavy_2 = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		shield = "units/payday2/characters/ene_shield_1/ene_shield_1",
		sniper = "units/payday2/characters/ene_sniper_2/ene_sniper_2"
	},
	overkill_290 = {
		swat_1 = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
		swat_2 = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
		swat_3 = "units/payday2/characters/ene_city_swat_3/ene_city_swat_3",
		heavy_1 = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		heavy_2 = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		shield = "units/payday2/characters/ene_city_shield/ene_city_shield",
		sniper = "units/payday2/characters/ene_sniper_3/ene_sniper_3"
	}
}

-- shared replacements
for mapped, replacement in pairs({
	dozer_1 = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
	dozer_2 = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
	dozer_3 = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic",
	medic_1 = "units/payday2/characters/ene_medic_m4/ene_medic_m4",
	medic_2 = "units/payday2/characters/ene_medic_r870/ene_medic_r870",
	taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1",
	cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
}) do
	for _, _level_mod in pairs(enemy_replacements) do
		_level_mod[mapped] = replacement
	end
end

-- very hard has swat scripted spawns, mayhem has fbi scripted spawns
enemy_replacements.hard = enemy_replacements.normal
enemy_replacements.overkill = enemy_replacements.normal
enemy_replacements.easy_wish = enemy_replacements.overkill_145
enemy_replacements.sm_wish = {
	swat_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat",
	swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2",
	swat_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat",
	heavy_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
	heavy_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2",
	shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
	sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
	dozer_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2",
	dozer_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
	dozer_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
	dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	medic_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4",
	medic_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870",
	taser = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer",
	cloaker = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"
}

-- level mod replacements
enemy_replacements.CS_normal = clone(enemy_replacements.normal)
enemy_replacements.CS_FBI_overkill = clone(enemy_replacements.overkill)
enemy_replacements.FBI_overkill_145 = clone(enemy_replacements.overkill_145)
enemy_replacements.FBI_with_office = clone(enemy_replacements.overkill_145)
enemy_replacements.FBI_mcmansion = clone(enemy_replacements.overkill_145)
enemy_replacements.FBI_mcmansion.swat_1 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"
enemy_replacements.FBI_mcmansion.swat_2 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
enemy_replacements.FBI_mcmansion.swat_3 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"
enemy_replacements.FBI_CITY_easy_wish = clone(enemy_replacements.easy_wish)
enemy_replacements.CITY_overkill_290 = clone(enemy_replacements.overkill_290)

local enemy_mapping = {
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",
	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "swat_1",
	[("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "swat_1",
	[("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",
	[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "swat_2",
	[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
	[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = "swat_2",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"):key()] = "swat_2",
	[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",
	[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "heavy_1",
	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "heavy_1",
	[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "heavy_1",
	[("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "heavy_2",
	[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "heavy_2",
	[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"):key()] = "heavy_2",
	[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield",
	[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield",
	[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = "shield",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = "shield",
	[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
	[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
	[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
	[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
	[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer_1",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer_1",
	[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer_2",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer_2",
	[("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer_3",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer_3",
	[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer_4",
	[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer_4",
	[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
	[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
	[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2"
}

-- TODO: look into disabling holdout scripted spawns, it looks weird having yellow heavies spawning when zeals are on the scene
local difficulty, level_mod
if tweak_data.levels[level_id] and tweak_data.levels[level_id].group_ai_state == "skirmish" then
	difficulty = "normal"
	level_mod = nil
else
	difficulty = ASS:get_difficulty()
	level_mod = ASS:level_mod()
end
Hooks:PostHook( ElementSpawnEnemyDummy, "init", "ass_init", function(self)
	local mission_script_elements = ASS:mission_script_patches()

	if mission_script_elements then
		local element_mapping = mission_script_elements[self._id]

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


-- allow randomization of scripted spawns, even when the same element is used multiple times
local produce_original = ElementSpawnEnemyDummy.produce
function ElementSpawnEnemyDummy:produce(params, ...)
	if params and params.name then
		return produce_original(self, params, ...)
	end

	local original_enemy_name = self._enemy_name

	if self._possible_enemies then
		self._enemy_name = table.random(self._possible_enemies)
	end

	local mapped_name = enemy_mapping[self._enemy_name:key()]
	local replacement = level_mod or difficulty
	local mapped_unit = enemy_replacements[replacement] and enemy_replacements[replacement][mapped_name]
	local mapped_unit_ids = mapped_unit and Idstring(mapped_unit)

	if mapped_unit_ids and mapped_unit_ids ~= self._enemy_name then
		self._enemy_name = mapped_unit_ids
	end

	local unit = produce_original(self, params, ...)

	self._enemy_name = original_enemy_name

	return unit
end
