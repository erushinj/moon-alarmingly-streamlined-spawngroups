local normal, hard, overkill = ASS:difficulty_groups()

local patches = {
	sub_sewer_sidespawn = table.set(100009, 100010, 100019),
	sub_sewer_grate = {
		[100010] = function(element)  -- bulldozer
			element.values.possible_enemies = tweak_data.levels:moon_random_unit("dozers_any")
		end,
		[100022] = function(element)  -- n
			element.values.amount = normal and 1 or hard and 2 or 3
			element.values.on_executed = {
				{ id = 100020, delay = 0, delay_rand = 0, },
				{ id = 100025, delay = 0, delay_rand = 0, },
				{ id = 100026, delay = 0, delay_rand = 0, },
			}
		end,
		[100008] = function(element)  -- h/vh/ovk
			element.values.amount = normal and 1 or hard and 2 or 3
			element.values.on_executed = {
				{ id = 100020, delay = 0, delay_rand = 0, },
				{ id = 100025, delay = 0, delay_rand = 0, },
				{ id = 100026, delay = 0, delay_rand = 0, },
			}
		end,
		[100018] = function(element)  -- mh+
			element.values.amount = normal and 1 or hard and 2 or 3
			element.values.on_executed = {
				{ id = 100020, delay = 0, delay_rand = 0, },
				{ id = 100025, delay = 0, delay_rand = 0, },
				{ id = 100026, delay = 0, delay_rand = 0, },
			}
		end,
		[100003] = function(element)  -- enemy chance
			element.values.chance = 65
		end,
	},
}

return {
	["levels/instances/unique/sub_sewer_sidespawn/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.sub_sewer_sidespawn[element.id] then
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("dozers_no_med")
			end
		end
	end,
	["levels/instances/unique/sub_sewer_grate/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.sub_sewer_grate[element.id] then
				patches.sub_sewer_grate[element.id](element)
			end
		end
	end,
}
