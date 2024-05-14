if ASS.is_editor_or_client then
	return
end

local group_mapping = ElementSpawnEnemyGroup.group_mapping
if not group_mapping then
	return ASS:message("sh_outdated")
end

local try_insert, check_clone = ASS:require("try_insert", true), ASS:require("check_clone", true)
for group_name, new_groups in pairs(tweak_data.group_ai:moon_spawn_group_mapping()) do
	local mapping = group_mapping[group_name] or {}
	group_mapping[group_name] = mapping

	try_insert(mapping, group_name)

	for i = 1, #new_groups do
		local new_group_name = new_groups[i]

		try_insert(mapping, new_group_name)
	end
end

-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
group_mapping.single_spooc = check_clone(group_mapping.FBI_spoocs, true)

-- reduce spawn point intervals on single_spooc spawns with only one spawn point to compensate for groups with 2 units
ASS:pre_hook( ElementSpawnEnemyGroup, "_finalize_values", function(self)
	local preferred = self._values.preferred_spawn_groups

	if preferred and #preferred == 1 and preferred[1] == "single_spooc" then
		local elements = self._values.elements

		if elements and #elements == 1 then
			local spawn = self:get_mission_element(elements[1])

			if spawn then
				spawn._values.interval = math.min(spawn._values.interval or 1, 1)
			end
		end
	end
end )
