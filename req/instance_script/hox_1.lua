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
		for _, element in ipairs(result.default.elements) do
			if patches.hox_breakout_harasser001[element.id] then
				element.values.possible_enemies = ASS:random_unit("heavys")
			end
		end
	end,
	["levels/instances/unique/hox_breakout_serverroom001/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.hox_breakout_serverroom001[element.id] then
				element.values.possible_enemies = ASS:random_unit("dozers_no_med")
			end
		end
	end,
	["levels/instances/unique/hox_breakout_road001/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.hox_breakout_road001.cops[element.id] then
				element.values.possible_enemies = ASS:random_unit("cops")
			elseif patches.hox_breakout_road001.swats[element.id] then
				element.values.possible_enemies = ASS:random_unit("swats")
			end
		end
	end,
}
