-- harassers and heli swat are now heavies on any difficulty
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	harasser = table.set(100017, 100016, 100018),
	helicopter_swat = table.list_to_set({
		100012,
		100014,
		100030,
		100011,
		100013,
		100029,
		100027,
		100015,
		100031,
		100028,
		100016,
		100032,
	}),
}

return {
	["levels/instances/unique/shout_harasser/world/world"] = function(result)
		local heavy_1 = tweak_data.levels:moon_units("heavy_1")

		for _, element in pairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.moon_data = {
					enemy = heavy_1,
				}
			end
		end
	end,
	["levels/instances/unique/shout_helicopter_swat/world/world"] = function(result)
		local heavys = tweak_data.levels:moon_units("heavys")

		for _, element in pairs(result.default.elements) do
			if patches.helicopter_swat[element.id] then
				element.values.moon_data = {
					enemy = heavys,
				}
			end
		end
	end,
}
