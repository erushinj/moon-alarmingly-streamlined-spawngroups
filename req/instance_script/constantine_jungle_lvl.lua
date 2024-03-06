local patches = {
	chopper = {
		heli_fly_in = table.set(100007),
		dozer = table.set(100062),
		specials = table.set(100064, 100063, 100061),
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
			100013,
			100049,
			100020,
			100035,
		}),
	},
	assault_wave = table.list_to_set({
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
		100013,
		100049,
		100020,
		100035,
		100009,
		100014,
		100015,
		100016,
		100002,
	}),
	sniper_chopper = {
		sniper = table.set(100014),
		heli_fly_in = table.set(100000),
	}
}

local static_spawn = {
	continent = "america",
	tier = "overkill_290",
}

return {
	["levels/instances/mods/Constantine Scores/constantine_gensec_enemies_helicopter_spawn/world/world"] = function(result)
		local swats = patches.chopper.swats
		local specials = patches.chopper.specials
		local dozer = patches.chopper.dozer
		local heli_fly_in = patches.chopper.heli_fly_in

		for _, element in pairs(result.default.elements) do
			local id = element.id
			local wanted_type = swats[id] and "heavys" or specials[id] and "specials_any" or dozer[id] and "dozers_no_med"

			if wanted_type then
				element.values.static_spawn = static_spawn
				element.values.possible_enemies = tweak_data.levels:moon_random_unit(wanted_type)
			elseif heli_fly_in[id] then
				element.values.base_delay_rand = 2  -- less robotic waves
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/gensec_spawn_enemies_assault_wave/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.assault_wave[element.id] then
				element.values.static_spawn = static_spawn
				element.values.possible_enemies = tweak_data.levels:moon_random_unit("swats")
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/constantine_gensec_sniper_helicopter/world/world"] = function(result)
		local sniper = patches.sniper_chopper.sniper
		local heli_fly_in = patches.sniper_chopper.heli_fly_in

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if sniper[id] then
				element.values.static_spawn = static_spawn
				element.values.patched_enemy_name = Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3")
			elseif heli_fly_in[id] then
				element.values.base_delay_rand = 2
			end
		end
	end,
}
