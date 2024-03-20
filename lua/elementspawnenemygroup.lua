if ASS:get_var("is_editor_or_client") then
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
