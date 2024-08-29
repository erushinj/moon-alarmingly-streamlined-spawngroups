if ASS.is_client then
	return
end

Hooks:OverrideFunction( MutatorHydra, "split_enemy", function(self, parent_unit, ...)
	local name_key = alive(parent_unit) and parent_unit:name():key()

	if name_key then
		local mapped = tweak_data.moon.enemy_mapping[name_key]

		if mapped then
			local split = tweak_data.moon.hydra_splits[mapped]

			if split then
				local replacement = managers.groupai:state():moon_get_scripted_prefix()

				if replacement then
					local tier = tweak_data.moon:enemy_replacements()[replacement]

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

Hooks:OverrideFunction( MutatorEnemyReplacer, "modify_unit_categories", function(self, group_ai, ...)
	local override_enemy = self:get_override_enemy()
	local replacer_group = tweak_data.moon.replacer_groups[override_enemy]

	if not replacer_group then
		ASS:log("error", "MutatorEnemyReplacer is missing replacer group \"%s\"!", override_enemy)
	else
		group_ai.special_unit_spawn_limits[override_enemy] = math.huge

		for _, data in pairs(group_ai.enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = group_ai.unit_categories[unit]

				if not category then
					ASS:log("error", "Nonexistent unit category \"%s\"!", unit)
				elseif not category.is_captain then
					enemy.unit = replacer_group[unit:match("CS") and "CS" or "FBI"] or unit
				end
			end
		end
	end
end )

Hooks:OverrideFunction( MutatorMediDozer, "modify_unit_categories", function(self, group_ai, ...)
	local tank_group = tweak_data.moon.replacer_groups.tank
	local medic_group = tweak_data.moon.replacer_groups.medic

	if not tank_group or not medic_group then
		ASS:log("error", "MutatorMediDozer is missing replacer groups!")
	else
		group_ai.special_unit_spawn_limits.tank = math.huge
		group_ai.special_unit_spawn_limits.medic = math.huge

		for _, data in pairs(group_ai.enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = group_ai.unit_categories[unit]

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

Hooks:OverrideFunction( MutatorTitandozers, "modify_unit_categories", function(self, group_ai, ...)
	local replacer_group = tweak_data.moon.replacer_groups.tank_hw

	if not replacer_group then
		ASS:log("error", "MutatorTitandozers is missing replacer groups!")
	else
		group_ai.special_unit_spawn_limits.tank = math.huge

		for _, data in pairs(group_ai.enemy_spawn_groups) do
			for _, enemy in pairs(data.spawn) do
				local unit = enemy.unit
				local category = group_ai.unit_categories[unit]

				if not category then
					ASS:log("error", "Nonexistent unit category \"%s\"!", unit)
				elseif not category.is_captain and category.special_type == "tank" then
					enemy.unit = replacer_group[unit:match("CS") and "CS" or "FBI"] or unit
				end
			end
		end
	end
end )
