if ASS.is_editor_or_client then
	return
end

local added_new_groups
Hooks:PreHook( ElementSpawnEnemyGroup, "init", "moon_init", function(self)
	if not added_new_groups then
		added_new_groups = true

		for group_name, new_groups in pairs(tweak_data.moon.spawn_group_mapping) do
			self.group_mapping[group_name] = self.group_mapping[group_name] or {}

			for _, new_group_name in pairs(new_groups) do
				ASS.utils.try_insert(self.group_mapping[group_name], new_group_name)
			end
		end

		-- allow regular cloaker groups to spawn from manholes/vents/etc, since the cloaker task has been turned off
		self.group_mapping.single_spooc = ASS.utils.check_clone(self.group_mapping.FBI_spoocs, true)
	end
end )

