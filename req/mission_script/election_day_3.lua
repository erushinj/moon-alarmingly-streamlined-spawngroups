return {
	-- recurring spawns in the spot with really annoying constant snipers
	[100119] = { enemy = ASS:random_unit("cops") },
	[100132] = { enemy = ASS:random_unit("cops") },
	[100145] = { enemy = ASS:random_unit("cops") },
	[100150] = { enemy = ASS:random_unit("cops") },
	[100152] = { enemy = ASS:random_unit("cops") },
	[100154] = { enemy = ASS:random_unit("cops") },

	[100128] = { enemy = ASS:random_unit("swats") },
	[100164] = { enemy = ASS:random_unit("swats") },
	[100170] = { enemy = ASS:random_unit("swats") },
	[100171] = { enemy = ASS:random_unit("swats") },
	[100174] = { enemy = ASS:random_unit("swats") },
	[100175] = { enemy = ASS:random_unit("swats") },
	[100131] = { enemy = ASS:random_unit("swats") },
	[100176] = { enemy = ASS:random_unit("swats") },
	[100177] = { enemy = ASS:random_unit("swats") },
	[100179] = { enemy = ASS:random_unit("swats") },
	[100181] = { enemy = ASS:random_unit("swats") },
	[100182] = { enemy = ASS:random_unit("swats") },
	[100189] = { enemy = ASS:random_unit("swats") },
	[100190] = { enemy = ASS:random_unit("swats") },
	[100191] = { enemy = ASS:random_unit("swats") },
	[100192] = { enemy = ASS:random_unit("swats") },
	[100193] = { enemy = ASS:random_unit("swats") },
	[100197] = { enemy = ASS:random_unit("swats") },
	[100199] = { enemy = ASS:random_unit("swats") },
	[100201] = { enemy = ASS:random_unit("swats") },
	[100203] = { enemy = ASS:random_unit("swats") },
	[100204] = { enemy = ASS:random_unit("swats") },
	[100206] = { enemy = ASS:random_unit("swats") },
	[100207] = { enemy = ASS:random_unit("swats") },

	[100208] = { enemy = ASS:random_unit("heavys") },
	[100209] = { enemy = ASS:random_unit("heavys") },
	[100210] = { enemy = ASS:random_unit("heavys") },
	[100211] = { enemy = ASS:random_unit("heavys") },
	[100212] = { enemy = ASS:random_unit("heavys") },
	[100213] = { enemy = ASS:random_unit("heavys") },

	-- elevator dozers
	[103241] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103266] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103254] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103222] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
}