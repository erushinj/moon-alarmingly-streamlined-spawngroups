return {
	[103683] = {  -- cams, no titan
		values = {
			enabled = false,
		},
	},
	[101112] = {  -- spawn points, spawn 1
		on_executed = {
			{ id = 103242, delay = 0, },
		},
	},
	[101113] = {  -- spawn 2
		on_executed = {
			{ id = 103242, delay = 0, },
		},
		values = {
			enabled = true,
		},
	},
	[101115] = {  -- spawn 4
		on_executed = {
			{ id = 103242, delay = 0, },
		},
		values = {
			enabled = true,
		},
	},
	[103240] = {  -- open the door if you spawn at spawn 3, not based on difficulty
		on_executed = {
			{ id = 103242, remove = true, },
		},
	},
}
