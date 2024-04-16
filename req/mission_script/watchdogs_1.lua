local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()

local cops = tweak_data.levels:moon_units("cops")
local fbis = tweak_data.levels:moon_units("fbis")
local shield = tweak_data.levels:moon_units("shield")
local specials_agg = tweak_data.levels:moon_units("specials_agg")
local dozers_any = tweak_data.levels:moon_units("dozers_any")
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

return {
	[100445] = {  -- spawn start cops
		group_amount = normal and 8 or hard and 12 or 16,  -- 19 available, 6 normally
		on_executed = {
			{ name = "ambush_sniper_filter_normal", delay = 0, },
			{ name = "ambush_sniper_filter_hard", delay = 0, },
			{ name = "ambush_sniper_filter_overkill", delay = 0, },
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
	[101305] = {  -- swat defend SO
		so_access_filter = "any",
	},
	[101294] = {  -- swat defend SO
		on_executed = {
			{ id = 101291, delay = 0.5, },
			{ id = 101292, delay = 1, },
		},
	},
	[101276] = shield_event or nil,  -- shield event, use unused variation half the time
	[102841] = { enemy = fbis, },
	[102842] = { enemy = fbis, },
	[102843] = { enemy = fbis, },
	[102844] = { enemy = fbis, },
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
	[100361] = { enemy = cops, },
	[100360] = { enemy = cops, },
	[100376] = { enemy = cops, },
	[100372] = { enemy = cops, },
	[100373] = { enemy = cops, },
	[100379] = { enemy = cops, },
	[100374] = { enemy = cops, },
	[100433] = { enemy = cops, },
	[101600] = { enemy = cops, },
	[101591] = { enemy = cops, },
	[101621] = { enemy = cops, },
	[101594] = { enemy = cops, },
	[101854] = { enemy = cops, },
	[101630] = { enemy = cops, },
	[101855] = { enemy = cops, },
	[101856] = { enemy = cops, },
	[100330] = { enemy = cops, },
	[100329] = { enemy = cops, },
	[100342] = { enemy = cops, },
	[100347] = { enemy = cops, },
	[100375] = { enemy = cops, },
	[100452] = { enemy = cops, },
	[101291] = { enemy = dozers_any, },  -- van swats
	[101292] = { enemy = dozers_any, },
	[101279] = { enemy = shield, },  -- unused shield event variation, fix enemy names
	[101280] = { enemy = shield, },
	[101281] = { enemy = specials_agg, },
	[101282] = { enemy = specials_agg, },
	[101283] = { enemy = specials_agg, },
}
