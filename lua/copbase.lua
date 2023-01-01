if StreamHeist then
	return
end

local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

local fbi_rifle = difficulty_index > 3 and "m4" or "mp5"
local city_rifle = difficulty_index > 5 and "g36" or "m4"
local zeal_rifle = difficulty_index > 7 and "mp5" or fbi_rifle

local weapon_mapping = {
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

--	various weapon changes in vanilla
Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)

	local unit_weapon = weapon_mapping[self._unit:name():key()]
	self._default_weapon_id = unit_weapon or self._default_weapon_id

end )