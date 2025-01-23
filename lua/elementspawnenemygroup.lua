if ASS.is_editor_or_client then
	return
end

local added_new_groups
Hooks:PreHook( ElementSpawnEnemyGroup, "init", "moon_init", function()
	if not added_new_groups then
		added_new_groups = true

		local group_mapping = ElementSpawnEnemyGroup.group_mapping
		for group_name, new_groups in pairs(tweak_data.moon.spawn_group_mapping) do
			group_mapping[group_name] = group_mapping[group_name] or {}

			for _, new_group_name in pairs(new_groups) do
				ASS.utils.try_insert(group_mapping[group_name], new_group_name)
			end
		end

		-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
		group_mapping.single_spooc = ASS.utils.check_clone(group_mapping.FBI_spoocs, true)
	end
end )

