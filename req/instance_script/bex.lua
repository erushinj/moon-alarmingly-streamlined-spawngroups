local security_suit = {
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"),
	Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"),
}
local function security_room(result)
	for _, element in pairs(result.default.elements) do
		if element.id = 100002 then
			element.values.moon_data = {
				enemy = security_suit,
			}
		end
	end
end

return {
	["levels/instances/unique/bex/bex_security_room/world/world"] = security_room,
	["levels/instances/unique/bex/bex_security_room2/world/world"] = security_room,
}
