if ASS.is_editor_or_client then
	return
end

local level_id = ASS.level_id

Hooks:PreHook( MissionManager, "init", "ass_init", function(self)
	if ElementAIGroupType then  -- beardlib custom element type
		Hooks:PostHook( ElementAIGroupType, "on_executed", "ass_on_executed", function()
			tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_tiers)
		end )
	end
end )

local custom_element_ids = {}
local last_id = 0
local add_save_state_cb_original = MissionScript.add_save_state_cb
function MissionScript:add_save_state_cb(id, ...)
	if not table.contains(custom_element_ids, id) then
		return add_save_state_cb_original(self, id, ...)
	end
end

function MissionManager:moon_generate_custom_id(editor_name)
	local id = custom_element_ids[editor_name]

	if not id then
		id = last_id + 1

		while self:get_element_by_id(id) do
			id = id + 1
		end

		custom_element_ids[editor_name] = id
		last_id = id
	end

	return id
end

function MissionManager:moon_generate_preset_values(to_split, values)
	local params_list = to_split:split("|")
	local params = table.map_keys(params_list)
	local typ, preset = params_list[1], params_list[2]
	local result

	if typ == "SO" then
		local access = params_list[3]

		if preset == "sniper" then
			result = {
				so_action = "AI_sniper",
			}
		elseif preset == "hunt" then
			result = {
				so_action = "AI_hunt",
				path_style = "none",
			}
		elseif preset == "defend" then
			result = {
				so_action = "AI_defend",
			}
		elseif preset == "navlink" then
			result = {
				use_instigator = false,
				is_navigation_link = true,
				forced = false,
				attitude = "none",
				path_haste = "none",
				path_stance = "none",
				pose = "none",
			}
		end

		if result then
			result.SO_access = tweak_data.moon.access_filters[access] or tweak_data.moon.access_filters.any
			result.path_style = result.path_style or "destination"
			result.attitude = result.attitude or params.avoid and "avoid" or "engage"
			result.path_haste = result.path_haste or params.walk and "walk" or "run"
			result.path_stance = result.path_stance or params.cbt and "cbt" or params.ntl and "ntl" or "hos"
			result.pose = result.pose or params.crouch and "crouch" or "stand"
		end
	elseif typ == "filter" then
		result = ASS.utils.set_difficulty_groups(preset)

		if result then
			table.map_append(result, {
				player_1 = not params.no_p1,
				player_2 = not params.no_p2,
				player_3 = not params.no_p3,
				player_4 = not params.no_p4,
				mode_control = not params.assault,
				mode_assault = not params.control,
			})
		end
	end

	-- if no result, things will likely go wrong anyway
	if result then
		return values and table.map_append(result, values) or result
	end

	ASS:log("warn", "Invalid params \"%s\" in MissionManager:moon_generate_preset_values!", to_split)
end

local generated
Hooks:PreHook( MissionScript, "init", "ass_init", function(self, data)
	if not generated and data and data.name == "default" then
		generated = true

		local try_generate_elements = ASS:require("req/try_generate_elements")
		local new_elements = try_generate_elements and try_generate_elements()
		if new_elements then
			ASS:log("info", "Current level has custom script patches...")

			for element in pairs(new_elements) do
				table.insert(data.elements, element)
			end
		end
	end
end )

