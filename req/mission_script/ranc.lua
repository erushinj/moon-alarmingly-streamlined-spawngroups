local securitys = {
	Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"),
	Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"),
}

return {
	[100022] = {  -- alarm
		reinforce = {  -- add all at once so they get populated quickly
			{
				name = "fork",
				force = 5,  -- fuck huge navseg
				position = Vector3(-2015, -145, 200),
			},
			{
				name = "fork_corner1",
				force = 3,
				position = Vector3(-1440, -3970, 200),
			},
			{
				name = "fork_corner2",
				force = 3,
				position = Vector3(-315, 4935, 400),
			},
			{
				name = "main_gate1",
				force = 5,  -- fuck huge navseg
				position = Vector3(5670, 1125, 400),
			},
			{
				name = "main_gate2",
				force = 5,
				position = Vector3(5310, -1090, 400),
			},
			{
				name = "living_room1",
				force = 2,
				position = Vector3(6150, -8040, 450),
			},
			{
				name = "living_room2",
				force = 2,
				position = Vector3(6285, -5265, 450),
			},
			{
				name = "outside_garage",
				force = 2,
				position = Vector3(7875, -9315, 400),
			},
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(2985, -7040, 400),  -- go bank car near some un-enterable sheds
			},
			{
				name = "barn1",
				force = 2,
				position = Vector3(6755, 5320, 400),  -- exit by shooting range
			},
			{
				name = "barn2",
				force = 2,
				position = Vector3(4285, 5215, 400),  -- exit by stealth secure point
			},
			{
				name = "workshop_a",  -- labelled in editor
				force = 3,
				position = Vector3(3070, 2890, 400),
			},
			{
				name = "workshop_c",  -- labelled in editor
				force = 3,
				position = Vector3(9215, 1625, 450),
			},
		},
	},
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
