local patches = {
	cartel_truck = table.set(100042, 100043, 100044),
}

return {
	["levels/instances/mods/Constantine Scores/constantine_score_cartel_truck/world/world"] = function(result)
		local hrts_cartel = {
			Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
			Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
			Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
			Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"),
		}

		for _, element in pairs(result.default.elements) do
			if patches.cartel_truck[element.id] then
				element.values.possible_enemies = hrts_cartel
			end
		end
	end,
}
