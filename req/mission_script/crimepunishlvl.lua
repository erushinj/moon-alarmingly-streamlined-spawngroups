-- crime and punishment, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local get_table_index_func = ASS:require("get_table_index_func", true)
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local filters_disable = {
	values = set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = set_difficulty_groups("normal_above"),
}

local sniper_respawn_delay = overkill and 15 or 30
local sniper_respawn_delay_rand = normal and 30 or 15
local securitys = {
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"),
}
local rioters = {
	Idstring("units/payday2/characters/ene_rus_prisoner_1/ene_rus_prisoner_1"),
	Idstring("units/payday2/characters/ene_rus_prisoner_2/ene_rus_prisoner_2"),
	Idstring("units/payday2/characters/ene_rus_prisoner_3/ene_rus_prisoner_3"),
	Idstring("units/payday2/characters/ene_rus_prisoner_4/ene_rus_prisoner_4"),
}
local prisoners = {
	Idstring("units/payday2/characters/civ_rus_prisoner_1/civ_rus_prisoner_1"),
	Idstring("units/payday2/characters/civ_rus_prisoner_2/civ_rus_prisoner_2"),
	Idstring("units/payday2/characters/civ_rus_prisoner_3/civ_rus_prisoner_3"),
	Idstring("units/payday2/characters/civ_rus_prisoner_4/civ_rus_prisoner_4"),
}
local confined_prisoners = {
	Idstring("units/payday2/characters/civ_rus_prisoner_special_1/civ_rus_prisoner_special_1"),
	Idstring("units/payday2/characters/civ_rus_prisoner_special_2/civ_rus_prisoner_special_2"),
	Idstring("units/payday2/characters/civ_rus_prisoner_special_3/civ_rus_prisoner_special_3"),
	Idstring("units/payday2/characters/civ_rus_prisoner_special_4/civ_rus_prisoner_special_4"),
}
local dozers_no_cs = tweak_data.levels:moon_units("dozers_no_cs")
local specials_med = tweak_data.levels:moon_units("specials_med")
local last_ambush = tweak_data.levels:moon_units("heavys")
local top_ambush_ids = get_table_index_func({ 101185, 101192, 101196, 101200, })
local top_ambush = scripted_swat_squads({
	hard_target = overkill and 4 or 2,
	hard_spawn = "specials_shield_clk",
	normal_spawn = "heavys",
})
local bottom_ambush_ids = get_table_index_func({ 101035, 101036, 101037, 101038, })
local bottom_ambush = scripted_swat_squads({
	hard_target = overkill and 4 or 2,
	hard_spawn = "specials_no_clk",
	normal_spawn = "heavys",
})

