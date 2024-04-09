-- hunter and hunted day 3, https://modworkshop.net/mod/43578
local patches = {
	hunter_crew = table.list_to_set({
		100134,
		100135,
		100136,
		100137,
		100138,
		100139,
		100143,
		100146,
		100147,
		100148,
		100149,
		100150,
		100151,
		100153,
		100130,
		100131,
		100132,
		100133,
		100140,
		100141,
		100142,
		100144,
		100145,
		100152,
		100154,
		100155,
		100156,
		100157,
		100162,
		100161,
	}),
}

return {
	["levels/instances/mods/Hunter and Hunted/hunter_crew/world/world"] = function(result)
		local mobsters = {
			Idstring("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1"),
			Idstring("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2"),
			Idstring("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3"),
			Idstring("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4"),
		}

		for _, element in pairs(result.default.elements) do
			if patches.hunter_crew[element.id] then
				element.values.moon_data = {
					enemy = mobsters,
				}
			end
		end
	end,
}
