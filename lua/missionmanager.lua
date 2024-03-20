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

MissionManager.mission_script_patch_funcs.interval = function(self, element, data)
	element._values.interval = data
end

MissionManager.mission_script_patch_funcs.on_executed_reorder = function(self, element, data)
	element._values.on_executed_original = element._values.on_executed
	element._values.on_executed = {}

	local reordered_ids = {}
	for i = 1, #data do
		local id = data[i]

		for _, v in pairs(element._values.on_executed_original) do
			if v.id == id then
				table.insert(element._values.on_executed, v)

				reordered_ids[id] = true

				break
			end
		end
	end

	for _, v in pairs(element._values.on_executed_original) do
		if not reordered_ids[v.id] then
			table.insert(element._values.on_executed, v)
		end
	end
end

-- used for CoreElementLogicChance.ElementLogicChance, core\lib\managers\mission\coreelementlogicchance
MissionManager.mission_script_patch_funcs.chance = function(self, element, data)
	element._values.chance = data
	element._chance = data
end

-- used for ElementSpawnCivilian, lib\managers\mission\elementspawncivilian
-- used for ElementSpawnEnemyDummy, lib\managers\mission\elementspawnenemydummy
MissionManager.mission_script_patch_funcs.static_spawn = function(self, element, data)
	element.static_continent = data.continent
	element.static_tier = data.tier
end

MissionManager.mission_script_patch_funcs.enemy = function(self, element, data)
	if type(data) == "table" then
		element._possible_enemies = data
		element._patched_enemy_name = data[1]
	else
		element._patched_enemy_name = data
	end
end

-- used for ElementSpawnCivilianGroup, lib\managers\mission\elementspawnciviliangroup
-- used for ElementSpawnEnemyGroup, lib\managers\mission\elementspawnenemygroup
MissionManager.mission_script_patch_funcs.group_amount = function(self, element, data)
	element._group_data.amount = data
end

MissionManager.mission_script_patch_funcs.hunt = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_hunt_" .. element:id(), function()
		StreamHeist:log("%s executed, %s hunt mode", element:editor_name(), data and "enabled" or "disabled")

		managers.groupai:state():set_wave_mode(data and "hunt" or "besiege")
	end )
end

-- referenced from ElementFleePoint, lib\managers\mission\elementfleepoint
MissionManager.mission_script_patch_funcs.loot_dropoff = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_loot_dropoff_" .. element:id(), function()
		StreamHeist:log("%s executed, toggled %u loot dropoff point(s)", element:editor_name(), #data)

		for _, v in pairs(data) do
			if v.position then
				managers.groupai:state():add_enemy_loot_drop_point(v.id, v.position)
			else
				managers.groupai:state():remove_enemy_loot_drop_point(v.id)
			end
		end
	end )
end

-- referenced from ElementSmokeGrenade, lib\managers\mission\elementsmokegrenade
MissionManager.mission_script_patch_funcs.grenade = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_grenade_" .. element:id(), function()
		StreamHeist:log("%s executed, detonating %u grenade(s)", element:editor_name(), #data)

		for _, v in pairs(data) do
			v.id = v.id or element:id()
			v.position = v.position or element:value("position")
			v.duration = v.duration or tweak_data.group_ai.smoke_grenade_lifetime

			managers.groupai:state():queue_smoke_grenade(v.id, v.position, nil, v.duration, true, v.flashbang)
			managers.groupai:state():detonate_world_smoke_grenade(v.id)
		end
	end )
end
