local patches = {
	harasser = table.set(100017, 100016, 100018),
	helicopter_enemies = table.list_to_set({
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
	["levels/instances/shared/harasser/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.marshal_1,
				}
			end
		end
	end,
	["levels/instances/unique/deep/deep_helicopter_enemies/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.helicopter_enemies[element.id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.marshals,
				}
			end
		end
	end,
}
