local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}
local filters_disable = {
	values = ASS.utils.set_difficulty_groups("disable"),
}
local dozers_any = tweak_data.moon.units.dozers_any
local dozers_no_med = tweak_data.moon.units.dozers_no_med
local bellmead_securitys = {
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"),
	Idstring("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"),
}
local disable = {
	values = {
		enabled = false,
	},
}

return {
	[104207] = disable,  -- vanilla reenforce points
	[104208] = disable,
	[104210] = disable,
	[104222] = filters_disable,  -- escape ambush spawn filters
	[104211] = filters_disable,
	[105001] = filters_disable,
	[104212] = {
		values = filters_normal_above.values,
		on_executed = {
			{ id = 104213, remove = true, },
			{ id = 104214, remove = true, },
			{ id = 104216, remove = true, },
			{ id = 104218, remove = true, },
			{ id = 104220, remove = true, },
		},
	},
	[105003] = {  -- "random dozer mayham", now controls spawning all ambush dozers instead of only one at the zipline
		values = {
			amount = 4,
		},
		on_executed = {
			{ id = 104213, delay = 0, },
			{ id = 104214, delay = 0, },
			{ id = 104216, delay = 0, },
			{ id = 104218, delay = 0, },
			{ id = 104220, delay = 0, },
		},
	},
	[104213] = { enemy = dozers_any, },  -- escape ambush dozers
	[104214] = { enemy = dozers_any, },
	[104216] = { enemy = dozers_any, },
	[104218] = { enemy = dozers_any, },
	[104220] = { enemy = dozers_any, },
	[104993] = { enemy = dozers_any, },
	[104999] = { enemy = dozers_any, },
	[102312] = { enemy = dozers_no_med, },  -- "force dozers" while going up to the pipe puzzle
	[104519] = { enemy = dozers_no_med, },
	[104518] = { enemy = dozers_no_med, },
	[104517] = { enemy = dozers_no_med, },
	[100671] = { enemy = bellmead_securitys, },  -- security guards
	[100670] = { enemy = bellmead_securitys, },
	[100675] = { enemy = bellmead_securitys, },
	[100676] = { enemy = bellmead_securitys, },
	[101722] = { enemy = bellmead_securitys, },
	[101739] = { enemy = bellmead_securitys, },
	[101754] = { enemy = bellmead_securitys, },
	[101794] = { enemy = bellmead_securitys, },
	[102509] = { enemy = bellmead_securitys, },
	[102524] = { enemy = bellmead_securitys, },
	[102539] = { enemy = bellmead_securitys, },
	[100211] = { enemy = bellmead_securitys, },
	[101280] = { enemy = bellmead_securitys, },  -- "helicopter gaurd" when using heli entry plan
	[102066] = { enemy = bellmead_securitys, },
	[103696] = { enemy = bellmead_securitys, },
	[103697] = { enemy = bellmead_securitys, },
	[104861] = { enemy = bellmead_securitys, },
	[104862] = { enemy = bellmead_securitys, },
	[104863] = { enemy = bellmead_securitys, },
	[104980] = { enemy = bellmead_securitys, },
	[104981] = { enemy = bellmead_securitys, },
	[104982] = { enemy = bellmead_securitys, },
	[104983] = { enemy = bellmead_securitys, },
	[104984] = { enemy = bellmead_securitys, },
	[100177] = { enemy = bellmead_securitys, },  -- "force" security, presumably additional spawns that happen at some point
	[100178] = { enemy = bellmead_securitys, },
	[100181] = { enemy = bellmead_securitys, },
	[100182] = { enemy = bellmead_securitys, },
	[100183] = { enemy = bellmead_securitys, },
	[105393] = { enemy = bellmead_securitys, },
	[105394] = { enemy = bellmead_securitys, },
	[105395] = { enemy = bellmead_securitys, },
	[105396] = { enemy = bellmead_securitys, },
	[105398] = { enemy = bellmead_securitys, },
	[105399] = { enemy = bellmead_securitys, },
	[105400] = { enemy = bellmead_securitys, },
	[105401] = { enemy = bellmead_securitys, },
	[105402] = { enemy = bellmead_securitys, },
	[100740] = { enemy = bellmead_securitys, },  -- "guard tower overkill"
	[103900] = { enemy = bellmead_securitys, },  -- "guard investigate drill"
	[104205] = { enemy = bellmead_securitys, },  -- scripted swats on normal/hard, replace with bellmead
	[104223] = { enemy = bellmead_securitys, },
	[104224] = { enemy = bellmead_securitys, },
	[104225] = { enemy = bellmead_securitys, },
	[104226] = { enemy = bellmead_securitys, },
	[104234] = { enemy = bellmead_securitys, },
	[104235] = { enemy = bellmead_securitys, },
	[104236] = { enemy = bellmead_securitys, },
	[104247] = { enemy = bellmead_securitys, },
	[104248] = { enemy = bellmead_securitys, },
}
