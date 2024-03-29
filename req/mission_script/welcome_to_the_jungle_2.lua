local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local filters_disable = set_difficulty_groups("disable")
local filters_normal_above = set_difficulty_groups("normal_above")

local disable = {
	values = {
		enabled = false,
	},
}
local cams_amount = {
	values = {
		amount = normal and 1 or hard and 2 or 3,
	},
}

return {
	[104393] = disable,  -- cams, no titan
	[102554] = {  -- amount of camera groups to pick
		values = {
			amount = overkill and 2 or 1,
		},
	},
	[102573] = {  -- chance for extra group
		values = {
			chance = normal and 20 or hard and 35 or 50,
		},
	},
	[102542] = cams_amount,  -- amounts
	[102543] = cams_amount,
	[102546] = cams_amount,
	[102550] = {
		values = {
			amount = normal and 3 or hard and 5 or 7,
		},
	},
	[104393] = {  -- disables pool heli below mayhem, why
		values = filters_disable,
	},
	-- [100073] = {
	-- 	reinforce = {
	-- 		{
	-- 			name = "hedge",
	-- 			force = 2,
	-- 			position = Vector3(-1450, -3250, 0),
	-- 		},
	-- 	}
	-- },
	[104421] = {  -- reenforce, on lighting flare
		reinforce = {
			{
				name = "pool",
				force = 4,
				position = Vector3(2100, -3000, 0),
			},
		}
	},
	[104421] = {  -- ditto
		reinforce = {
			{
				name = "runway",
				force = 4,
				position = Vector3(-6800, 550, 0),
			},
		}
	},
	[100069] = disable,  -- strange placement
	[101618] = disable,  -- placed on interruptable objectives, because random jams and assault force walking by isnt enough
	[103415] = disable,
	[103421] = disable,
}
