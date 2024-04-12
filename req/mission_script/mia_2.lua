local mobster_1 = Idstring("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1")
local mobster_2 = Idstring("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2")
local mobster_3 = Idstring("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3")
local mobster_4 = Idstring("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4")
local mobsters = { mobster_1, mobster_2, mobster_3, mobster_4, }
local mobsters_light = { mobster_2, mobster_4, }
local mobsters_medium = { mobster_1, mobster_2, }
local mobsters_heavy = { mobster_1, mobster_3, }

local dozers_no_med = tweak_data.levels:moon_units("dozers_no_med")
local swats_close = tweak_data.levels:moon_units("swats_close")
local specials_def = tweak_data.levels:moon_units("specials_def")
local specials_any = tweak_data.levels:moon_units("specials_any")
local dozers_any = tweak_data.levels:moon_units("dozers_any")

return {
	[101407] = { enemy = mobsters, },  -- starting mobsters
	[101408] = { enemy = mobsters, },
	[101409] = { enemy = mobsters, },
	[101410] = { enemy = mobsters, },
	[100218] = { enemy = mobsters_light, },  -- windows
	[100473] = { enemy = mobsters_light, },
	[100899] = { enemy = mobsters_light, },
	[100928] = { enemy = mobsters_light, },
	[100946] = { enemy = mobsters_light, },
	[101474] = { enemy = mobsters_heavy, },  -- after c4ing first door
	[101475] = { enemy = mobsters_heavy, },
	[100462] = { enemy = mobsters, },  -- second floor hallway
	[100467] = { enemy = mobsters, },
	[100506] = { enemy = mobsters, },
	[101364] = { enemy = mobsters, },
	[101365] = { enemy = mobsters, },
	[101370] = { enemy = mobsters, },
	[101371] = { enemy = mobsters, },
	[101372] = { enemy = mobsters, },
	[101387] = { enemy = mobsters, },
	[100522] = { enemy = mobsters_medium, },  -- in rooms
	[100523] = { enemy = mobsters_medium, },
	[100524] = { enemy = mobsters_medium, },
	[100528] = { enemy = mobsters_medium, },
	[100529] = { enemy = mobsters_medium, },
	[100531] = { enemy = mobsters_medium, },
	[101366] = { enemy = mobsters_medium, },
	[100616] = { enemy = mobsters_medium, },
	[100701] = { enemy = mobsters_medium, },
	[100716] = { enemy = mobsters_medium, },
	[101367] = { enemy = mobsters_medium, },
	[101368] = { enemy = mobsters_medium, },
	[100190] = { enemy = mobsters_heavy, },  -- penthouse
	[100191] = { enemy = mobsters_heavy, },
	[101496] = { enemy = mobsters_heavy, },
	[101497] = { enemy = mobsters_heavy, },
	[101505] = { enemy = mobsters_heavy, },
	[101506] = { enemy = mobsters_heavy, },
	[101977] = { enemy = dozers_no_med, },  -- third floor hallway, dozers
	[102018] = { enemy = dozers_no_med, },
	[101968] = { enemy = swats_close, },  -- swats
	[101088] = { enemy = swats_close, },
	[101969] = { enemy = swats_close, },
	[102016] = { enemy = swats_close, },
	[102019] = { enemy = swats_close, },
	[102020] = { enemy = swats_close, },
	[101976] = { enemy = specials_def, },  -- taser/shield groups, taser A1
	[101970] = { enemy = specials_any, },  -- shield A1
	[101971] = { enemy = specials_any, },  -- shield A2
	[102017] = { enemy = specials_def, },  -- taser B1
	[102014] = { enemy = specials_any, },  -- shield B1
	[102015] = { enemy = specials_any, },  -- shield B2
	[101133] = { enemy = dozers_any, },  -- penthouse, dozers
	[101137] = { enemy = dozers_any, },
	[101141] = { enemy = dozers_any, },
	[101151] = { enemy = specials_any, },  -- swats
	[101156] = { enemy = specials_any, },
	[101158] = { enemy = specials_any, },
	[101159] = { enemy = specials_any, },
	[101160] = { enemy = specials_any, },
	[101164] = { enemy = specials_any, },
	[101166] = { enemy = specials_any, },
}
