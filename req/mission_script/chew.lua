local bikers_male = {
	Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"),
	Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"),
	Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"),
	Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"),
}
local bikers_female = {
	Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"),
	Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"),
	Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"),
}

return {
	[100136] = {  -- 0.75 diff from the start on this teeny tiny little train is fucked, actually
		values = {
			difficulty = 0.375,
		},
	},
	-- middle wagon
	[101136] = { enemy = bikers_male, },
	[101143] = { enemy = bikers_male, },
	[101144] = { enemy = bikers_male, },
	[101145] = { enemy = bikers_male, },
	[101146] = { enemy = bikers_female, },
	[101147] = { enemy = bikers_female, },
	[101148] = { enemy = bikers_female, },
	[101149] = { enemy = bikers_male, },
	[101150] = { enemy = bikers_female, },
	[101151] = { enemy = bikers_male, },
	-- last wagon
	[101153] = { enemy = bikers_female, },
	[101158] = { enemy = bikers_female, },
	[101154] = { enemy = bikers_female, },
	[101157] = { enemy = bikers_female, },
	[101156] = { enemy = bikers_female, },
	[101155] = { enemy = bikers_female, },
	[101159] = { enemy = bikers_female, },
	[101160] = { enemy = bikers_female, },
	[101161] = { enemy = bikers_female, },
	[101162] = { enemy = bikers_female, },
}
