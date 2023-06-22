return {
	-- van swats
	[100770] = { enemy = ASS:random_unit("swats") },
	[100771] = { enemy = ASS:random_unit("swats") },
	[100772] = { enemy = ASS:random_unit("swats") },
	[100775] = { enemy = ASS:random_unit("swats") },
	[100776] = { enemy = ASS:random_unit("swats") },

	[100779] = { enemy = ASS:random_unit("swats") },
	[100780] = { enemy = ASS:random_unit("swats") },
	[100781] = { enemy = ASS:random_unit("swats") },
	-- [100783] = { enemy = ASS:random_unit("swats") },  -- thats a cloaker ?
	[100785] = { enemy = ASS:random_unit("swats") },
	[100786] = { enemy = ASS:random_unit("swats") },

	[100797] = { enemy = ASS:random_unit("swats") },
	[100798] = { enemy = ASS:random_unit("swats") },
	[100800] = { enemy = ASS:random_unit("swats") },
	[100801] = { enemy = ASS:random_unit("swats") },
	[100826] = { enemy = ASS:random_unit("swats") },

	[100829] = { enemy = ASS:random_unit("swats") },
	[100830] = { enemy = ASS:random_unit("swats") },
	[100833] = { enemy = ASS:random_unit("swats") },
	[100834] = { enemy = ASS:random_unit("swats") },
	[100835] = { enemy = ASS:random_unit("swats") },

	-- "harasser" spawns on mitchell/wilson's roofs
	[101733] = { enemy = ASS:random_unit("swats_close") },
	[101735] = { enemy = ASS:random_unit("swats_close") },
	[101716] = { enemy = ASS:random_unit("swats_close") },
	[101718] = { enemy = ASS:random_unit("swats_close") },

	-- destroyed pool chopper spawns
	[101747] = { enemy = ASS:random_unit("swats_close") },
	[101748] = { enemy = ASS:random_unit("swats_close") },
	[101749] = { enemy = ASS:random_unit("specials_def") },
	[101750] = { enemy = ASS:random_unit("specials_def") },

	-- crashed van shields
	[101652] = { enemy = ASS:random_unit("specials_def") },
	[101653] = { enemy = ASS:random_unit("specials_def") },
	[102704] = { enemy = ASS:random_unit("specials_def") },
	[102733] = { enemy = ASS:random_unit("specials_def") },
	[102758] = { enemy = ASS:random_unit("specials_def") },
	[102760] = { enemy = ASS:random_unit("specials_def") },

	-- crashed van dozers
	[101651] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },
	[102703] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },
	[102745] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },
}
