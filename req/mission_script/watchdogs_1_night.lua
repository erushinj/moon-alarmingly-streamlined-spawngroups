local units = ASS:base_units()

return {
	-- cloaker replacing bronco cop near manhole
	[100371] = { enemy = ASS:is_difficulty_at_least("easy_wish") and units.cloaker },

	-- medic near bronco cop and shields
	[102844] = { enemy = ASS:is_difficulty_at_least("overkill_145") and units.medic_2 },
	[100363] = { enemy = units.cop_3 },
	[100436] = { enemy = units.cop_3 },
}
