local bellmead_marksman = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
local bellmead_shield = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
local bellmead_specials = { bellmead_marksman, bellmead_shield, }
local bellmead_securitys = {
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"),
}

local replace_guaranteed_dozer_spot = math.random(1, 5)

return {
	-- security guards
	[100671] = { enemy = bellmead_securitys },
	[100670] = { enemy = bellmead_securitys },
	[100675] = { enemy = bellmead_securitys },
	[100676] = { enemy = bellmead_securitys },
	[101722] = { enemy = bellmead_securitys },
	[101739] = { enemy = bellmead_securitys },
	[101754] = { enemy = bellmead_securitys },
	[101794] = { enemy = bellmead_securitys },
	[102509] = { enemy = bellmead_securitys },
	[102524] = { enemy = bellmead_securitys },
	[102539] = { enemy = bellmead_securitys },
	[100211] = { enemy = bellmead_securitys },

	-- "helicopter gaurd"
	[101280] = { enemy = bellmead_securitys },
	[102066] = { enemy = bellmead_securitys },
	[103696] = { enemy = bellmead_securitys },
	[103697] = { enemy = bellmead_securitys },
	[104861] = { enemy = bellmead_securitys },
	[104862] = { enemy = bellmead_securitys },
	[104863] = { enemy = bellmead_securitys },
	[104980] = { enemy = bellmead_securitys },
	[104981] = { enemy = bellmead_securitys },
	[104982] = { enemy = bellmead_securitys },
	[104983] = { enemy = bellmead_securitys },
	[104984] = { enemy = bellmead_securitys },

	-- "force" security, presumably additional spawns that happen at some point
	[100177] = { enemy = bellmead_securitys },
	[100178] = { enemy = bellmead_securitys },
	[100181] = { enemy = bellmead_securitys },
	[100182] = { enemy = bellmead_securitys },
	[100183] = { enemy = bellmead_securitys },
	[105393] = { enemy = bellmead_securitys },
	[105394] = { enemy = bellmead_securitys },
	[105395] = { enemy = bellmead_securitys },
	[105396] = { enemy = bellmead_securitys },
	[105398] = { enemy = bellmead_securitys },
	[105399] = { enemy = bellmead_securitys },
	[105400] = { enemy = bellmead_securitys },
	[105401] = { enemy = bellmead_securitys },
	[105402] = { enemy = bellmead_securitys },

	[100740] = { enemy = bellmead_securitys },  -- "guard tower overkill"
	[103900] = { enemy = bellmead_securitys },  -- "guard investigate drill"

	-- scripted swats - more bellmead marshals/shields are called in, so, uh. why not bellmead guards ?
	[104205] = { enemy = bellmead_securitys },
	[104223] = { enemy = bellmead_securitys },
	[104224] = { enemy = bellmead_securitys },
	[104225] = { enemy = bellmead_securitys },
	[104226] = { enemy = bellmead_securitys },
	[104234] = { enemy = bellmead_securitys },
	[104235] = { enemy = bellmead_securitys },
	[104236] = { enemy = bellmead_securitys },
	[104247] = { enemy = bellmead_securitys },
	[104248] = { enemy = bellmead_securitys },

	-- why are there so many bulldozers during the escape sequence ?
	-- reduce to 1 on vh/ovk, 2 on mh/dw, and 4 on ds (from what appears to be 6/6/8)
	-- TODO: find out if all of them for a given difficulty are activated, looking like all of them plus a random other dozer get activated..?
	[104215] = { enemy = replace_guaranteed_dozer_spot ~= 1 and bellmead_shield or ASS:random_unit("dozers_no_cs") },  -- vh/ovk
	[104206] = { enemy = replace_guaranteed_dozer_spot ~= 2 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104217] = { enemy = replace_guaranteed_dozer_spot ~= 3 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104219] = { enemy = replace_guaranteed_dozer_spot ~= 4 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104221] = { enemy = replace_guaranteed_dozer_spot ~= 5 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104998] = { enemy = bellmead_marksman },  -- 25/25/25/25
	[104997] = { enemy = bellmead_marksman },  -- 25/25/25/25
	[104996] = { enemy = bellmead_marksman },  -- 25/25/25/25
	[104994] = { enemy = bellmead_marksman },  -- 25/25/25/25
	[104213] = { enemy = replace_guaranteed_dozer_spot ~= 1 and bellmead_shield or ASS:random_unit("dozers_no_cs") },  -- mh+
	[104214] = { enemy = replace_guaranteed_dozer_spot ~= 2 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104216] = { enemy = replace_guaranteed_dozer_spot ~= 3 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104218] = { enemy = replace_guaranteed_dozer_spot ~= 4 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104220] = { enemy = replace_guaranteed_dozer_spot ~= 5 and bellmead_shield or ASS:random_unit("dozers_no_cs") },
	[104993] = { enemy = ASS:random_unit("dozers_no_med") },  -- 50/50
	[104999] = { enemy = ASS:random_unit("dozers_no_med") },  -- 50/50
	[104995] = { enemy = ASS:random_unit("dozers_any") },  -- ds
	[105000] = { enemy = ASS:random_unit("dozers_any") },

	-- "force dozers" while going up to the pipe puzzle, 50/50 chance
	[102312] = { enemy = ASS:random_unit("dozers_no_med") },
	[104519] = { enemy = ASS:random_unit("dozers_no_med") },
	[104518] = { enemy = ASS:random_unit("dozers_no_med") },
	[104517] = { enemy = ASS:random_unit("dozers_no_med") },
}
