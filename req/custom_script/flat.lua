local phoney_money = "phoney_money"
local force_slam_door_1 = "force_slam_door_1"
local slam_door_1_failed = "slam_door_1_failed"
local force_slam_door_2 = "force_slam_door_2"
local slam_door_2_failed = "slam_door_2_failed"
local toggle_ambush_peek = "toggle_ambush_peek"
local chance_close_roof_doors = "chance_close_roof_doors"
local add_chance_25 = "add_chance_25"
local pick_doors_2nd_floor = "pick_doors_2nd_floor"
local open_145_door = "open_145_door"
local open_non_145_door = "open_non_145_door"
local disable_easy_doors = "disable_easy_doors"
local filter_easy_doors = "filter_easy_doors"
local inst_in_cokeroom_door_004 = "inst_in_cokeroom_door_004"
local block_washroom_3rdfloor_doors = "block_washroom_3rdfloor_doors"

local chance_block_5th_corner_doors = "chance_block_5th_corner_doors"
local trigger_open_5th_corner_doors = "trigger_open_5th_corner_doors"
local block_5th_corner_doors = "block_5th_corner_doors"
local open_5th_corner_doors = "open_5th_corner_doors"

local chance_block_4th_corridor_doors = "chance_block_4th_corridor_doors"
local trigger_open_4th_corridor_doors = "trigger_open_4th_corridor_doors"
local block_4th_corridor_doors = "block_4th_corridor_doors"
local open_4th_corridor_doors = "open_4th_corridor_doors"

local chance_block_4th_objective_door = "chance_block_4th_objective_door"
local trigger_open_4th_objective_door = "trigger_open_4th_objective_door"
local block_4th_objective_door = "block_4th_objective_door"
local open_4th_objective_door = "open_4th_objective_door"

local disable_ladders = "disable_ladders"
local disable_planks = "disable_planks"
local disable_window_interaction = "disable_window_interaction"
local cheese_blocker_1 = "cheese_blocker_1"
local turn_off_so_1 = "turn_off_so_1"
local cheese_blocker_2 = "cheese_blocker_2"
local turn_off_so_2 = "turn_off_so_2"
local cheese_blocker_3 = "cheese_blocker_3"
local cheese_blocker_4 = "cheese_blocker_4"
local cheese_blocker_5 = "cheese_blocker_5"
local cheese_blocker_6 = "cheese_blocker_6"
local cheese_blocker_7 = "cheese_blocker_7"
local cheese_blocker_8 = "cheese_blocker_8"
local cheese_blocker_9 = "cheese_blocker_9"
local filter_hard_above = "filter_hard_above"
local filter_overkill = "filter_overkill"
local id_phoney_money = managers.mission:moon_generate_custom_id(phoney_money)
local id_force_slam_door_1 = managers.mission:moon_generate_custom_id(force_slam_door_1)
local id_slam_door_1_failed = managers.mission:moon_generate_custom_id(slam_door_1_failed)
local id_force_slam_door_2 = managers.mission:moon_generate_custom_id(force_slam_door_2)
local id_slam_door_2_failed = managers.mission:moon_generate_custom_id(slam_door_2_failed)
local id_toggle_ambush_peek = managers.mission:moon_generate_custom_id(toggle_ambush_peek)
local id_chance_close_roof_doors = managers.mission:moon_generate_custom_id(chance_close_roof_doors)
local id_add_chance_25 = managers.mission:moon_generate_custom_id(add_chance_25)
local id_pick_doors_2nd_floor = managers.mission:moon_generate_custom_id(pick_doors_2nd_floor)
local id_open_145_door = managers.mission:moon_generate_custom_id(open_145_door)
local id_open_non_145_door = managers.mission:moon_generate_custom_id(open_non_145_door)
local id_disable_easy_doors = managers.mission:moon_generate_custom_id(disable_easy_doors)
local id_filter_easy_doors = managers.mission:moon_generate_custom_id(filter_easy_doors)
local id_inst_in_cokeroom_door_004 = managers.mission:moon_generate_custom_id(inst_in_cokeroom_door_004)
local id_block_washroom_3rdfloor_doors = managers.mission:moon_generate_custom_id(block_washroom_3rdfloor_doors)

local id_chance_block_5th_corner_doors = managers.mission:moon_generate_custom_id(chance_block_5th_corner_doors)
local id_trigger_open_5th_corner_doors = managers.mission:moon_generate_custom_id(trigger_open_5th_corner_doors)
local id_block_5th_corner_doors = managers.mission:moon_generate_custom_id(block_5th_corner_doors)
local id_open_5th_corner_doors = managers.mission:moon_generate_custom_id(open_5th_corner_doors)

local id_chance_block_4th_corridor_doors = managers.mission:moon_generate_custom_id(chance_block_4th_corridor_doors)
local id_trigger_open_4th_corridor_doors = managers.mission:moon_generate_custom_id(trigger_open_4th_corridor_doors)
local id_block_4th_corridor_doors = managers.mission:moon_generate_custom_id(block_4th_corridor_doors)
local id_open_4th_corridor_doors = managers.mission:moon_generate_custom_id(open_4th_corridor_doors)

