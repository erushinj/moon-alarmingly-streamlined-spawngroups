local sniper = {
	enemy = tweak_data.levels:moon_units("sniper"),
}

-- ship/dock snipers
local sniper_area_trigger_1 = "sniper_area_trigger_1"
local sniper_toggle_1 = "sniper_toggle_1"
local sniper_1 = "sniper_1"
local sniper_so_1 = "sniper_so_1"
local sniper_death_1 = "sniper_death_1"
local id_sniper_1 = managers.mission:moon_generate_custom_id(sniper_1)
local id_sniper_so_1 = managers.mission:moon_generate_custom_id(sniper_so_1)
local id_sniper_toggle_1 = managers.mission:moon_generate_custom_id(sniper_toggle_1)
local id_sniper_area_trigger_1 = managers.mission:moon_generate_custom_id(sniper_area_trigger_1)
local id_sniper_death_1 = managers.mission:moon_generate_custom_id(sniper_death_1)

local sniper_area_trigger_2 = "sniper_area_trigger_2"
local sniper_toggle_2 = "sniper_toggle_2"
local sniper_2 = "sniper_2"
local sniper_so_2 = "sniper_so_2"
local sniper_death_2 = "sniper_death_2"
local id_sniper_2 = managers.mission:moon_generate_custom_id(sniper_2)
local id_sniper_so_2 = managers.mission:moon_generate_custom_id(sniper_so_2)
local id_sniper_toggle_2 = managers.mission:moon_generate_custom_id(sniper_toggle_2)
local id_sniper_area_trigger_2 = managers.mission:moon_generate_custom_id(sniper_area_trigger_2)
local id_sniper_death_2 = managers.mission:moon_generate_custom_id(sniper_death_2)

local sniper_area_trigger_3 = "sniper_area_trigger_3"
local sniper_toggle_3 = "sniper_toggle_3"
local sniper_3 = "sniper_3"
local sniper_so_3 = "sniper_so_3"
local sniper_death_3 = "sniper_death_3"
local id_sniper_3 = managers.mission:moon_generate_custom_id(sniper_3)
local id_sniper_so_3 = managers.mission:moon_generate_custom_id(sniper_so_3)
local id_sniper_toggle_3 = managers.mission:moon_generate_custom_id(sniper_toggle_3)
local id_sniper_area_trigger_3 = managers.mission:moon_generate_custom_id(sniper_area_trigger_3)
local id_sniper_death_3 = managers.mission:moon_generate_custom_id(sniper_death_3)

local ship_sniper_spawn = "ship_sniper_spawn"
local ship_sniper_respawn_normal = "ship_sniper_respawn_normal"
local ship_sniper_respawn_hard = "ship_sniper_respawn_hard"
local ship_sniper_respawn_overkill = "ship_sniper_respawn_overkill"
local id_ship_sniper_spawn = managers.mission:moon_generate_custom_id(ship_sniper_spawn)
local id_ship_sniper_respawn_normal = managers.mission:moon_generate_custom_id(ship_sniper_respawn_normal)
local id_ship_sniper_respawn_hard = managers.mission:moon_generate_custom_id(ship_sniper_respawn_hard)
local id_ship_sniper_respawn_overkill = managers.mission:moon_generate_custom_id(ship_sniper_respawn_overkill)

-- ground sniper
local sniper_toggle_4 = "sniper_toggle_4"
local sniper_4 = "sniper_4"
local sniper_so_4_1 = "sniper_so_4_1"
local sniper_so_4_2 = "sniper_so_4_2"
local sniper_death_4 = "sniper_death_4"
local id_sniper_toggle_4 = managers.mission:moon_generate_custom_id(sniper_toggle_4)
local id_sniper_4 = managers.mission:moon_generate_custom_id(sniper_4)
local id_sniper_so_4_1 = managers.mission:moon_generate_custom_id(sniper_so_4_1)
local id_sniper_so_4_2 = managers.mission:moon_generate_custom_id(sniper_so_4_2)
local id_sniper_death_4 = managers.mission:moon_generate_custom_id(sniper_death_4)

local ground_sniper_spawn = "ground_sniper_spawn"
local ground_sniper_respawn_normal = "ground_sniper_respawn_normal"
local ground_sniper_respawn_hard = "ground_sniper_respawn_hard"
local ground_sniper_respawn_overkill = "ground_sniper_respawn_overkill"
local id_ground_sniper_spawn = managers.mission:moon_generate_custom_id(ground_sniper_spawn)
local id_ground_sniper_respawn_normal = managers.mission:moon_generate_custom_id(ground_sniper_respawn_normal)
local id_ground_sniper_respawn_hard = managers.mission:moon_generate_custom_id(ground_sniper_respawn_hard)
local id_ground_sniper_respawn_overkill = managers.mission:moon_generate_custom_id(ground_sniper_respawn_overkill)

