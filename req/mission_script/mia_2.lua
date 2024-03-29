local mobster_1 = Idstring("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1")
local mobster_2 = Idstring("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2")
local mobster_3 = Idstring("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3")
local mobster_4 = Idstring("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4")
local mobsters = { mobster_1, mobster_2, mobster_3, mobster_4, }
local mobsters_light = { mobster_2, mobster_4, }
local mobsters_medium = { mobster_1, mobster_2, }
local mobsters_heavy = { mobster_1, mobster_3, }

return {
	[101407] = { enemy = mobsters },  -- starting mobsters
	[101408] = { enemy = mobsters },
	[101409] = { enemy = mobsters },
	[101410] = { enemy = mobsters },

	[100218] = { enemy = mobsters_light },  -- window mobsters
	[100473] = { enemy = mobsters_light },
	[100899] = { enemy = mobsters_light },
	[100928] = { enemy = mobsters_light },
	[100946] = { enemy = mobsters_light },

	[101474] = { enemy = mobsters_heavy },  -- after c4ing first door mobsters
	[101475] = { enemy = mobsters_heavy },

	[100462] = { enemy = mobsters },  -- second floor, hallway mobsters
	[100467] = { enemy = mobsters },
	[100506] = { enemy = mobsters },
	[101364] = { enemy = mobsters },
	[101365] = { enemy = mobsters },
	[101370] = { enemy = mobsters },
	[101371] = { enemy = mobsters },
	[101372] = { enemy = mobsters },
	[101387] = { enemy = mobsters },
	[100522] = { enemy = mobsters_medium },  -- in rooms
	[100523] = { enemy = mobsters_medium },
	[100524] = { enemy = mobsters_medium },
	[100528] = { enemy = mobsters_medium },
	[100529] = { enemy = mobsters_medium },
	[100531] = { enemy = mobsters_medium },
	[101366] = { enemy = mobsters_medium },
	[100616] = { enemy = mobsters_medium },
	[100701] = { enemy = mobsters_medium },
	[100716] = { enemy = mobsters_medium },
	[101367] = { enemy = mobsters_medium },
	[101368] = { enemy = mobsters_medium },

	[101977] = { enemy = ASS:random_unit("dozers_no_med") },  -- third floor, hallway dozers
	[102018] = { enemy = ASS:random_unit("dozers_no_med") },
	[101968] = { enemy = ASS:random_unit("swats_close") },  -- swats
	[101088] = { enemy = ASS:random_unit("swats_close") },
	[101969] = { enemy = ASS:random_unit("swats_close") },
	[102016] = { enemy = ASS:random_unit("swats_close") },
	[102019] = { enemy = ASS:random_unit("swats_close") },
	[102020] = { enemy = ASS:random_unit("swats_close") },
	[101976] = { enemy = ASS:random_unit("specials_def") },  -- taser/shield groups, taser A1
	[101970] = { enemy = ASS:random_unit("specials_any") },  -- shield A1
	[101971] = { enemy = ASS:random_unit("specials_any") },  -- shield A2
	[102017] = { enemy = ASS:random_unit("specials_def") },  -- taser B1
	[102014] = { enemy = ASS:random_unit("specials_any") },  -- shield B1
	[102015] = { enemy = ASS:random_unit("specials_any") },  -- shield B2

	[100190] = { enemy = mobsters_heavy },  -- penthouse mobsters
	[100191] = { enemy = mobsters_heavy },
	[101496] = { enemy = mobsters_heavy },
	[101497] = { enemy = mobsters_heavy },
	[101505] = { enemy = mobsters_heavy },
	[101506] = { enemy = mobsters_heavy },
	[101133] = { enemy = ASS:random_unit("dozers_any") },  -- dozers
	[101137] = { enemy = ASS:random_unit("dozers_any") },
	[101141] = { enemy = ASS:random_unit("dozers_any") },
	[101151] = { enemy = ASS:random_unit("specials_any") },  -- swats
	[101156] = { enemy = ASS:random_unit("specials_any") },
	[101158] = { enemy = ASS:random_unit("specials_any") },
	[101159] = { enemy = ASS:random_unit("specials_any") },
	[101160] = { enemy = ASS:random_unit("specials_any") },
	[101164] = { enemy = ASS:random_unit("specials_any") },
	[101166] = { enemy = ASS:random_unit("specials_any") },
}
