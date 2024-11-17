local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()

local cops = tweak_data.moon.units.cops
local initial_cops_ids = ASS.utils.gen_remove_random_value({ 100135, 100027, 100028, 100035, 100037, 100038, 100040, })
local initial_cops = ASS.utils.gen_remove_random_value(table.list_add(cops, cops))
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
	Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"),  -- why are they using russians ?
	Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"),
}
local gangsters_outside_ids = ASS.utils.gen_remove_random_value({
	101881,
	101395,
	-- 101746,
	-- 101749,
	102330,
	102333,
	102335,
	100767,
	102717,
	102718,
})
local gangsters_outside = clone(gangsters)
local door_guy = table.remove(gangsters_outside, math.random(#gangsters_outside))
gangsters_outside = ASS.utils.gen_remove_random_value(gangsters_outside)

local gangsters_1st_ids = ASS.utils.gen_remove_random_value({
	100085,
	102456,
	102197,
	101375,
	101743,
	100169,
	101802,
	101804,
})
local gangsters_1st = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_2nd_ids = ASS.utils.gen_remove_random_value({
	102596,
	102592,
	101401,
	101539,
	101540,
	101433,
	101435,
	102586,
	101668,
	101434,
})
local gangsters_2nd = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_3rd_ids = ASS.utils.gen_remove_random_value({
	104793,
	102563,
	101441,
	102558,
	101442,
	102564,
	101422,
	101437,
	103450,
})
local gangsters_3rd = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_4th_ids = ASS.utils.gen_remove_random_value({
	100431,
	101661,
	104889,
	100234,
	104930,
	104932,
	100496,
	100495,
	100494,
	100484,
})
local gangsters_4th = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_5th_ids = ASS.utils.gen_remove_random_value({
	101425,
	100418,
	100081,
	101200,
	101438,
	103702,  -- one of the rooms
	103703,
	102191,
	102192,
	102193,
})
local gangsters_5th = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_misc_1_ids = ASS.utils.gen_remove_random_value({
	100025,  -- other 5th floor room
	100039,
	100050,
	100055,
	100056,
	100057,
	101512,  -- unused 4th floor guy
	102170,  -- 3rd floor room
	101421,
	102165,
})
local gangsters_escape_ids = ASS.utils.gen_remove_random_value({
	100253,
	100236,
	103102,
	103101,
	100305,
	103104,
	103180,
	103103,
	102562,
	103179,
})
local gangsters_escape = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_misc_1 = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_misc_2_ids = ASS.utils.gen_remove_random_value({
	100513,  -- other unused 4th floor guys
	100512,
	100516,
	104781,
	100407,  -- 2nd floor room
	100406,
	100409,
})
local gangsters_misc_2 = ASS.utils.gen_remove_random_value(clone(gangsters))
local gangsters_misc_3_ids = ASS.utils.gen_remove_random_value({
	103231,  -- unused 145 room guys
	103232,
	103234,
	103235,
	103236,
})
local gangsters_misc_3 = ASS.utils.gen_remove_random_value(gangsters)

local civs_casual_ids = ASS.utils.gen_remove_random_value({ 100109, 101838, 100241, 100211, 101130, })
local civs_casual = {
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_5/civ_male_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_casual_9/civ_male_casual_9"),
}
local balcony_civ = table.random(civs_casual)
civs_casual = ASS.utils.gen_remove_random_value(civs_casual)

local civs_hobo_ids = ASS.utils.gen_remove_random_value({ 102244, 101748, 100960, 100967, })
local civs_hobo = ASS.utils.gen_remove_random_value({
	Idstring("units/pd2_dlc_holly/characters/civ_male_hobo_1/civ_male_hobo_1"),
	Idstring("units/pd2_dlc_holly/characters/civ_male_hobo_2/civ_male_hobo_2"),
	Idstring("units/pd2_dlc_holly/characters/civ_male_hobo_3/civ_male_hobo_3"),
	Idstring("units/pd2_dlc_holly/characters/civ_male_hobo_4/civ_male_hobo_4"),
})
local dealer_voicelines = {
	modify_list_value = {
		elements = {
			[102456] = false,
			[104782] = true,
		},
	},
}
local dealer_walk_so = {
	values = {
		patrol_path = "inpath2",
	},
}
local disable = {
	values = {
		enabled = false,
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
local gangsters_amounts_2 = {
	values = {
		amount = 2,
		amount_random = 0,
	},
}
local gangsters_amounts_3 = {
	values = {
		amount = 3,
		amount_random = 0,
	},
}
local ambush_chance = {
	values = {
		chance = normal and 0 or hard and 15 or 25,  -- not active on n-vh anyway but eh
	},
}
local trigger_unlimited = {
	values = {
		enabled = true,
		trigger_times = 0,
	},
}
local toothbrush_secured = {
	on_executed = {
		{ id = 104319, delay = 0, },
	},
}
local escape_gangsters_chance = {
	values = {
		chance = overkill and 100 or 50,
	},
}

return {
	[101853] = {  -- change cop arrival triggers, cops arrive once the red door is opened
		on_executed = {
			{ id = 104691, remove = true, },
		},
	},
	[100450] = {
		on_executed = {
			{ id = 104691, delay = 0, },
		},
	},
	[100809] = {  -- ..or after some time has passed since masking up without the red door being opened
		on_executed = {
			{ name = "start_time_until_police", delay = 0, },
		},
	},
	[100907] = {  -- move an asset medic bag that can potentially be blocked off
		values = {
			position = Vector3(336, 470, 1429.99),
			rotation = Rotation(-90, 0, 0),
		},
	},
	[100900] = {
		on_executed = {
			{ id = 100890, remove = not normal or nil, delay = 0, },
			{ id = 100332, remove = overkill or nil, delay = 0, },
		},
	},
	[103300] = escape_gangsters_chance,  -- ovk+ extra gangsters in the basement, vanilla is 50
	[101698] = escape_gangsters_chance,  -- chance to spawn one (1) gangster in the basement regardless of any others, vanilla is 15
	[104573] = {
		on_executed = {
			{ name = "enable_roof_sniper_respawns", delay = 0, },
		},
	},
	[103143] = trigger_unlimited,  -- sniper spawns, re-enabling them are handled by other elements
	[103134] = trigger_unlimited,
	[103137] = trigger_unlimited,
	[103130] = trigger_unlimited,
	[103126] = trigger_unlimited,
	[101599] = trigger_unlimited,
	[102833] = trigger_unlimited,
	[101801] = trigger_unlimited,
	[102614] = trigger_unlimited,
	[102612] = trigger_unlimited,
	[103148] = trigger_unlimited,
	[103168] = trigger_unlimited,
	[100793] = trigger_unlimited,
	[100645] = trigger_unlimited,
	[103111] = trigger_unlimited,
	[100693] = trigger_unlimited,
	[103167] = disable,  -- sniper toggles, re-enabled and executed after sniper objective
	[103170] = disable,
	[103173] = disable,
	[104532] = disable,
	[104533] = disable,
	[104534] = disable,
	[104535] = disable,
	[104536] = disable,
	[104537] = disable,
	[104538] = disable,
	[104539] = disable,
	[104540] = disable,
	[104541] = disable,
	[104542] = disable,
	[104543] = disable,
	[104544] = disable,
	[102092] = disable,  -- dont remove ground level spawns at any point
	[102097] = disable,
	[101519] = disable,  -- disruptive garbage team ai SOs, checking out winch
	[101167] = disable,  -- pointing over edge if c4 lands not on the roof
	[101170] = disable,
	[100535] = disable,  -- true garbage, make team ai go to lower floors when cops arrive for no reason
	[100539] = disable,
	[100556] = disable,
	[100643] = disable,
	[100644] = disable,
	[101108] = disable,
	[101112] = disable,
	[100316] = disable,  -- turn off navlink that rappels through blinds
	[100202] = disable,  -- and 4th balcony -> 3rd floor navlink, no good use
	[102690] = {  -- heli chance (vanilla is 50, but its tweaked to loop now)
		values = {
			chance = 20,
		},
		on_executed = {
			{ name = "heli_reset_chance", delay = 0, },
		},
	},
	[101346] = {  -- safe expl area touched
		on_executed = {
			{ name = "heli_switch_spawns", delay = 0, },
		},
	},
	[101658] = {  -- helicopter cops logic
		on_executed = {
			{ name = "heli_dozers", delay = 17, },  -- toggled on after explosion, replaces generic group spawn
		},
	},
	[104561] = {  -- roof heli group spawn
		values = {
			spawn_type = "group_guaranteed",
		},
	},
	[104185] = disable,  -- "passive cloaker spawn" with other enemies, replaced
	[102087] = {  -- add back spawns
		on_executed = {
			{ name = "add_cloaker_groups", delay = 0, },
		},
	},
	[100270] = {
		values = {
			elements = { 101669, 103217, 103225, 103226, },  -- remove a nonsense spawn thats now used for a cloaker group
		},
	},
	[102760] = disable,  -- roof doors closed disables mostly unrelated navlinks
	[103487] = {  -- flat doors startup
		on_executed = {
			{ name = "filter_hard_above", delay = 0.5, },
			{ name = "filter_overkill", delay = 0.5, },
			{ name = "pick_doors_2nd_floor", delay = 1.5, },
			{ name = "chance_close_roof_doors", delay = 1.5, },
			{ name = "chance_block_5th_corner_doors", delay = 1.5, },
			{ name = "chance_block_4th_corridor_doors", delay = 1.5, },
			{ name = "chance_block_4th_objective_door", delay = 1.5, },
		},
	},
	[100444] = {  -- money guy notices phoney money
		on_executed = {
			{ id = 101797, remove = true, },
			{ name = "phoney_money", delay = 0, },
		},
	},
	[100095] = {  -- players spawned
		on_executed = {
			-- { name = "disable_ladders", delay = 0, },  -- ladders and planks remain interactable ?
			-- { name = "disable_planks", delay = 0, },
			{ name = "disable_window_interaction", delay = 0, },
			{ name = "link_slam_doors", delay = 0, },
		},
	},
	[101464] = disable,  -- only make the guy just around the corner peek if the ambush will happen
	[102362] = {
		on_executed = {
			{ name = "toggle_ambush_peek", delay = 0, },
		},
	},
	[102720] = ambush_chance,  -- tweak ambush chance (vanilla is 20% ovk, 30% mh+)
	[101817] = ambush_chance,
	[102656] = enable,  -- "link to close roof doors"
	[103611] = enable,
	[103648] = {
		on_executed = {
			{ id = 103611, remove = true, },  -- dont block roof stairwell navigation by default
		},
	},
	[100297] = {  -- "close roof doors"
		values = enable.values,
		on_executed = {
			{ id = 103611, delay = 0, },  -- block ai navigation into the roof stairwell if its blocked off
			{ name = "so_stairwell_to_ground", delay = 0, },
		},
	},
	[101745] = enable,  -- reenable harassers, but remove the dumb swarm heavies
	[100150] = disable,
	[100385] = disable,
	[100387] = disable,
	[100389] = disable,
	[100391] = disable,
	[100392] = disable,
	[103348] = disable,  -- disable vanilla reenforce points (they're replaced)
	[102501] = disable,
	[103181] = disable,
	[100290] = {  -- spawn swat
		reinforce = {
			{
				name = "alley1",
				force = 2,
				position = Vector3(-2320, 1070, -25),
			},
			{
				name = "alley2",
				force = 2,
				position = Vector3(-845, 1990, -25),
			},
			{
				name = "alley3",
				force = 2,
				position = Vector3(650, 530, -25),
			},
		},
	},
	[100045] = {  -- saws placeable
		reinforce = {
			{
				name = "panic1",
				force = 2,
				position = Vector3(-1370, 1285, 700),
			},
			{
				name = "panic2",
				force = 2,
				position = Vector3(-1275, 1270, 375),
			},
		},
	},
	[100247] = {  -- saws finished, go to roof
		reinforce = {
			{
				name = "floor2",
				force = 2,
				position = Vector3(-825, 620, 375),
			},
			{
				name = "floor4",
				force = 2,
				position = Vector3(-485, 585, 1025),
			},
		},
	},
	[102840] = {  -- diff curve, "start diff" (0.25)
		values = {
			difficulty = 0.5,
		},
	},
	[102841] = {  -- "all drills" (1)
		values = {
			difficulty = 0.75,
		},
	},
	-- [102842] = {  -- "bag drops" (0.75)
	-- 	values = {
	-- 		enabled = true,
	-- 		difficulty = 0.6,
	-- 	},
	-- },
	[102843] = {  -- "explosion" (1)
		values = {
			enabled = true,
			difficulty = 1,
		},
	},
	[103616] = {  -- tweak 4th floor front doors
		on_executed = {
			{ id = 100517, delay = 2, },  -- normally executed by random elements in 103490, potential softlock if not executed
		},
	},
	[103490] = {
		values = {
			amount = 0,
			amount_random = overkill and 1 or 2,
		},
	},
	[103491] = {
		on_executed = {
			{ id = 100517, remove = true, },
		},
	},
	[103492] = {
		on_executed = {
			{ id = 100517, remove = true, },
		},
	},
	[104689] = disable,
	[102959] = {
		event_list = {
			["flat_door_001"] = "door_block",
			["flat_door_002"] = "door_block",
			["flat_door_003"] = false,
			["flat_door_012"] = false,
			["flat_door_013"] = false,
			["flat_door_019"] = false,
			["flat_door_020"] = false,
			["flat_door_021"] = "door_block",
			["flat_door_025"] = false,
		},
	},
	[103455] = {  -- fewer open doors to the coke lab
		values = {
			amount = 1,  -- softlock if none
			amount_random = normal and 2 or hard and 1 or 0,
		},
		on_executed = {
			{ name = "inst_in_cokeroom_door_004", delay = 0, },
		},
	},
	[103618] = {  -- fewer other open doors
		values = {
			amount = 1,  -- potential softlock if none
			amount_random = normal and 2 or hard and 1 or 0,
		},
	},
	[103501] = enable,  -- allow 3rd floor doors to be closed
	[100581] = {
		on_executed = {
			{ name = "block_washroom_3rdfloor_doors", delay = 0, },
		},
	},
	[104612] = disable,  -- dont kill all snipers after objective is complete
	[103161] = {  -- speed up post-objective sniper spawns to same as during objective (from 20-40s)
		on_executed = {
			{ id = 103159, delay = 10, delay_rand = 5, },
		},
	},
	[102593] = gangsters_amounts_3,  -- gangster amounts
	[102597] = gangsters_amounts_2,
	[102604] = gangsters_amounts_2,
	[101612] = gangsters_amounts_2,
	[101744] = gangsters_amounts_2,
	[101867] = gangsters_amounts_3,
	[102557] = not normal and disable or nil,  -- in panic room, 2
	[102554] = overkill and disable or nil,  -- 3
	[102556] = normal and disable or nil,  -- 4
	[103090] = {  -- more loot (vanilla is fixed 7, max is 16)
		values = {
			amount = 6,
			amount_random = normal and 0 or hard and 3 or 6,
		},
	},
	[100373] = {  -- grabbing giant toothbrush should use the same logic as grabbing coke for the loot dropoff waypoint
		on_executed = {
			{ id = 104314, delay = 0, },
			{ id = 104325, remove = true, },
		},
	},
	[104839] = toothbrush_secured,  -- securing giant toothbrush should remove waypoint if no more bags left
	[104900] = toothbrush_secured,
	[104133] = disable,  -- disable loot truck nearest spawn
	[103055] = disable,  -- also disable garbage ambush triggered by securing loot, its only set up for the far truck and doesnt really make sense anyway
	[103557] = disable,
	[104731] = {  -- make cops carry stolen loot to spawn
		values = {
			position = Vector3(-3500, 0, 0),
		},
	},
	[100501] = {  -- ambush line fix ?  hasnt been working for me since forever
		values = {
			append_prefix = false,
		},
	},
	[102329] = {  -- reduce delay on mask up when ambushed (this triggers loud)
		on_executed = {
			{ id = 102332, delay = 1.5, },
		},
	},
	[101797] = dealer_voicelines,  -- dealer voice fix
	[101798] = dealer_voicelines,
	[101832] = dealer_voicelines,
	[101888] = dealer_walk_so,  -- always make dealer walk up to 4th floor
	[101891] = dealer_walk_so,
	[101899] = dealer_walk_so,
	[104782] = { enemy = Idstring("units/pd2_dlc_flat/characters/npc_jamaican/npc_jamaican"), },  -- gangsters
	[102332] = { enemy = door_guy, },
	[101749] = { enemy = door_guy, },
	[101746] = { enemy = door_guy, },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_outside_ids()] = { enemy = gangsters_outside(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_1st_ids()] = { enemy = gangsters_1st(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_2nd_ids()] = { enemy = gangsters_2nd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_3rd_ids()] = { enemy = gangsters_3rd(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_4th_ids()] = { enemy = gangsters_4th(), },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_5th_ids()] = { enemy = gangsters_5th(), values = no_participate_to_group_ai.values, },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_escape_ids()] = { enemy = gangsters_escape(), },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_1_ids()] = { enemy = gangsters_misc_1(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_2_ids()] = { enemy = gangsters_misc_2(), values = no_participate_to_group_ai.values, },
	[gangsters_misc_3_ids()] = { enemy = gangsters_misc_3(), },
	[gangsters_misc_3_ids()] = { enemy = gangsters_misc_3(), },
	[gangsters_misc_3_ids()] = { enemy = gangsters_misc_3(), },
	[gangsters_misc_3_ids()] = { enemy = gangsters_misc_3(), },
	[gangsters_misc_3_ids()] = { enemy = gangsters_misc_3(), },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[initial_cops_ids()] = { enemy = initial_cops(), values = no_participate_to_group_ai.values, },
	[102020] = { enemy = cops, },  -- "blockade" (swarm)
	[102021] = { enemy = cops, },
	[101005] = { enemy = tweak_data.moon.units.dozers_any, },  -- heli swats, hijacked to dozers after roof explosion
	[101911] = { enemy = tweak_data.moon.units.dozers_any, },
	[101515] = { enemy = balcony_civ, },
	[civs_casual_ids()] = { enemy = civs_casual(), },
	[civs_casual_ids()] = { enemy = civs_casual(), },
	[civs_casual_ids()] = { enemy = civs_casual(), },
	[civs_casual_ids()] = { enemy = civs_casual(), },
	[civs_casual_ids()] = { enemy = civs_casual(), },
	[civs_hobo_ids()] = { enemy = civs_hobo(), },
	[civs_hobo_ids()] = { enemy = civs_hobo(), },
	[civs_hobo_ids()] = { enemy = civs_hobo(), },
	[civs_hobo_ids()] = { enemy = civs_hobo(), },
}
