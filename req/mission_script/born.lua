local biker_1 = Idstring("units/payday2/characters/ene_biker_1/ene_biker_1")
local biker_2 = Idstring("units/payday2/characters/ene_biker_2/ene_biker_2")
local biker_3 = Idstring("units/payday2/characters/ene_biker_3/ene_biker_3")
local biker_4 = Idstring("units/payday2/characters/ene_biker_4/ene_biker_4")
local biker_female_1 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1")
local biker_female_2 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2")
local biker_female_3 = Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3")

-- biker 4 is the guy punching the mechanic
local bikers_any = { biker_1, biker_2, biker_3, biker_female_1, biker_female_2, biker_female_3, }

-- no idea how to touch instances like the harasser spawns seem to be
return {
	[100024] = { enemy = { biker_3, biker_female_3, } },  -- "bartender"
	[100026] = { enemy = bikers_any },
	[100027] = { enemy = bikers_any },
	[100028] = { enemy = bikers_any },
	[100052] = { enemy = bikers_any },
	[100053] = { enemy = bikers_any },
	[100073] = { enemy = bikers_any },
	[100074] = { enemy = bikers_any },
	[100438] = { enemy = bikers_any },
	[101419] = { enemy = bikers_any },
	[100526] = { enemy = bikers_any },
	[100527] = { enemy = bikers_any },
	[102423] = { enemy = bikers_any },
	[102432] = { enemy = bikers_any },
	[102448] = { enemy = bikers_any },
	[102451] = { enemy = bikers_any },
	[102453] = { enemy = bikers_any },
	[100081] = { enemy = bikers_any },
	[102485] = { enemy = bikers_any },
	[101851] = { enemy = bikers_any },
	[101854] = { enemy = bikers_any },
	[101856] = { enemy = bikers_any },
	[101857] = { enemy = bikers_any },
	[101420] = { enemy = bikers_any },
	[101421] = { enemy = bikers_any },
	[100394] = { enemy = bikers_any },
	[100413] = { enemy = bikers_any },
	[101099] = { enemy = bikers_any },
	[101117] = { enemy = bikers_any },
	[100254] = { enemy = bikers_any },
	[100295] = { enemy = bikers_any },
	[100301] = { enemy = bikers_any },
	[100302] = { enemy = bikers_any },
	[100303] = { enemy = bikers_any },
	[100357] = { enemy = bikers_any },
	[100372] = { enemy = bikers_any },
	[100373] = { enemy = bikers_any },
	[100374] = { enemy = bikers_any },
	[100384] = { enemy = bikers_any },
	[100149] = { enemy = bikers_any },
	[100524] = { enemy = bikers_any },
	[100525] = { enemy = bikers_any },
	[100151] = { enemy = bikers_any },
	[100153] = { enemy = bikers_any },

	-- van swats
	[100826] = { enemy = ASS:random_unit("heavys") },  -- n/h
	[103257] = { enemy = ASS:random_unit("heavys") },
	[100823] = { enemy = ASS:random_unit("heavys") },  -- vh/ovk
	[100841] = { enemy = ASS:random_unit("heavys") },
	[103258] = { enemy = ASS:random_unit("specials_med") },  -- mh+
	[103259] = { enemy = ASS:random_unit("specials_taser_medic") },

	-- van shields
	[103260] = { enemy = ASS:random_unit("dozers_any") },  -- n/h
	-- [100821] = { enemy = ASS:random_unit("specials_any") },  -- vh+

	-- van dozers
	[103255] = { enemy = ASS:random_unit("dozers_any") },  -- vh/ovk
	[103256] = { enemy = ASS:random_unit("dozers_any") },  -- mh+

	-- heli spawns
	[101810] = { enemy = ASS:random_unit("heavys") },  -- h shield
	[101830] = { enemy = ASS:random_unit("heavys") },  -- h swat heavy
	[101560] = { enemy = ASS:random_unit("dozers_any") },  -- vh r870 dozer
	[100577] = { enemy = ASS:random_unit("dozers_any") },  -- ovk saiga dozer
	[101672] = { enemy = ASS:random_unit("heavys") },  -- vh/ovk fbi swat
	[101814] = { enemy = ASS:random_unit("specials_no_clk") },  -- vh+ shield
	[101740] = { enemy = ASS:random_unit("dozers_any") },  -- mh+ lmg dozer
	[101740] = { enemy = ASS:random_unit("specials_no_clk") },  -- mh+ city swat
}
