local hrts_cartel = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
}

return {
	[100021] = {
		reinforce = {
			{
				name = "entrance_1",
				force = 3,
				position = Vector3(800, 700, 50),
			},
			{
				name = "entrance_2",
				force = 3,
				position = Vector3(5200, 1550, 50),
			},
			{
				name = "entrance_3",
				force = 3,
				position = Vector3(3000, -150, 50),
			},
		},
	},
	[100100] = {
		values = {
			difficulty = 0.5,
		},
		on_executed = {
			{ id = 100101, delay = 60, },  -- 120 normally
		},
	},
	[100101] = {
		values = {
			difficulty = 0.675,  -- 0.75 normally
		},
		on_executed = {
			{ id = 100102, delay = 60, },  -- 120
		},
	},
	[100102] = {
		values = {
			difficulty = 0.85,  -- 0.9 normally
		},
		on_executed = {
			{ id = 100103, delay = 60, },  -- 120, diff 1 element
		},
	},
	[100133] = { enemy = hrts_cartel, },
	[100134] = { enemy = hrts_cartel, },
	[100135] = { enemy = hrts_cartel, },
	[100136] = { enemy = hrts_cartel, },
	[100137] = { enemy = hrts_cartel, },
	[100138] = { enemy = hrts_cartel, },
	[100139] = { enemy = hrts_cartel, },
	[100140] = { enemy = hrts_cartel, },
}
