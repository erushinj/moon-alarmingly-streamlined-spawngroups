local patches = {
	harasser = table.set(100017, 100016, 100018),
}

return {
	["levels/instances/shared/harasser/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats")
			end
		end
	end,
}
