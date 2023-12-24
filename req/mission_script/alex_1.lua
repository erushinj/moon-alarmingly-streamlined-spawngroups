local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local mexicans = {
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
}

return {
	-- planks amount, normally 2-4 in sh
	[100822] = {
		values = {
			amount = overkill and 0 or 2,
			amount_random = overkill and 6 or 4,
		},
	},
	-- waiter !  waiter !  more gangsters please !
	[101520] = {
		values = {
			amount = overkill and 4 or 2,
			amount_random = 0,
		},
	},
	[101266] = {
		values = {
			amount = overkill and 4 or 2,
			amount_random = 0,
		},
	},
	[101297] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
			amount_random = 0,
		},
	},
	[101010] = {
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	-- a new reenforce spot
	[100941] = {
		reinforce = {
			{
				name = "basement",
				force = 2,
				position = Vector3(2050, 1000, 950),
			},
		},
	},
	[100952] = { enemy = tweak_data.levels:moon_random_unit("dozers_any"), },  -- chopper dozer
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
