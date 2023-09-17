-- adjust to support all factions and the CS tank unit category
ASS:override( ModifierSkulldozers, "init", function(self, data)
	ModifierSkulldozers.super.init(self, data)

	local categories = tweak_data.group_ai.unit_categories
	for _, category in pairs({ "CS_tank", "FBI_tank" }) do
		local unit_types = categories[category] and categories[category].unit_types

		if unit_types then
			table.insert(unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
			table.insert(unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
			table.insert(unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
			table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
			table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
		end
	end
end )
