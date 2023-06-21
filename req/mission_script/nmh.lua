local units = ASS:base_units()
local get_random_units = ASS:get_random_units()
local swats = get_random_units.swats
local swats_close = get_random_units.swats_close

return {
	-- beat cop swarm (they show up after all the swats for some reason, so..make them swats)
	-- very bottom of the stairs
	[103041] = { enemy = ASS:random_unit(swats_close) },
	[103042] = { enemy = ASS:random_unit(swats_close) },
	[103043] = { enemy = ASS:random_unit(swats_close) },
	[103044] = { enemy = ASS:random_unit(swats_close) },

	-- near very bottom
	[103047] = { enemy = ASS:random_unit(swats_close) },
	[103048] = { enemy = ASS:random_unit(swats_close) },
	[103045] = { enemy = ASS:random_unit(swats_close) },
	[103046] = { enemy = ASS:random_unit(swats_close) },

	-- across from teddy saw
	[103054] = { enemy = ASS:random_unit(swats) },
	[103055] = { enemy = ASS:random_unit(swats) },
	[103056] = { enemy = ASS:random_unit(swats) },
	[103057] = { enemy = ASS:random_unit(swats) },

	-- end of long hall
	[103058] = { enemy = ASS:random_unit(swats) },
	[103059] = { enemy = ASS:random_unit(swats) },
	[103060] = { enemy = ASS:random_unit(swats) },
	[103061] = { enemy = ASS:random_unit(swats) },
	[103062] = { enemy = ASS:random_unit(swats) },
	[103063] = { enemy = ASS:random_unit(swats) },
}
