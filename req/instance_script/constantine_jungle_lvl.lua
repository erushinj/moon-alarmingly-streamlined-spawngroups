-- welcome to the jungle, https://modworkshop.net/mod/43578
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

return {
	["levels/instances/mods/Constantine Scores/constantine_gensec_enemies_helicopter_spawn/world/world"] = function(result)
		local chopper = patches.chopper
		local heavys = tweak_data.levels:moon_random_unit("heavys")
		local specials_any = tweak_data.levels:moon_random_unit("specials_any")
		local dozers_no_med = tweak_data.levels:moon_random_unit("dozers_no_med")

		for _, element in pairs(result.default.elements) do
			local id = element.id
			local wanted = chopper.swats[id] and heavys or chopper.specials[id] and specials_any or chopper.dozer[id] and dozers_no_med

			if wanted then
				element.values.moon_data = {
					continent = "america",
					tier = "overkill_290",
					enemy = wanted,
				}
			elseif chopper.heli_fly_in[id] then
				element.values.base_delay_rand = 2  -- less robotic waves
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/gensec_spawn_enemies_assault_wave/world/world"] = function(result)
		local swats = tweak_data.levels:moon_random_unit("swats")

		for _, element in pairs(result.default.elements) do
			if patches.assault_wave[element.id] then
				element.values.moon_data = {
					continent = "america",
					tier = "overkill_290",
					enemy = swats,
				}
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/constantine_gensec_sniper_helicopter/world/world"] = function(result)
		local marshal = tweak_data.levels:moon_units().marshal_1
		local sniper_chopper = patches.sniper_chopper

		for _, element in pairs(result.default.elements) do
			local id = element.id

			if sniper_chopper.sniper[id] then
				element.values.moon_data = {
					continent = "america",
					tier = "overkill_290",
					enemy = marshal,
				}
			elseif sniper_chopper.heli_fly_in[id] then
				element.values.base_delay_rand = 2
			end
		end
	end,
}
