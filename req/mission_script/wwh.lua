local units = ASS:base_units()

local difficulty_dozer_mini = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI)
local cloaker = units.cloaker
local shield_replacement_spot_right = math.random(1, 4)
local shield_replacement_spot_left = math.random(1, 4)

return {
	-- starting dozers
	-- right side dozers
	[100496] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100493] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100498] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100499] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100492] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100494] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100495] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100497] = { enemy = ASS:random_unit("dozers_no_cs") },

	-- left side dozers
	[100500] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100501] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100502] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100503] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100488] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100489] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100490] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100491] = { enemy = ASS:random_unit("dozers_no_cs") },

	-- hidden dozers
	[100351] = { enemy = difficulty_dozer_mini },
	[100427] = { enemy = difficulty_dozer_mini },
	[100428] = { enemy = difficulty_dozer_mini },
	[100429] = { enemy = difficulty_dozer_mini },
	[100430] = { enemy = difficulty_dozer_mini },
	[100431] = { enemy = difficulty_dozer_mini },
	[100432] = { enemy = difficulty_dozer_mini },
	[100433] = { enemy = difficulty_dozer_mini },

	-- right side, right-most shield (intro shield 5, 13, 17, 25)
	[100452] = { enemy = shield_replacement_spot_right == 1 and cloaker },
	[100460] = { enemy = shield_replacement_spot_right == 1 and cloaker },
	[100464] = { enemy = shield_replacement_spot_right == 1 and cloaker },
	[100472] = { enemy = shield_replacement_spot_right == 1 and cloaker },

	-- right side, second from right-most shield (intro shield 6, 14, 18, 26)
	[100453] = { enemy = shield_replacement_spot_right == 2 and cloaker },
	[100461] = { enemy = shield_replacement_spot_right == 2 and cloaker },
	[100465] = { enemy = shield_replacement_spot_right == 2 and cloaker },
	[100473] = { enemy = shield_replacement_spot_right == 2 and cloaker },

	-- right side, second from left-most shield (intro shield 7, 15, 19, 27)
	[100454] = { enemy = shield_replacement_spot_right == 3 and cloaker },
	[100462] = { enemy = shield_replacement_spot_right == 3 and cloaker },
	[100466] = { enemy = shield_replacement_spot_right == 3 and cloaker },
	[100474] = { enemy = shield_replacement_spot_right == 3 and cloaker },

	-- right side, left-most shield (intro shield 8, 16, 20, 28)
	[100455] = { enemy = shield_replacement_spot_right == 4 and cloaker },
	[100463] = { enemy = shield_replacement_spot_right == 4 and cloaker },
	[100467] = { enemy = shield_replacement_spot_right == 4 and cloaker },
	[100475] = { enemy = shield_replacement_spot_right == 4 and cloaker },

	-- left side, right-most shield (intro shield 1, 9, 21, 29)
	[100448] = { enemy = shield_replacement_spot_left == 1 and cloaker },
	[100456] = { enemy = shield_replacement_spot_left == 1 and cloaker },
	[100476] = { enemy = shield_replacement_spot_left == 1 and cloaker },
	[100433] = { enemy = shield_replacement_spot_left == 1 and cloaker },

	-- left side, second from right-most shield (intro shield 2, 10, 22, 30)
	[100449] = { enemy = shield_replacement_spot_left == 2 and cloaker },
	[100457] = { enemy = shield_replacement_spot_left == 2 and cloaker },
	[100469] = { enemy = shield_replacement_spot_left == 2 and cloaker },
	[100477] = { enemy = shield_replacement_spot_left == 2 and cloaker },

	-- left side, second from left-most shield (intro shield 3, 11, 23, 31)
	[100450] = { enemy = shield_replacement_spot_left == 3 and cloaker },
	[100458] = { enemy = shield_replacement_spot_left == 3 and cloaker },
	[100470] = { enemy = shield_replacement_spot_left == 3 and cloaker },
	[100478] = { enemy = shield_replacement_spot_left == 3 and cloaker },

	-- left side, left-most shield (intro shield 4, 12, 24, 32)
	[100451] = { enemy = shield_replacement_spot_left == 4 and cloaker },
	[100459] = { enemy = shield_replacement_spot_left == 4 and cloaker },
	[100471] = { enemy = shield_replacement_spot_left == 4 and cloaker },
	[100479] = { enemy = shield_replacement_spot_left == 4 and cloaker },
}
