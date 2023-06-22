local units = ASS:base_units()
local escape_roof_dozer_spot = math.random(1, 4)
local escape_roof_dozer = ASS:random_unit("dozers_any")

return {
	-- rooftop swats
	[103237] = { enemy = ASS:random_unit("swats_far") },
	[103236] = { enemy = ASS:random_unit("swats_far") },
	[103228] = { enemy = ASS:random_unit("swats_far") },
	[103235] = { enemy = ASS:random_unit("swats_far") },
	[102097] = { enemy = ASS:random_unit("swats_far") },
	[103234] = { enemy = ASS:random_unit("swats_far") },
	[103839] = { enemy = ASS:random_unit("swats_far") },
	[103841] = { enemy = ASS:random_unit("swats_far") },
	[103843] = { enemy = ASS:random_unit("swats_far") },
	[103845] = { enemy = ASS:random_unit("swats_far") },
	[103847] = { enemy = ASS:random_unit("swats_far") },
	[103849] = { enemy = ASS:random_unit("swats_far") },

	-- escape rooftop swats
	[102450] = { enemy = ASS:random_unit("swats") },
	[102448] = { enemy = ASS:random_unit("swats") },
	[102446] = { enemy = ASS:random_unit("swats") },
	[102443] = { enemy = ASS:random_unit("swats") },
	[102436] = { enemy = ASS:random_unit("swats") },
	[102437] = { enemy = ASS:random_unit("swats") },
	[102438] = { enemy = ASS:random_unit("swats") },
	[102439] = { enemy = ASS:random_unit("swats") },

	-- gassers
	-- n/h
	[103293] = { enemy = ASS:random_unit("swats") },
	[103294] = { enemy = ASS:random_unit("swats") },

	-- vh/ovk
	[104045] = { enemy = ASS:random_unit("heavys") },
	[104046] = { enemy = ASS:random_unit("heavys") },

	-- mh/dw
	[104047] = { enemy = units.taser },
	[104048] = { enemy = ASS:random_unit("specials_taser_medic") },

	-- ds
	[104049] = { enemy = ASS:random_unit("dozers_any") },
	[104050] = { enemy = ASS:random_unit("dozers_any") },

	-- escape roof dozers
	[102433] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[102434] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- escape roof shields
	[102410] = { enemy = escape_roof_dozer_spot == 1 and escape_roof_dozer },
	[102411] = { enemy = escape_roof_dozer_spot == 2 and escape_roof_dozer },
	[102416] = { enemy = escape_roof_dozer_spot == 3 and escape_roof_dozer },
	[102417] = { enemy = escape_roof_dozer_spot == 4 and escape_roof_dozer },
}
