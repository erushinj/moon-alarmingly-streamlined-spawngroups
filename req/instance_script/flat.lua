local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local patches = {
	harasser = {
		enemy = table.set(100017, 100016, 100018),
		assault_filters = table.set(100010, 100029),
		disabled_forced_behaviour = table.set(100000, 100002),
	},
	door = {
		block_door = 100017,
		enable_bars = 100018,
		disable_door = 100019,
	}
}

return {
	["levels/instances/shared/harasser/world/world"] = function(result)
		local harasser = patches.harasser
		local enemy = tweak_data.moon.units[normal and "swats_far" or hard and "swats_heavys_far" or "marshals_far"]

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if harasser.enemy[id] then
				element.values.moon_data = {
					enemy = enemy,
				}
			elseif harasser.assault_filters[id] then  -- allow spawns between assaults
				element.values.mode_control = true
			elseif harasser.disabled_forced_behaviour[id] then  -- no flee on assault end, no forced spawn on assault start
				element.values.enabled = false
			end
		end
	end,
	["levels/instances/unique/flat/flat_door/world/world"] = function(result)
		local door = patches.door

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if id == door.block_door then
				for _, v in pairs(element.values.on_executed) do
					if v.id == door.enable_bars then
						v.id = door.disable_door

						break
					end
				end
			elseif id == door.enable_bars then
				element.values.enabled = false
			end
		end
	end,
}