return {
	{
		class = "ElementFilter",
		editor_name = ship_sniper_respawn_normal,
		id = id_ship_sniper_respawn_normal,
		values = managers.mission:moon_generate_preset_values("filter|normal", {
			enabled = true,
			on_executed = {
				{ id = id_ship_sniper_spawn, delay = 60, delay_rand = 30, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = ship_sniper_respawn_hard,
		id = id_ship_sniper_respawn_hard,
		values = managers.mission:moon_generate_preset_values("filter|hard", {
			enabled = true,
			on_executed = {
				{ id = id_ship_sniper_spawn, delay = 45, delay_rand = 45, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = ship_sniper_respawn_overkill,
		id = id_ship_sniper_respawn_overkill,
		values = managers.mission:moon_generate_preset_values("filter|overkill", {
			enabled = true,
			on_executed = {
				{ id = id_ship_sniper_spawn, delay = 30, delay_rand = 60, },
			},
		}),
	},
	{
		class = "MissionScriptElement",
		editor_name = ship_sniper_spawn,
		id = id_ship_sniper_spawn,
		values = {
			enabled = true,
			on_executed = {
				{ id = id_sniper_1, delay = 0, },
				{ id = id_sniper_2, delay = 0, },
				{ id = id_sniper_3, delay = 0, },
			},
		},
	},

	-- dock 8 sniper
	{
		class = "ElementAreaTrigger",
		editor_name = sniper_area_trigger_1,
		id = id_sniper_area_trigger_1,
		values = {
			enabled = true,
			position = Vector3(5925, 1950, 540),
			rotation = Rotation(0, 0, -0),
			instigator = "enemies",
			width = 100,
			depth = 500,
			height = 400,
			trigger_times = 1,
			on_executed = {
				{ id = id_sniper_toggle_1, delay = 0, },
				{ id = id_sniper_1, delay = 0, },
				{ id = id_sniper_toggle_4, delay = 0, },
				{ id = id_sniper_4, delay = 15, delay_rand = 45, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = sniper_toggle_1,
		id = id_sniper_toggle_1,
		values = {
			enabled = true,
			toggle = "on",
			set_trigger_times = 1,
			elements = {
				id_sniper_1,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = sniper_1,
		id = id_sniper_1,
		values = {
			participate_to_group_ai = false,
			position = Vector3(5925, 1850, 540),
			rotation = Rotation(-180, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_sniper_so_1, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = sniper_so_1,
		id = id_sniper_so_1,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(5700, 900, 540),
			rotation = Rotation(90, 0, -0),
		}),
	},
	{
		class = "ElementEnemyDummyTrigger",
		editor_name = sniper_death_1,
		id = id_sniper_death_1,
		values = {
			enabled = true,
			elements = {
				id_sniper_1,
			},
			on_executed = {
				{ id = id_sniper_toggle_1, delay = 0, },
				{ id = id_ship_sniper_respawn_normal, delay = 0, },
				{ id = id_ship_sniper_respawn_hard, delay = 0, },
				{ id = id_ship_sniper_respawn_overkill, delay = 0, },
			},
		},
	},

	-- dock 9 sniper
	{
		class = "ElementAreaTrigger",
		editor_name = sniper_area_trigger_2,
		id = id_sniper_area_trigger_2,
		values = {
			enabled = true,
			position = Vector3(2400, -3600, 815),
			rotation = Rotation(0, 0, -0),
			instigator = "enemies",
			width = 500,
			depth = 100,
			height = 400,
			trigger_times = 1,
			on_executed = {
				{ id = id_sniper_toggle_2, delay = 0, },
				{ id = id_sniper_2, delay = 0, },
				{ id = id_sniper_toggle_4, delay = 0, },
				{ id = id_sniper_4, delay = 15, delay_rand = 45, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = sniper_toggle_2,
		id = id_sniper_toggle_2,
		values = {
			enabled = true,
			toggle = "on",
			set_trigger_times = 1,
			elements = {
				id_sniper_2,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = sniper_2,
		id = id_sniper_2,
		values = {
			participate_to_group_ai = false,
			position = Vector3(3225, -3275, 540),
			rotation = Rotation(-90, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_sniper_so_2, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = sniper_so_2,
		id = id_sniper_so_2,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(3975, -3075, 540),
			rotation = Rotation(0, 0, -0),
		}),
	},
	{
		class = "ElementEnemyDummyTrigger",
		editor_name = sniper_death_2,
		id = id_sniper_death_2,
		values = {
			enabled = true,
			elements = {
				id_sniper_2,
			},
			on_executed = {
				{ id = id_sniper_toggle_2, delay = 0, },
				{ id = id_ship_sniper_respawn_normal, delay = 0, },
				{ id = id_ship_sniper_respawn_hard, delay = 0, },
				{ id = id_ship_sniper_respawn_overkill, delay = 0, },
			},
		},
	},

	-- dock 7 sniper
	{
		class = "ElementAreaTrigger",
		editor_name = sniper_area_trigger_3,
		id = id_sniper_area_trigger_3,
		values = {
			enabled = true,
			position = Vector3(4825, 4400, 540),
			rotation = Rotation(0, 0, -0),
			instigator = "enemies",
			width = 500,
			depth = 100,
			height = 400,
			trigger_times = 1,
			on_executed = {
				{ id = id_sniper_toggle_3, delay = 0, },
				{ id = id_sniper_3, delay = 0, },
				{ id = id_sniper_toggle_4, delay = 0, },
				{ id = id_sniper_4, delay = 15, delay_rand = 45, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = sniper_toggle_3,
		id = id_sniper_toggle_3,
		values = {
			enabled = true,
			toggle = "on",
			set_trigger_times = 1,
			elements = {
				id_sniper_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = sniper_3,
		id = id_sniper_3,
		values = {
			participate_to_group_ai = false,
			position = Vector3(4700, 4400, 540),
			rotation = Rotation(90, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_sniper_so_3, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = sniper_so_3,
		id = id_sniper_so_3,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(3700, 4125, 540),
			rotation = Rotation(180, 0, -0),
		}),
	},
	{
		class = "ElementEnemyDummyTrigger",
		editor_name = sniper_death_3,
		id = id_sniper_death_3,
		values = {
			enabled = true,
			elements = {
				id_sniper_3,
			},
			on_executed = {
				{ id = id_sniper_toggle_3, delay = 0, },
				{ id = id_ship_sniper_respawn_normal, delay = 0, },
				{ id = id_ship_sniper_respawn_hard, delay = 0, },
				{ id = id_ship_sniper_respawn_overkill, delay = 0, },
			},
		},
	},

	{
		class = "ElementFilter",
		editor_name = ground_sniper_respawn_normal,
		id = id_ground_sniper_respawn_normal,
		values = managers.mission:moon_generate_preset_values("filter|normal", {
			enabled = true,
			on_executed = {
				{ id = id_ground_sniper_spawn, delay = 60, delay_rand = 30, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = ground_sniper_respawn_hard,
		id = id_ground_sniper_respawn_hard,
		values = managers.mission:moon_generate_preset_values("filter|hard", {
			enabled = true,
			on_executed = {
				{ id = id_ground_sniper_spawn, delay = 45, delay_rand = 45, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = ground_sniper_respawn_overkill,
		id = id_ground_sniper_respawn_overkill,
		values = managers.mission:moon_generate_preset_values("filter|overkill", {
			enabled = true,
			on_executed = {
				{ id = id_ground_sniper_spawn, delay = 30, delay_rand = 60, },
			},
		}),
	},
	{
		class = "MissionScriptElement",
		editor_name = ground_sniper_spawn,
		id = id_ground_sniper_spawn,
		values = {
			enabled = true,
			on_executed = {
				{ id = id_sniper_4, delay = 0, },
			},
		},
	},
	{
		class = "ElementToggle",
		editor_name = sniper_toggle_4,
		id = id_sniper_toggle_4,
		values = {
			enabled = true,
			toggle = "on",
			set_trigger_times = 1,
			elements = {
				id_sniper_4,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = sniper_4,
		id = id_sniper_4,
		values = {
			participate_to_group_ai = false,
			position = Vector3(-2925, -2325, 0),  -- ground sniper spawn
			rotation = Rotation(90, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_sniper_so_4_1, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = sniper_so_4_1,
		id = id_sniper_so_4_1,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-1600, -1450, 0),
			rotation = Rotation(-90, 0, -0),
			on_executed = {
				{ id = id_sniper_so_4_2, delay = 30, },
			},
		}),
	},
	{
		class = "ElementSpecialObjective",
		editor_name = sniper_so_4_2,
		id = id_sniper_so_4_2,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-500, 975, 0),
			rotation = Rotation(-90, 0, -0),
			on_executed = {
				{ id = id_sniper_so_4_1, delay = 30, },
			},
		}),
	},
	{
		class = "ElementEnemyDummyTrigger",
		editor_name = sniper_death_4,
		id = id_sniper_death_4,
		values = {
			enabled = true,
			elements = {
				id_sniper_4,
			},
			on_executed = {
				{ id = id_sniper_toggle_4, delay = 0, },
				{ id = id_ground_sniper_respawn_normal, delay = 0, },
				{ id = id_ground_sniper_respawn_hard, delay = 0, },
				{ id = id_ground_sniper_respawn_overkill, delay = 0, },
			},
		},
	},
}
