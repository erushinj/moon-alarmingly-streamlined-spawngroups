local patches = {
	double_doors = {
		security = table.set(100002, 100031),
		triad = table.set(100021, 100032, 100033),
	},
}
local securitys = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"),
}
local triads = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"),
}

return {
	["levels/instances/unique/pent/pent_double_doors_spawn/world/world"] = function(result)
		local double_doors = patches.double_doors

		for _, element in pairs(result.default.elements) do
			local id = element.id
			local wanted = double_doors.security[id] and securitys or double_doors.triad[id] and triads

			if wanted then
				element.values.moon_data = {
					enemy = wanted,
				}
			end
		end
	end,
}
