if ASS:get_var("is_client") then
	return
end

if not ModifierSkulldozers or not ModifierSkulldozers.moon_init then
	ASS:log("error", "ModifierDozerMedic has no access to ModifierSkulldozers!")

	return
end

-- adjust to support all factions and the CS tank unit category
ModifierDozerMedic._moon_dozer_add = {
	america = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
	murkywater = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
	federales = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
}
ModifierDozerMedic._moon_dozer_tables = {
	dozers_any = true,
	dozers_no_mini = true,
}

ASS:override( ModifierDozerMedic, "init", ModifierSkulldozers.moon_init )
