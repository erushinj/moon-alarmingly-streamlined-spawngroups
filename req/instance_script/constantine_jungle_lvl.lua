local patches = {
	chopper_swats = table.list_to_set({
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
	}),
}

return {
	["levels/instances/mods/Constantine Scores/constantine_gensec_enemies_helicopter_spawn/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.chopper_swats[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_mod_ttr/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				}
			end
		end
	end,
	["levels/instances/mods/Constantine Scores/gensec_spawn_enemies_assault_wave/world/world"] = function(result)
		for _, element in pairs(result.default.elements) do
			if patches.assault_wave[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_mod_ttr/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					Idstring("units/pd2_mod_ttr/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
				}
			end
		end
	end,
}
