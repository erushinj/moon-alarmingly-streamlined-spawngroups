local units = ASS:base_units()

return {
	-- dozer with 4 shields guarding bags, goes up to minigun now
	[102374] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[102375] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- helicopter spawn in front of the warehouse
	[100446] = { enemy = ASS:random_unit("specials_med") },
	[100447] = { enemy = ASS:is_difficulty_at_least("easy_wish") and ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) or units.taser },
}
