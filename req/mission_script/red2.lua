local replace_vault_dozer_1, replace_vault_dozer_2
repeat
	replace_vault_dozer_1, replace_vault_dozer_2 = math.random(1, 5), math.random(1, 5)
until replace_vault_dozer_1 ~= replace_vault_dozer_2

local is_overkill_145 = ASS:get_var("real_difficulty_index") > 4

return {
	-- escape dozers
	[103603] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },  -- office
	[103390] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103231] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },  -- basement
	[103198] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103163] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103162] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	-- vault dozers - only 4 are chosen on mh+, so although 2 are meant to be replaced, you might get 3 if youre unlucky and one of the replaced spawns isnt used
	[104169] = { enemy = tweak_data.levels:moon_random_unit(is_overkill_145 and (replace_vault_dozer_1 == 1 or replace_vault_dozer_2 == 1) and "specials_agg" or "dozers_no_med"), },
	[104170] = { enemy = tweak_data.levels:moon_random_unit(is_overkill_145 and (replace_vault_dozer_1 == 2 or replace_vault_dozer_2 == 2) and "specials_agg" or "dozers_no_med"), },
	[100763] = { enemy = tweak_data.levels:moon_random_unit(is_overkill_145 and (replace_vault_dozer_1 == 3 or replace_vault_dozer_2 == 3) and "specials_agg" or "dozers_no_med"), },
	[104131] = { enemy = tweak_data.levels:moon_random_unit(is_overkill_145 and (replace_vault_dozer_1 == 4 or replace_vault_dozer_2 == 4) and "specials_agg" or "dozers_no_med"), },
	[104132] = { enemy = tweak_data.levels:moon_random_unit(is_overkill_145 and (replace_vault_dozer_1 == 5 or replace_vault_dozer_2 == 5) and "specials_agg" or "dozers_no_med"), },
	-- after vault
	[104319] = { enemy = tweak_data.levels:moon_random_unit("swats"), },  -- heavies (low difficulties only ?)
	[104330] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[100570] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[103704] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[105108] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[105110] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[104317] = { enemy = tweak_data.levels:moon_random_unit("specials_any"), },  -- tasers
	[104318] = { enemy = tweak_data.levels:moon_random_unit("specials_any"), },
	-- vault area guards
	[102286] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },  -- security
	[102288] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102289] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102291] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102299] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102810] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102837] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102881] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[104001] = { enemy = tweak_data.levels:moon_random_unit("cops"), },  -- cop inside vault
	-- office
	[106586] = { enemy = tweak_data.levels:moon_random_unit("cops_heavy"), },  -- cops
	[106586] = { enemy = tweak_data.levels:moon_random_unit("cops_heavy"), },
	[100686] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },  -- fbis
	[100687] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },
	[103609] = { enemy = tweak_data.levels:moon_random_unit("fbis_heavy"), },
	-- patrolling guards outside vault
	[100863] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100753] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102045] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102054] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100743] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102053] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100672] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102058] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100628] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	-- stationary guards
	[100614] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100646] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100661] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100663] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100787] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100671] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100920] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100872] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102059] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[102046] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100752] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[100694] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[105493] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[105494] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	[105383] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },
	-- management office window swats
	[102501] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[102974] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[101705] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[101616] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	-- one-time cops, outside
	[103536] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103670] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106853] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106854] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106857] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106865] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106877] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106878] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106879] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[106880] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	-- TODO: check that these are actually scripted spawns
	[106891] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[106892] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[103397] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[106893] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
	[106894] = { enemy = tweak_data.levels:moon_random_unit("swats"), },
}
