local mission_custom_script = ASS:script_patches("mission_custom")

if not mission_custom_script then
	return
end

local check_clone = ASS:require("check_clone", true)
local required_values = {
	enabled = false,
	-- execute_on_startup = false,
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
			counter_id = false,  -- number?
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
			backup_so = false,  -- number?
			elements = {},
		}),
	},
	{
		class = "ElementSpawnEnemyDummy",
		values = append_template_values(true, {
			participate_to_group_ai = true,
			enemy = false,  -- string
			force_pickup = "none",
			spawn_action = "none",
			accessibility = "any",
			team = "default",
			voice = 0,
			interval = 0,
			-- moon_data = {},  -- optional custom data, see elementspawncivilian hook
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
			preferred_spawn_groups = {},
		}),
	},
	{
		class = "ElementEnemyPreferedAdd",
		values = append_template_values(nil, {
			-- spawn_points = false,  -- table?
			spawn_groups = {},
		}),
	},
	{
		class = "ElementEnemyPreferedRemove",
		values = append_template_values(nil, {
			elements = {},
		}),
	},
	{
		class = "ElementSpawnCivilian",
		values = append_template_values(true, {
			enemy = false,  -- string
			force_pickup = "none",
			state = "none",
			team = "default",
			-- moon_data = {},  -- optional custom data, see elementspawncivilian hook
		}),
	},
	{
		class = "ElementAreaMinPoliceForce",
		values = append_template_values(true, {
			amount = 2,
		}),
	},
	{
		class = "ElementCarry",
		values = append_template_values(true, {
			operation = false,  -- number
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
for i = 1, #element_templates do
	local template = element_templates[i]

	element_templates[template.class] = template
	element_templates[i] = nil
end

local generated_elements = false
return function()
	if not generated_elements then
		generated_elements = true

		local result = {}
		for i = 1, #mission_custom_script do
			local params = mission_custom_script[i]
			local new_element = check_clone(element_templates[params.class])

			if not new_element then
				ASS:log("error", "No template for element class %s", params.class)
			else
				new_element.editor_name = params.editor_name
				new_element.id = params.id

				for k, v in pairs(params.values) do
					new_element.values[k] = v
				end

				result[i] = new_element
			end
		end

		return result
	end
end
