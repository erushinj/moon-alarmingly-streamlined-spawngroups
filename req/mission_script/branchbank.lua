return {
	-- chopper swats
	[101432] = { enemy = ASS:random_unit("swats_close") },
	[105621] = { enemy = ASS:random_unit("swats_close") },

	-- chopper heavies
	[101433] = { enemy = ASS:random_unit("heavys") },
	[105620] = { enemy = ASS:random_unit("heavys") },

	-- chopper dozers
	[101785] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[101786] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
}
