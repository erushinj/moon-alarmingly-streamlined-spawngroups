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

local sh_mission_script_patches = StreamHeist:mission_script_patches()
if not sh_mission_script_patches then
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

	merge_patches(sh_mission_script_patches, ass_mission_script_patches)
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
