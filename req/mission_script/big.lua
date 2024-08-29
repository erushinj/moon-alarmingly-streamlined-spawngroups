local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local securitys = {
	Idstring("units/payday2/characters/ene_security_4/ene_security_4"),
	Idstring("units/payday2/characters/ene_security_5/ene_security_5"),
	Idstring("units/payday2/characters/ene_security_6/ene_security_6"),
	Idstring("units/payday2/characters/ene_security_7/ene_security_7"),
}
local harassers = tweak_data.moon.units[normal and "swats" or hard and "swats_heavys" or "marshals_far"]
local cops = tweak_data.moon.units.cops

return {
	[100670] = { enemy = securitys },  -- guards, lobby area
	[100671] = { enemy = securitys },
	[103143] = { enemy = securitys },  -- kitchen
	[100672] = { enemy = securitys },  -- upstairs
	[100673] = { enemy = securitys },
	[100674] = { enemy = securitys },
	[100675] = { enemy = securitys },
	[106566] = { enemy = securitys },  -- elevator
	[106567] = { enemy = securitys },
	[101406] = { enemy = securitys },  -- vault area
	[101402] = { enemy = securitys },
	[105303] = { enemy = securitys },
	[101401] = { enemy = securitys },
	[101403] = { enemy = securitys },
	[101404] = { enemy = securitys },
	[101405] = { enemy = securitys },
	[101311] = { enemy = cops, },  -- recurring street cops
	[100184] = { enemy = cops, },
	[102683] = { enemy = cops, },
	[105409] = { enemy = cops, },
	[105410] = { enemy = cops, },
	[105412] = { enemy = cops, },
	[100883] = { enemy = harassers, },  -- harassers, n
	[100332] = { enemy = harassers, },
	[100906] = { enemy = harassers, },
	[100922] = { enemy = harassers, },
	[100938] = { enemy = harassers, },
	[100954] = { enemy = harassers, },
	[100969] = { enemy = harassers, },
	[100985] = { enemy = harassers, },
	[101001] = { enemy = harassers, },
	[101017] = { enemy = harassers, },
	[101033] = { enemy = harassers, },
	[101049] = { enemy = harassers, },
	[101065] = { enemy = harassers, },
	[101081] = { enemy = harassers, },
	[101097] = { enemy = harassers, },
	[101113] = { enemy = harassers, },
	[101129] = { enemy = harassers, },
	[101145] = { enemy = harassers, },
	[101161] = { enemy = harassers, },
	[101177] = { enemy = harassers, },
	[100884] = { enemy = harassers, },  -- h/vh
	[100334] = { enemy = harassers, },
	[100907] = { enemy = harassers, },
	[100923] = { enemy = harassers, },
	[100939] = { enemy = harassers, },
	[100955] = { enemy = harassers, },
	[100970] = { enemy = harassers, },
	[100986] = { enemy = harassers, },
	[101002] = { enemy = harassers, },
	[101018] = { enemy = harassers, },
	[101034] = { enemy = harassers, },
	[101050] = { enemy = harassers, },
	[101066] = { enemy = harassers, },
	[101082] = { enemy = harassers, },
	[101098] = { enemy = harassers, },
	[101114] = { enemy = harassers, },
	[101130] = { enemy = harassers, },
	[101146] = { enemy = harassers, },
	[101162] = { enemy = harassers, },
	[101178] = { enemy = harassers, },
	[100885] = { enemy = harassers, },  -- ovk+
	[100336] = { enemy = harassers, },
	[100908] = { enemy = harassers, },
	[100924] = { enemy = harassers, },
	[100940] = { enemy = harassers, },
	[100956] = { enemy = harassers, },
	[100971] = { enemy = harassers, },
	[100987] = { enemy = harassers, },
	[101003] = { enemy = harassers, },
	[101019] = { enemy = harassers, },
	[101035] = { enemy = harassers, },
	[101051] = { enemy = harassers, },
	[101067] = { enemy = harassers, },
	[101083] = { enemy = harassers, },
	[101099] = { enemy = harassers, },
	[101115] = { enemy = harassers, },
	[101131] = { enemy = harassers, },
	[101147] = { enemy = harassers, },
	[101163] = { enemy = harassers, },
	[101179] = { enemy = harassers, },
}
