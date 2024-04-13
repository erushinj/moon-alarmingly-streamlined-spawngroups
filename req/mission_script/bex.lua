local policia = {
	Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
	Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
}
local securitys = {
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"),
}
local suits = {
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"),
}
local disable = {
	values = {
		enabled = false,
	},
}
local reenforce_office_1 = {
	name = "office1",
	force = 2,
	position = Vector3(700, -6000, 0),
}
local reenforce_office_2 = {
	name = "office2",
	force = 2,
	position = Vector3(-700, -6000, 0),
}
local reenforce_office_3 = {
	name = "office3",
	force = 2,
	position = Vector3(1150, -4400, 0),
}

return {
	[101835] = disable,  -- point area min police force 2
	[102369] = disable,  -- cheat spawns, replaced with reenforce, toggle cheat spawns on
	[102355] = disable,  -- "extra preferreds 00X"
	[102363] = disable,
	[100007] = disable,
	[102388] = disable,
	[102847] = disable,
	[100020] = disable,
	[100198] = disable,
	[100109] = {  -- police, executed on alarm
		reinforce = {
			{
				name = "front",
				force = 2,
				position = Vector3(0, -600, 0),
			},
			{
				name = "side_entrance",
				force = 2,
				position = Vector3(-2250, -2350, 0),
			},
		},
	},
	[102311] = {  -- func sequence trigger 003
		reinforce = {
			{
				name = "backdoor",  -- lockpick door by the mechanic shop
				force = 2,
				position = Vector3(1750, -2100, 0),
			},
		},
	},
	[102541] = {  -- link activate navlinks roof
		on_executed = {
			{ id = 101618, remove = true, },  -- why does this spawn a guard ?
		},
		reinforce = {
			{
				name = "roof1",
				force = 2,
				position = Vector3(0, -1000, 850),
			},
			{
				name = "roof2",
				force = 2,
				position = Vector3(0, -4000, 850),
			},
		},
	},
	[103692] = {  -- break wall
		reinforce = {
			{
				name = "back_turret",
				force = 2,
				position = Vector3(-1700, -5650, 0),
			},
		},
	},
	[101758] = {  -- add reenforce to office rooms at start, server room point 1
		reinforce = {
			reenforce_office_1,
			reenforce_office_2,
		},
	},
	[101013] = {  -- server room point 2
		reinforce = {
			reenforce_office_2,
			reenforce_office_3,
		},
	},
	[101886] = {  -- server room point 3 (same room as 1)
		reinforce = {
			reenforce_office_1,
			reenforce_office_2,
		},
	},
	[101022] = {  -- server room point 4
		reinforce = {
			reenforce_office_1,
			reenforce_office_3,
		},
	},
	[101801] = {  -- hacking completed - server room is fair game for reenforce
		reinforce = {
			reenforce_office_1,
			reenforce_office_2,
			reenforce_office_3,
		},
	},
	[104687] = { enemy = securitys, },  -- pre-spawned policia
	[104688] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[104689] = { enemy = securitys, },  -- securitys
	[100670] = { enemy = securitys, },
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
	[100678] = { enemy = securitys, },
	[100679] = { enemy = securitys, },
	[101570] = { enemy = securitys, },
	[101571] = { enemy = securitys, },
	[101574] = { enemy = securitys, },
	[101507] = { enemy = securitys, },
	[101508] = { enemy = securitys, },
	[101618] = { enemy = suits, },
	[103084] = { enemy = suits, },
	[103087] = { enemy = suits, },
	[101579] = { enemy = suits, },  -- suits
	[101587] = { enemy = suits, },
	[101599] = { enemy = suits, },
	[101625] = { enemy = suits, },
	[103092] = { enemy = suits, },
	[103103] = { enemy = suits, },
}
