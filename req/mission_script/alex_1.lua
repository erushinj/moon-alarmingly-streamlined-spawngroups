local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local mexicans = {
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
}
local mexicans_amounts_2_4 = {
	values = {
		amount = normal and 2 or hard and 3 or 4,
	},
}
local mexicans_amounts_1_3 = {
	values = {
		amount = normal and 1 or hard and 2 or 3,
	},
}
local mexicans_amounts_1_5 = {
	values = {
		amount = normal and 1 or hard and 3 or 5,
	},
}

return {
	[100822] = {  -- planks amount, normally 2-4 in sh
		values = {
			amount = overkill and 0 or 2,
			amount_random = overkill and 6 or 4,
		},
	},
	[101520] = mexicans_amounts_2_4,  -- waiter !  waiter !  more gangsters please !
	[101266] = mexicans_amounts_2_4,
	[101297] = mexicans_amounts_1_3,
	[101010] = mexicans_amounts_1_5,
	[100941] = {  -- a new reenforce point
		reinforce = {
			{
				name = "basement",
				force = 2,
				position = Vector3(2050, 1000, 950),
			},
		},
	},
	[100952] = { enemy = tweak_data.moon.units.dozers_any, },  -- chopper dozer
	[101525] = { enemy = mexicans, },  -- gangsters
	[101527] = { enemy = mexicans, },
	[100825] = { enemy = mexicans, },
	[100826] = { enemy = mexicans, },
	[101529] = { enemy = mexicans, },
	[101530] = { enemy = mexicans, },
	[101531] = { enemy = mexicans, },
	[101294] = { enemy = mexicans, },
	[101284] = { enemy = mexicans, },
	[101286] = { enemy = mexicans, },
	[100417] = { enemy = mexicans, },
	[100420] = { enemy = mexicans, },
	[101060] = { enemy = mexicans, },
	[101061] = { enemy = mexicans, },
	[101293] = { enemy = mexicans, },
	[101288] = { enemy = mexicans, },
	[100426] = { enemy = mexicans, },
	[100431] = { enemy = mexicans, },
	[101262] = { enemy = mexicans, },
	[101263] = { enemy = mexicans, },
}