return {
	[101052] = filters_disable,  -- ambush enemy toggle filters, normal
	[101053] = filters_disable,  -- ovk
	[101054] = filters_normal_above,  -- dw
	[101055] = filters_disable,  -- zeal
	[100145] = {  -- destroyed satalite dish - on destroying any satellite dish
		hunt = true,
	},
	[100819] = {  -- loud time
		on_executed = {
			-- { id = 100820, delay = 0, },  -- diff 0.75 (normally 0s)
			{ id = 100822, remove = true, },  -- diff 1 (normally 60s)
		},
	},
	[100820] = {  -- difficulty 0.75 element
		values = {
			difficulty = 0.25,
		},
	},
	[100110] = {  -- enter guard room - door blown open
		difficulty = 0.5,
	},
	[100181] = {  -- found ivan
		difficulty = 0.75,
	},
	[100118] = {  -- escape roof helipad - door drilled open, diff 1
		on_executed = {
			{ id = 100822, delay = 0, },
		},
	},
	[100931] = {  -- spawn snipers (first spawn delay)
		on_executed = {
			-- { id = 100924, delay = 0, },  -- normally 0s
			{ id = 100925, delay = normal and 30 or hard and 20 or 10, },  -- normally 30s
			{ id = 100927, delay = normal and 60 or hard and 40 or 20, },  -- normally 60s
		},
	},
	[100923] = {  -- sniper respawn delays, normally all 30s
		on_executed = {
			{ id = 100924, delay = sniper_respawn_delay, delay_rand = sniper_respawn_delay_rand, },
		},
	},
	[100926] = {
		on_executed = {
			{ id = 100925, delay = sniper_respawn_delay, delay_rand = sniper_respawn_delay_rand, },
		},
	},
	[100929] = {
		on_executed = {
			{ id = 100927, delay = sniper_respawn_delay, delay_rand = sniper_respawn_delay_rand, },
		},
	},
	[101043] = {
		so_access_filter = "any",
	},
	[101044] = {
		so_access_filter = "any",
	},
	[101045] = {
		so_access_filter = "any",
	},
	[101046] = {
		so_access_filter = "any",
	},
	[101201] = {
		so_access_filter = "any",
		modify_list_value = {
			spawn_instigator_ids = {
				[101192] = false,
				[101185] = true,
			},
		},
	},
	[101202] = {
		so_access_filter = "any",
		modify_list_value = {
			spawn_instigator_ids = {
				[101185] = false,
				[101192] = true,
			},
		},
	},
	[101201] = {
		so_access_filter = "any",
		modify_list_value = {
			spawn_instigator_ids = {
				[101192] = false,
				[101196] = true,
			},
		},
	},
	[101201] = {
		so_access_filter = "any",
		modify_list_value = {
			spawn_instigator_ids = {
				[101192] = false,
				[101200] = true,
			},
		},
	},
	[100865] = { enemy = specials_med, },  -- ambush units, non-instanced medics
	[101077] = { enemy = specials_med, },
	[101149] = { enemy = specials_med, },
	[101150] = { enemy = specials_med, },
	[101050] = { enemy = dozers_no_cs, },  -- dozers
	[101151] = { enemy = dozers_no_cs, },
	[100864] = { enemy = dozers_no_cs, },
	[100867] = { enemy = dozers_no_cs, },
	[100866] = { enemy = dozers_no_cs, },
	[101154] = { enemy = last_ambush, },
	[101155] = { enemy = last_ambush, },
	[101156] = { enemy = last_ambush, },
	[101157] = { enemy = last_ambush, },
	[top_ambush_ids()] = { enemy = top_ambush(), },
	[top_ambush_ids()] = { enemy = top_ambush(), },
	[top_ambush_ids()] = { enemy = top_ambush(), },
	[top_ambush_ids()] = { enemy = top_ambush(), },
	[bottom_ambush_ids()] = { enemy = bottom_ambush(), },
	[bottom_ambush_ids()] = { enemy = bottom_ambush(), },
	[bottom_ambush_ids()] = { enemy = bottom_ambush(), },
	[bottom_ambush_ids()] = { enemy = bottom_ambush(), },
	[100225] = { enemy = securitys, },
	[100226] = { enemy = securitys, },
	[100227] = { enemy = securitys, },
	[100228] = { enemy = securitys, },
	[100229] = { enemy = securitys, },
	[100230] = { enemy = securitys, },
	[100232] = { enemy = securitys, },
	[100233] = { enemy = securitys, },
	[100234] = { enemy = securitys, },
	[100235] = { enemy = securitys, },
	[100236] = { enemy = securitys, },
	[100237] = { enemy = securitys, },
	[100259] = { enemy = securitys, },
	[100260] = { enemy = securitys, },
	[100267] = { enemy = securitys, },
	[100268] = { enemy = securitys, },
	[100269] = { enemy = securitys, },
	[100270] = { enemy = securitys, },
	[100271] = { enemy = securitys, },
	[100272] = { enemy = securitys, },
	[100869] = { enemy = securitys, },
	[100870] = { enemy = securitys, },
	[100871] = { enemy = securitys, },
	[101086] = { enemy = securitys, },
	[100743] = { enemy = securitys, },
	[100744] = { enemy = securitys, },
	[100745] = { enemy = securitys, },
	[101087] = { enemy = securitys, },
	[101093] = { enemy = securitys, },
	[101090] = { enemy = securitys, },
	[101088] = { enemy = securitys, },
	[101091] = { enemy = securitys, },
	[101089] = { enemy = securitys, },
	[101092] = { enemy = securitys, },
	[100279] = { enemy = securitys, },
	[100280] = { enemy = securitys, },
	[100281] = { enemy = securitys, },
	[100282] = { enemy = securitys, },
	[100283] = { enemy = securitys, },
	[100286] = { enemy = securitys, },
	[100287] = { enemy = securitys, },
	[100288] = { enemy = securitys, },
	[100289] = { enemy = securitys, },
	[101081] = { enemy = securitys, },
	[101082] = { enemy = securitys, },
	[101083] = { enemy = securitys, },
	[101084] = { enemy = securitys, },
	[101085] = { enemy = securitys, },
	[100239] = { enemy = rioters, },
	[100240] = { enemy = rioters, },
	[100241] = { enemy = rioters, },
	[100242] = { enemy = rioters, },
	[100243] = { enemy = rioters, },
	[100244] = { enemy = rioters, },
	[100245] = { enemy = rioters, },
	[100246] = { enemy = rioters, },
	[100247] = { enemy = rioters, },
	[100248] = { enemy = rioters, },
	[100249] = { enemy = rioters, },
	[100250] = { enemy = rioters, },
	[100251] = { enemy = rioters, },
	[100252] = { enemy = rioters, },
	[100253] = { enemy = rioters, },
	[100254] = { enemy = rioters, },
	[100255] = { enemy = rioters, },
	[100256] = { enemy = rioters, },
	[100261] = { enemy = rioters, },
	[100262] = { enemy = rioters, },
	[100263] = { enemy = rioters, },
	[100264] = { enemy = rioters, },
	[100265] = { enemy = rioters, },
	[100266] = { enemy = rioters, },
	[100273] = { enemy = rioters, },
	[100274] = { enemy = rioters, },
	[100275] = { enemy = rioters, },
	[100277] = { enemy = rioters, },
	[100278] = { enemy = rioters, },
	[100906] = { enemy = rioters, },
	[100907] = { enemy = rioters, },
	[100908] = { enemy = rioters, },
	[100909] = { enemy = rioters, },
	[100910] = { enemy = rioters, },
	[100912] = { enemy = rioters, },
	[100913] = { enemy = rioters, },
	[100914] = { enemy = rioters, },
	[100915] = { enemy = rioters, },
	[100916] = { enemy = rioters, },
	[100917] = { enemy = rioters, },
	[100918] = { enemy = rioters, },
	[100919] = { enemy = rioters, },
	[100174] = { enemy = prisoners, },
	[100175] = { enemy = prisoners, },
	[100176] = { enemy = prisoners, },
	[100177] = { enemy = prisoners, },
	[101062] = { enemy = prisoners, },
	[101063] = { enemy = prisoners, },
	[101064] = { enemy = prisoners, },
	[101065] = { enemy = prisoners, },
	[101066] = { enemy = prisoners, },
	[101067] = { enemy = prisoners, },
	[101068] = { enemy = prisoners, },
	[101069] = { enemy = prisoners, },
	[101070] = { enemy = prisoners, },
	[101180] = { enemy = confined_prisoners, },
	[101181] = { enemy = confined_prisoners, },
	[101182] = { enemy = confined_prisoners, },
	[101183] = { enemy = confined_prisoners, },
	[101184] = { enemy = confined_prisoners, },
}
