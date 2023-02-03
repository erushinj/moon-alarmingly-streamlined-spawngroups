local ASSCopBaseModule = {}

local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local is_fbi = difficulty_index > 3
local is_city = difficulty_index > 5
local is_zeal = difficulty_index > 7

function ASSCopBaseModule.weapon_mapping_vanilla()
	local fbi_rifle = is_fbi and "m4" or "mp5"
	local city_rifle = is_city and "g36" or "m4"
	local zeal_rifle = is_zeal and "mp5" or fbi_rifle

	return {
		[Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "r870",
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = fbi_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = zeal_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "r870",
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = zeal_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = zeal_rifle,

		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = city_rifle,
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "m4",
		[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = city_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = city_rifle,
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = city_rifle,
		[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = city_rifle,
		[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = city_rifle,

		[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "m4_yellow",
		[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "m4_yellow"
	}
end

function ASSCopBaseModule.weapon_mapping_streamlined_heisting()
	return {
		[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "r870",
		[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "mp5",
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "spas12",
		[Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "mp5",
		[Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "r870",

		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = "spas12",
		[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = "spas12",

		[Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "spas12",

		[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "m4_yellow"
	}
end

ASSCopBaseModule.weapon_mapping_beta_vanilla = ASSCopBaseModule.weapon_mapping_vanilla
ASSCopBaseModule.weapon_mapping_beta_streamlined_heisting = ASSCopBaseModule.weapon_mapping_streamlined_heisting

function ASSCopBaseModule.tweak_mapping_vanilla()
	local light = is_zeal and "swat" or "fbi_swat" 
	local heavy = is_zeal and "heavy_swat" or "fbi_heavy_swat"
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
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = hrt,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = hrt,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = hrt,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = hrt,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = hrt
		}
	}
end

function ASSCopBaseModule.tweak_mapping_streamlined_heisting()
	return {
		swaps = {},
		override = {}
	}
end

ASSCopBaseModule.tweak_mapping_streamlined_heisting = ASSCopBaseModule.tweak_mapping_vanilla

ASSCopBaseModule.tweak_mapping_beta_vanilla = ASSCopBaseModule.tweak_mapping_vanilla
ASSCopBaseModule.tweak_mapping_beta_streamlined_heisting = ASSCopBaseModule.tweak_mapping_streamlined_heisting

return ASSCopBaseModule