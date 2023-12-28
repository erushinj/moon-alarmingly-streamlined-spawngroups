local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local patches = {
	simple_harasser_spawn = table.set(100008, 100009, 100010, 100011, 100012, 100014, 100015, 100016),
	born_armory = table.list_to_set({
		100123,
		100124,
		100151,
		100155,
		100132,
		100133,
		100153,
		100152,
		100154,
		100156,
		100125,
		100130,
		100131,
		100148,
		100150,
		100149,
	}),
}

return {
	["levels/instances/shared/simple_harasser_spawn/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.simple_harasser_spawn[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats")
			end
		end
	end,
	["levels/instances/unique/born/born_armory/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.born_armory[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats_close")
			end

			-- spawn suprise cloaker
			if element.id == 100114 then
				table.map_append(element.values, set_difficulty_groups("normal_above"))
			end
		end
	end,
}
