local units = ASS:base_units()
local is_easy_wish = ASS:is_difficulty_at_least("easy_wish")

return {
	-- dozer with 4 shields guarding bags, goes up to minigun now
	[102374] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[102375] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- helicopter spawn in front of the warehouse
	[100446] = { enemy = is_easy_wish and units.taser or units.medic_1 },
	[100447] = { enemy = is_easy_wish and ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MEDIC) or units.taser },
}
