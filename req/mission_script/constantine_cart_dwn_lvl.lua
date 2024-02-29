return {
	[100000] = {
		on_executed = {
			{ id = 100006, remove = true, },
		},
	},
	[100067] = {
		on_executed = {
			{ id = 100006, delay = 0, },
		},
	},
	[100006] = {
		values = {
			ai_group_type = "constantine_cartel",
		},
		-- func = function()  -- keeps using swat for some reason without this ?
		-- 	tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
		-- end,
	},
}
