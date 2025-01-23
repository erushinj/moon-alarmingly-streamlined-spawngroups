local thug_outdoor_fex = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex")
local function fex_security_room(result)
	for _, element in pairs(result.default.elements) do
		if element.id == 100030 then
			element.values.moon_data = {
				enemy = thug_outdoor_fex,
				run_func_on_unit = function(unit)
					local unit_data = alive(unit) and unit:unit_data()

					if unit_data then
						unit_data.has_alarm_pager = true
					end
				end,
			}
		end
	end
end

return {
	["levels/instances/unique/fex/fex_security_room_left/world/world"] = fex_security_room,
	["levels/instances/unique/fex/fex_security_room_right/world/world"] = fex_security_room,
}
