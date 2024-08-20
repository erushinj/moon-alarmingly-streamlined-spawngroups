if ASS.is_client then
	return
end

local try_insert = ASS:require("try_insert", true)

-- add missing vanilla and custom map heavies
for name_key, mapped in pairs(tweak_data.levels:moon_enemy_mapping()) do
	ModifierHeavySniper.heavy_units[name_key] = mapped == "heavy_1" or mapped == "heavy_2" or nil
end

ModifierHeavies.moon_u_key_mapping = {
	swat_1 = "heavy_1",
	swat_2 = "heavy_2",
	swat_3 = "heavy_1",
}
ASS:override( ModifierHeavies, "init", function(self, ...)
	self.super.init(self, ...)

	for _, continent in pairs(tweak_data.levels:moon_enemy_replacements(true)) do
		for _, tier in pairs(continent) do
			for u_key in pairs(tier) do
				local new_key = self.moon_u_key_mapping[u_key]
				local mapped_unit = tier[new_key]

				if mapped_unit then
					tier[u_key] = mapped_unit
				end
			end
		end
	end

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end, true )

-- adjust to support all factions and the CS tank unit category
local function dozer_modifier_init(self, ...)
	self.super.init(self, ...)

	local units = tweak_data.levels:moon_units()
	local dozer_add = units[self.moon_dozer_key]
	for tbl_name in pairs(self.moon_dozer_tables) do
		try_insert(units[tbl_name], dozer_add)
	end

	local FBI_tank_u_keys = tweak_data.group_ai.unit_categories.FBI_tank.moon_u_keys
	FBI_tank_u_keys[self.moon_dozer_key] = math.max(FBI_tank_u_keys[self.moon_dozer_key] or 0, 1)

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end

ModifierSkulldozers.moon_dozer_add = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
ModifierSkulldozers.moon_dozer_key = "dozer_3"
ModifierSkulldozers.moon_dozer_tables = table.set("dozers_any", "dozers_no_cs", "dozers_no_med", "dozers_no_mini")
ASS:override( ModifierSkulldozers, "init", dozer_modifier_init, true )

ModifierDozerMinigun.moon_dozer_add = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
ModifierDozerMinigun.moon_dozer_key = "dozer_4"
ModifierDozerMinigun.moon_dozer_tables = table.set("dozers_any", "dozers_no_med")
ASS:override( ModifierDozerMinigun, "init", dozer_modifier_init, true )

ModifierDozerMedic.moon_dozer_add = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
ModifierDozerMedic.moon_dozer_key = "dozer_5"
ModifierDozerMedic.moon_dozer_tables = table.set("dozers_any", "dozers_no_mini")
ASS:override( ModifierDozerMedic, "init", dozer_modifier_init, true )
