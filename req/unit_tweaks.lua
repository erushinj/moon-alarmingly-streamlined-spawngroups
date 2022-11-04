local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local fbi = difficulty_index > 3
local city = difficulty_index > 5
local zeal = difficulty_index > 7

local light = zeal and "swat" or city and "city_swat" or fbi and "fbi_swat" or "swat"
local heavy = zeal and "heavy_swat" or fbi and "fbi_heavy_swat" or "heavy_swat"
local hrt = fbi and "fbi" or "cop"

return {
	swaps = {
		swat = light,
		fbi_swat = light,
		city_swat = light,
		heavy_swat = heavy,
		fbi_heavy_swat = heavy,
		cop = hrt,
		fbi = hrt
	},
	override = {
		[Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = hrt,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = hrt,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = hrt,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = hrt,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = hrt
	}
}