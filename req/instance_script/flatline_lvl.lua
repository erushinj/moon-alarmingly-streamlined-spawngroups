-- flatline, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local patches = {
	spawn_enemies = {
		medic = table.set(100013, 100049, 100020, 100035),
		swats = table.list_to_set({
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
			-- 100013,
			-- 100049,
			-- 100020,
			-- 100035,
			100009,
			100014,
			100015,
			100016,
		}),
	},
}

return {
	["levels/instances/mods/Flatline/flatline_spawn_enemies/world/world"] = function(result)
		local spawn_enemies = patches.spawn_enemies
		local spawns = tweak_data.levels:moon_random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")
		local specials_med = tweak_data.levels:moon_random_unit("specials_med")

		for _, element in pairs(result.default.elements) do
			local id = element.id
			local wanted = spawn_enemies.medic[id] and specials_med or spawn_enemies.swats[id] and spawns

			if wanted then
				element.values.moon_data = {
					enemy = wanted,
				}
			end
		end
	end,
}
