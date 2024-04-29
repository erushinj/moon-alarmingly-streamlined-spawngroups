local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local cops = tweak_data.levels:moon_units("cops")
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
	Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"),
	Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"),
	Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"),
	Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"),
	-- Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"),  -- why are they using russians ?
	-- Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"),
}
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
		chance = normal and 0 or hard and 25 or 40,  -- not active on n-vh anyway but eh
	},
}
local chance_slam_door = {  -- 2nd/3rd floor doors that are slammed open on approach, chance elements exist but are set to 100 for both
	values = {
		chance = 35,
	},
}

return {
	[102760] = {  -- roof doors closed disables unrelated navlinks for some reason, just keep the one thats related
		modify_list_value = {
			elements = {
				[103291] = false,
				[103283] = false,
				[103293] = false,
				[103292] = false,
			},
		},
	},
	[104133] = disable,  -- disable loot truck nearest spawn
	[104731] = {  -- make cops carry stolen loot to spawn
		values = {
			position = Vector3(-3500, 0, 0),
		},
	},
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
	[100444] = {  -- dealer notices phoney money
		on_executed = {
			{ id = 101797, remove = true, },
			{ name = "phoney_money", delay = 0, },
		},
	},
	[100095] = {  -- players spawned
		on_executed = {
			{ name = "disable_ladders", delay = 0, },  -- ladders and planks remain interactable ?
			{ name = "disable_planks", delay = 0, },
			{ name = "disable_window_interaction", delay = 0, },
			{ name = "cheese_blocker_6", delay = 0, },
			{ name = "cheese_blocker_7", delay = 0, },
			{ name = "cheese_blocker_8", delay = 0, },
			{ name = "cheese_blocker_9", delay = 0, },
		},
	},
	[100256] = chance_slam_door,
	[104805] = {  -- this chavez spawn isnt used but whatever, just in case
		on_executed = {
			{ name = "force_slam_door_1", delay = 0, },
		},
	},
	[101504] = chance_slam_door,
	[104807] = {
		on_executed = {
			{ name = "force_slam_door_2", delay = 0, },
		},
	},
	[101464] = disable,  -- only make the guy just around the corner peek if the ambush will happen
	[102362] = {
		on_executed = {
			{ name = "toggle_ambush_peek", delay = 0, },
		},
	},
	[102720] = ambush_chance,  -- tweak ambush chance (20% -> 25% ovk, 30% -> 25% mh, 30% -> 40% dw/ds)
	[101817] = ambush_chance,
	[102656] = enable,  -- "link to close roof doors"
	[103611] = enable,
	[100297] = {  -- "close roof doors"
		values = enable.values,
		on_executed = {
			{ id = 103611, delay = 0, },  -- block ai navigation into the roof stairwell if its blocked off
			{ name = "cheese_blocker_1", delay = 0, },
		},
	},
	[101745] = enable,  -- reenable harassers, but remove the dumb swarm heavies
	[100150] = disable,
	[100385] = disable,
	[100387] = disable,
	[100389] = disable,
	[100391] = disable,
	[100392] = disable,
	[103348] = disable,  -- disable last reenforce point, really not needed on this heist
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
	[100499] = {
		values = {
			amount = 0,
			amount_random = 1,
		},
	},
	[102261] = {  -- c4 alley drop on high difficulties
		on_executed = {
			{ id = 100350, delay = 0, },
		},
	},
	[104556] = disable,  -- dont disable objective sniper spawn points after the objective is completed
	[104557] = disable,
	[101599] = enable,  -- also allow a disabled sniper spawn
	[101521] = enable,  -- and corresponding so
	[102593] = gangsters_amounts_3,  -- gangster amounts
	[102597] = gangsters_amounts_2,
	[102604] = gangsters_amounts_2,
	[102612] = gangsters_amounts_2,
	[101744] = gangsters_amounts_2,
	[101867] = gangsters_amounts_3,
	[103090] = {  -- more loot
		values = {
			amount = 8,
			amount_random = normal and 0 or hard and 4 or 8,
		},
	},
	[100501] = {  -- ambush line fix ?  hasnt been working for me since forever
		values = {
			append_prefix = false,
			-- use_play_func = true,
			-- use_instigator = true,
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
	[102456] = { enemy = gangsters, },
	[100081] = { enemy = gangsters, },
	[100085] = { enemy = gangsters, },
	[100169] = { enemy = gangsters, },
	[100234] = { enemy = gangsters, },
	[100236] = { enemy = gangsters, },
	[100253] = { enemy = gangsters, },
	[100305] = { enemy = gangsters, },
	[100406] = { enemy = gangsters, },
	[100409] = { enemy = gangsters, },
	[100418] = { enemy = gangsters, },
	[100431] = { enemy = gangsters, },
	[100767] = { enemy = gangsters, },
	[101200] = { enemy = gangsters, },
	[101375] = { enemy = gangsters, },
	[101401] = { enemy = gangsters, },
	[101421] = { enemy = gangsters, },
	[101422] = { enemy = gangsters, },
	[101425] = { enemy = gangsters, },
	[101434] = { enemy = gangsters, },
	[101435] = { enemy = gangsters, },
	[101438] = { enemy = gangsters, },
	[101441] = { enemy = gangsters, },
	[101442] = { enemy = gangsters, },
	[101512] = { enemy = gangsters, },
	[101661] = { enemy = gangsters, },
	[101668] = { enemy = gangsters, },
	[101743] = { enemy = gangsters, },
	[101746] = { enemy = gangsters, },
	[101749] = { enemy = gangsters, },
	[101881] = { enemy = gangsters, },
	[102170] = { enemy = gangsters, },
	[102197] = { enemy = gangsters, },
	[102330] = { enemy = gangsters, },
	[102332] = { enemy = gangsters, },
	[102333] = { enemy = gangsters, },
	[102335] = { enemy = gangsters, },
	[102558] = { enemy = gangsters, },
	[102562] = { enemy = gangsters, },
	[102563] = { enemy = gangsters, },
	[102564] = { enemy = gangsters, },
	[102586] = { enemy = gangsters, },
	[102592] = { enemy = gangsters, },
	[102596] = { enemy = gangsters, },
	[102718] = { enemy = gangsters, },
	[103061] = { enemy = gangsters, },
	[103231] = { enemy = gangsters, },
	[103232] = { enemy = gangsters, },
	[103234] = { enemy = gangsters, },
	[103235] = { enemy = gangsters, },
	[103236] = { enemy = gangsters, },
	[103450] = { enemy = gangsters, },
	[104781] = { enemy = gangsters, },
	[104889] = { enemy = gangsters, },
	[104930] = { enemy = gangsters, },
	[104932] = { enemy = gangsters, },
	[103103] = { enemy = gangsters, },
	[103102] = { enemy = gangsters, },
	[103103] = { enemy = gangsters, },
	[103104] = { enemy = gangsters, },
	[103179] = { enemy = gangsters, },
	[103180] = { enemy = gangsters, },
	[101540] = { enemy = gangsters, },
	[101395] = { enemy = gangsters, },
	[101433] = { enemy = gangsters, },
	[101437] = { enemy = gangsters, },
	[101539] = { enemy = gangsters, },
	[101802] = { enemy = gangsters, },
	[101804] = { enemy = gangsters, },
	[104793] = { enemy = gangsters, },
	[102717] = { enemy = gangsters, },
	[100512] = { enemy = gangsters, },
	[100513] = { enemy = gangsters, },
	[100516] = { enemy = gangsters, },
	[100407] = { enemy = gangsters, },
	[102165] = { enemy = gangsters, },
	[102193] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100484] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100025] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100494] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100495] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100496] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100039] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[102192] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100050] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[102191] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100055] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100056] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100057] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[103703] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[103702] = { enemy = gangsters, values = no_participate_to_group_ai.values, },
	[100135] = { enemy = cops, },  -- "random swat 1" (not actually swat, is a bronco cop, kicks down the front door)
	[100027] = { enemy = cops, },  -- cops, initial
	[100028] = { enemy = cops, },
	[100035] = { enemy = cops, },
	[100037] = { enemy = cops, },
	[100038] = { enemy = cops, },
	[100040] = { enemy = cops, },
	[102020] = { enemy = cops, },  -- "blockade" (swarm)
	[102021] = { enemy = cops, },
}
