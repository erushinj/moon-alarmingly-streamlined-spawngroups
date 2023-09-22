local patches = {
	bex_security_room = table.set(100002),
	bex_security_room2 = table.set(100002),
}

return {
	["levels/instances/unique/bex/bex_security_room/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.bex_security_room[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"),
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"),
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"),
				}
			end
		end
	end,
	["levels/instances/unique/bex/bex_security_room2/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.bex_security_room2[element.id] then
				element.values.possible_enemies = {
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"),
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"),
					Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"),
				}
			end
		end
	end,
}
