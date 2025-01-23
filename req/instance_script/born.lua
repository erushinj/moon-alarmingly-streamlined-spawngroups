local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_normal_above = ASS.utils.set_difficulty_groups("normal_above")
local patches = {
	simple_harasser_spawn = table.set(100008, 100009, 100010, 100011, 100012, 100014, 100015, 100016),
	born_armory = {
		cloaker_filter = table.set(100114),
		swats = table.list_to_set({
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
	},
}

return {
	["levels/instances/shared/simple_harasser_spawn/world/world"] = function(result)
		local harassers = tweak_data.moon.units[normal and "swats_far" or hard and "swats_heavys_far" or "marshals_far"]

		for _, element in pairs(result.default.elements) do
			if patches.simple_harasser_spawn[element.id] then
				element.values.moon_data = {
					enemy = harassers,
				}
			end
		end
	end,
	["levels/instances/unique/born/born_armory/world/world"] = function(result)
		local born_armory = patches.born_armory

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if born_armory.swats[id] then
				element.values.moon_data = {
					enemy = tweak_data.moon.units.swats_close,
				}
			elseif born_armory.cloaker_filter[id] then  -- spawn suprise cloaker
				table.map_append(element.values, filters_normal_above)
			end
		end
	end,
}
