local deep_securitys = {
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"),
}

local replace_guaranteed_dozer_spot = math.random(1, 5)

return {
	-- security guards
	[100671] = { enemy = deep_securitys },
	[100670] = { enemy = deep_securitys },
	[100675] = { enemy = deep_securitys },
	[100676] = { enemy = deep_securitys },
	[101722] = { enemy = deep_securitys },
	[101739] = { enemy = deep_securitys },
	[101754] = { enemy = deep_securitys },
	[101794] = { enemy = deep_securitys },
	[102509] = { enemy = deep_securitys },
	[102524] = { enemy = deep_securitys },
	[102539] = { enemy = deep_securitys },
	[100211] = { enemy = deep_securitys },

	-- "force" security, presumably additional spawns that happen at some point
	[100177] = { enemy = deep_securitys },
	[100178] = { enemy = deep_securitys },
	[100181] = { enemy = deep_securitys },
	[100182] = { enemy = deep_securitys },
	[100183] = { enemy = deep_securitys },
	[105393] = { enemy = deep_securitys },
	[105394] = { enemy = deep_securitys },
	[105395] = { enemy = deep_securitys },
	[105396] = { enemy = deep_securitys },
	[105398] = { enemy = deep_securitys },
	[105399] = { enemy = deep_securitys },
	[105400] = { enemy = deep_securitys },
	[105401] = { enemy = deep_securitys },
	[105402] = { enemy = deep_securitys },

	[100740] = { enemy = deep_securitys },  -- "guard tower overkill"
	[103900] = { enemy = deep_securitys },  -- "guard investigate drill"

	-- scripted swats - more bellmead marshals/shields are called in, so, uh. why not bellmead guards ?
	[104205] = { enemy = deep_securitys },
	[104223] = { enemy = deep_securitys },
	[104224] = { enemy = deep_securitys },
	[104225] = { enemy = deep_securitys },
	[104226] = { enemy = deep_securitys },
	[104234] = { enemy = deep_securitys },
	[104235] = { enemy = deep_securitys },
	[104236] = { enemy = deep_securitys },
	[104247] = { enemy = deep_securitys },
	[104248] = { enemy = deep_securitys },

	-- why are there so many bulldozers during the escape sequence ?
	-- reduce to 1 on vh/ovk, 2 on mh/dw, and 4 on ds (from what appears to be 6/6/8)
	-- TODO: find out if all of them for a given difficulty are activated, looking like all of them plus a random other dozer get activated..?
	[104215] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 1 and "specials_agg" or "dozers_no_cs") },  -- vh/ovk
	[104206] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 2 and "specials_agg" or "dozers_no_cs") },
	[104217] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 3 and "specials_agg" or "dozers_no_cs") },
	[104219] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 4 and "specials_agg" or "dozers_no_cs") },
	[104221] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 5 and "specials_agg" or "dozers_no_cs") },
	[104998] = { enemy = ASS:random_unit("specials_agg") },  -- 25/25/25/25
	[104997] = { enemy = ASS:random_unit("specials_agg") },  -- 25/25/25/25
	[104996] = { enemy = ASS:random_unit("specials_agg") },  -- 25/25/25/25
	[104994] = { enemy = ASS:random_unit("specials_agg") },  -- 25/25/25/25
	[104213] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 1 and "specials_agg" or "dozers_no_cs") },  -- mh+
	[104214] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 2 and "specials_agg" or "dozers_no_cs") },
	[104216] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 3 and "specials_agg" or "dozers_no_cs") },
	[104218] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 4 and "specials_agg" or "dozers_no_cs") },
	[104220] = { enemy = ASS:random_unit(replace_guaranteed_dozer_spot ~= 5 and "specials_agg" or "dozers_no_cs") },
	[104993] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },  -- 50/50
	[104999] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },  -- 50/50
	[104995] = { enemy = ASS:random_unit("dozers_any") },  -- ds
	[105000] = { enemy = ASS:random_unit("dozers_any") },

	-- "force dozers" while going up to the pipe puzzle, 50/50 chance
	[102312] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[104519] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[104518] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
	[104517] = { enemy = ASS:get_difficulty_dozer(ASS.DOZER_TIERS.MINI) },
}
