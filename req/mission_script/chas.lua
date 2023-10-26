local triad_1 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1")
local triad_2 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2")
local triad_3 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3")
local triad_4 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4")
local triad_5 = Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5")
local triads = { triad_1, triad_2, triad_3, triad_4, triad_5, }
local triads_light = { triad_1, triad_2, triad_3, triad_4, }
local triads_heavy = { triad_2, triad_3, triad_5, }
local triads_grey = { triad_1, triad_4, }
local triads_red = { triad_2, triad_3, }

-- no security 3. yay.
return {
	-- triads
	[102717] = { enemy = triads_red, },  -- near auction room
	[103035] = { enemy = triads_red, },
	[102741] = { enemy = triads_grey, },  -- in auction room
	[102744] = { enemy = triads_grey, },
	[102738] = { enemy = triads, },  -- conversation havers
	[102718] = { enemy = triads, },
	[102736] = { enemy = triads, },
	[102719] = { enemy = triads, },
	[102331] = { enemy = triads_heavy, },  -- backup
	[102332] = { enemy = triads_heavy, },
	[102339] = { enemy = triads_heavy, },
	[102340] = { enemy = triads_heavy, },
	[103224] = { enemy = triads_heavy, },
	[103233] = { enemy = triads_heavy, },
	-- guards
	[101089] = { enemy = ASS:random_unit("securitys_light"), },  -- alleyway
	[101098] = { enemy = ASS:random_unit("securitys_light"), },
	[102132] = { enemy = ASS:random_unit("securitys_light"), },  -- storefront
	[102149] = { enemy = ASS:random_unit("securitys_light"), },
	[100672] = { enemy = ASS:random_unit("securitys_light"), },  -- near "auction room" on dev plane
	[100673] = { enemy = ASS:random_unit("securitys_light"), },
	[100674] = { enemy = ASS:random_unit("securitys_light"), },
	[100670] = { enemy = ASS:random_unit("securitys_light"), },  -- auction room
	[100671] = { enemy = ASS:random_unit("securitys_light"), },
	[100677] = { enemy = ASS:random_unit("securitys_light"), },  -- warehouse
	[100678] = { enemy = ASS:random_unit("securitys_light"), },
	[102267] = { enemy = ASS:random_unit("securitys_light"), },
	[102265] = { enemy = ASS:random_unit("securitys_light"), },
	[102263] = { enemy = ASS:random_unit("securitys_light"), },
	[100679] = { enemy = ASS:random_unit("securitys_light"), },
	[100676] = { enemy = ASS:random_unit("securitys_light"), },
}
