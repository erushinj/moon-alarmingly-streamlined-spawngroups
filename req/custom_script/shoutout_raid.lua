-- custom murky reinforcement logic, spawn a couple groups each fade
local murkywater = "units/payday2/characters/ene_murkywater_2/ene_murkywater_2"  -- only one loaded

local pick_murky_groups = "pick_murky_groups"
local murky_outside_1 = "murky_outside_1"  -- outside the front gate
local murky_outside_2 = "murky_outside_2"
local murky_outside_3 = "murky_outside_3"
local murky_outside_group = "murky_outside_group"
local murky_spawn_1 = "murky_spawn_1"  -- near player spawn
local murky_spawn_2 = "murky_spawn_2"
local murky_spawn_3 = "murky_spawn_3"
local murky_spawn_group = "murky_spawn_group"
local murky_silo_1 = "murky_silo_1"
local murky_silo_2 = "murky_silo_2"
local murky_silo_3 = "murky_silo_3"
local murky_silo_group = "murky_silo_group"
local murky_roof_1 = "murky_roof_1"
local murky_roof_2 = "murky_roof_2"
local murky_roof_3 = "murky_roof_3"
local murky_roof_group = "murky_roof_group"
local murky_balcony_1 = "murky_balcony_1"  -- upper floor room enemies can come from, near the balcony that causes stuck guards on shadow raid
local murky_balcony_2 = "murky_balcony_2"
local murky_balcony_3 = "murky_balcony_3"
local murky_balcony_group = "murky_balcony_group"
local murky_dock_1 = "murky_dock_1"  -- nearest the dock area of shadow raid (besides balcony group)
local murky_dock_2 = "murky_dock_2"
local murky_dock_3 = "murky_dock_3"
local murky_dock_group = "murky_dock_group"
local id_pick_murky_groups = managers.mission:moon_generate_custom_id(pick_murky_groups)
local id_murky_outside_1 = managers.mission:moon_generate_custom_id(murky_outside_1)
local id_murky_outside_2 = managers.mission:moon_generate_custom_id(murky_outside_2)
local id_murky_outside_3 = managers.mission:moon_generate_custom_id(murky_outside_3)
local id_murky_outside_group = managers.mission:moon_generate_custom_id(murky_outside_group)
local id_murky_spawn_1 = managers.mission:moon_generate_custom_id(murky_spawn_1)
local id_murky_spawn_2 = managers.mission:moon_generate_custom_id(murky_spawn_2)
local id_murky_spawn_3 = managers.mission:moon_generate_custom_id(murky_spawn_3)
local id_murky_spawn_group = managers.mission:moon_generate_custom_id(murky_spawn_group)
local id_murky_silo_1 = managers.mission:moon_generate_custom_id(murky_silo_1)
local id_murky_silo_2 = managers.mission:moon_generate_custom_id(murky_silo_2)
local id_murky_silo_3 = managers.mission:moon_generate_custom_id(murky_silo_3)
local id_murky_silo_group = managers.mission:moon_generate_custom_id(murky_silo_group)
local id_murky_roof_1 = managers.mission:moon_generate_custom_id(murky_roof_1)
local id_murky_roof_2 = managers.mission:moon_generate_custom_id(murky_roof_2)
local id_murky_roof_3 = managers.mission:moon_generate_custom_id(murky_roof_3)
local id_murky_roof_group = managers.mission:moon_generate_custom_id(murky_roof_group)
local id_murky_balcony_1 = managers.mission:moon_generate_custom_id(murky_balcony_1)
local id_murky_balcony_2 = managers.mission:moon_generate_custom_id(murky_balcony_2)
local id_murky_balcony_3 = managers.mission:moon_generate_custom_id(murky_balcony_3)
local id_murky_balcony_group = managers.mission:moon_generate_custom_id(murky_balcony_group)
local id_murky_dock_1 = managers.mission:moon_generate_custom_id(murky_dock_1)
local id_murky_dock_2 = managers.mission:moon_generate_custom_id(murky_dock_2)
local id_murky_dock_3 = managers.mission:moon_generate_custom_id(murky_dock_3)
local id_murky_dock_group = managers.mission:moon_generate_custom_id(murky_dock_group)

