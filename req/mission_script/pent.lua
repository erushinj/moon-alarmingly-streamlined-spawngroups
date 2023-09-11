local securitys = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"),
}
local triads = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"),
}


return {
	-- all security replaced with penthouse security + randomization for existing penthouse security
	[100670] = { enemy = securitys },
	[100671] = { enemy = securitys },
	[100672] = { enemy = securitys },
	[100673] = { enemy = securitys },
	[100674] = { enemy = securitys },
	[100675] = { enemy = securitys },
	[100676] = { enemy = securitys },
	[100677] = { enemy = securitys },
	[100678] = { enemy = securitys },
	[100679] = { enemy = securitys },
	[100760] = { enemy = securitys },
	[100772] = { enemy = securitys },
	[100783] = { enemy = securitys },
	[100813] = { enemy = securitys },
	[100840] = { enemy = securitys },
	[100882] = { enemy = securitys },
	[101946] = { enemy = securitys },
	[101947] = { enemy = securitys },
	[101948] = { enemy = securitys },
	[101949] = { enemy = securitys },
	[102464] = { enemy = securitys },

	-- randomize suit triads
	[102729] = { enemy = triads },
	[103582] = { enemy = triads },
	[103593] = { enemy = triads },
	[103592] = { enemy = triads },
	[103596] = { enemy = triads },
	[102284] = { enemy = triads },
	[102285] = { enemy = triads },
	[102286] = { enemy = triads },
	[102287] = { enemy = triads },
	[102288] = { enemy = triads },
	[102289] = { enemy = triads },
	[102337] = { enemy = triads },
	[102338] = { enemy = triads },
	[102339] = { enemy = triads },
	[102340] = { enemy = triads },
	[102341] = { enemy = triads },
	[102343] = { enemy = triads },
	[102344] = { enemy = triads },
	[103591] = { enemy = triads },
	[103590] = { enemy = triads },
}
