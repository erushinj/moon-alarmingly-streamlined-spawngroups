local patches = {
	fex_security_room = table.set(100030),
}
local function fex_security_room(result)
	for _, element in pairs(result.default.elements) do
		if patches.fex_security_room[element.id] then
			element.values.patched_enemy_name = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex")
		end
	end
end

return {
	["levels/instances/unique/fex/fex_security_room_left/world/world"] = fex_security_room,
	["levels/instances/unique/fex/fex_security_room_right/world/world"] = fex_security_room,
}
