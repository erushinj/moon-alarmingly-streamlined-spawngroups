local securitys = tweak_data.levels:moon_units("securitys")
local cops = tweak_data.levels:moon_units("cops")

return {
	[103342] = {  -- allow one more sniper
		values = {
			amount = 1,
			amount_random = 1,
		},
	},
	[103344] = {  -- enable unused sniper spawns (vantage point roof, but, vanilla san martin)
		values = {
			enabled = true,
		},
	},
	[103347] = {
		values = {
			enabled = true,
		},
	},
	[102179] = { enemy = securitys, },  -- guards
	[103486] = { enemy = securitys, },
	[103489] = { enemy = securitys, },
	[103490] = { enemy = securitys, },
	[103491] = { enemy = securitys, },
	[102120] = { enemy = securitys, },
	[102151] = { enemy = securitys, },
	[102737] = { enemy = securitys, },
	[102739] = { enemy = securitys, },
	[102736] = { enemy = securitys, },
	[102736] = { enemy = securitys, },
	[100792] = { enemy = securitys, },
	[102738] = { enemy = securitys, },
	[102048] = { enemy = cops, },  -- beat cop swarm
	[102046] = { enemy = cops, },
	[102308] = { enemy = cops, },
	[104183] = { enemy = cops, },
	[104184] = { enemy = cops, },
	[104186] = { enemy = cops, },
	[102311] = { enemy = cops, },
	[102536] = { enemy = cops, },
	[102537] = { enemy = cops, },
	[102538] = { enemy = cops, },
	[102539] = { enemy = cops, },
	[102298] = { enemy = cops, },
	[102316] = { enemy = cops, },
	[104179] = { enemy = cops, },
	[104180] = { enemy = cops, },
	[104181] = { enemy = cops, },
	[104182] = { enemy = cops, },
	[104183] = { enemy = cops, },
	[104184] = { enemy = cops, },
	[104185] = { enemy = cops, },
	[104186] = { enemy = cops, },
	[104187] = { enemy = cops, },
	[104188] = { enemy = cops, },
	[104189] = { enemy = cops, },
	[104190] = { enemy = cops, },
}
