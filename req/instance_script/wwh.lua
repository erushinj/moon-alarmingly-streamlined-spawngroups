local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	intro_harasser = table.list_to_set({
		100000,
		100001,
		100002,
		100003,
		100004,
		100005,
		100006,
		100007,
	}),
	hostage_spawn = {
		swat_amount = table.set(100024),
		special_objectives = table.list_to_set({
			100022,
			100011,
			100023,
			100026,
			100027,
			100028,
			100029,
			100037,
			100038,
			100039,
			100040,
			100041,
		}),
		swats = table.list_to_set({
			100030,
			100002,
			100033,
			100031,
			100004,
			100035,
			100012,
			100003,
			100034,
			100032,
			100009,
			100036,
		}),
	},
}

return {
	["levels/instances/unique/wwh/wwh_intro_harasser/world/world"] = function(result)
		local enemy = tweak_data.levels:moon_units(overkill and "marshal_1" or "heavy_1")

		for _, element in pairs(result.default.elements) do
			if patches.intro_harasser[element.id] then
				element.values.moon_data = {
					enemy = enemy,
				}
			end
		end
	end,
	["levels/instances/unique/wwh/wwh_hostage_spawn/world/world"] = function(result)
		local hostage_spawn = patches.hostage_spawn
		local enemy = tweak_data.levels:moon_units(normal and "swats" or hard and "swats_heavys" or "heavys")

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if hostage_spawn.swats[id] then
				element.values.moon_data = {
					enemy = enemy,
				}
			elseif hostage_spawn.swat_amount[id] then
				element.values.amount = normal and 1 or hard and 2 or 3
				element.values.amount_random = normal and 2 or hard and 1 or 0
			elseif hostage_spawn.special_objectives[id] then
				element.values.interrupt_dmg = 0.01
				element.values.interrupt_dis = 15
			end
		end
	end,
}
