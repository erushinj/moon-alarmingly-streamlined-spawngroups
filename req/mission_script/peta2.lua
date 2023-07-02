local thugs = {
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
}
local thugs_light = {
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
}
local thugs_heavy = {
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
}

return {
	-- thugs
	[100428] = { enemy = thugs_light },  -- "sniper" spots
	[100429] = { enemy = thugs_light },
	[100430] = { enemy = thugs_light },
	[100431] = { enemy = thugs_light },
	[100432] = { enemy = thugs_light },
	[100433] = { enemy = thugs_light },
	[100434] = { enemy = thugs_light },
	[100435] = { enemy = thugs_light },
	[100182] = { enemy = thugs_heavy },  -- door openers, poor suckers
	[100183] = { enemy = thugs_heavy },
	[100288] = { enemy = thugs_heavy },
	[100289] = { enemy = thugs_heavy },
	[100290] = { enemy = thugs_heavy },
	[100187] = { enemy = thugs_heavy },  -- outside the barn door, near cars
	[100184] = { enemy = thugs_heavy },
	[100186] = { enemy = thugs_heavy },
	[100195] = { enemy = thugs_heavy },
	[100192] = { enemy = thugs },  -- other spawns
	[100196] = { enemy = thugs },
	[100188] = { enemy = thugs },
	[100193] = { enemy = thugs },
	[100197] = { enemy = thugs },
	[100190] = { enemy = thugs },
	[100194] = { enemy = thugs },
	[100198] = { enemy = thugs },
	[100191] = { enemy = thugs },
	[100199] = { enemy = thugs },
	[100200] = { enemy = thugs },
	[100207] = { enemy = thugs },
	[100211] = { enemy = thugs },
	[100215] = { enemy = thugs },
	[100219] = { enemy = thugs },
	[100201] = { enemy = thugs },
	[100208] = { enemy = thugs },
	[100212] = { enemy = thugs },
	[100216] = { enemy = thugs },
	[100220] = { enemy = thugs },
	[100203] = { enemy = thugs },
	[100209] = { enemy = thugs },
	[100213] = { enemy = thugs },
	[100217] = { enemy = thugs },
	[100221] = { enemy = thugs },
	[100204] = { enemy = thugs },
	[100210] = { enemy = thugs },
	[100214] = { enemy = thugs },
	[100218] = { enemy = thugs },
	[100222] = { enemy = thugs },

	-- swat van spawns
	[101900] = { enemy = ASS:random_unit("swats") },  -- n
	[101826] = { enemy = ASS:random_unit("swats") },
	[101833] = { enemy = ASS:random_unit("swats") },
	[101908] = { enemy = ASS:random_unit("swats") },
	[101910] = { enemy = ASS:random_unit("swats") },
	[101911] = { enemy = ASS:random_unit("swats") },
	[101926] = { enemy = ASS:random_unit("swats") },
	[101927] = { enemy = ASS:random_unit("swats") },
	[101928] = { enemy = ASS:random_unit("swats") },
	[101892] = { enemy = ASS:random_unit("heavys") },  -- h/vh
	[101893] = { enemy = ASS:random_unit("heavys") },
	[101894] = { enemy = ASS:random_unit("heavys") },
	[101912] = { enemy = ASS:random_unit("heavys") },
	[101913] = { enemy = ASS:random_unit("heavys") },
	[101914] = { enemy = ASS:random_unit("heavys") },
	[101929] = { enemy = ASS:random_unit("heavys") },
	[101930] = { enemy = ASS:random_unit("heavys") },
	[101931] = { enemy = ASS:random_unit("heavys") },
	[101896] = { enemy = ASS:random_unit("specials_any") },  -- ovk+
	[101898] = { enemy = ASS:random_unit("specials_any") },
	[101899] = { enemy = ASS:random_unit("specials_any") },
	[101916] = { enemy = ASS:random_unit("specials_any") },
	[101917] = { enemy = ASS:random_unit("specials_any") },
	[101919] = { enemy = ASS:random_unit("specials_any") },
	[101932] = { enemy = ASS:random_unit("specials_any") },
	[101933] = { enemy = ASS:random_unit("specials_any") },
	[101934] = { enemy = ASS:random_unit("specials_any") },
}
