local CopBaseTweakSwaps = {}

local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

function CopBaseTweakSwaps.moon_style_streamlined()
	return {
		swaps = {},
		override = {}
	}
end

function CopBaseTweakSwaps.moon_style_vanilla()
	local light = difficulty_index > 7 and "swat" or "fbi_swat" 
	local heavy = difficulty_index > 7 and "heavy_swat" or "fbi_heavy_swat"
	local hrt = "fbi"

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
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = hrt,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = hrt,
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = hrt,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = hrt,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = hrt,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = hrt,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = hrt
		}
	}
end

CopBaseTweakSwaps.van_style_streamlined = CopBaseTweakSwaps.moon_style_streamlined
CopBaseTweakSwaps.van_style_vanilla = CopBaseTweakSwaps.moon_style_vanilla

return CopBaseTweakSwaps