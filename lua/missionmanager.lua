if ASS:get_var("is_editor_or_client") then
	return
end

if not MissionManager.mission_script_patch_funcs then
	return ASS:message("sh_outdated")
end

ASS:pre_hook( MissionManager, "init", function(self)
	if ElementAIGroupType then
		ASS:post_hook( ElementAIGroupType, "on_executed", function(self, instigator)
			tweak_data.group_ai:moon_swap_units(tweak_data.group_ai.moon_last_prefixes)
		end )
	end
end )

-- initialize sh patches, dont bother assigning to a local as we have to
-- access StreamHeist._mission_script_patches directly if no sh patches anyway
StreamHeist:mission_script_patches()

local ass_mission_script_patches = ASS:script_patches("mission")
if ass_mission_script_patches then
	if not StreamHeist._mission_script_patches then
		StreamHeist._mission_script_patches = ass_mission_script_patches
	else
		local function merge_patches(base_patch, to_merge)
			for id, data in pairs(to_merge) do
				if type(base_patch[id]) == "table" and type(data) == "table" then
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

		merge_patches(StreamHeist._mission_script_patches, ass_mission_script_patches)
	end
end

if not StreamHeist._mission_script_patches then
	return
end

local try_insert = ASS:require("try_insert", true)
local spawn_group_mapping = tweak_data.group_ai:moon_spawn_group_mapping()
for _, data in pairs(StreamHeist._mission_script_patches) do
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

-- ElementRandom clones on_executed on init, need to handle it
ASS:override( MissionManager.mission_script_patch_funcs, "on_executed", function(self, element, data)
	self.mission_script_patch_funcs.on_executed_original(self, element, data)

	if element._original_on_executed then
		element._original_on_executed = clone(element._values.on_executed)
	end
end )

-- CoreElementLogicChance.ElementLogicChance also needs to be handled
ASS:override( MissionManager.mission_script_patch_funcs, "values", function(self, element, data)
	self.mission_script_patch_funcs.values_original(self, element, data)

	if data.chance and element._chance then
		element._chance = data.chance
	end
end )

MissionManager.mission_script_patch_funcs.on_executed_reorder = function(self, element, data)
	element._values.on_executed_original = element._values.on_executed
	element._values.on_executed = {}

	for i = 1, #data do
		local id = data[i]

		for _, v in ipairs(element._values.on_executed_original) do
			if v.id == id then
				table.insert(element._values.on_executed, v)
			end
		end
	end

	for _, v in ipairs(element._values.on_executed_original) do
		try_insert(element._values.on_executed, v)
	end

	if element._original_on_executed then
		element._original_on_executed = clone(element._values.on_executed)
	end
end

-- used for ElementSpecialObjective, lib\managers\mission\elementspecialobjective
MissionManager.mission_script_patch_funcs.modify_list_value = function(self, element, data)
	for k, v in pairs(data) do
		if type(element._values[k]) == "table" then
			for id, enabled in pairs(v) do
				if enabled then
					try_insert(element._values[k], id)
				else
					table.delete(element._values[k], id)
				end
			end
		end
	end
end

MissionManager.mission_script_patch_funcs.chance = function(self, element, data)
	ASS:log("error", "Deprecated script patch function \"chance\" for element \"%s\" (%s)!", element:editor_name(), element:id())
end

-- used for ElementSpecialObjective, lib\managers\mission\elementspecialobjective
MissionManager.mission_script_patch_funcs.so_access_filter = function(self, element, data)
	local access_filter = tweak_data.character:moon_access_filters(data)

	if access_filter then
		element._values.SO_access_original = element._values.SO_access
		element._values.SO_access = managers.navigation:convert_access_filter_to_number(access_filter)

		StreamHeist:log("Replaced SO access filter of element %s", element:editor_name())
	else  -- dont point fingers at sh if i fuck up
		ASS:log("warn", "Invalid SO access filter preset \"%s\" for element \"%s\" (%s)!", data, element:editor_name(), element:id())
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

-- used for ElementSpawnCivilianGroup, lib\managers\mission\elementspawnciviliangroup
-- used for ElementSpawnEnemyGroup, lib\managers\mission\elementspawnenemygroup
MissionManager.mission_script_patch_funcs.group_amount = function(self, element, data)
	element._group_data.amount = data

	StreamHeist:log("Modified group data in element %s", element:editor_name())
end

-- referenced from ElementAiGlobalEvent, lib\managers\mission\elementaiglobalevent
MissionManager.mission_script_patch_funcs.hunt = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_hunt_" .. element:id(), function()
		local groupai_state = managers.groupai:state()
		local function func()
			local hunt_mode = groupai_state._hunt_mode
			local wanted_mode = (data and not hunt_mode and "hunt") or (hunt_mode and not data and "besiege") or nil

			if wanted_mode then
				StreamHeist:log("%s executed, set wave mode to %s", element:editor_name(), wanted_mode)

				groupai_state:set_wave_mode(wanted_mode)
			end
		end

		if groupai_state:enemy_weapons_hot() then
			func()
		else
			Hooks:PostHook( groupai_state, "on_enemy_weapons_hot", "sh_on_enemy_weapons_hot_" .. element:id(), function()
				if groupai_state:is_AI_enabled() and groupai_state:enemy_weapons_hot() then
					func()
				end
			end )
		end
	end )
end

-- referenced from ElementFleePoint, lib\managers\mission\elementfleepoint
MissionManager.mission_script_patch_funcs.loot_dropoff = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_loot_dropoff_" .. element:id(), function()
		StreamHeist:log("%s executed, toggled %u loot dropoff point(s)", element:editor_name(), #data)

		local groupai_state = managers.groupai:state()
		for _, v in pairs(data) do
			if v.position then
				groupai_state:add_enemy_loot_drop_point(v.id, v.position)
			else
				groupai_state:remove_enemy_loot_drop_point(v.id)
			end
		end
	end )
end

-- referenced from ElementSmokeGrenade, lib\managers\mission\elementsmokegrenade
MissionManager.mission_script_patch_funcs.grenade = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_grenade_" .. element:id(), function()
		StreamHeist:log("%s executed, detonating %u grenade(s)", element:editor_name(), #data)

		local groupai_state = managers.groupai:state()
		for _, v in pairs(data) do
			local id = v.id or element:id()
			local pos = v.position or element:value("position")
			local duration = tweak_data.group_ai.smoke_grenade_lifetime

			groupai_state:queue_smoke_grenade(id, pos, nil, duration, true, v.flashbang)
			groupai_state:detonate_world_smoke_grenade(id)
		end
	end )
end
