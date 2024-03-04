local patches = {
	chopper = {
		dozer = table.set(100062),
		specials = table.set(100064, 100063, 100061),
		swats = table.list_to_set({
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
	},
	assault_wave = table.list_to_set({
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
		100002,
	}),
}

local static_spawn = {
	continent = "america",
	tier = "overkill_290",
}

return {
	["levels/instances/mods/Constantine Scores/constantine_gensec_enemies_helicopter_spawn/world/world"] = function(result)
		local chopper = patches.chopper

		for _, element in pairs(result.default.elements) do
			local id = element.id
			local swats, specials, dozer = chopper.swats[id], chopper.specials[id], chopper.dozer[id]

			if swats or specials or dozer then
				local wanted_type = swats and "heavys" or specials and "specials_any" or "dozers_no_med"

				element.values.static_spawn = static_spawn
				element.values.possible_enemies = tweak_data.levels:moon_random_unit(wanted_type)
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/gensec_spawn_enemies_assault_wave/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.assault_wave[element.id] then
				element.values.static_spawn = static_spawn
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats")
			end
		end
	end,
}
