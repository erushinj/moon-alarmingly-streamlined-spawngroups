-- chance stuff for doors that get slammed open on 2nd and 3rd floors
local link_slam_doors = "link_slam_doors"
local chance_slam_door_1 = "chance_slam_door_1"
local slam_door_1_success = "slam_door_1_success"
local chance_slam_door_2 = "chance_slam_door_2"
local slam_door_2_success = "slam_door_2_success"
local id_link_slam_doors = managers.mission:moon_generate_custom_id(link_slam_doors)
local id_chance_slam_door_1 = managers.mission:moon_generate_custom_id(chance_slam_door_1)
local id_slam_door_1_success = managers.mission:moon_generate_custom_id(slam_door_1_success)
local id_chance_slam_door_2 = managers.mission:moon_generate_custom_id(chance_slam_door_2)
local id_slam_door_2_success = managers.mission:moon_generate_custom_id(slam_door_2_success)

-- doors to the right when going up to the 5th floor
local chance_block_5th_corner_doors = "chance_block_5th_corner_doors"
local trigger_open_5th_corner_doors = "trigger_open_5th_corner_doors"
local block_5th_corner_doors = "block_5th_corner_doors"
local open_5th_corner_doors = "open_5th_corner_doors"
local id_chance_block_5th_corner_doors = managers.mission:moon_generate_custom_id(chance_block_5th_corner_doors)
local id_trigger_open_5th_corner_doors = managers.mission:moon_generate_custom_id(trigger_open_5th_corner_doors)
local id_block_5th_corner_doors = managers.mission:moon_generate_custom_id(block_5th_corner_doors)
local id_open_5th_corner_doors = managers.mission:moon_generate_custom_id(open_5th_corner_doors)

-- doors in the little corridor next to the stairs on the 4th floor
local chance_block_4th_corridor_doors = "chance_block_4th_corridor_doors"
local trigger_open_4th_corridor_doors = "trigger_open_4th_corridor_doors"
local block_4th_corridor_doors = "block_4th_corridor_doors"
local open_4th_corridor_doors = "open_4th_corridor_doors"
local trigger_destroy_4th_corridor_window = "trigger_destroy_4th_corridor_window"
local destroy_4th_corridor_window = "destroy_4th_corridor_window"
local so_4th_corridor_window_in = "so_4th_corridor_window_in"
local so_4th_corridor_window_out = "so_4th_corridor_window_out"
local id_chance_block_4th_corridor_doors = managers.mission:moon_generate_custom_id(chance_block_4th_corridor_doors)
local id_trigger_open_4th_corridor_doors = managers.mission:moon_generate_custom_id(trigger_open_4th_corridor_doors)
local id_block_4th_corridor_doors = managers.mission:moon_generate_custom_id(block_4th_corridor_doors)
local id_open_4th_corridor_doors = managers.mission:moon_generate_custom_id(open_4th_corridor_doors)
local id_trigger_destroy_4th_corridor_window = managers.mission:moon_generate_custom_id(trigger_destroy_4th_corridor_window)
local id_destroy_4th_corridor_window = managers.mission:moon_generate_custom_id(destroy_4th_corridor_window)
local id_so_4th_corridor_window_in = managers.mission:moon_generate_custom_id(so_4th_corridor_window_in)
local id_so_4th_corridor_window_out = managers.mission:moon_generate_custom_id(so_4th_corridor_window_out)

-- front door to 4th floor c4 room
local chance_block_4th_objective_door = "chance_block_4th_objective_door"
local trigger_open_4th_objective_door = "trigger_open_4th_objective_door"
local block_4th_objective_door = "block_4th_objective_door"
local open_4th_objective_door = "open_4th_objective_door"
local id_chance_block_4th_objective_door = managers.mission:moon_generate_custom_id(chance_block_4th_objective_door)
local id_trigger_open_4th_objective_door = managers.mission:moon_generate_custom_id(trigger_open_4th_objective_door)
local id_block_4th_objective_door = managers.mission:moon_generate_custom_id(block_4th_objective_door)
local id_open_4th_objective_door = managers.mission:moon_generate_custom_id(open_4th_objective_door)

