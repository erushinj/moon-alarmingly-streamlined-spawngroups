local triads = {
	Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"),
	Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"),
	Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"),
	Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"),
	Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"),
}
local securitys_light = tweak_data.levels:moon_units("securitys_light")

-- no security 3. yay.
return {
	[102717] = { enemy = triads, },  -- triads, near auction room
	[103035] = { enemy = triads, },
	[102741] = { enemy = triads, },  -- in auction room
	[102744] = { enemy = triads, },
	[102738] = { enemy = triads, },  -- conversation havers
	[102718] = { enemy = triads, },
	[102736] = { enemy = triads, },
	[102719] = { enemy = triads, },
	[102331] = { enemy = triads, },  -- backup
	[102332] = { enemy = triads, },
	[102339] = { enemy = triads, },
	[102340] = { enemy = triads, },
	[103224] = { enemy = triads, },
	[103233] = { enemy = triads, },
	[101089] = { enemy = securitys_light, },  -- guards, alleyway
	[101098] = { enemy = securitys_light, },
	[102132] = { enemy = securitys_light, },  -- storefront
	[102149] = { enemy = securitys_light, },
	[100672] = { enemy = securitys_light, },  -- near "auction room" on dev plane
	[100673] = { enemy = securitys_light, },
	[100674] = { enemy = securitys_light, },
	[100670] = { enemy = securitys_light, },  -- auction room
	[100671] = { enemy = securitys_light, },
	[100677] = { enemy = securitys_light, },  -- warehouse
	[100678] = { enemy = securitys_light, },
	[102267] = { enemy = securitys_light, },
	[102265] = { enemy = securitys_light, },
	[102263] = { enemy = securitys_light, },
	[100679] = { enemy = securitys_light, },
	[100676] = { enemy = securitys_light, },
}
