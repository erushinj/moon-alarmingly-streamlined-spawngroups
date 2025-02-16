local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local cops = tweak_data.moon.units.cops
local fbis = tweak_data.moon.units.fbis
local shield = tweak_data.moon.units.shield
local shield_event = math.random() < 0.5 and {
	on_executed = {
		{ id = 102848, remove = true, },
		{ id = 102849, remove = true, },
		{ id = 102850, remove = true, },
		{ id = 102851, remove = true, },
		{ id = 101279, delay = 0, },
		{ id = 101280, delay = 0, },
		{ id = 101281, delay = 0, },
		{ id = 101282, delay = 0, },
		{ id = 101283, delay = 0, },
	},
}
local no_participate_to_group_ai = {
	values = {
		participate_to_group_ai = false,
	},
}
local participate_to_group_ai = {
	values = {
		participate_to_group_ai = true,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}

return {
	[101859] = disable,  -- enemy dummy trigger for some normally unused cops
	[100445] = {  -- spawn start cops
		values = {
			amount = normal and 8 or hard and 12 or 16,  -- 26 (normally 19) available, 6 used normally
		},
		modify_list_value = {
			elements = {
				[100330] = true,
				[100329] = true,
				[100342] = true,
				[100347] = true,
				[100375] = true,
				[100452] = true,
				[100455] = true,
			},
		},
		on_executed = {
			{ name = "ambush_sniper_spawn", delay = 0, },
		}
	},
	[102845] = {  -- logic random 029 (spawn fbis)
		values = {
			amount = normal and 2 or hard and 3 or 4,  -- 3 normally
		},
	},
	[101301] = {  -- swats at start chance
		values = {
			chance = overkill and 70 or 35,  -- 10 normally
		},
	},
	[101305] = disable,  -- swat defend SO
	[101294] = {  -- modify van spawn delays
		on_executed = {
			{ id = 101291, delay = 0.5, },
			{ id = 101292, delay = 1, },
		},
	},
	[101276] = shield_event or nil,  -- shield event, use unused variation half the time
	[102841] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[102842] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[102843] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[102844] = { enemy = fbis, values = no_participate_to_group_ai.values, },
	[100363] = { enemy = cops, },
	[100436] = { enemy = cops, },
	[100438] = { enemy = cops, },
	[100435] = { enemy = cops, },
	[100392] = { enemy = cops, },
	[100395] = { enemy = cops, },
	[100432] = { enemy = cops, },
	[100404] = { enemy = cops, },
	[100378] = { enemy = cops, },
	[100377] = { enemy = cops, },
	[100367] = { enemy = cops, },
	[100371] = { enemy = cops, },
	[100361] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100360] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100376] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100372] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100373] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100379] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100374] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100433] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100330] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100329] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100342] = { enemy = cops, },
	[100347] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100375] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100452] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[100455] = { enemy = cops, values = no_participate_to_group_ai.values, },
	[101291] = { enemy = tweak_data.moon.units.dozers_any, },  -- van swats
	[101292] = { enemy = tweak_data.moon.units.dozers_any, },
	[101279] = { enemy = shield, values = no_participate_to_group_ai.values, },  -- unused shield event variation, fix enemy names
	[101280] = { enemy = shield, values = no_participate_to_group_ai.values, },
	[101281] = { enemy = tweak_data.moon.units.specials_agg, values = no_participate_to_group_ai.values, },
	[101282] = { enemy = tweak_data.moon.units.specials_agg, values = no_participate_to_group_ai.values, },
	[101283] = { enemy = tweak_data.moon.units.specials_agg, values = no_participate_to_group_ai.values, },
	[102071] = { enemy = tweak_data.moon.units.cloaker, },  -- weird scripted fbi swat in the area with bad navlink access
	[102072] = { enemy = tweak_data.moon.units.cloaker, },
}
