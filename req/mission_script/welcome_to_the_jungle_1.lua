local bikers = {
	Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"),
	Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"),
	Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"),
	Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"),
}
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
}
local weapons_amount = math.random(5, 15)

-- TODO: figure out how to disable useless assets
-- found what seems to be the right elements, but removing them from the on_executed of the corresponding table does jack shit
return {
	-- titan cams
	[101301] = {
		values = {
			enabled = false,
		},
	},
	-- planks amount (vanilla is 7)
	[103021] = {
		values = {
			amount = 4,
			amount_random = 6,
		},
	},
	-- safes hidden
	[100658] = {  -- vanilla is 12
		values = {
			amount = 10,
			amount_random = 2,
		},
	},
	[100691] = {  -- vanilla is 11
		values = {
			amount = 10,
			amount_random = 2,
		},
	},
	-- counter operators used for weapons amount
	[103216] = {
		values = {
			amount = weapons_amount,
		},
	},
	[103218] = {
		values = {
			amount = weapons_amount,
		},
	},
	[103219] = {
		values = {
			amount = weapons_amount,
		},
	},
	[103220] = {
		values = {
			amount = weapons_amount,
		},
	},
	[103221] = {
		values = {
			amount = weapons_amount,
		},
	},
	-- bikers amount (vanilla is 8)
	[101579] = {
		values = {
			amount = math.random(8, 18),
		},
	},
	-- drug deal cobras
	[100422] = { enemy = gangsters },
	[103255] = { enemy = gangsters },
	[103256] = { enemy = gangsters },
	[103257] = { enemy = gangsters },
	-- bikers
	[102068] = { enemy = bikers },
	[102069] = { enemy = bikers },
	[101711] = { enemy = bikers },
	[101712] = { enemy = bikers },
	[101713] = { enemy = bikers },
	[101779] = { enemy = bikers },
	[101765] = { enemy = bikers },
	[101766] = { enemy = bikers },
	[103336] = { enemy = bikers },
	[103337] = { enemy = bikers },
	[103338] = { enemy = bikers },
	[103339] = { enemy = bikers },
	[101714] = { enemy = bikers },
	[101716] = { enemy = bikers },
	[103258] = { enemy = bikers },
	[103260] = { enemy = bikers },
	[103261] = { enemy = bikers },
	[103276] = { enemy = bikers },
	[103277] = { enemy = bikers },
	[103278] = { enemy = bikers },
	[101577] = { enemy = bikers },
	[101596] = { enemy = bikers },
	[101609] = { enemy = bikers },
	[101614] = { enemy = bikers },
	[101619] = { enemy = bikers },
	[100950] = { enemy = bikers },
}