local merged
Hooks:PostHook( StreamHeist, "mission_script_patches", "ass_mission_script_patches", function(self)
	if not merged then
		merged = true

		if not self._mission_script_patches then
			local remap = ({
				branchbank_russia = "branchbank",
			})[level_id]

			if remap then
				self._mission_script_patches = self:require("mission_script/" .. remap) or false
			end
		end

		local ass_mission_script_patches = ASS:script_patches("mission")
		if ass_mission_script_patches then
			ASS:log("info", "Current level has mission script patches...")

			if not self._mission_script_patches then
				self._mission_script_patches = ass_mission_script_patches
			else
				local function merge_patches(base_patch, to_merge)
					for id, data in pairs(to_merge) do
						if type(base_patch[id]) == "table" and type(data) == "table" then
							if base_patch == self._mission_script_patches then
								base_patch[id] = deep_clone(base_patch[id])
							end

							if base_patch[id][1] then
								for _, v in pairs(data) do
									table.insert(base_patch[id], v)
								end
							else
								merge_patches(base_patch[id], data)
							end
						else
							base_patch[id] = data
						end
					end
				end

				merge_patches(self._mission_script_patches, ass_mission_script_patches)
			end
		end

		if self._mission_script_patches then
			local spawn_group_mapping = tweak_data.moon.spawn_group_mapping

			for _, data in pairs(self._mission_script_patches) do
				local groups = data.groups

				if groups then
					for name, enabled in pairs(groups) do
						local mapped = spawn_group_mapping[name]

						if mapped then
							for _, v in pairs(mapped) do
								groups[v] = enabled
							end
						end
					end
				end
			end
		end

		return self._mission_script_patches
	end
end )

-- ElementRandom clones on_executed on init, need to handle it
local mission_script_patch_funcs_on_executed_original = MissionManager.mission_script_patch_funcs.on_executed
MissionManager.mission_script_patch_funcs.on_executed = function(self, element, data)
	for i, v in table.reverse_ipairs(data) do
		if v.name then
			local generated_id = custom_element_ids[v.name]

			if generated_id then
				v.id = generated_id
				v.name = nil
			else
				ASS:log("warn", "No ID for custom element \"%s\" in on_executed patch on \"%s\" (%s)!", v.name, element:editor_name(), element:id())

				table.remove(data, i)
			end
		end
	end

	mission_script_patch_funcs_on_executed_original(self, element, data)

	if element._original_on_executed then
		element._original_on_executed = clone(element._values.on_executed)
	end
end

-- CoreElementLogicChance.ElementLogicChance also needs to be handled
Hooks:PostHook( MissionManager.mission_script_patch_funcs, "values", "ass_values", function(self, element, data)
	if data.chance and element._chance then
		element._chance = data.chance
	end

	-- we love spawn group elements
	local group_data = element._group_data
	if group_data then
		group_data.amount = data.amount or group_data.amount
		group_data.spawn_type = data.spawn_type or group_data.spawn_type

		if data.ignore_disabled ~= nil then
			group_data.ignore_disabled = data.ignore_disabled
		end
	end
end )

MissionManager.mission_script_patch_funcs.on_executed_reorder = function(self, element, data)
	element._values.on_executed_original = element._values.on_executed
	element._values.on_executed = {}

	for _, id in ipairs(data) do
		for _, v in ipairs(element._values.on_executed_original) do
			if v.id == id then
				table.insert(element._values.on_executed, v)
			end
		end
	end

	for _, v in ipairs(element._values.on_executed_original) do
		ASS.utils.try_insert(element._values.on_executed, v)
	end

	if element._original_on_executed then
		element._original_on_executed = clone(element._values.on_executed)
	end
end