return {
	{
		class = "ElementRandom",
		editor_name = pick_murky_groups,
		id = id_pick_murky_groups,
		values = {
			enabled = true,
			amount = 3,
			on_executed = {
				{ id = id_murky_outside_group, delay = 0, },
				{ id = id_murky_spawn_group, delay = 0, },
				{ id = id_murky_silo_group, delay = 0, },
				{ id = id_murky_roof_group, delay = 0, },
				{ id = id_murky_balcony_group, delay = 0, },
				{ id = id_murky_dock_group, delay = 0, },
			},
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_outside_group,
		id = id_murky_outside_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_outside_1,
				id_murky_outside_2,
				id_murky_outside_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_outside_1,
		id = id_murky_outside_1,
		values = {
			enabled = true,
			position = Vector3(4700, 0, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_outside_2,
		id = id_murky_outside_2,
		values = {
			enabled = true,
			position = Vector3(4700, 50, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_outside_3,
		id = id_murky_outside_3,
		values = {
			enabled = true,
			position = Vector3(4700, 100, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_spawn_group,
		id = id_murky_spawn_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_spawn_1,
				id_murky_spawn_2,
				id_murky_spawn_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_spawn_1,
		id = id_murky_spawn_1,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(3950, 2325, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_spawn_2,
		id = id_murky_spawn_2,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(4075, 2325, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_spawn_3,
		id = id_murky_spawn_3,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(4200, 2325, 975),
			rotation = Rotation(180, 0, -0),
			enemy = murkywater,
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_dock_group,
		id = id_murky_dock_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_dock_1,
				id_murky_dock_2,
				id_murky_dock_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_dock_1,
		id = id_murky_dock_1,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(2025, -3900, 975),
			rotation = Rotation(0, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_dock_2,
		id = id_murky_dock_2,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(1900, -3900, 975),
			rotation = Rotation(0, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_dock_3,
		id = id_murky_dock_3,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(1775, -3900, 975),
			rotation = Rotation(0, 0, -0),
			enemy = murkywater,
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_silo_group,
		id = id_murky_silo_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_silo_1,
				id_murky_silo_2,
				id_murky_silo_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_silo_1,
		id = id_murky_silo_1,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(-4900, -1750, 975),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_silo_2,
		id = id_murky_silo_2,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(-4900, -1625, 975),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_silo_3,
		id = id_murky_silo_3,
		values = {
			enabled = true,
			spawn_action = "e_sp_over_3m",
			position = Vector3(-4900, -1500, 975),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_roof_group,
		id = id_murky_roof_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_roof_1,
				id_murky_roof_2,
				id_murky_roof_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_roof_1,
		id = id_murky_roof_1,
		values = {
			enabled = true,
			position = Vector3(-2675, -4950, 1775),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_roof_2,
		id = id_murky_roof_2,
		values = {
			enabled = true,
			position = Vector3(-2625, -4950, 1775),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_roof_3,
		id = id_murky_roof_3,
		values = {
			enabled = true,
			position = Vector3(-2575, -4950, 1775),
			rotation = Rotation(270, 0, -0),
			enemy = murkywater,
		},
	},

	{
		class = "ElementSpawnEnemyGroup",
		editor_name = murky_balcony_group,
		id = id_murky_balcony_group,
		values = {
			enabled = true,
			amount = 3,
			elements = {
				id_murky_balcony_1,
				id_murky_balcony_2,
				id_murky_balcony_3,
			},
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_balcony_1,
		id = id_murky_balcony_1,
		values = {
			enabled = true,
			position = Vector3(-2850, -5350, 1375),
			rotation = Rotation(90, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_balcony_2,
		id = id_murky_balcony_2,
		values = {
			enabled = true,
			position = Vector3(-2850, -5400, 1375),
			rotation = Rotation(90, 0, -0),
			enemy = murkywater,
		},
	},
	{
		class = "ElementSpawnEnemyDummy",
		editor_name = murky_balcony_3,
		id = id_murky_balcony_3,
		values = {
			enabled = true,
			position = Vector3(-2850, -5450, 1375),
			rotation = Rotation(90, 0, -0),
			enemy = murkywater,
		},
	},
}
