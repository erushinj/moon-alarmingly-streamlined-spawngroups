local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local securitys = tweak_data.levels:moon_units("securitys")
local securitys_heavy = tweak_data.levels:moon_units("securitys_heavy")

return {
	[102211] = {  -- cams, no titan
		values = {
			enabled = false,
		},
	},
	[100033] = {  -- amounts
		values = {
			amount = normal and 5 or hard and 8 or 11,
			amount_random = 0,
		},
	},
	[100370] = {  -- unused sniper spawn
		values = {
			enabled = true,
		},
	},
	[100324] = {  -- reenforce
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
	[100670] = { enemy = securitys, },  -- guards
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
	[100678] = { enemy = securitys, },
	[100679] = { enemy = securitys, },
	[100709] = { enemy = securitys_heavy, },  -- camera men
	[100710] = { enemy = securitys_heavy, },
	[100711] = { enemy = securitys_heavy, },
}
