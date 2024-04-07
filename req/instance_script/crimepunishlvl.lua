local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	helicopter_backup = table.list_to_set({
		100010,
		100040,
		100019,
		100032,
		100011,
		100047,
		100008,
		100033,
		100012,
		100048,
		100021,
		100034,
		100013,
		100049,
		100020,
		100035,
	}),
	spawn_enemies = table.list_to_set({
		100010,
		100040,
		100019,
		100032,
		100011,
		100047,
		100008,
		100033,
		100012,
		100048,
		100021,
		100034,
		100013,
		100049,
		100020,
		100035,
		100009,
		100014,
		100015,
		100016,
	}),
}

return {
	["levels/instances/mods/crimepunish_helicopter_backup/world/world"] = function(result)
		local heavys = tweak_data.levels:moon_random_unit("heavys")

		for _, element in pairs(result.default.elements) do
			if patches.helicopter_backup[element.id] then
				element.values.moon_data = {
					enemy = heavys,
				}
			end
		end
	end,
	["levels/instances/mods/crimepunish_spawn_enemies/world/world"] = function(result)
		local spawns = tweak_data.levels:moon_random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")

		for _, element in pairs(result.default.elements) do
			if patches.spawn_enemies[element.id] then
				element.values.moon_data = {
					enemy = spawns,
				}
			end
		end
	end,
}
