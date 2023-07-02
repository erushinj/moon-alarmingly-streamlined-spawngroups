local securitys = {
	Idstring("units/payday2/characters/ene_security_4/ene_security_4"),
	Idstring("units/payday2/characters/ene_security_5/ene_security_5"),
	Idstring("units/payday2/characters/ene_security_6/ene_security_6"),
	Idstring("units/payday2/characters/ene_security_7/ene_security_7"),
}
local securitys_light = {
	Idstring("units/payday2/characters/ene_security_4/ene_security_4"),
	Idstring("units/payday2/characters/ene_security_5/ene_security_5"),
}
local securitys_medium = {
	Idstring("units/payday2/characters/ene_security_5/ene_security_5"),
	Idstring("units/payday2/characters/ene_security_6/ene_security_6"),
}
local securitys_heavy = {
	Idstring("units/payday2/characters/ene_security_6/ene_security_6"),
	Idstring("units/payday2/characters/ene_security_7/ene_security_7"),
}

return {
	-- guards
	[100670] = { enemy = securitys_medium },  -- lobby area
	[100671] = { enemy = securitys_medium },
	[103143] = { enemy = securitys_medium },  -- kitchen
	[100672] = { enemy = securitys_light },  -- upstairs
	[100673] = { enemy = securitys_light },
	[100674] = { enemy = securitys_light },
	[100675] = { enemy = securitys_light },
	[106566] = { enemy = securitys_medium },  -- elevator
	[106567] = { enemy = securitys_medium },
	[101406] = { enemy = securitys_heavy },  -- vault area
	[101402] = { enemy = securitys_heavy },
	[105303] = { enemy = securitys_heavy },
	[101401] = { enemy = securitys_heavy },
	[101403] = { enemy = securitys_heavy },
	[101404] = { enemy = securitys_heavy },
	[101405] = { enemy = securitys_heavy },
	[100710] = { enemy = securitys_heavy },  -- vault area surveillance guys
	[100709] = { enemy = securitys_heavy },
	[100711] = { enemy = securitys_heavy },

	-- recurring street cops
	[101311] = { enemy = ASS:random_unit("cops") },
	[100184] = { enemy = ASS:random_unit("cops") },
	[102683] = { enemy = ASS:random_unit("cops") },
	[105409] = { enemy = ASS:random_unit("cops") },
	[105410] = { enemy = ASS:random_unit("cops") },
	[105412] = { enemy = ASS:random_unit("cops") },

	-- harassers
	[100883] = { enemy = ASS:random_unit("swats") },  -- n
	[100332] = { enemy = ASS:random_unit("swats") },
	[100906] = { enemy = ASS:random_unit("swats") },
	[100922] = { enemy = ASS:random_unit("swats") },
	[100938] = { enemy = ASS:random_unit("swats") },
	[100954] = { enemy = ASS:random_unit("swats") },
	[100969] = { enemy = ASS:random_unit("swats") },
	[100985] = { enemy = ASS:random_unit("swats") },
	[101001] = { enemy = ASS:random_unit("swats") },
	[101017] = { enemy = ASS:random_unit("swats") },
	[101033] = { enemy = ASS:random_unit("swats") },
	[101049] = { enemy = ASS:random_unit("swats") },
	[101065] = { enemy = ASS:random_unit("swats") },
	[101081] = { enemy = ASS:random_unit("swats") },
	[101097] = { enemy = ASS:random_unit("swats") },
	[101113] = { enemy = ASS:random_unit("swats") },
	[101129] = { enemy = ASS:random_unit("swats") },
	[101145] = { enemy = ASS:random_unit("swats") },
	[101161] = { enemy = ASS:random_unit("swats") },
	[101177] = { enemy = ASS:random_unit("swats") },
	[100884] = { enemy = ASS:random_unit("swats_heavys") },  -- h/vh
	[100334] = { enemy = ASS:random_unit("swats_heavys") },
	[100907] = { enemy = ASS:random_unit("swats_heavys") },
	[100923] = { enemy = ASS:random_unit("swats_heavys") },
	[100939] = { enemy = ASS:random_unit("swats_heavys") },
	[100955] = { enemy = ASS:random_unit("swats_heavys") },
	[100970] = { enemy = ASS:random_unit("swats_heavys") },
	[100986] = { enemy = ASS:random_unit("swats_heavys") },
	[101002] = { enemy = ASS:random_unit("swats_heavys") },
	[101018] = { enemy = ASS:random_unit("swats_heavys") },
	[101034] = { enemy = ASS:random_unit("swats_heavys") },
	[101050] = { enemy = ASS:random_unit("swats_heavys") },
	[101066] = { enemy = ASS:random_unit("swats_heavys") },
	[101082] = { enemy = ASS:random_unit("swats_heavys") },
	[101098] = { enemy = ASS:random_unit("swats_heavys") },
	[101114] = { enemy = ASS:random_unit("swats_heavys") },
	[101130] = { enemy = ASS:random_unit("swats_heavys") },
	[101146] = { enemy = ASS:random_unit("swats_heavys") },
	[101162] = { enemy = ASS:random_unit("swats_heavys") },
	[101178] = { enemy = ASS:random_unit("swats_heavys") },
	[100885] = { enemy = ASS:random_unit("heavys") },  -- ovk+
	[100336] = { enemy = ASS:random_unit("heavys") },
	[100908] = { enemy = ASS:random_unit("heavys") },
	[100924] = { enemy = ASS:random_unit("heavys") },
	[100940] = { enemy = ASS:random_unit("heavys") },
	[100956] = { enemy = ASS:random_unit("heavys") },
	[100971] = { enemy = ASS:random_unit("heavys") },
	[100987] = { enemy = ASS:random_unit("heavys") },
	[101003] = { enemy = ASS:random_unit("heavys") },
	[101019] = { enemy = ASS:random_unit("heavys") },
	[101035] = { enemy = ASS:random_unit("heavys") },
	[101051] = { enemy = ASS:random_unit("heavys") },
	[101067] = { enemy = ASS:random_unit("heavys") },
	[101083] = { enemy = ASS:random_unit("heavys") },
	[101099] = { enemy = ASS:random_unit("heavys") },
	[101115] = { enemy = ASS:random_unit("heavys") },
	[101131] = { enemy = ASS:random_unit("heavys") },
	[101147] = { enemy = ASS:random_unit("heavys") },
	[101163] = { enemy = ASS:random_unit("heavys") },
	[101179] = { enemy = ASS:random_unit("heavys") },
}
