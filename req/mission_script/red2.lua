local replace_vault_dozer_1, replace_vault_dozer_2
repeat
	replace_vault_dozer_1, replace_vault_dozer_2 = math.random(1, 5), math.random(1, 5)
until replace_vault_dozer_1 ~= replace_vault_dozer_2

local is_overkill_145 = ASS:get_var("real_difficulty_index") > 4

return {
	-- escape dozers
	[103603] = { enemy = ASS:random_unit("dozers_no_med"), },  -- office
	[103390] = { enemy = ASS:random_unit("dozers_no_med"), },
	[103231] = { enemy = ASS:random_unit("dozers_no_med"), },  -- basement
	[103198] = { enemy = ASS:random_unit("dozers_no_med"), },
	[103163] = { enemy = ASS:random_unit("dozers_no_med"), },
	[103162] = { enemy = ASS:random_unit("dozers_no_med"), },
	-- vault dozers - only 4 are chosen on mh+, so although 2 are meant to be replaced, you might get 3 if youre unlucky and one of the replaced spawns isnt used
	[104169] = { enemy = ASS:random_unit(is_overkill_145 and (replace_vault_dozer_1 == 1 or replace_vault_dozer_2 == 1) and "specials_agg" or "dozers_no_med"), },
	[104170] = { enemy = ASS:random_unit(is_overkill_145 and (replace_vault_dozer_1 == 2 or replace_vault_dozer_2 == 2) and "specials_agg" or "dozers_no_med"), },
	[100763] = { enemy = ASS:random_unit(is_overkill_145 and (replace_vault_dozer_1 == 3 or replace_vault_dozer_2 == 3) and "specials_agg" or "dozers_no_med"), },
	[104131] = { enemy = ASS:random_unit(is_overkill_145 and (replace_vault_dozer_1 == 4 or replace_vault_dozer_2 == 4) and "specials_agg" or "dozers_no_med"), },
	[104132] = { enemy = ASS:random_unit(is_overkill_145 and (replace_vault_dozer_1 == 5 or replace_vault_dozer_2 == 5) and "specials_agg" or "dozers_no_med"), },
	-- after vault
	[104319] = { enemy = ASS:random_unit("swats"), },  -- heavies (low difficulties only ?)
	[104330] = { enemy = ASS:random_unit("swats"), },
	[100570] = { enemy = ASS:random_unit("swats"), },
	[103704] = { enemy = ASS:random_unit("swats"), },
	[105108] = { enemy = ASS:random_unit("swats"), },
	[105110] = { enemy = ASS:random_unit("swats"), },
	[104317] = { enemy = ASS:random_unit("specials_any"), },  -- tasers
	[104318] = { enemy = ASS:random_unit("specials_any"), },
	-- vault area guards
	[102286] = { enemy = ASS:random_unit("securitys_heavy"), },  -- security
	[102288] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102289] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102291] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102299] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102810] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102837] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102881] = { enemy = ASS:random_unit("securitys_heavy"), },
	[104001] = { enemy = ASS:random_unit("cops"), },  -- cop inside vault
	-- office
	[106586] = { enemy = ASS:random_unit("cops_heavy"), },  -- cops
	[106586] = { enemy = ASS:random_unit("cops_heavy"), },
	[100686] = { enemy = ASS:random_unit("fbis_heavy"), },  -- fbis
	[100687] = { enemy = ASS:random_unit("fbis_heavy"), },
	[103609] = { enemy = ASS:random_unit("fbis_heavy"), },
	-- patrolling guards outside vault
	[100863] = { enemy = ASS:random_unit("securitys"), },
	[100753] = { enemy = ASS:random_unit("securitys"), },
	[102045] = { enemy = ASS:random_unit("securitys"), },
	[102054] = { enemy = ASS:random_unit("securitys"), },
	[100743] = { enemy = ASS:random_unit("securitys"), },
	[102053] = { enemy = ASS:random_unit("securitys"), },
	[100672] = { enemy = ASS:random_unit("securitys"), },
	[102058] = { enemy = ASS:random_unit("securitys"), },
	[100628] = { enemy = ASS:random_unit("securitys"), },
	-- stationary guards
	[100614] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100646] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100661] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100663] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100787] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100671] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100920] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100872] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102059] = { enemy = ASS:random_unit("securitys_heavy"), },
	[102046] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100752] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100694] = { enemy = ASS:random_unit("securitys_heavy"), },
	[105493] = { enemy = ASS:random_unit("securitys_heavy"), },
	[105494] = { enemy = ASS:random_unit("securitys_heavy"), },
	[105383] = { enemy = ASS:random_unit("securitys_heavy"), },
	-- management office window swats
	[102501] = { enemy = ASS:random_unit("swats"), },
	[102974] = { enemy = ASS:random_unit("swats"), },
	[101705] = { enemy = ASS:random_unit("swats"), },
	[101616] = { enemy = ASS:random_unit("swats"), },
	-- one-time cops, outside
	[103536] = { enemy = ASS:random_unit("cops"), },
	[103670] = { enemy = ASS:random_unit("cops"), },
	[106853] = { enemy = ASS:random_unit("cops"), },
	[106854] = { enemy = ASS:random_unit("cops"), },
	[106857] = { enemy = ASS:random_unit("cops"), },
	[106865] = { enemy = ASS:random_unit("cops"), },
	[106877] = { enemy = ASS:random_unit("cops"), },
	[106878] = { enemy = ASS:random_unit("cops"), },
	[106879] = { enemy = ASS:random_unit("cops"), },
	[106880] = { enemy = ASS:random_unit("cops"), },
	-- TODO: check that these are actually scripted spawns
	[106891] = { enemy = ASS:random_unit("swats"), },
	[106892] = { enemy = ASS:random_unit("swats"), },
	[103397] = { enemy = ASS:random_unit("swats"), },
	[106893] = { enemy = ASS:random_unit("swats"), },
	[106894] = { enemy = ASS:random_unit("swats"), },
}
