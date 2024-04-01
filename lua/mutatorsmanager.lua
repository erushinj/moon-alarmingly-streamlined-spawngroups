if ASS:get_var("is_client") then
	return
end

ASS:override( MutatorHydra, "split_enemy", function(self, parent_unit, ...)
	local name_key = alive(parent_unit) and parent_unit:name():key()

	if name_key then
		local key = tweak_data.levels:moon_enemy_mapping(name_key)

		if key then
			local split = tweak_data.mutators:moon_hydra_splits(key)

			if split then
				local last_prefixes = tweak_data.group_ai.moon_last_prefixes

				if last_prefixes then
					local tier = tweak_data.levels:moon_enemy_replacements()[last_prefixes.CS]

					if tier then
						local unit_depth = self:get_hydra_depth(parent_unit)

						self:_spawn_unit(tier[split:select()], parent_unit, unit_depth)
						self:_spawn_unit(tier[split:select()], parent_unit, unit_depth)
						self:set_hydra_depth(parent_unit, nil)
					end
				end
			end
		end
	end
end )

ASS:override( MutatorEnemyReplacer, "modify_unit_categories", function(self, group_ai, ...)
	for id in pairs(group_ai.special_unit_spawn_limits) do
		group_ai.special_unit_spawn_limits[id] = math.huge
	end

	local override_enemy = self:get_override_enemy()
	local replacer_group = tweak_data.mutators:moon_replacer_groups(override_enemy)
	if not replacer_group then
		ASS:log("error", "MutatorEnemyReplacer is missing replacer group \"%s\"!", override_enemy)
	else
		local enemy_spawn_groups = group_ai.enemy_spawn_groups
		local unit_categories = group_ai.unit_categories

		for _, data in pairs(enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = unit_categories[unit]

				if not category then
					ASS:log("error", "Nonexistent unit category \"%s\"!", unit)
				elseif not category.is_captain then
					enemy.unit = replacer_group[unit:match("CS") and "CS" or "FBI"] or unit
				end
			end
		end
	end
end )

ASS:override( MutatorMediDozer, "modify_unit_categories", function(self, group_ai, ...)
	group_ai.special_unit_spawn_limits.tank = math.huge
	group_ai.special_unit_spawn_limits.medic = math.huge

	local tank_group = tweak_data.mutators:moon_replacer_groups("tank")
	local medic_group = tweak_data.mutators:moon_replacer_groups("medic")
	if not tank_group or not medic_group then
		ASS:log("error", "MutatorMediDozer is missing replacer groups!")
	else
		local enemy_spawn_groups = group_ai.enemy_spawn_groups
		local unit_categories = group_ai.unit_categories

		for _, data in pairs(enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = unit_categories[unit]

				if not category then
					ASS:log("error", "Nonexistent unit category \"%s\"!", unit)
				elseif not category.is_captain then
					local replacer_group = category.special_type and tank_group or medic_group

					enemy.unit = replacer_group[unit:match("CS") and "CS" or "FBI"] or unit
				end
			end
		end
	end
end )

ASS:override( MutatorTitandozers, "modify_unit_categories", function(self, group_ai, ...)
	group_ai.special_unit_spawn_limits.tank = math.huge

	local replacer_group = tweak_data.mutators:moon_replacer_groups("tank_hw")
	if not replacer_group then
		ASS:log("error", "MutatorTitandozers is missing replacer groups!")
	else
		local enemy_spawn_groups = group_ai.enemy_spawn_groups
		local unit_categories = group_ai.unit_categories

		for _, data in pairs(enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = unit_categories[unit]

				if not category then
					ASS:log("error", "Nonexistent unit category \"%s\"!", unit)
				elseif not category.is_captain and category.special_type == "tank" then
					enemy.unit = replacer_group[unit:match("CS") and "CS" or "FBI"] or unit
				end
			end
		end
	end
end)
