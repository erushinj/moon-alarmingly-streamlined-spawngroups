local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local filters_disable = {
	values = set_difficulty_groups("disable"),
}

local disable = {
	values = {
		enabled = false,
	},
}

return {
	[104393] = filters_disable,  -- disables pool heli below mayhem, why
	[104421] = {  -- reenforce, on lighting flare
		reinforce = {
			{
				name = "pool",
				force = 4,
				position = Vector3(2100, -3000, 0),
			},
		},
	},
	[100006] = {  -- ditto
		reinforce = {
			{
				name = "runway",
				force = 4,
				position = Vector3(-6800, 550, 0),
			},
		},
	},
	[100069] = disable,  -- strange placement
	[101618] = disable,  -- placed on interruptable objectives, because random jams and assault force walking by isnt enough
	[103415] = disable,
	[103421] = disable,
}
