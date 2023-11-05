-- adjust to support all factions and the CS tank unit category
local random_units = tweak_data.levels:moon_random_units()

ModifierSkulldozers._moon_dozer_add = tweak_data.levels:moon_units().dozer_3
ModifierSkulldozers._moon_dozer_tables = {
	[random_units.dozers_any] = true,
	[random_units.dozers_no_cs] = true,
	[random_units.dozers_no_med] = true,
	[random_units.dozers_no_mini] = true,
}

local try_insert = ASS:require("try_insert", true)

function ModifierSkulldozers:moon_init(...)
	self.super.init(self, ...)

	self._moon_dozer_add = self._moon_dozer_add or Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")

	for _, data in pairs(tweak_data.group_ai.unit_categories) do
		if data.special_type == "tank" then
			for _, units in pairs(data.unit_types) do
				try_insert(units, self._moon_dozer_add)
			end
		end
	end

	for tbl in pairs(self._moon_dozer_tables or {}) do
		try_insert(tbl, self._moon_dozer_add)
	end

	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
end

ASS:override( ModifierSkulldozers, "init", ModifierSkulldozers.moon_init )
