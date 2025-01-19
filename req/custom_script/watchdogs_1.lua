local sniper = {
	enemy = tweak_data.moon.units.sniper,
}

local ambush_sniper_1 = "ambush_sniper_1"
local ambush_sniper_2 = "ambush_sniper_2"
local ambush_sniper_3 = "ambush_sniper_3"
local ambush_sniper_4 = "ambush_sniper_4"
local ambush_sniper_5 = "ambush_sniper_5"
local ambush_sniper_6 = "ambush_sniper_6"
local ambush_sniper_so_1 = "ambush_sniper_so_1"
local ambush_sniper_so_2 = "ambush_sniper_so_2"
local ambush_sniper_so_3 = "ambush_sniper_so_3"
local ambush_sniper_so_4 = "ambush_sniper_so_4"
local ambush_sniper_so_5 = "ambush_sniper_so_5"
local ambush_sniper_so_6 = "ambush_sniper_so_6"
local ambush_sniper_counter = "ambush_sniper_counter"
local ambush_sniper_counter_add = "ambush_sniper_counter_add"
local ambush_sniper_filter_hard_above = "ambush_sniper_filter_hard_above"
local ambush_sniper_filter_overkill = "ambush_sniper_filter_overkill"
local ambush_sniper_spawn = "ambush_sniper_spawn"
local id_ambush_sniper_1 = managers.mission:moon_generate_custom_id(ambush_sniper_1)
local id_ambush_sniper_2 = managers.mission:moon_generate_custom_id(ambush_sniper_2)
local id_ambush_sniper_3 = managers.mission:moon_generate_custom_id(ambush_sniper_3)
local id_ambush_sniper_4 = managers.mission:moon_generate_custom_id(ambush_sniper_4)
local id_ambush_sniper_5 = managers.mission:moon_generate_custom_id(ambush_sniper_5)
local id_ambush_sniper_6 = managers.mission:moon_generate_custom_id(ambush_sniper_6)
local id_ambush_sniper_so_1 = managers.mission:moon_generate_custom_id(ambush_sniper_so_1)
local id_ambush_sniper_so_2 = managers.mission:moon_generate_custom_id(ambush_sniper_so_2)
local id_ambush_sniper_so_3 = managers.mission:moon_generate_custom_id(ambush_sniper_so_3)
local id_ambush_sniper_so_4 = managers.mission:moon_generate_custom_id(ambush_sniper_so_4)
local id_ambush_sniper_so_5 = managers.mission:moon_generate_custom_id(ambush_sniper_so_5)
local id_ambush_sniper_so_6 = managers.mission:moon_generate_custom_id(ambush_sniper_so_6)
local id_ambush_sniper_counter = managers.mission:moon_generate_custom_id(ambush_sniper_counter)
local id_ambush_sniper_counter_add = managers.mission:moon_generate_custom_id(ambush_sniper_counter_add)
local id_ambush_sniper_filter_hard_above = managers.mission:moon_generate_custom_id(ambush_sniper_filter_hard_above)
local id_ambush_sniper_filter_overkill = managers.mission:moon_generate_custom_id(ambush_sniper_filter_overkill)
local id_ambush_sniper_spawn = managers.mission:moon_generate_custom_id(ambush_sniper_spawn)

return {
	{
		class = "ElementCounter",
		editor_name = ambush_sniper_counter,
		id = id_ambush_sniper_counter,
		values = {
			enabled = true,
			counter_target = 1,
		},
	},
	{
		class = "ElementCounterOperator",
		editor_name = ambush_sniper_counter_add,
		id = id_ambush_sniper_counter_add,
		values = {
			enabled = true,
			amount = 1,
			operation = "add",
			elements = {
				id_ambush_sniper_counter,
			},
		},
	},
	{
		class = "ElementRandom",
		editor_name = ambush_sniper_spawn,
		id = id_ambush_sniper_spawn,
		values = {
			enabled = true,
			amount = 1,
			counter_id = id_ambush_sniper_counter,
			on_executed = {
				{ id = id_ambush_sniper_1, delay = 0, },
				{ id = id_ambush_sniper_2, delay = 0, },
				{ id = id_ambush_sniper_3, delay = 0, },
				{ id = id_ambush_sniper_4, delay = 0, },
				{ id = id_ambush_sniper_5, delay = 0, },
				{ id = id_ambush_sniper_6, delay = 0, },
			},
		},
	},

	{
		class = "ElementFilter",
		editor_name = ambush_sniper_filter_hard_above,
		id = id_ambush_sniper_filter_hard_above,
		values = managers.mission:moon_generate_preset_values("filter|hard_above", {
			enabled = true,
			on_executed = {
				{ id = id_ambush_sniper_counter_add, delay = 0, },
			},
		}),
	},
	{
		class = "ElementFilter",
		editor_name = ambush_sniper_filter_overkill,
		id = id_ambush_sniper_filter_overkill,
		values = managers.mission:moon_generate_preset_values("filter|overkill", {
			enabled = true,
			on_executed = {
				{ id = id_ambush_sniper_counter_add, delay = 0, },
			},
		}),
	},

	-- by bridge that gets broken on mh+
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_1,
		id = id_ambush_sniper_1,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-625, 1650, 800),
			rotation = Rotation(180, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_1, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_1,
		id = id_ambush_sniper_so_1,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-625, 1650, 800),
			rotation = Rotation(180, 0, -0),
		}),
	},

	-- far side of bridge
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_2,
		id = id_ambush_sniper_2,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-2725, 1275, 814),
			rotation = Rotation(-90, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_2, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_2,
		id = id_ambush_sniper_so_2,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-2725, 1275, 814),
			rotation = Rotation(-90, 0, -0),
		}),
	},

	-- rooftop that normally has snipers
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_3,
		id = id_ambush_sniper_3,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-3400, -2150, 1040),
			rotation = Rotation(-45, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_3, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_3,
		id = id_ambush_sniper_so_3,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-3400, -2150, 1040),
			rotation = Rotation(-45, 0, -0),
		}),
	},

	-- rooftop enemies never go on that has navigation for some reason
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_4,
		id = id_ambush_sniper_4,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-50, -925, 840),
			rotation = Rotation(0, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_4, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_4,
		id = id_ambush_sniper_so_4,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-50, -925, 840),
			rotation = Rotation(0, 0, -0),
		}),
	},

	-- grey car near far swat van
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_5,
		id = id_ambush_sniper_5,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-3825, -350, 20),
			rotation = Rotation(-90, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_5, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_5,
		id = id_ambush_sniper_so_5,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-3825, -350, 20),
			rotation = Rotation(-90, 0, -0),
		}),
	},

	-- black car near fence with boards on other side of the street
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = ambush_sniper_6,
		id = id_ambush_sniper_6,
		values = {
			enabled = true,
			participate_to_group_ai = false,
			position = Vector3(-2700, -1775, 20),
			rotation = Rotation(-45, 0, -0),
			trigger_times = 1,
			moon_data = sniper,
			on_executed = {
				{ id = id_ambush_sniper_so_6, delay = 0, },
			},
		},
	},
	{
		class = "ElementSpecialObjective",
		editor_name = ambush_sniper_so_6,
		id = id_ambush_sniper_so_6,
		values = managers.mission:moon_generate_preset_values("SO|sniper", {
			enabled = true,
			position = Vector3(-2700, -1775, 20),
			rotation = Rotation(-45, 0, -0),
		}),
	},
}
