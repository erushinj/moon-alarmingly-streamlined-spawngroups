if ASS:get_var("is_editor_or_client") then
	return
end

if not MissionManager.mission_script_patch_funcs then
	ASS:_sh_outdated()

	return
end

local ass_mission_script_patches = ASS:script_patches("mission")
if not ass_mission_script_patches then
	return
end

-- initialize sh patches, dont bother assigning to a local as we have to
-- access StreamHeist._mission_script_patches directly if no sh patches anyway
StreamHeist:mission_script_patches()

if not StreamHeist._mission_script_patches then
	StreamHeist._mission_script_patches = ass_mission_script_patches
else
	local function merge_patches(base_patch, to_merge)
		for k, v in pairs(to_merge) do
			if type(base_patch[k]) == "table" then
				merge_patches(base_patch[k], v)
			else
				base_patch[k] = v
			end
		end
	end

	merge_patches(StreamHeist._mission_script_patches, ass_mission_script_patches)
end

local spawn_group_mapping = ASS:require("spawn_group_mapping")
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

MissionManager.mission_script_patch_funcs.chance = function(self, element, data)
	element._values.chance = data
	element._chance = data
end

MissionManager.mission_script_patch_funcs.enemy = function(self, element, data)
	if type(data) == "table" then
		element._possible_enemies = data
		element._patched_enemy_name = data[1]
	else
		element._patched_enemy_name = data
	end
end

MissionManager.mission_script_patch_funcs.group_amount = function(self, element, data)
	element._group_data.amount = data
end