local id_chance_block_4th_objective_door = managers.mission:moon_generate_custom_id(chance_block_4th_objective_door)
local id_trigger_open_4th_objective_door = managers.mission:moon_generate_custom_id(trigger_open_4th_objective_door)
local id_block_4th_objective_door = managers.mission:moon_generate_custom_id(block_4th_objective_door)
local id_open_4th_objective_door = managers.mission:moon_generate_custom_id(open_4th_objective_door)

local id_disable_ladders = managers.mission:moon_generate_custom_id(disable_ladders)
local id_disable_planks = managers.mission:moon_generate_custom_id(disable_planks)
local id_disable_window_interaction = managers.mission:moon_generate_custom_id(disable_window_interaction)
local id_cheese_blocker_1 = managers.mission:moon_generate_custom_id(cheese_blocker_1)
local id_turn_off_so_1 = managers.mission:moon_generate_custom_id(turn_off_so_1)
local id_cheese_blocker_2 = managers.mission:moon_generate_custom_id(cheese_blocker_2)
local id_turn_off_so_2 = managers.mission:moon_generate_custom_id(turn_off_so_2)
local id_cheese_blocker_3 = managers.mission:moon_generate_custom_id(cheese_blocker_3)
local id_cheese_blocker_4 = managers.mission:moon_generate_custom_id(cheese_blocker_4)
local id_cheese_blocker_5 = managers.mission:moon_generate_custom_id(cheese_blocker_5)
local id_cheese_blocker_6 = managers.mission:moon_generate_custom_id(cheese_blocker_6)
local id_cheese_blocker_7 = managers.mission:moon_generate_custom_id(cheese_blocker_7)
local id_cheese_blocker_8 = managers.mission:moon_generate_custom_id(cheese_blocker_8)
local id_cheese_blocker_9 = managers.mission:moon_generate_custom_id(cheese_blocker_9)
local id_filter_hard_above = managers.mission:moon_generate_custom_id(filter_hard_above)
local id_filter_overkill = managers.mission:moon_generate_custom_id(filter_overkill)

return {
	{
		class = "ElementRandom",
		editor_name = pick_doors_2nd_floor,
		id = id_pick_doors_2nd_floor,
		values = {
			enabled = true,
			amount = 1,
			amount_random = 1,
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
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_1,
		id = id_cheese_blocker_1,
		values = {
			enabled = true,
			position = Vector3(480, 1075, 1575),  -- roof stairwell
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
			on_executed = {
				{ id = id_turn_off_so_1, delay = 0, },
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
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_2,
		id = id_cheese_blocker_2,
		values = {
			enabled = true,
			position = Vector3(480, 1382, 1575),  -- 5th floor corner
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
			on_executed = {
				{ id = id_turn_off_so_2, delay = 0, },
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
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_3,
		id = id_cheese_blocker_3,
		values = {
			enabled = true,
			position = Vector3(-631, -71, 1250),  -- 4th floor corridor
			rotation = Rotation(180, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
		},
	},

	{
		class = "ElementLogicChanceTrigger",
		editor_name = slam_door_1_failed,
		id = id_slam_door_1_failed,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				100256,
			},
			on_executed = {
				{ id = id_cheese_blocker_4, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_4,
		id = id_cheese_blocker_4,
		values = {
			enabled = true,
			position = Vector3(473, 228, 605),  -- 2nd floor slam
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
		},
	},

	{
		class = "ElementLogicChanceTrigger",
		editor_name = slam_door_2_failed,
		id = id_slam_door_2_failed,
		values = {
			enabled = true,
			outcome = "fail",
			elements = {
				101504,
			},
			on_executed = {
				{ id = id_cheese_blocker_5, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_5,
		id = id_cheese_blocker_5,
		values = {
			enabled = true,
			position = Vector3(473, 228, 930),  -- 3rd floor slam
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
		},
	},

	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_6,
		id = id_cheese_blocker_6,
		values = {
			enabled = true,
			position = Vector3(-1970, -200, 930),  -- some other 3rd floor window
			rotation = Rotation(90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
		},
	},

	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_7,
		id = id_cheese_blocker_7,
		values = {
			enabled = true,
			position = Vector3(269, -75, 1580),  -- 5th floor chavez spawn nearest roof stairwell
			rotation = Rotation(180, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
		},
	},
	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_8,
		id = id_cheese_blocker_8,
		values = {
			enabled = true,
			position = Vector3(478, 230, 1578.98),
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up_half",
		},
	},
	{
		class = "ElementSpawnUnit",
		editor_name = cheese_blocker_9,
		id = id_cheese_blocker_9,
		values = {
			enabled = true,
			position = Vector3(474, 1076, 1256),
			rotation = Rotation(-90, 90, 0),
			unit_name = "units/world/props/gym/stn_prop_blinds/stn_prop_blinds_window_up",
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
			on_executed = {
				{ id = id_cheese_blocker_2, delay = 0, },
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
				{ id = id_cheese_blocker_3, delay = 0, },
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
		class = "ElementLogicChanceOperator",
		editor_name = force_slam_door_1,
		id = id_force_slam_door_1,
		values = {
			enabled = true,
			chance = 100,
			operation = "set_chance",
			elements = {
				100256,
			},
		},
	},
	{
		class = "ElementLogicChanceOperator",
		editor_name = force_slam_door_2,
		id = id_force_slam_door_2,
		values = {
			enabled = true,
			chance = 100,
			operation = "set_chance",
			elements = {
				101504,
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
