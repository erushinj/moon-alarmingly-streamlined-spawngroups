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
				element.values.possible_enemies = ASS:random_unit("swats")
			end
		end
	end,
	["levels/instances/unique/born/born_armory/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.born_armory[element.id] then
				element.values.possible_enemies = ASS:random_unit("swats_close")
			end

			-- spawn suprise cloaker
			if element.id == 100114 then
				element.values.difficulty_easy = true
				element.values.difficulty_normal = true
			end
		end
	end,
}
