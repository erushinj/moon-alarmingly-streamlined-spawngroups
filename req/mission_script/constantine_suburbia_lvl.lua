return {
	[100016] = {  -- unit type is set to federales after spawning cartel units normally, not good
		on_executed = {
			{ id = 100084, remove = true, },
			{ id = 100084, delay = 0, },
		},
	},
}