MissionManager.mission_script_patch_funcs.toggle = function(self, element, data)
	StreamHeist:log("%s hooked as toggle trigger for %u element(s)", element:editor_name(), #data)

	Hooks:PostHook( element, "on_executed", "sh_on_executed_toggle_" .. element:id(), function()
		StreamHeist:log("%s executed, toggled %u element(s)", element:editor_name(), #data)

		for id, toggle_data in pairs(data) do
			local elmt = element:get_mission_element(id)

			if elmt then
				local enabled = toggle_data.enabled
				local trigger_times = toggle_data.trigger_times

				if enabled ~= nil then
					if enabled == "toggle" then
						enabled = not elmt:value("enabled")
					end

					elmt:set_enabled(enabled)
					elmt:on_toggle(elmt:value("enabled"))
				end

				if trigger_times and trigger_times > -1 then
					elmt:set_trigger_times(trigger_times)
				end
			end
		end
	end )
end

-- used for elements with lists in their values not containing tables
MissionManager.mission_script_patch_funcs.modify_list_value = function(self, element, data)
	for k, v in pairs(data) do
		if type(element._values[k]) ~= "table" then
			ASS:log("warn", "Invalid modify list value name \"%s\" on element \"%s\" (%s)!", k, element:editor_name(), element:id())
		else
			for id, enabled in pairs(v) do
				if enabled then
					ASS.utils.try_insert(element._values[k], id)
				else
					table.delete(element._values[k], id)
				end
			end
		end
	end
end

-- used for CoreElementInstance.ElementInstanceInputEvent, core\lib\managers\mission\coreelementinstance
MissionManager.mission_script_patch_funcs.event_list = function(self, element, data)
	local event_list = element._values.event_list

	if not event_list then
		ASS:log("warn", "No event list on element \"%s\" (%s)!", element:editor_name(), element:id())
	else
		StreamHeist:log("Changed %u event(s) in event list of %s", table.size(data), element:editor_name())

		for instance, event in pairs(data) do
			local val, i = table.find_value(event_list, function(val) return val.instance == instance end)

			if event then
				if val then
					val.event = event
				else
					table.insert(event_list, { instance = instance, event = event, })
				end
			elseif val then
				table.remove(event_list, i)
			end
		end
	end
end

-- used for ElementSpecialObjective, lib\managers\mission\elementspecialobjective
MissionManager.mission_script_patch_funcs.so_access_filter = function(self, element, data)
	local access_filter = tweak_data.moon.access_filters[data]

	if not access_filter then  -- dont point fingers at sh if i fuck up
		ASS:log("warn", "Invalid SO access filter preset \"%s\" for element \"%s\" (%s)!", data, element:editor_name(), element:id())
	else
		element._values.SO_access_original = element._values.SO_access
		element._values.SO_access = managers.navigation:convert_access_filter_to_number(access_filter)

		StreamHeist:log("Replaced SO access filter of element %s", element:editor_name())
	end
end

-- used for ElementSpawnEnemyDummy, lib\managers\mission\elementspawnenemydummy
MissionManager.mission_script_patch_funcs.static_spawn = function(self, element, data)
	element.static_continent = data.continent
	element.static_tier = data.tier

	StreamHeist:log("Set static spawn data for element %s", element:editor_name())
end

-- used for ElementSpawnCivilian, lib\managers\mission\elementspawncivilian
-- used for ElementSpawnEnemyDummy, lib\managers\mission\elementspawnenemydummy
MissionManager.mission_script_patch_funcs.enemy = function(self, element, data)
	if type(data) == "table" then
		element._possible_enemies = data
		element._patched_enemy_name = data[1]
	else
		element._patched_enemy_name = data
	end

	StreamHeist:log("Modified enemy spawn in element %s", element:editor_name())
end

-- used for ElementSpawnCivilian, lib\managers\mission\elementspawncivilian
-- used for ElementSpawnEnemyDummy, lib\managers\mission\elementspawnenemydummy
MissionManager.mission_script_patch_funcs.run_func_on_unit = function(self, element, data)
	if not element.produce then
		ASS:log("warn", "Element %s (%s) has no produce function!", element:editor_name(), element:id())
	else
		Hooks:PostHook( element, "produce", "sh_produce_run_func_on_unit_" .. element:id(), function()
			data(Hooks:GetReturn())
		end )

		StreamHeist:log("%s hooked as run function on unit trigger", element:editor_name())
	end
end

-- referenced from ElementAiGlobalEvent, lib\managers\mission\elementaiglobalevent
MissionManager.mission_script_patch_funcs.hunt = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_hunt_" .. element:id(), function()
		local groupai_state = managers.groupai:state()
		local hunt_mode = groupai_state._hunt_mode
		local flag = (data and not hunt_mode and "hunt") or (hunt_mode and not data and "besiege") or nil

		if flag then
			StreamHeist:log("%s executed, setting wave mode to %s", element:editor_name(), flag)

			if groupai_state:enemy_weapons_hot() then
				groupai_state:set_wave_mode(flag)
			else
				local key = "moon_script_patch_hunt_" .. element:id()
				local events = { "enemy_weapons_hot", }
				local function clbk()
					groupai_state:set_wave_mode(flag)
					groupai_state:remove_listener(key)
				end

				groupai_state:add_listener(key, events, clbk)
			end
		end
	end )
end
