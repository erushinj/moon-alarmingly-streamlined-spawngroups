local normal, hard, overkill = ASS:difficulty_groups()
local cruise_triads = {
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"),
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"),
	Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"),
}
local cruise_securitys = {
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"),
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"),
	Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"),
}

return {
	-- reenforce points
	[103167] = {  -- casino back end
		values = {
			amount = 2,
		},
	},
	[103168] = {  -- vault
		values = {
			amount = 2,
		},
	},
	[103169] = {  -- courtyard
		values = {
			enabled = false,
		},
	},
	[103170] = { -- spa
		values = {
			enabled = false,
		},
	},
	[103172] = {  -- helipad
		values = {
			enabled = false,
		},
	},
	[100022] = {  -- alarm
		reinforce = {
			{
				name = "courtyard",
				force = 3,
				position = Vector3(-9300, 7150, 0),
			},
			{
				name = "corridor1",
				force = 2,
				position = Vector3(-10950, 6800, 0),
			},
			{
				name = "corridor2",
				force = 2,
				position = Vector3(-7600, 6800, 0),
			},
			{
				name = "casino",
				force = 4,
				position = Vector3(-9200, 2600, 150),
			},
			{
				name = "elevator1",
				force = 2,
				position = Vector3(-9250, 9800, 0),
			},
			{
				name = "elevator2",
				force = 2,
				position = Vector3(-9300, 9800, 400),
			},
			{
				name = "spa",
				force = 3,
				position = Vector3(-9300, 11700, 400),
			},
			{
				name = "spa_balcony1",
				force = 2,
				position = Vector3(-8000, 14600, 400),
			},
			{
				name = "spa_balcony2",
				force = 2,
				position = Vector3(-11000, 14600, 400),
			},
		},
	},
	-- escape reenforce/harasser stuff
	[100918] = {
		on_executed = {
			{ id = 100890, remove = true, },
		},
	},
	[101449] = {  -- escape signalled (it's payday)
		on_executed = {
			{ id = 100890, },
		},
		reinforce = {
			{ name = "spa", },
			{ name = "casino", },
			{ name = "spa_balcony1", },
			{ name = "spa_balcony2", },
			{
				name = "helipad",
				force = 5,
				position = Vector3(-9300, 17000, 100),
			},
			{
				name = "spa_outside1",
				force = 5,
				position = Vector3(-7500, 15500, 0),
			},
			{
				name = "spa_outside2",
				force = 5,
				position = Vector3(-11000, 15500, 0),
			},
		},
	},
	[102623] = {  -- alternate escape, when doing heist panic room-style
		reinforce = {
			{ name = "spa", },
			{ name = "casino", },
			{ name = "spa_balcony1", },
			{ name = "spa_balcony2", },
			{
				name = "by_sec_room",
				force = 6,
				position = Vector3(-11000, 9700, 0),
			},
			{
				name = "by_sec_room_stairs",
				force = 4,
				position = Vector3(-10450, 10350, 150),
			},
		},
	},
	-- guards amount
	[101945] = {  -- casino 1
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101946] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101947] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101915] = {  -- casino 2
		values = {
			difficulty_overkill = true,
			enabled = false,
		},
	},
	[101952] = {
		values = {
			amount = 0,
		},
	},
	[101916] = {
		values = {
			difficulty_overkill = false,
			difficulty_easy_wish = true,
		},
	},
	[101953] = {
		values = {
			amount = 1,
		},
	},
	[101917] = {
		values = {
			difficulty_easy_wish = false,
		},
	},
	[101954] = {
		values = {
			amount = 2,
		},
	},
	[101925] = {  -- cabin corridor 1
		values = {
			enabled = hard and true or false,
		},
	},
	[102068] = {
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[101928] = {  -- cabin corridor 2
		values = {
			enabled = hard and true or false,
		},
	},
	[101930] = {
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102069] = {  -- inner courtyard
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102070] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102071] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[101935] = {  -- lobby
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102072] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[103018] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102073] = {  -- spa
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102074] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102075] = {
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
	},
	[102076] = {  -- helipad
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102077] = {
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102076] = {  -- crew corridor
		values = {
			enabled = hard and true or false,
		},
	},
	-- titan cams
	[100303] = {
		values = {
			enabled = false,
		},
	},
	-- cameras amount
	[100033] = {  -- casino
		values = {
			amount = normal and 4 or hard and 6 or 8,
			amount_random = 0,
		},
	},
	[102348] = {
		values = {
			amount = normal and 4 or hard and 6 or 8,
			amount_random = 0,
		},
	},
	[102349] = {
		values = {
			amount = normal and 4 or hard and 6 or 8,
			amount_random = 0,
		},
	},
	[102375] = {  -- crew
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102376] = {
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102354] = {  -- hall
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102355] = {
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102356] = {
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102364] = {  -- lobby
		on_executed = {
			{ id = 100296, remove = true, },
		},
	},
	[102365] = {
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	[102366] = {
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	[102367] = {
		on_executed = {
			{ id = 100296, },
		},
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	[103014] = {  -- reception
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[103015] = {
		values = {
			amount = overkill and 2 or 1,
			amount_random = 0,
		},
	},
	[102372] = {  -- spa
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	[102373] = {
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	[102374] = {
		values = {
			amount = normal and 1 or hard and 3 or 5,
			amount_random = 0,
		},
	},
	-- enemies
	[101949] = { enemy = cruise_securitys },  -- guards
	[101951] = { enemy = cruise_securitys },
	[101956] = { enemy = cruise_securitys },
	[101957] = { enemy = cruise_securitys },
	[101920] = { enemy = cruise_securitys },
	[101943] = { enemy = cruise_securitys },
	[101944] = { enemy = cruise_securitys },
	[102079] = { enemy = cruise_securitys },
	[101958] = { enemy = cruise_securitys },
	[102101] = { enemy = cruise_securitys },
	[102102] = { enemy = cruise_securitys },
	[102104] = { enemy = cruise_securitys },
	[102105] = { enemy = cruise_securitys },
	[102109] = { enemy = cruise_securitys },
	[102111] = { enemy = cruise_securitys },
	[103509] = { enemy = cruise_securitys },
	[102147] = { enemy = cruise_securitys },
	[101534] = { enemy = cruise_securitys },
	[101535] = { enemy = cruise_securitys },
	[101793] = { enemy = cruise_securitys },
	[101796] = { enemy = cruise_securitys },
	[101950] = { enemy = cruise_triads },  -- triads
	[102082] = { enemy = cruise_triads },
	[102078] = { enemy = cruise_triads },
	[102080] = { enemy = cruise_triads },
	[102081] = { enemy = cruise_triads },
	[102103] = { enemy = cruise_triads },
	[102106] = { enemy = cruise_triads },
	[102110] = { enemy = cruise_triads },
	[102148] = { enemy = cruise_triads },
	[101794] = { enemy = cruise_triads },
	[101795] = { enemy = cruise_triads },
	[103016] = { enemy = cruise_triads },
	[101802] = { enemy = cruise_triads },
}
