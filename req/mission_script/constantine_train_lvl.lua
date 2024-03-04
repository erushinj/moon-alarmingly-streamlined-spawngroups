local cartel_security = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_security_1/ene_cartel_security_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_security_2/ene_cartel_security_2"),
}

return {
	[100021] = {
		reinforce = {
			{
				name = "birds_eye_1",  -- catwalk with line of sight to escape van
				force = 4,  -- 6 cover points, 3 per side
				position = Vector3(-3450, 4100, 600),
			},
			{
				name = "birds_eye_2",
				force = 2,
				position = Vector3(-4750, 7100, 600),
			},
			{
				name = "inside_1",
				force = 3,
				position = Vector3(-6250, 7250, 50),
			},
			{
				name = "inside_2",
				force = 3,
				position = Vector3(-5500, 4000, 50),
			},
			{
				name = "stairs",
				force = 2,
				position = Vector3(-7550, 3800, 450),
			},
		},
	},
	[100125] = {
		values = {
			difficulty = 0.5,
		},
		on_executed = {
			{ id = 100126, delay = 150, },  -- 140 normally
		},
	},
	[100126] = {
		values = {
			difficulty = 0.675,  -- 0.75 normally
		},
		on_executed = {
			{ id = 100127, delay = 150, },  -- 240
		},
	},
	[100127] = {
		-- values = {
		-- 	difficulty = 0.85,  -- 0.85 normally
		-- },
		on_executed = {
			{ id = 100128, delay = 150, },  -- 60, diff 1 element
		},
	},
	[100015] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100040] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100130] = { enemy = cartel_security, },
	[100131] = { enemy = cartel_security, },
	[100132] = { enemy = cartel_security, },
	[100133] = { enemy = cartel_security, },
	[100134] = { enemy = cartel_security, },
	[100135] = { enemy = cartel_security, },
	[100136] = { enemy = cartel_security, },
	[100137] = { enemy = cartel_security, },
	[100138] = { enemy = cartel_security, },
	[100193] = { enemy = cartel_security, },
	[100194] = { enemy = cartel_security, },
	[100195] = { enemy = cartel_security, },
	[100042] = { enemy = cartel_security, },
	[100041] = { enemy = cartel_security, },
	[100043] = { enemy = cartel_security, },
	[100044] = { enemy = cartel_security, },
	[100045] = { enemy = cartel_security, },
}
