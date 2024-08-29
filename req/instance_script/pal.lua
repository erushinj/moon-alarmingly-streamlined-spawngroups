local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	sub_sewer_sidespawn = table.set(100009, 100010, 100019),
	sub_sewer_grate = {
		dozer = table.set(100010),
		spawns = table.set(100022, 100008, 100018),
		spawns_chance = table.set(100003),
	},
}

return {
	["levels/instances/unique/sub_sewer_sidespawn/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.sub_sewer_sidespawn[element.id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.dozers_no_med,
				}
			end
		end
	end,
	["levels/instances/unique/sub_sewer_grate/world/world"] = function(result)
		local sub_sewer_grate = patches.sub_sewer_grate

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if sub_sewer_grate.dozer[id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.dozers_any,
				}
			elseif sub_sewer_grate.spawns[id] then
				element.values.amount = normal and 1 or hard and 2 or 3
				element.values.on_executed = {
					{ id = 100020, delay = 0, },
					{ id = 100025, delay = 0, },
					{ id = 100026, delay = 0, },
				}
			elseif sub_sewer_grate.spawns_chance[id] then
				element.values.chance = 65
			end
		end
	end,
}
