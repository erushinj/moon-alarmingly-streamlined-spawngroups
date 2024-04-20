-- cartel transport downtown, https://modworkshop.net/mod/43578
return {
	[100062] = {
		reinforce = {
			{
				name = "mechanic_1",
				force = 2,
				position = Vector3(700, 11700, 50),
			},
			{
				name = "mechanic_2",
				force = 2,
				position = Vector3(700, 9600, 50),
			},
			{
				name = "bus",
				force = 3,
				position = Vector3(5550, 9300, 50),
			},
		},
	},
	[100083] = {
		values = {
			difficulty = 0.5,
		},
		on_executed = {
			{ id = 100084, delay = 75, },  -- 150 normally
		},
	},
	[100084] = {
		values = {
			difficulty = 0.675,  -- 0.75 normally
		},
		on_executed = {
			{ id = 100085, delay = 75, },  -- 60
		},
	},
	[100085] = {
		values = {
			difficulty = 0.85,  -- 0.9 normally
		},
		on_executed = {
			{ id = 100086, delay = 75, },  -- 120, diff 1 element
		},
	},
}
