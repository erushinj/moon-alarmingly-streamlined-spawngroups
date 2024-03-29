local patches = {
	hox_breakout_harasser001 = table.set(100016, 100017, 100018),
	hox_breakout_serverroom001 = table.set(100061, 100001, 100060, 100002, 100062, 100003),
	hox_breakout_road001 = {
		cops = table.set(100094, 100093),
		swats = table.set(100101, 100102, 100103),
	},
}

return {
	["levels/instances/unique/hox_breakout_harasser001/world/world"] = function(result)
		local heavys = tweak_data.levels:moon_random_unit("heavys")

		for _, element in pairs(result.default.elements) do
			if patches.hox_breakout_harasser001[element.id] then
				element.values.moon_data = {
					enemy = heavys,
				}
			end
		end
	end,
	["levels/instances/unique/hox_breakout_serverroom001/world/world"] = function(result)
		local dozers_no_med = tweak_data.levels:moon_random_unit("dozers_no_med")

		for _, element in pairs(result.default.elements) do
			if patches.hox_breakout_serverroom001[element.id] then
				element.values.moon_data = {
					enemy = dozers_no_med,
				}
			end
		end
	end,
	["levels/instances/unique/hox_breakout_road001/world/world"] = function(result)
		local cops = tweak_data.levels:moon_random_unit("cops")
		local swats = tweak_data.levels:moon_random_unit("swats")

		for _, element in pairs(result.default.elements) do
			if patches.hox_breakout_road001.cops[element.id] then
				element.values.moon_data = {
					enemy = cops,
				}
			elseif patches.hox_breakout_road001.swats[element.id] then
				element.values.moon_data = {
					enemy = swats,
				}
			end
		end
	end,
}
