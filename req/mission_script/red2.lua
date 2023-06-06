local units = ASS:base_units()

return {
	-- escape office dozers
	[103603] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },
	[103390] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },

	-- escape basement dozers
	[103231] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103198] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103163] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103162] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- vault dozer next to the money table
	[104169] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MEDIC) },

	-- vault dozer near the door
	[104170] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },

	-- vault dozer immediately to the right
	[100763] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.SAIGA) },

	-- other vault dozers
	[104131] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.R870) },
	[104132] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.R870) },

	-- medic near taser after vault opening (right side)
	[104319] = { enemy = ASS:is_difficulty_at_least("overkill_145") and units.medic_1 },

	-- medic near heavy (left side)
	[105110] = { enemy = ASS:is_difficulty_at_least("overkill_290") and units.medic_2 },

	-- vault guards that arent security 3
	[102286] = { enemy = units.security_3 },
	[102288] = { enemy = units.security_3 },
	[102289] = { enemy = units.security_3 },
	[102291] = { enemy = units.security_3 },
	[102299] = { enemy = units.security_3 },
	[102810] = { enemy = units.security_3 },
	[102837] = { enemy = units.security_3 },
	[102881] = { enemy = units.security_3 },
	[104001] = { enemy = units.cop_2 },  -- vault cop

	-- lobby/surrounding guards that are security 1 (not all of them)
	[100671] = { enemy = units.security_2 },
	[100787] = { enemy = units.security_2 },

	[102501] = { enemy = units.swat_2 },
	[101616] = { enemy = units.swat_2 },
	[106891] = { enemy = units.swat_2 },

	-- city swat 3 swaps (when gensec units are being used)
	[103644] = { enemy = units.swat_3 },
	[101705] = { enemy = units.swat_3 },
	[102974] = { enemy = units.swat_3 },
	[106893] = { enemy = units.swat_3 },
}
