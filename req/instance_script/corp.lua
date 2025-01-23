local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_normal_above = ASS.utils.set_difficulty_groups("normal_above")
local filters_disable = ASS.utils.set_difficulty_groups("disable")
local patches = {
	helicopter_enemies = {
		filters_disable = table.set(100027, 100028, 100041),
		filters_normal_above = table.set(100026),
		swats = table.set(100010, 100011, 100012, 100013),
	},
}

return {
	["levels/instances/unique/chca/chca_helicopter_enemies/world/world"] = function(result)
		local helicopter_enemies = patches.helicopter_enemies
		local heli_spawns = ASS.utils.scripted_swat_squads({
			hard_target = overkill and 4 or 2,
			hard_spawn = "dozers_no_cs",
			normal_spawn = "specials_any",
		})

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if helicopter_enemies.swats[id] then
				element.values.participate_to_group_ai = true
				element.values.moon_data = {
					enemy = heli_spawns(),
				}
			elseif helicopter_enemies.filters_normal_above[id] then
				table.map_append(element.values, filters_normal_above)
			elseif helicopter_enemies.filters_disable[id] then
				table.map_append(element.values, filters_disable)
			end
		end
	end,
}
