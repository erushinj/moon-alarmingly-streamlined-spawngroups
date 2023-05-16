Hooks:OverrideFunction( ModifierDozerMedic, "init", function(self, data)
	ModifierDozerMedic.super.init(self, data)

	local categories = tweak_data.group_ai.unit_categories
	local unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")

	for _, category in pairs({ "CS_tank", "FBI_tank" }) do
		local unit_types = categories[category] and categories[category].unit_types

		if unit_types then
			table.insert(unit_types.america, unit_name)
			table.insert(unit_types.russia, unit_name)
			table.insert(unit_types.zombie, unit_name)
			table.insert(unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"))
			table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		end
	end
end )
