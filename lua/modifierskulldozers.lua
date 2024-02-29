if ASS:get_var("is_client") then
	return
end

local try_insert = ASS:require("try_insert", true)

-- adjust to support all factions and the CS tank unit category
ModifierSkulldozers._moon_dozer_add = {
	america = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
	russia = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
	zombie = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
	murkywater = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
	federales = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
	constantine_cartel = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
}
ModifierSkulldozers._moon_dozer_tables = {
	dozers_any = true,
	dozers_no_cs = true,
	dozers_no_med = true,
	dozers_no_mini = true,
}

function ModifierSkulldozers:moon_init(...)
	self.super.init(self, ...)

	self._moon_dozer_tables = self._moon_dozer_tables or {}
	self._moon_dozer_add = self._moon_dozer_add or {
		america = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
	}

	local fucked, use = tweak_data.levels:moon_custom_maps_boowomp()
	if self._moon_dozer_add[fucked] then
		self._moon_dozer_add["actual_" .. fucked] = self._moon_dozer_add[fucked]
		self._moon_dozer_add[fucked] = self._moon_dozer_add[use] or self._moon_dozer_add[fucked]
	end

	for _, data in pairs(tweak_data.group_ai.unit_categories) do
		if data.special_type == "tank" then
			for continent, units in pairs(data.unit_types) do
				try_insert(units, self._moon_dozer_add[continent] or self._moon_dozer_add.america)
			end
		end
	end

	local random_units = tweak_data.levels:moon_random_units()
	for tbl_name in pairs(self._moon_dozer_tables) do
		try_insert(random_units[tbl_name], self._moon_dozer_add.america)
	end

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end

ASS:override( ModifierSkulldozers, "init", ModifierSkulldozers.moon_init )
