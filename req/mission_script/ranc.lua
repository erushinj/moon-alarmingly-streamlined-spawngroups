local securitys = {
	Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"),
	Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"),
}

-- want to add reenforce but for some godforsaken reason, nearly every spot i wanted caused enemies to get stuck
-- not doing anything any differently from other heists
-- the fuck is going on ?
return {
	[100670] = { enemy = securitys, },
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[101799] = { enemy = securitys, },
	[102830] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
}
