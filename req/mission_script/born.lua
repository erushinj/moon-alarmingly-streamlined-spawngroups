-- no idea how to touch instances like the harasser spawns seem to be
return {
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
