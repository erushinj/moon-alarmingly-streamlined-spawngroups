return {
	-- titan cams
	[103683] = {
		values = {
			enabled = false,
		},
	},
	-- spawn points
	[101112] = {  -- spawn 1
		on_executed = {
			{ id = 103242, },
		},
	},
	[101113] = {  -- spawn 2
		on_executed = {
			{ id = 103242, },
		},
		values = {
			enabled = true,
		},
	},
	[101115] = {  -- spawn 4
		on_executed = {
			{ id = 103242, },
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
