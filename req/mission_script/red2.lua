return {
	-- escape office dozers
	[103603] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },
	[103390] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.LMG) },

	-- escape basement dozers
	[103231] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103198] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103163] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[103162] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },

	-- vault dozers
	[104169] = { enemy = ASS:random_unit("dozers_no_med") },
	[104170] = { enemy = ASS:random_unit("dozers_no_med") },
	[100763] = { enemy = ASS:random_unit("dozers_no_med") },

	-- other vault dozers, now other units (reduced dozer spam)
	[104131] = { enemy = ASS:random_unit("specials_agg") },
	[104132] = { enemy = ASS:random_unit("specials_agg") },

	-- after vault heavies (low difficulties only ?)
	[104319] = { enemy = ASS:random_unit("swats") },
	[104330] = { enemy = ASS:random_unit("swats") },
	[100570] = { enemy = ASS:random_unit("swats") },
	[103704] = { enemy = ASS:random_unit("swats") },
	[105108] = { enemy = ASS:random_unit("swats") },
	[105110] = { enemy = ASS:random_unit("swats") },

	-- after vault tasers
	[104317] = { enemy = ASS:random_unit("specials_any") },
	[104318] = { enemy = ASS:random_unit("specials_any") },

	-- vault guards
	[102286] = { enemy = ASS:random_unit("securitys_heavy") },
	[102288] = { enemy = ASS:random_unit("securitys_heavy") },
	[102289] = { enemy = ASS:random_unit("securitys_heavy") },
	[102291] = { enemy = ASS:random_unit("securitys_heavy") },
	[102299] = { enemy = ASS:random_unit("securitys_heavy") },
	[102810] = { enemy = ASS:random_unit("securitys_heavy") },
	[102837] = { enemy = ASS:random_unit("securitys_heavy") },
	[102881] = { enemy = ASS:random_unit("securitys_heavy") },
	[104001] = { enemy = ASS:random_unit("cops") },  -- vault cop

	-- office cops
	[106586] = { enemy = ASS:random_unit("cops_heavy") },
	[106586] = { enemy = ASS:random_unit("cops_heavy") },

	-- office fbis
	[100686] = { enemy = ASS:random_unit("fbis_field") },
	[100687] = { enemy = ASS:random_unit("fbis_field") },
	[103609] = { enemy = ASS:random_unit("fbis_field") },

	-- patrolling guards outside vault
	[100863] = { enemy = ASS:random_unit("securitys") },
	[100753] = { enemy = ASS:random_unit("securitys") },
	[102045] = { enemy = ASS:random_unit("securitys") },
	[102054] = { enemy = ASS:random_unit("securitys") },
	[100743] = { enemy = ASS:random_unit("securitys") },
	[102053] = { enemy = ASS:random_unit("securitys") },
	[100672] = { enemy = ASS:random_unit("securitys") },
	[102058] = { enemy = ASS:random_unit("securitys") },
	[100628] = { enemy = ASS:random_unit("securitys") },

	-- stationary guards
	[100614] = { enemy = ASS:random_unit("securitys_heavy") },
	[100646] = { enemy = ASS:random_unit("securitys_heavy") },
	[100661] = { enemy = ASS:random_unit("securitys_heavy") },
	[100663] = { enemy = ASS:random_unit("securitys_heavy") },
	[100787] = { enemy = ASS:random_unit("securitys_heavy") },
	[100671] = { enemy = ASS:random_unit("securitys_heavy") },
	[100920] = { enemy = ASS:random_unit("securitys_heavy") },
	[100872] = { enemy = ASS:random_unit("securitys_heavy") },
	[102059] = { enemy = ASS:random_unit("securitys_heavy") },
	[102046] = { enemy = ASS:random_unit("securitys_heavy") },
	[100752] = { enemy = ASS:random_unit("securitys_heavy") },
	[100694] = { enemy = ASS:random_unit("securitys_heavy") },
	[105493] = { enemy = ASS:random_unit("securitys_heavy") },
	[105494] = { enemy = ASS:random_unit("securitys_heavy") },
	[105383] = { enemy = ASS:random_unit("securitys_heavy") },

	-- management office window swats
	[102501] = { enemy = ASS:random_unit("swats") },
	[102974] = { enemy = ASS:random_unit("swats") },
	[101705] = { enemy = ASS:random_unit("swats") },
	[101616] = { enemy = ASS:random_unit("swats") },

	-- one-time cops, outside
	[103536] = { enemy = ASS:random_unit("cops") },
	[103670] = { enemy = ASS:random_unit("cops") },
	[106853] = { enemy = ASS:random_unit("cops") },
	[106854] = { enemy = ASS:random_unit("cops") },
	[106857] = { enemy = ASS:random_unit("cops") },
	[106865] = { enemy = ASS:random_unit("cops") },
	[106877] = { enemy = ASS:random_unit("cops") },
	[106878] = { enemy = ASS:random_unit("cops") },
	[106879] = { enemy = ASS:random_unit("cops") },
	[106880] = { enemy = ASS:random_unit("cops") },

	-- TODO: check that these are actually scripted spawns
	[106891] = { enemy = ASS:random_unit("swats") },
	[106892] = { enemy = ASS:random_unit("swats") },
	[103397] = { enemy = ASS:random_unit("swats") },
	[106893] = { enemy = ASS:random_unit("swats") },
	[106894] = { enemy = ASS:random_unit("swats") },
}
