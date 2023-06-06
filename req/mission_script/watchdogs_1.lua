local units = ASS:base_units()

return {
	-- cloaker replacing bronco cop near manhole
	[100371] = { enemy = ASS:is_difficulty_at_least("easy_wish") and units.cloaker },

	-- taser near bronco cop and shields
	[102844] = { enemy = ASS:is_difficulty_at_least("overkill_145") and units.taser },
	[100363] = { enemy = units.cop_4 },
	[100436] = { enemy = units.cop_4 },
}
