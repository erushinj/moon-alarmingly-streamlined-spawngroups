local patches = {
	harasser = table.set(100016, 100017, 100018),
	glace_helicopter_swat = table.list_to_set({
		100012,
		100014,
		100030,
		100011,
		100013,
		100029,
		100027,
		100015,
		100031,
		100028,
		100016,
		100032,
	}),
}

return {
	["levels/instances/shared/harasser/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.harasser[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
				}
			end
		end
	end,
	["levels/instances/unique/glace/glace_helicopter_swat/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.glace_helicopter_swat[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
				}
			end
		end
	end,
}
