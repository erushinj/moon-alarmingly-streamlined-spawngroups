local units = ASS:base_units()

return {
	-- dozer with 4 shields guarding bags, goes up to minigun now
	[102374] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[102375] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- shotgun cop, long distance, now mp5 cop
	[101216] = { enemy = units.cop_4 },

	-- helicopter spawn in front of the warehouse
	[100446] = { enemy = ASS:is_difficulty_at_least("easy_wish") and units.taser or units.medic_1 },
	[100447] = { enemy = ASS:is_difficulty_at_least("easy_wish") and ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MEDIC) or units.taser },
}
