return {
	-- disable reenforce in one of the server rooms, the others dont have reenforce, why this one ?
	[101835] = {
		values = {
			enabled = false
		}
	},
	-- cheat spawns, replaced with reenforce
	[102356] = {  -- enemy group 12
		values = {
			enabled = false
		}
	},
	[102365] = {  -- enemy group 13
		values = {
			enabled = false
		}
	},
	[100133] = {  -- enemy group 14
		values = {
			enabled = false
		}
	},
	[102390] = {  -- enemy group 15
		values = {
			enabled = false
		}
	},
	[102848] = {  -- enemy group 16
		values = {
			enabled = false
		}
	},
	[100024] = {  -- enemy group 17
		values = {
			enabled = false
		}
	},
	[100199] = {  -- enemy group 18
		values = {
			enabled = false
		}
	},
	-- this normally activates the out of place server room reenforce
	[101797] = {
		reinforce = {
			{
				name = "cheat_spawns1",  -- enemy group 12 (above tellers)
				force = 1,
				position = Vector3(138, -2225, 400)  -- spawn enemy 50
			},
			{
				name = "cheat_spawns2",  -- enemy group 13 (outside)
				force = 1,
				position = Vector3(-1612, -3874, -0)  -- spawn enemy 56
			},
			{
				name = "cheat_spawns3",  -- enemy group 14 (outside)
				force = 1,
				position = Vector3(-1562, -6722, -0)  -- spawn enemy 58
			},
			{
				name = "cheat_spawns4",  -- enemy group 15 (halls)
				force = 1,
				position = Vector3(1503, -4556, -0)  -- spawn enemy 66
			},
			{
				name = "cheat_spawns5",  -- enemy group 16 (halls)
				force = 1,
				position = Vector3(474, -5613, -0)  -- spawn enemy 74
			},
			{
				name = "cheat_spawns6",  -- enemy group 17 (halls)
				force = 1,
				position = Vector3(985, -3072, 0)  -- spawn enemy 70
			},
			{
				name = "cheat_spawns7",  -- enemy group 18 (halls)
				force = 1,
				position = Vector3(-853, -3125, -0)  -- spawn enemy 83
			},
		}
	},
}
