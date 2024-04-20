local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local patches = {
	sand_spawn_enemies = table.list_to_set({
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
	sand_helicopter_spawn_enemies = table.list_to_set({
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
}

return {
	["levels/instances/unique/sand/sand_spawn_enemies/world/world"] = function(result)
		local spawns = scripted_swat_squads({
			hard_target = normal and 1 or hard and 3 or 5,
			hard_spawn = "specials_any",
			normal_spawn = "heavys",
		})

		for _, element in pairs(result.default.elements) do
			if patches.sand_spawn_enemies[element.id] then
				element.values.moon_data = {
					enemy = spawns(),
				}
			end
		end
	end,
	["levels/instances/unique/sand/sand_helicopter_spawn_enemies/world/world"] = function(result)
		local spawns = scripted_swat_squads({
			hard_target = overkill and 2 or 1,
			hard_spawn = "dozers_any",
			normal_spawn = "specials_any",
		})

		for _, element in pairs(result.default.elements) do
			if patches.sand_helicopter_spawn_enemies[element.id] then
				element.values.moon_data = {
					enemy = spawns(),
				}
			end
		end
	end,
}
