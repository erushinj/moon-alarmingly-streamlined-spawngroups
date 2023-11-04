local normal, hard, overkill = ASS:difficulty_groups()

local security_4 = Idstring("units/payday2/characters/ene_security_4/ene_security_4")
local security_5 = Idstring("units/payday2/characters/ene_security_5/ene_security_5")
local security_6 = Idstring("units/payday2/characters/ene_security_6/ene_security_6")
local security_7 = Idstring("units/payday2/characters/ene_security_7/ene_security_7")
local securitys_light = { security_4, security_5, }
local securitys_medium = { security_5, security_6, }
local securitys_heavy = { security_6, security_7, }

local harassers = tweak_data.levels:moon_random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")

return {
	-- titan cams
	[106265] = {
		values = {
			enabled = false,
		},
	},
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
	[101311] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[100184] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102683] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[105409] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[105410] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[105412] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	-- harassers
	[100883] = { enemy = harassers, },  -- n
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