-- generic door stuff
local filter_hard_above = "filter_hard_above"
local filter_overkill = "filter_overkill"
local add_chance_25 = "add_chance_25"
local disable_easy_doors = "disable_easy_doors"
local filter_easy_doors = "filter_easy_doors"
local chance_close_roof_doors = "chance_close_roof_doors"
local pick_doors_2nd_floor = "pick_doors_2nd_floor"
local open_145_door = "open_145_door"
local open_non_145_door = "open_non_145_door"
local inst_in_cokeroom_door_004 = "inst_in_cokeroom_door_004"
local block_washroom_3rdfloor_doors = "block_washroom_3rdfloor_doors"
local id_filter_hard_above = managers.mission:moon_generate_custom_id(filter_hard_above)
local id_filter_overkill = managers.mission:moon_generate_custom_id(filter_overkill)
local id_add_chance_25 = managers.mission:moon_generate_custom_id(add_chance_25)
local id_disable_easy_doors = managers.mission:moon_generate_custom_id(disable_easy_doors)
local id_filter_easy_doors = managers.mission:moon_generate_custom_id(filter_easy_doors)
local id_chance_close_roof_doors = managers.mission:moon_generate_custom_id(chance_close_roof_doors)
local id_pick_doors_2nd_floor = managers.mission:moon_generate_custom_id(pick_doors_2nd_floor)
local id_open_145_door = managers.mission:moon_generate_custom_id(open_145_door)
local id_open_non_145_door = managers.mission:moon_generate_custom_id(open_non_145_door)
local id_inst_in_cokeroom_door_004 = managers.mission:moon_generate_custom_id(inst_in_cokeroom_door_004)
local id_block_washroom_3rdfloor_doors = managers.mission:moon_generate_custom_id(block_washroom_3rdfloor_doors)

-- timer until police arrive regardless of red door status after masking up
local time_until_police = "time_until_police"
local start_time_until_police = "start_time_until_police"
local reduce_time_until_police = "reduce_time_until_police"
local id_time_until_police = managers.mission:moon_generate_custom_id(time_until_police)
local id_start_time_until_police = managers.mission:moon_generate_custom_id(start_time_until_police)
local id_reduce_time_until_police = managers.mission:moon_generate_custom_id(reduce_time_until_police)

-- heli loop stuff
local heli_reset_chance = "heli_reset_chance"
local heli_add_chance = "heli_add_chance"
local heli_roll_failed = "heli_roll_failed"
local heli_switch_spawns = "heli_switch_spawns"
local heli_dozers = "heli_dozers"
local id_heli_reset_chance = managers.mission:moon_generate_custom_id(heli_reset_chance)
local id_heli_add_chance = managers.mission:moon_generate_custom_id(heli_add_chance)
local id_heli_roll_failed = managers.mission:moon_generate_custom_id(heli_roll_failed)
local id_heli_switch_spawns = managers.mission:moon_generate_custom_id(heli_switch_spawns)
local id_heli_dozers = managers.mission:moon_generate_custom_id(heli_dozers)

-- misc stuff
local enable_roof_sniper_respawns = "enable_roof_sniper_respawns"
local disable_ladders = "disable_ladders"
local disable_planks = "disable_planks"
local disable_window_interaction = "disable_window_interaction"
local phoney_money = "phoney_money"
local toggle_ambush_peek = "toggle_ambush_peek"
local turn_off_so_1 = "turn_off_so_1"
local turn_off_so_2 = "turn_off_so_2"
local id_enable_roof_sniper_respawns = managers.mission:moon_generate_custom_id(enable_roof_sniper_respawns)
local id_disable_ladders = managers.mission:moon_generate_custom_id(disable_ladders)
local id_disable_planks = managers.mission:moon_generate_custom_id(disable_planks)
local id_disable_window_interaction = managers.mission:moon_generate_custom_id(disable_window_interaction)
local id_phoney_money = managers.mission:moon_generate_custom_id(phoney_money)
local id_toggle_ambush_peek = managers.mission:moon_generate_custom_id(toggle_ambush_peek)
local id_turn_off_so_1 = managers.mission:moon_generate_custom_id(turn_off_so_1)
local id_turn_off_so_2 = managers.mission:moon_generate_custom_id(turn_off_so_2)

