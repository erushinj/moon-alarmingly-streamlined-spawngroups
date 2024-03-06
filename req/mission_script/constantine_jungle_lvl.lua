local cartel_rebels = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_1/ene_cartel_rebel_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_2/ene_cartel_rebel_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_3/ene_cartel_rebel_3"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_rebel_4/ene_cartel_rebel_4"),
}

return {
	[100038] = {
		reinforce = {
			{
				name = "welcome_to_the_uhhhhhh_compound",
				force = 3,
				position = Vector3(-1050, 6400, 600),
			},
			{
				name = "boat",
				force = 3,
				position = Vector3(5400, 9750, 600),
			},
			{
				name = "dock_workshop",
				force = 3,
				position = Vector3(3600, 6500, 600),
			},
			{
				name = "main_workshop1",
				force = 3,
				position = Vector3(-2400, 10000, 600),
			},
			{
				name = "main_workshop2",
				force = 3,
				position = Vector3(1650, 12000, 600),
			},
		},
	},
	[100109] = {
		-- values = {
		-- 	difficulty = 0.5,
		-- },
		on_executed = {
			{ id = 100110, delay = 150, },  -- 150 normally
		},
	},
	[100110] = {
		values = {
			difficulty = 0.675,  -- 0.75 normally
		},
		on_executed = {
			{ id = 100111, delay = 150, },  -- 200
		},
	},
	[100111] = {
		values = {
			difficulty = 0.85,  -- 0.8 normally
		},
		on_executed = {
			{ id = 100112, delay = 150, },  -- 120, diff 1 element
		},
	},
	[100045] = { enemy = cartel_rebels, },
	[100046] = { enemy = cartel_rebels, },
	[100047] = { enemy = cartel_rebels, },
	[100048] = { enemy = cartel_rebels, },
	[100049] = { enemy = cartel_rebels, },
	[100050] = { enemy = cartel_rebels, },
	[100051] = { enemy = cartel_rebels, },
	[100052] = { enemy = cartel_rebels, },
	[100053] = { enemy = cartel_rebels, },
	[100054] = { enemy = cartel_rebels, },
	[100055] = { enemy = cartel_rebels, },
	[100056] = { enemy = cartel_rebels, },
	[100057] = { enemy = cartel_rebels, },
	[100058] = { enemy = cartel_rebels, },
	[100059] = { enemy = cartel_rebels, },
	[100137] = { enemy = cartel_rebels, },
	[100138] = { enemy = cartel_rebels, },
	[100139] = { enemy = cartel_rebels, },
	[100140] = { enemy = cartel_rebels, },
	[100243] = { enemy = cartel_rebels, },
	[100069] = { enemy = cartel_rebels, },
	[100067] = { enemy = cartel_rebels, },
	[100075] = { enemy = cartel_rebels, },
	[100063] = { enemy = cartel_rebels, },
	[100066] = { enemy = cartel_rebels, },
	[100070] = { enemy = cartel_rebels, },
	[100074] = { enemy = cartel_rebels, },
	[100116] = { enemy = cartel_rebels, },
	[100117] = { enemy = cartel_rebels, },
	[100118] = { enemy = cartel_rebels, },
	[100119] = { enemy = cartel_rebels, },
	[100120] = { enemy = cartel_rebels, },
	[100124] = { enemy = cartel_rebels, },
	[100126] = { enemy = cartel_rebels, },
}
