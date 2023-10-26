-- adjust to support all factions and the CS tank unit category
ASS:override( ModifierDozerMedic, "init", function(self, data)
	ModifierDozerMedic.super.init(self, data)

	local categories = tweak_data.group_ai.unit_categories
	for _, category in pairs({ "CS_tank", "FBI_tank", }) do
		local unit_types = categories[category] and categories[category].unit_types

		if unit_types then
			table.insert(unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
			table.insert(unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
			table.insert(unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
			table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"))
			table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		end
	end
end )
