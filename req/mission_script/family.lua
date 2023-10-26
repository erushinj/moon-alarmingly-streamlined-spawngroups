local normal, hard, overkill = ASS:difficulty_groups()

return {
	-- titan cams
	[102211] = {
		values = {
			enabled = false,
		},
	},
	-- cameras amount
	[100033] = {
		values = {
			amount = normal and 5 or hard and 8 or 11,
			amount_random = 0,
		},
	},
	-- unused sniper spawn
	[100370] = {
		values = {
			enabled = true,
		},
	},
	-- reenforce
	[100324] = {
		values = {
			enabled = false,
		},
	},
	[104843] = {
		reinforce = {
			{ name = "security", },
		},
	},
	[100017] = {
		reinforce = {
			{
				name = "street1",
				force = 2,
				position = Vector3(-750, 450, 0),
			},
			{
				name = "street2",
				force = 2,
				position = Vector3(-1750, 450, 0),
			},
			{
				name = "street3",
				force = 2,
				position = Vector3(-1000, -4000, 0),
			},
			{
				name = "street4",
				force = 2,
				position = Vector3(3000, -4000, 0),
			},
			{
				name = "security",
				force = 3,
				position = Vector3(2200, 1000, 0),
			},
			{
				name = "outside_stairs",
				force = 3,
				position = Vector3(2650, -1350, 450),
			},
			{
				name = "office1",
				force = 2,
				position = Vector3(1000, -1000, 450),
			},
			{
				name = "office2",
				force = 2,
				position = Vector3(2000, -1000, 450),
			},
		},
	},
	-- guards
	[100670] = { enemy = ASS:random_unit("securitys"), },
	[100671] = { enemy = ASS:random_unit("securitys"), },
	[100672] = { enemy = ASS:random_unit("securitys"), },
	[100673] = { enemy = ASS:random_unit("securitys"), },
	[100674] = { enemy = ASS:random_unit("securitys"), },
	[100675] = { enemy = ASS:random_unit("securitys"), },
	[100676] = { enemy = ASS:random_unit("securitys"), },
	[100677] = { enemy = ASS:random_unit("securitys"), },
	[100678] = { enemy = ASS:random_unit("securitys"), },
	[100679] = { enemy = ASS:random_unit("securitys"), },
	[100709] = { enemy = ASS:random_unit("securitys_heavy"), },  -- camera men
	[100710] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100711] = { enemy = ASS:random_unit("securitys_heavy"), },
}
