-- vanilla list + missing (albeit unused anyway) heavies, just because
for _, heavy in ipairs({
	"units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
	"units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	"units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
	"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
	"units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass",
	"units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
	"units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1",
	"units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
	"units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy",
	"units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36",
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale",
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36",
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi",
	"units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
}) do
	ModifierHeavySniper.heavy_units[heavy:key()] = true
end