-- TODO: figure out how to prevent cheese, previous add blinds solution doesnt work clientside
return {
	{
		class = "ElementToggle",
		editor_name = enable_roof_sniper_respawns,
		id = id_enable_roof_sniper_respawns,
		values = {
			enabled = true,
			toggle = "on",
			elements = {
				103167,
				103170,
				103173,
				104532,
				104533,
				104534,
				104535,
				104536,
				104537,
				104538,
				104539,
				104540,
				104541,
				104542,
				104543,
				104544,
			},
			on_executed = {
				{ id = 103167, delay = 0, },
				{ id = 103170, delay = 0, },
				{ id = 103173, delay = 0, },
				{ id = 104532, delay = 0, },
				{ id = 104533, delay = 0, },
				{ id = 104534, delay = 0, },
				{ id = 104535, delay = 0, },
				{ id = 104536, delay = 0, },
				{ id = 104537, delay = 0, },
				{ id = 104538, delay = 0, },
				{ id = 104539, delay = 0, },
				{ id = 104540, delay = 0, },
				{ id = 104541, delay = 0, },
				{ id = 104542, delay = 0, },
				{ id = 104543, delay = 0, },
				{ id = 104544, delay = 0, },
			},
		},
	},

	{
		class = "ElementLogicChanceOperator",
		editor_name = heli_reset_chance,
		id = id_heli_reset_chance,
		values = {
			enabled = true,
			chance = 20,
			operation = "set_chance",
			elements = {
				102690,
			},
			on_executed = {
				{ id = 102690, delay = 180, },
			},
		},
	},
	{
		class = "ElementLogicChanceTrigger",
		editor_name = heli_roll_failed,
		id = id_heli_roll_failed,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				102690,
			},
			on_executed = {
				{ id = id_heli_add_chance, delay = 0, },
			},
		},
	},
	{
		class = "ElementLogicChanceOperator",
		editor_name = heli_add_chance,
		id = id_heli_add_chance,
		values = {
			enabled = true,
			chance = 20,
			operation = "add_chance",
			elements = {
				102690,
			},
			on_executed = {
				{ id = 102690, delay = 15, delay_rand = 15, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = heli_switch_spawns,
		id = id_heli_switch_spawns,
		values = {
			enabled = true,
			toggle = "toggle",
			elements = {
				104561,  -- roof heli group spawn
				id_heli_dozers,
			},
		},
	},
	{
		class = "MissionScriptElement",
		editor_name = heli_dozers,
		id = id_heli_dozers,
		values = {
			enabled = false,
			on_executed = {
				{ id = 101005, delay = 0, },
				{ id = 101911, delay = 0.5, },
			},
		},
	},

	{
		class = "ElementRandom",
		editor_name = pick_doors_2nd_floor,
		id = id_pick_doors_2nd_floor,
		values = {
			enabled = true,
			amount = 0,
			amount_random = 2,
			on_executed = {
				{ id = id_open_145_door, delay = 0, },
				{ id = id_open_non_145_door, delay = 0, },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = open_145_door,
		id = id_open_145_door,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_001", event = "door_open", },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = open_non_145_door,
		id = id_open_non_145_door,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_002", event = "door_open", },
			},
		},
	},

	{
		class = "ElementOperator",
		editor_name = turn_off_so_1,
		id = id_turn_off_so_1,
		values = {
			enabled = true,
			operation = "remove",
			elements = {
				101063,
			},
		},
	},

	{
		class = "ElementOperator",
		editor_name = turn_off_so_2,
		id = id_turn_off_so_2,
		values = {
			enabled = true,
			operation = "remove",
			elements = {
				101257,
			},
		},
	},

	{
		class = "ElementLogicChanceOperator",
		editor_name = link_slam_doors,
		id = id_link_slam_doors,
		values = {
			enabled = true,
			chance = 50,
			elements = {
				id_chance_slam_door_1,
				id_chance_slam_door_2,
			},
			on_executed = {
				{ id = id_chance_slam_door_1, delay = 0, },
				{ id = id_chance_slam_door_2, delay = 0, },
			},
		},
	},

	{
		class = "ElementLogicChance",
		editor_name = chance_slam_door_1,
		id = id_chance_slam_door_1,
		values = {
			enabled = true,
			on_executed = {
				{ id = id_slam_door_1_success, delay = 0, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = slam_door_1_success,
		id = id_slam_door_1_success,
		values = {
			enabled = true,
			toggle = "off",
			elements = {
				100256,  -- chance
				104805,  -- (unused) chavez spawn
			},
		},
	},

	{
		class = "ElementLogicChance",
		editor_name = chance_slam_door_2,
		id = id_chance_slam_door_2,
		values = {
			enabled = true,
			on_executed = {
				{ id = id_slam_door_2_success, delay = 0, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = slam_door_2_success,
		id = id_slam_door_2_success,
		values = {
			enabled = true,
			toggle = "off",
			elements = {
				101504,  -- chance
				104807,  -- chavez spawn
			},
		},
	},

	{
		class = "ElementPlaySound",
		editor_name = phoney_money,
		id = id_phoney_money,
		values = {
			enabled = true,
			sound_event = "Play_thg_flt_01",
			elements = {
				102456,
			},
		},
	},

	{
		class = "ElementLogicChance",
		editor_name = chance_block_5th_corner_doors,
		id = id_chance_block_5th_corner_doors,
		values = {
			enabled = true,
			chance = 25,
			on_executed = {
				{ id = id_block_5th_corner_doors, delay = 0, },
			},
		},
	},
	{
		class = "ElementLogicChanceTrigger",
		editor_name = trigger_open_5th_corner_doors,
		id = id_trigger_open_5th_corner_doors,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				id_chance_block_5th_corner_doors,
			},
			on_executed = {
				{ id = id_open_5th_corner_doors, delay = 0, },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = block_5th_corner_doors,
		id = id_block_5th_corner_doors,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_019", event = "door_block", },
				{ instance = "flat_door_020", event = "door_block", },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = open_5th_corner_doors,
		id = id_open_5th_corner_doors,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_019", event = "door_open", },
				{ instance = "flat_door_020", event = "door_open", },
			},
		},
	},

	{
		class = "ElementAreaTrigger",
		editor_name = trigger_destroy_4th_corridor_window,
		id = id_trigger_destroy_4th_corridor_window,
		values = {
			enabled = true,
			position = Vector3(-684, -90, 1172),
			rotation = Rotation(90, 0, 0),
			interval = 0.1,
			width = 30,
			depth = 109,
			height = 141,
			trigger_times = 1,
			on_executed = {
				{ id = id_destroy_4th_corridor_window, delay = 0, },
			},
		},
	},
	{
		class = "ElementUnitSequence",
		editor_name = destroy_4th_corridor_window,
		id = id_destroy_4th_corridor_window,
		values = {
			enabled = true,
			trigger_list = {
				{ id = 1, name = "run_sequence", notify_unit_id = 700429, notify_unit_sequence = "destroy", time = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = so_4th_corridor_window_out,
		id = id_so_4th_corridor_window_out,
		values = managers.mission:moon_generate_preset_values("SO|navlink|law", {
			enabled = true,
			position = Vector3(-684, 0, 1025),
			search_position = Vector3(-690, -233, 1025),
			rotation = Rotation(180, 0, 0),
			so_action = "e_nl_jump_over_1m_var1",
			interval = 1.5,
		}),
	},
	{
		class = "ElementSpecialObjective",
		editor_name = so_4th_corridor_window_in,
		id = id_so_4th_corridor_window_in,
		values = managers.mission:moon_generate_preset_values("SO|navlink|law", {
			enabled = true,
			position = Vector3(-690, -233, 1025),
			search_position = Vector3(-684, 0, 1025),
			rotation = Rotation(0, 0, 0),
			so_action = "e_nl_jump_over_1m_var1",
			interval = 1.5,
		}),
	},
	{
		class = "ElementLogicChance",
		editor_name = chance_block_4th_corridor_doors,
		id = id_chance_block_4th_corridor_doors,
		values = {
			enabled = true,
			chance = 25,
			on_executed = {
				{ id = id_block_4th_corridor_doors, delay = 0, },
			},
		},
	},
	{
		class = "ElementLogicChanceTrigger",
		editor_name = trigger_open_4th_corridor_doors,
		id = id_trigger_open_4th_corridor_doors,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				id_chance_block_4th_corridor_doors,
			},
			on_executed = {
				{ id = id_open_4th_corridor_doors, delay = 0, },
				{ id = id_so_4th_corridor_window_in, delay = 0, },
				{ id = id_so_4th_corridor_window_out, delay = 0, },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = block_4th_corridor_doors,
		id = id_block_4th_corridor_doors,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_012", event = "door_block", },
				{ instance = "flat_door_013", event = "door_block", },
			},
			on_executed = {
				{ id = id_so_4th_corridor_window_in, delay = 0, },
				{ id = id_so_4th_corridor_window_out, delay = 0, },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = open_4th_corridor_doors,
		id = id_open_4th_corridor_doors,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_012", event = "door_open", },
				{ instance = "flat_door_013", event = "door_open", },
			},
		},
	},

	{
		class = "ElementLogicChance",
		editor_name = chance_block_4th_objective_door,
		id = id_chance_block_4th_objective_door,
		values = {
			enabled = true,
			chance = 25,
			on_executed = {
				{ id = id_block_4th_objective_door, delay = 0, },
			},
		},
	},
	{
		class = "ElementLogicChanceTrigger",
		editor_name = trigger_open_4th_objective_door,
		id = id_trigger_open_4th_objective_door,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				id_chance_block_4th_objective_door,
			},
			on_executed = {
				{ id = id_open_4th_objective_door, delay = 0, },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = block_4th_objective_door,
		id = id_block_4th_objective_door,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_025", event = "door_block", },
			},
		},
	},
	{
		class = "ElementInstanceInputEvent",
		editor_name = open_4th_objective_door,
		id = id_open_4th_objective_door,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_025", event = "door_open", },
			},
		},
	},

	{
		class = "ElementFilter",
		editor_name = filter_hard_above,
		id = id_filter_hard_above,
		values = managers.mission:moon_generate_preset_values("filter|hard_above", {
			enabled = true,
			on_executed = {
				{ id = id_add_chance_25, delay = 0, },
				{ id = id_reduce_time_until_police, delay = 0, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = filter_overkill,
		id = id_filter_overkill,
		values = managers.mission:moon_generate_preset_values("filter|overkill", {
			enabled = true,
			on_executed = {
				{ id = id_add_chance_25, delay = 0, },
				{ id = id_reduce_time_until_police, delay = 0, },
				{ id = id_disable_easy_doors, delay = 0, },
			},
		}),
	},
	{
		class = "ElementLogicChanceOperator",
		editor_name = add_chance_25,
		id = id_add_chance_25,
		values = {
			enabled = true,
			chance = 25,
			operation = "add_chance",
			elements = {
				id_chance_close_roof_doors,
				id_chance_block_4th_corridor_doors,
				id_chance_block_5th_corner_doors,
				id_chance_block_4th_objective_door,
			},
		},
	},

	{
		class = "ElementTimer",
		editor_name = time_until_police,
		id = id_time_until_police,
		values = {
			enabled = true,
			timer = 90,
			on_executed = {
				{ id = 104691, delay = 0, },
			},
		},
	},
	{
		class = "ElementTimerOperator",
		editor_name = start_time_until_police,
		id = id_start_time_until_police,
		values = {
			enabled = true,
			operation = "start",
			elements = {
				id_time_until_police,
			},
		},
	},
	{
		class = "ElementTimerOperator",
		editor_name = reduce_time_until_police,
		id = id_reduce_time_until_police,
		values = {
			enabled = true,
			operation = "subtract_time",
			time = 30,
			elements = {
				id_time_until_police,
			},
		},
	},

	{
		class = "ElementToggle",
		editor_name = disable_easy_doors,
		id = id_disable_easy_doors,
		values = {
			enabled = true,
			toggle = "off",
			elements = {
				id_inst_in_cokeroom_door_004,
				103240,  -- cokeroom door 001
				101758,  -- instance input event 039 (washroom and 3rd floor open)
				103492,  -- instance input event 035 (near balcony c4 location)
			},
		},
	},

	{
		class = "ElementLogicChance",
		editor_name = chance_close_roof_doors,
		id = id_chance_close_roof_doors,
		values = {
			enabled = true,
			chance = 25,
			on_executed = {
				{ id = 102656, delay = 0, },  -- "link to close roof doors"
			},
		},
	},

	{
		class = "ElementInstanceInputEvent",
		editor_name = block_washroom_3rdfloor_doors,
		id = id_block_washroom_3rdfloor_doors,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_005", event = "door_block", },
				{ instance = "flat_door_006", event = "door_block", },
				{ instance = "flat_door_009", event = "door_block", },
				{ instance = "flat_door_018", event = "door_block", },
			},
		},
	},

	{
		class = "ElementInstanceInputEvent",
		editor_name = inst_in_cokeroom_door_004,
		id = id_inst_in_cokeroom_door_004,
		values = {
			enabled = true,
			event_list = {
				{ instance = "flat_door_003", event = "door_open", },
			},
		},
	},

	{
		class = "ElementToggle",
		editor_name = toggle_ambush_peek,
		id = id_toggle_ambush_peek,
		values = {
			enabled = true,
			toggle = "on",
			elements = {
				101464,
			},
		},
	},

	{
		class = "ElementInstanceInputEvent",
		editor_name = disable_window_interaction,
		id = id_disable_window_interaction,
		values = {
			enabled = true,
			event_list = {
				{ instance = "window_planks_001", event = "disable_window", },
				{ instance = "window_planks_002", event = "disable_window", },
				{ instance = "window_planks_003", event = "disable_window", },
				{ instance = "window_planks_004", event = "disable_window", },
				{ instance = "window_planks_006", event = "disable_window", },
				{ instance = "window_planks_008", event = "disable_window", },
				{ instance = "window_planks_009", event = "disable_window", },
				{ instance = "window_planks_010", event = "disable_window", },
				{ instance = "window_planks_011", event = "disable_window", },
				{ instance = "window_planks_012", event = "disable_window", },
				{ instance = "window_planks_013", event = "disable_window", },
				{ instance = "window_planks_015", event = "disable_window", },
				{ instance = "window_planks_016", event = "disable_window", },
				{ instance = "window_planks_017", event = "disable_window", },
				{ instance = "window_planks_018", event = "disable_window", },
				{ instance = "window_planks_019", event = "disable_window", },
				{ instance = "window_planks_020", event = "disable_window", },
				{ instance = "window_planks_021", event = "disable_window", },
				{ instance = "window_planks_022", event = "disable_window", },
				{ instance = "window_planks_023", event = "disable_window", },
				{ instance = "window_planks_024", event = "disable_window", },
				{ instance = "window_planks_025", event = "disable_window", },
				{ instance = "window_planks_026", event = "disable_window", },
				{ instance = "window_planks_027", event = "disable_window", },
				{ instance = "window_planks_028", event = "disable_window", },
				{ instance = "window_planks_029", event = "disable_window", },
			},
		},
	},
	{
		class = "ElementDisableUnit",
		editor_name = disable_ladders,
		id = id_disable_ladders,
		values = {
			enabled = true,
			unit_ids = {
				700294,  -- 5th floor catwalk to roof
				700530,
				700783,
				700467,
				702379,  -- from ground, to roof
				702321,
				702215,
				702037,
				701749,
				701408,
				701131,
				700874,
				700574,
				702142,  -- to front balcony
				701933,
				701568,
				701241,
				700989,
				700767,  -- front balcony to roof, 4th floor
				700472,
				700268,
				700106,
				700791,
				700478,
				700278,
				700121,
				700144,  -- 5th floor
				700046,
			},
		},
	},
	{
		class = "ElementDisableUnit",
		editor_name = disable_planks,
		id = id_disable_planks,
		values = {
			enabled = true,
			unit_ids = {
				103333,
				103334,
				103428,
				103941,
				103942,
				103943,
				103944,
				103945,
				103946,
				103947,
			},
		},
	},
}
