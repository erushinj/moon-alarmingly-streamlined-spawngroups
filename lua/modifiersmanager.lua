if ASS:get_var("is_client") then
	return
end

local try_insert = ASS:require("try_insert", true)

-- add missing vanilla and custom map heavies
for name_key, mapped in pairs(tweak_data.levels:moon_enemy_mapping()) do
	ModifierHeavySniper.heavy_units[name_key] = mapped == "heavy_1" or mapped == "heavy_2" or nil
end

ModifierHeavies._moon_u_key_mapping = {
	swat_1 = "heavy_1",
	swat_2 = "heavy_2",
	swat_3 = "heavy_1",
}
ASS:override( ModifierHeavies, "init", function(self, ...)
	self.super.init(self, ...)

	local u_key_mapping = self._moon_u_key_mapping
	for _, continent in pairs(tweak_data.levels:moon_enemy_replacements(tweak_data.levels.moon_all_replacements)) do
		for _, tier in pairs(continent) do
			for u_key in pairs(tier) do
				local new_key = u_key_mapping[u_key]
				local mapped_unit = tier[new_key]

				if mapped_unit then
					tier[u_key] = mapped_unit
				end
			end
		end
	end

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end )

-- adjust to support all factions and the CS tank unit category
local fallback_dozer_add = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
local fallback_dozer_tables = {}
local function dozer_modifier_init(self, ...)
	self.super.init(self, ...)

	local dozer_add = self._moon_dozer_add or fallback_dozer_add
	local dozer_tables = self._moon_dozer_tables or fallback_dozer_tables
	local random_units = tweak_data.levels:moon_random_units()
	for tbl_name in pairs(dozer_tables) do
		try_insert(random_units[tbl_name], dozer_add)
	end

	local last_prefixes = tweak_data.group_ai.moon_last_prefixes
	tweak_data.group_ai:moon_add_func( -10, function(group_ai)
		try_insert(group_ai.unit_categories.FBI_tank.unit_types.america, dozer_add)
	end )
	tweak_data.group_ai:moon_reinit_unit_categories()
	tweak_data.group_ai:moon_swap_units(last_prefixes)
end

ModifierSkulldozers._moon_dozer_add = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
ModifierSkulldozers._moon_dozer_tables = table.set("dozers_any", "dozers_no_cs", "dozers_no_med", "dozers_no_mini")
ASS:override( ModifierSkulldozers, "init", dozer_modifier_init )

ModifierDozerMinigun._moon_dozer_add = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
ModifierDozerMinigun._moon_dozer_tables = table.set("dozers_any", "dozers_no_med")
ASS:override( ModifierDozerMinigun, "init", dozer_modifier_init )

ModifierDozerMedic._moon_dozer_add = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
ModifierDozerMedic._moon_dozer_tables = table.set("dozers_any", "dozers_no_mini")
ASS:override( ModifierDozerMedic, "init", dozer_modifier_init )
