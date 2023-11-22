if ASS:get_var("is_client") then
	return
end

if not ModifierSkulldozers or not ModifierSkulldozers.moon_init then
	ASS:log("error", "ModifierDozerMinigun has no access to ModifierSkulldozers!")

	return
end

-- adjust to support all factions and the CS tank unit category
ModifierDozerMinigun._moon_dozer_add = {
	america = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
	murkywater = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
	federales = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
}
ModifierDozerMinigun._moon_dozer_tables = {
	dozers_any = true,
	dozers_no_med = true,
}

ASS:override( ModifierDozerMinigun, "init", ModifierSkulldozers.moon_init )
