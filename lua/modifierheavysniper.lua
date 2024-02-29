if ASS:get_var("is_client") then
	return
end

-- add missing (albeit unused anyway) heavies, just because
for _, heavy in pairs({
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36",
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi",
}) do
	ModifierHeavySniper.heavy_units[heavy:key()] = true
end
