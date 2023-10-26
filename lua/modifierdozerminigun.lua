-- adjust to support all factions and the CS tank unit category
ASS:override( ModifierDozerMinigun, "init", function(self, data)
	ModifierDozerMinigun.super.init(self, data)

	local categories = tweak_data.group_ai.unit_categories
	for _, category in pairs({ "CS_tank", "FBI_tank", }) do
		local unit_types = categories[category] and categories[category].unit_types

		if unit_types then
			table.insert(unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
			table.insert(unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
			table.insert(unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
			table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
			table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		end
	end
end )
