local patches = {
	harasser = table.set(100017, 100016, 100018),
}

return {
	["levels/instances/shared/harasser/world/world"] = function(result)
		local enemy = tweak_data.levels:moon_random_unit("swats")

		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.moon_data = {
					enemy = enemy,
				}
			end
		end
	end,
}
