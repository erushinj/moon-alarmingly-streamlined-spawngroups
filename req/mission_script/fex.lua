local chance = {
	{
		0.1,  -- 10%
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
	},
	{
		0.2,  -- 10%
		{
			Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
		},
	},
	{
		0.4,  -- 20%
		Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
	},
	{
		0.7,  -- 30%
		Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
	},
	{
		1.0,  -- 30%
		Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"),
	},
}

local function scripted_swat_squads()
	local rand = math.random()

	for _, v in ipairs(chance) do
		if rand < v[1] then
			return v[2]
		end
	end

	return chance[#chance][2]
end

-- american enemy fixes are handled with hardcoded replacements
return {
	[103275] = { enemy = scripted_swat_squads() },
	[103276] = { enemy = scripted_swat_squads() },
	[103277] = { enemy = scripted_swat_squads() },
}
