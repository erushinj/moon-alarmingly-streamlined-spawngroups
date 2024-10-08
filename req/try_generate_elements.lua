local custom_script = ASS:script_patches("custom")

if not custom_script then
	return
end

local required_values = {
	enabled = false,
	trigger_times = 0,
	base_delay = 0,
	on_executed = {},
}
local common_values = {
	position = Vector3(0, 0, 0),
	rotation = Rotation(0, 0, -0),
}
local function append_template_values(has_common, values)
	return table.map_append(values, required_values, has_common and common_values or nil)
end

local element_templates = {
	{
		class = "MissionScriptElement",
		module = "CoreMissionScriptElement",
		values = append_template_values(nil, {}),
	},
	{
		class = "ElementPlaySound",
		module = "CoreElementPlaySound",
		values = append_template_values(true, {
			interrupt = false,
			sound_event = nil,  -- string
			use_instigator = false,
			use_play_func = false,
			append_prefix = false,
			elements = {},
		}),
	},
	{
		class = "ElementInstanceInputEvent",
		module = "CoreElementInstance",
		values = append_template_values(nil, {
			instance = nil,  -- string (prefer event_list)
			event = nil,  -- string (prefer event_list)
			event_list = {},
		}),
	},
	{
		class = "ElementUnitSequence",
		module = "CoreElementUnitSequence",
		values = append_template_values(true, {
			only_for_local_player = false,
			trigger_list = {},
		}),
	},
	{
		class = "ElementGlobalEventTrigger",
		module = "CoreElementGlobalEventTrigger",
		values = append_template_values(nil, {
			global_event = "start_assault",
		}),
	},
	{
		class = "ElementLogicChance",
		module = "CoreElementLogicChance",
		values = append_template_values(true, {
			chance = 50,
		}),
	},
	{
		class = "ElementLogicChanceOperator",
		module = "CoreElementLogicChance",
		values = append_template_values(true, {
			chance = 50,
			operation = "set_chance",
			elements = {},
		}),
	},
	{
		class = "ElementLogicChanceTrigger",
		module = "CoreElementLogicChance",
		values = append_template_values(true, {
			outcome = "success",
			elements = {},
		}),
	},
	{
		class = "ElementTimer",
		module = "CoreElementTimer",
		values = append_template_values(nil, {
			digital_gui_unit_ids = nil,  -- table
			timer = 60,  -- can also be a table { min, max, } ?
		}),
	},
	{
		class = "ElementTimerOperator",
		module = "CoreElementTimer",
		values = append_template_values(true, {
			elements = {},
			operation = "start",
			time = 30,  -- can also be a table { min, max, } ?
		}),
	},
	{
		class = "ElementTimerTrigger",
		module = "CoreElementTimer",
		values = append_template_values(true, {
			elements = {},
			time = 30,
		}),
	},
	{
		class = "ElementToggle",
		module = "CoreElementToggle",
		values = append_template_values(nil, {
			elements = {},
			toggle = "toggle",
			set_trigger_times = -1,
		}),
	},
	{
		class = "ElementRandom",
		module = "CoreElementRandom",
		values = append_template_values(nil, {
			counter_id = nil,  -- number, optional
			amount = 1,
			amount_random = 0,
		}),
	},
	{
		class = "ElementOperator",
		module = "CoreElementOperator",
		values = append_template_values(nil, {
			operation = "add",
			elements = {},
		}),
	},
	{
		class = "ElementAreaTrigger",
		module = "CoreElementArea",
		values = append_template_values(true, {
			instigator = "enemies",
			trigger_on = "on_enter",
			interval = 0.5,
			shape_type = "box",
			amount = 1,  -- can also be a string "all"
			depth = 0,
			height = 0,
			width = 0,
			radius = 0,
			spawn_unit_elements = {},
		}),
	},
	{
		class = "ElementAiGlobalEvent",
		values = append_template_values(true, {
			wave_mode = "none",
			AI_event = "none",
			blame = "empty",
		}),
	},
	{
		class = "ElementAIRemove",
		values = append_template_values(true, {
			force_ragdoll = false,
			true_death = true,
			use_instigator = false,
			backup_so = nil,  -- number, optional
			elements = {},
		}),
	},
	{
		class = "ElementSpawnEnemyDummy",
		values = append_template_values(true, {
			participate_to_group_ai = true,
			enemy = nil,  -- string
			force_pickup = "none",
			spawn_action = "none",
			accessibility = "any",
			team = "default",
			voice = 0,
			interval = 0,
			moon_data = nil,  -- table, optional, see elementspawncivilian hook
		}),
	},
	{
		class = "ElementEnemyDummyTrigger",
		values = append_template_values(nil, {
			event = "death",
			elements = {},
		}),
	},
	{
		class = "ElementSpawnEnemyGroup",
		values = append_template_values(true, {
			ignore_disabled = false,
			team = "default",
			spawn_type = "ordered",
			interval = 0,
			amount = 0,
			elements = {},
			preferred_spawn_groups = nil,  -- table, only needed for GroupAI spawns
		}),
	},
	{
		class = "ElementEnemyPreferedAdd",
		values = append_template_values(nil, {
			spawn_points = nil,  -- table, optional, seems spawn_groups is preferred
			spawn_groups = {},
		}),
	},
	{
		class = "ElementEnemyPreferedRemove",
		values = append_template_values(nil, {
			elements = {},  -- points to ElementEnemyPreferedAdd elements
		}),
	},
	{
		class = "ElementSpawnCivilian",
		values = append_template_values(true, {
			enemy = false,  -- string
			force_pickup = "none",
			state = "none",
			team = "default",
			moon_data = nil,  -- table, optional, see elementspawncivilian hook
		}),
	},
	{
		class = "ElementAreaMinPoliceForce",
		values = append_template_values(true, {
			amount = 2,
		}),
	},
	{
		class = "ElementDisableUnit",
		values = append_template_values(nil, {
			unit_ids = {},
		}),
	},
	{
		class = "ElementCarry",
		values = append_template_values(true, {
			operation = nil,  -- string, required to do anything
			type_filter = "none",
		}),
	},
	{
		class = "ElementFilter",
		values = append_template_values(nil, {
			platform_win32 = true,
			difficulty_easy = true,
			difficulty_normal = true,
			difficulty_hard = true,
			difficulty_overkill = true,
			difficulty_overkill_145 = true,
			difficulty_easy_wish = true,
			difficulty_overkill_290 = true,
			difficulty_sm_wish = true,
			player_1 = true,
			player_2 = true,
			player_3 = true,
			player_4 = true,
			mode_control = true,
			mode_assault = true,
		}),
	},
	{
		class = "ElementSpecialObjective",
		values = append_template_values(true, {
			use_instigator = true,
			is_navigation_link = false,
			align_position = true,
			align_rotation = true,
			needs_pos_rsrv = true,
			repeatable = false,
			forced = true,
			no_arrest = false,
			scan = true,
			allow_followup_self = false,
			so_action = "none",
			ai_group = "enemies",
			interaction_voice = "none",
			path_style = "none",
			path_haste = "none",
			patrol_path = "none",
			trigger_on = "none",
			interaction_voice = "none",
			path_stance = "none",
			pose = "none",
			attitude = "none",
			interval = -1,
			search_distance = 2000,
			base_chance = 1,
			chance_inc = 0,
			action_duration_min = 0,
			action_duration_max = 0,
			interrupt_dis = 0,
			interrupt_dmg = 0,
			followup_elements = {},
			spawn_instigator_ids = {},
			SO_access = {},
		}),
	},
}
for i, template in pairs(element_templates) do
	element_templates[i] = nil
	element_templates[template.class] = template
end

return function()
	local result = {}

	for _, params in pairs(custom_script) do
		local element = ASS.utils.check_clone(element_templates[params.class])

		if not element then
			ASS:log("error", "No template for element class \"%s\"!", params.class)
		else
			element.editor_name = params.editor_name
			element.id = params.id

			for k, v in pairs(params.values) do
				element.values[k] = v
			end

			result[element] = element
		end
	end

	return result
end
