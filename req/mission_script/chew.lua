local biker_1 = Idstring("units/payday2/characters/ene_biker_1/ene_biker_1")
local biker_2 = Idstring("units/payday2/characters/ene_biker_2/ene_biker_2")
local biker_3 = Idstring("units/payday2/characters/ene_biker_3/ene_biker_3")
local biker_4 = Idstring("units/payday2/characters/ene_biker_4/ene_biker_4")
local biker_female_1 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1")
local biker_female_2 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2")
local biker_female_3 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3")

local bikers_male = { biker_1, biker_2, biker_3, biker_4 }
local bikers_female = { biker_female_1, biker_female_2, biker_female_3, }

return {
	-- middle wagon
	[101136] = { enemy = bikers_male, },
	[101143] = { enemy = bikers_male, },
	[101144] = { enemy = bikers_male, },
	[101145] = { enemy = bikers_male, },
	[101146] = { enemy = bikers_male, },
	[101147] = { enemy = bikers_male, },
	[101148] = { enemy = bikers_male, },
	[101149] = { enemy = bikers_male, },
	[101150] = { enemy = bikers_male, },
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
