local units = ASS:base_units()

return {
	-- cloaker replacing bronco cop near manhole
	[100371] = { enemy = ASS:is_difficulty_at_least("easy_wish") and units.cloaker },

	-- taser near bronco cop and shields
	[102844] = { enemy = ASS:random_unit("specials_taser_medic") },
	[100363] = { enemy = ASS:random_unit("cops_heavy") },
	[100436] = { enemy = ASS:random_unit("cops_heavy") },
}
