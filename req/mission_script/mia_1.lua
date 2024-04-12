local mobster_1 = Idstring("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1")
local mobster_2 = Idstring("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2")
local mobster_3 = Idstring("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3")
local mobster_4 = Idstring("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4")
local mobsters = { mobster_1, mobster_2, mobster_3, mobster_4, }
local mobsters_light = { mobster_2, mobster_4, }
local mobsters_medium = { mobster_1, mobster_2, }
local mobsters_heavy = { mobster_1, mobster_3, }

return {
	[106480] = { enemy = mobsters_medium, },  -- mobsters, starting
	[106494] = { enemy = mobsters_medium, },
	[106496] = { enemy = mobsters_medium, },
	[106498] = { enemy = mobsters_medium, },
	[106481] = { enemy = mobsters_medium, },
	[106483] = { enemy = mobsters_medium, },
	[106489] = { enemy = mobsters_medium, },
	[106492] = { enemy = mobsters_medium, },
	[101829] = { enemy = mobsters_light, },
	[101830] = { enemy = mobsters_light, },
	[101832] = { enemy = mobsters_light, },
	[101814] = { enemy = mobsters_light, },
	[101823] = { enemy = mobsters_light, },
	[101826] = { enemy = mobsters_light, },
	[101837] = { enemy = mobsters_light, },
	[101836] = { enemy = mobsters_light, },
	[101833] = { enemy = mobsters_light, },
	[105045] = { enemy = mobsters, },  -- arrives
	[105046] = { enemy = mobsters, },
	[105047] = { enemy = mobsters, },
	[105048] = { enemy = mobsters, },
	[105049] = { enemy = mobsters, },
	[105069] = { enemy = mobsters, },
	[105057] = { enemy = mobsters, },
	[105058] = { enemy = mobsters, },
	[105059] = { enemy = mobsters, },
	[105060] = { enemy = mobsters, },
	[105070] = { enemy = mobsters, },
	[105071] = { enemy = mobsters, },
	[105061] = { enemy = mobsters, },
	[105062] = { enemy = mobsters, },
	[105063] = { enemy = mobsters, },
	[105064] = { enemy = mobsters, },
	[105072] = { enemy = mobsters, },
	[105073] = { enemy = mobsters, },
	[101548] = { enemy = mobsters_heavy, },  -- basement
	[101549] = { enemy = mobsters_heavy, },
	[101550] = { enemy = mobsters_heavy, },
	[101551] = { enemy = mobsters_heavy, },
	[101553] = { enemy = mobsters_heavy, },
	[101554] = { enemy = mobsters_heavy, },
}
