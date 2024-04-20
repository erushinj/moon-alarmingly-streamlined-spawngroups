local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()

local cops = tweak_data.levels:moon_units("cops")
local fbis = tweak_data.levels:moon_units("fbis")
local dozers_any = tweak_data.levels:moon_units("dozers_any")
local specials_med = tweak_data.levels:moon_units("specials_med")
local trigger_unlimited = {
	values = {
		trigger_times = 0,
	},
}
local enable = {
	values = {
		enabled = true,
	},
}
local no_participate_to_group_ai = {
	values = {
		participate_to_group_ai = false,
	},
}

local function cloaker_boowomp(id)
	return id and {
		modify_list_value = {
			elements = {
				[id] = true,
			},
		},
	} or nil
end

return {
	[101954] = enable,  -- unused reenforce, not added by operators
	[101955] = enable,
	[101984] = enable,
	[101987] = enable,
	[102123] = enable,
	[102125] = enable,
	[102126] = enable,
	[101983] = {
		modify_list_value = {
			elements = {
				[101954] = false,
				[101955] = false,
			},
		},
	},
	[102100] = {
		modify_list_value = {
			elements = {
				[101984] = false,
				[101947] = false,
			},
		},
	},
	[100210] = {
		modify_list_value = {
			elements = {
				[101984] = false,
				[101947] = false,
				[102123] = false,
				[102125] = false,
				[102126] = false,
			},
		},
	},
	[100454] = {  -- heli swat chance (vanilla is 33)
		values = {
			chance = 100,
		},
	},
	[102119] = {
		so_access_filter = "any",
	},
	[103962] = cloaker_boowomp(103961),  -- ai enemy group 9
	[103964] = cloaker_boowomp(103963),  -- ai enemy group 10
	[103966] = cloaker_boowomp(103965),  -- ai enemy group 11
	[103968] = cloaker_boowomp(103967),  -- ai enemy group 12
	[103970] = cloaker_boowomp(103969),  -- ai enemy group 13
	[103972] = cloaker_boowomp(103971),  -- ai enemy group 14
	[103974] = cloaker_boowomp(103973),  -- ai enemy group 15
	[103976] = cloaker_boowomp(103975),  -- ai enemy group 16
	[103978] = cloaker_boowomp(103977),  -- ai enemy group 17
	[103980] = cloaker_boowomp(103979),  -- ai enemy group 18
	[100443] = {  -- func sequence 23 (spawns first round of heli swat, modify delays)
		on_executed = {
			{ id = 100446, delay = 0.5, delay_rand = 0.5, },
			{ id = 100447, delay = 0.5, delay_rand = 0.5, },
			{ id = 100448, delay = 2, delay_rand = 2, },  -- logic link 28
		},
	},
	[100448] = {  -- logic link 28 (spawns second round of heli swat, modify delays and use it for looping)
		on_executed = {
			{ id = 100454, delay = 180, delay_rand = overkill and 60 or 180, },
			{ id = 100446, delay = 0, delay_rand = 1, },
			{ id = 100447, delay = 0, delay_rand = 1, },
		},
	},
	[100761] = no_participate_to_group_ai,
	[100765] = no_participate_to_group_ai,
	[101212] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[101214] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[101216] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[101218] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[101412] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[101413] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[101222] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[100344] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[102374] = { enemy = dozers_any, },  -- dozer with 4 shields guarding bags
	[102375] = { enemy = dozers_any, },
	[100446] = { enemy = specials_med, },  -- helicopter spawn in front of the warehouse
	[100447] = { enemy = dozers_any, values = trigger_unlimited.values, },
}
