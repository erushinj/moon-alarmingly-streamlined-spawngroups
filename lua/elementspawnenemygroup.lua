if ASS.is_editor_or_client then
	return
end

local group_mapping = ElementSpawnEnemyGroup.group_mapping
for group_name, new_groups in pairs(tweak_data.moon.spawn_group_mapping) do
	local mapping = group_mapping[group_name] or {}
	group_mapping[group_name] = mapping

	ASS.utils.try_insert(mapping, group_name)

	for i = 1, #new_groups do
		local new_group_name = new_groups[i]

		ASS.utils.try_insert(mapping, new_group_name)
	end
end

-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
group_mapping.single_spooc = ASS.utils.check_clone(group_mapping.FBI_spoocs, true)
