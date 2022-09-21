if not ASS then

	ASS = {
		massive = true,	-- does nothing. deliberate.
		remove_bad_dw_preset_enemies = true,	-- removes dw preset shotgunners and akan mercs, and akan taser on deathwish. defaults to true.
		american_enemies_everywhere = false	--	makes all factions spawn american enemies for max gameplay consistency. defaults to false.
	}

end


--	i love if-else if-else
--	im doing this to fix incorrect units (eg, city heavy shotgunners for murkywater, or city-tier akan mercs on ds) while allowing
--	me to keep track of which units i use more easily than having to constantly crosscheck with vanilla groupaitweakdata
Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	local diff_i = difficulty_index

	if diff_i < 4 then
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
		}
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
		}
		self.unit_categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
		}
		self.unit_categories.FBI_shield.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2")
		}
		self.unit_categories.FBI_shield.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		self.unit_categories.FBI_shield.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	elseif diff_i < 6 then
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
		}
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
		}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
		}
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
		}
		self.unit_categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
		self.unit_categories.FBI_shield.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		self.unit_categories.FBI_shield.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		self.unit_categories.FBI_shield.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	elseif diff_i < 8 then
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
		}
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
		}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
		}
		self.unit_categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
		}
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
		}
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
		}
		self.unit_categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
		self.unit_categories.FBI_shield.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		self.unit_categories.FBI_shield.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		self.unit_categories.FBI_shield.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	else
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		}
		self.unit_categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		self.unit_categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
		}
		self.unit_categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		}
		self.unit_categories.FBI_swat_M4.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
		}
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
		}
		self.unit_categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
		self.unit_categories.FBI_swat_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
		}
		self.unit_categories.FBI_heavy_G36.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
		}
		self.unit_categories.FBI_heavy_R870.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
		}
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
		}
		self.unit_categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
		self.unit_categories.FBI_shield.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
		self.unit_categories.FBI_shield.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
		}
		self.unit_categories.FBI_shield.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
		}
	end

	--	misc changes that dont fit in the scaling structure above
	if diff_i < 5 then
		self.unit_categories.FBI_tank.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
		}
	end

	if diff_i < 4 then
		self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
		}
	else
		self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
		}
	end

	--	overkill hates fbi agents
	self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	self.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	if diff_i == 7 and ASS.remove_bad_dw_preset_enemies then
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
		}
		self.unit_categories.CS_tazer.unit_types.russia = {
			Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
		}
	end
	self.unit_categories.FBI_suit_M4_MP5.unit_types = self.unit_categories.FBI_suit_C45_M4.unit_types

	-- Skulldozers on Mayhem
	if diff_i == 6 then
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
		table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
		table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
		table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
	end


	--	this is one fucking mess and wont apply to any new factions if added automatically. but it works, i guess.
	local category_tbl = {
		"FBI_suit_C45_M4",
		"FBI_suit_stealth_MP5",
		"FBI_swat_M4",
		"FBI_swat_R870",
		"FBI_heavy_G36",
		"FBI_heavy_R870",
		"FBI_shield",
		"CS_tazer",
		"FBI_tank",
		"spooc",
		"medic_M4",
		"medic_R870",
		"marshal_marksman"
	}
	local faction_tbl = {
		"russia",
		"zombie",
		"murkywater",
		"federales"
	}
	if ASS.american_enemies_everywhere then
		for _, category in pairs(category_tbl) do
			for _, faction in pairs(faction_tbl) do
				self.unit_categories[category].unit_types[faction] = self.unit_categories[category].unit_types.america
			end
		end
	end

	--	mayhem really should be closer to death wish than ovk
	local limits_shield = { 0, 2, 3, 4, 5, 6, 7, 8 }
	local limits_medic = { 0, 0, 0, 0, 1, 2, 3, 4 }
	local limits_taser = { 0, 0, 1, 1, 2, 3, 3, 4 }
	local limits_tank = { 0, 0, 0, 1, 1, 2, 2, 3 }
	local limits_spooc = { 0, 0, 0, 1, 2, 3, 4, 5 }
	self.special_unit_spawn_limits = {
		shield = limits_shield[diff_i],
		medic = limits_medic[diff_i],
		taser = limits_taser[diff_i],
		tank = limits_tank[diff_i],
		spooc = limits_spooc[diff_i]
	}

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local diff_i = difficulty_index

	--	you may notice i dont use provide_coverfire and provide_support like vanilla or other mods tend to
	--	they do literally nothing, never have since before release, and had been meant to be removed entirely.
	--	which obviously never happened.

	self._tactics.swat_shotgun_rush = {
		"charge",
		"smoke_grenade",
		"deathguard"
	}
	self._tactics.swat_shotgun_flank = {
		"charge",
		"flank",
		"flash_grenade",
		"deathguard"
	}
	self._tactics.swat_rifle = {
		"ranged_fire",
		"smoke_grenade"
	}
	self._tactics.swat_rifle_flank = {
		"flank",
		"ranged_fire",
		"flash_grenade"
	}

	--	vanilla shield tactics names are confusing for me.
	--	im making my own for ease of understanding.
	self._tactics.shield_phalanx = {
		"smoke_grenade",
		"charge",
		"murder"
	}
	self._tactics.shield_wall = {
		"shield",
		"shield_cover",
		"murder"
	}
	self._tactics.shield_ranged = {
		"shield",
		"ranged_fire",
		"deathguard"
	}
	self._tactics.shield_charge = {
		"shield",
		"charge",
		"deathguard"
	}
	self._tactics.shield_cover = {
		"shield_cover"
	}

	--	also used for marshals
	self._tactics.tazer_flanking = {
		"shield_cover",
		"flank",
		"murder"
	}
	self._tactics.tazer_charge = {
		"shield_cover",
		"charge",
		"murder"
	}
	--	taser backup is suicidal
	self._tactics.tazer_shield = {
		"shield",
		"murder"
	}

	self._tactics.tank_rush = {
		"shield",
		"charge",
		"murder"
	}
	self._tactics.tank_cover = {
		"shield_cover",
		"charge",
		"murder"
	}

	self._tactics.spooc = {
		"shield_cover",
		"deathguard",
		"smoke_grenade"
	}

	--	every group needs at least one baseline unit
	--	all other freqs remain constantly proportional to each other, its just that
	--	overall chance of a baseline unit being replaced increases with difficulty
	self._freq = {
		baseline = 1,
		common = diff_i / 8,
		uncommon = diff_i / 16,
		rare = diff_i / 24,
		elite = diff_i / 32
	}

	local heavy_limits = not StreamHeist and diff_i > 5 and 3 or 2
--	local light_limits = not StreamHeist and diff_i > 2 and 2 or 3
	local light_limits = not StreamHeist and diff_i > 5 and 1 or 2

	local group_special_limits = not StreamHeist and diff_i > 5 and 2 or 1
	local backup_special_limits = diff_i > 5 and 1 or 0

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = heavy_limits,
				freq = self._freq.common
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = light_limits,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	self.enemy_spawn_groups.tac_swat_shotgun_flank = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 4,
				unit = "CS_tazer",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			},
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = heavy_limits,
				freq = self._freq.common
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = light_limits,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	self.enemy_spawn_groups.tac_swat_rifle = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = heavy_limits,
				freq = self._freq.common
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = light_limits,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	self.enemy_spawn_groups.tac_swat_rifle_flank = {
		amount = { 3, 3 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = heavy_limits,
				freq = self._freq.common
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = light_limits,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			}
		}
	}

	self.enemy_spawn_groups.tac_shield_wall_ranged = {
		amount = { 4, 5 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.shield_ranged,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.shield_cover,
				amount_min = 2,
				amount_max = 4,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			}
		}
	}

	self.enemy_spawn_groups.tac_shield_wall_charge = {
		amount = { 4, 5 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.shield_charge,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.shield_cover,
				amount_min = 2,
				amount_max = 4,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			}
		}
	}

	--	this is a terrible group that had and still has no good reason to exist
	--	take an occasional dozer on ovk and above instead of a medic
	--	i dont normally use this group which is why its weird.
	self.enemy_spawn_groups.tac_shield_wall = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_shield",
				tactics = self._tactics.shield_wall,
				amount_min = 2,
				amount_max = math.max(2, group_special_limits + 1),	--	ew
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_tank",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			}
		}
	}

	self.enemy_spawn_groups.tac_tazer_flanking = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tazer_flanking,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_M4",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			}
		}
	}

	self.enemy_spawn_groups.tac_tazer_charge = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tazer_charge,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "FBI_swat_R870",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			}
		}
	}

	self.enemy_spawn_groups.tac_bull_rush = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 3,
				unit = "FBI_tank",
				tactics = self._tactics.tank_rush,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tank_cover,
				amount_min = 0,
				amount_max = backup_special_limits,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.tank_cover,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.tank_cover,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			}
		}
	}

	self.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.spooc,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline
			}
		}
	}
	--	potentially 2 cloakers together on mh+
	--	mas goes up to 3, but cloaker spam is not interesting
	--	even though cloakers are barely functional
	self.enemy_spawn_groups.FBI_spoocs = {
		amount = { 1, 2 },
		spawn = {
			{
				rank = 2,
				unit = "spooc",
				tactics = self._tactics.spooc,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.spooc,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.baseline
			}
		}
	}

	--	you have no spawncap, unfortunately.
	--	it was this or use the other mechanics that make sense for truly
	--	level-specific groups, not a group that spawns on all levels
	self.enemy_spawn_groups.marshal_squad = {
		amount = { 3, 4 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_marksman",
				tactics = self._tactics.tazer_flanking,
				amount_min = 1,
				amount_max = group_special_limits,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			}
		},
		spawn_point_chk_ref = {	--	youre treated enough like a special even in vanilla to warrant it
			tac_tazer_flanking = true
		}
	}

	self.enemy_spawn_groups.hostage_rescue = {
		amount = { 2, 3 },
		spawn = {
			{
				rank = 2,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.common
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	--	winters is a mistake
	self.enemy_spawn_groups.Phalanx = {
		amount = {
			self.phalanx.minions.amount + 1,
			self.phalanx.minions.amount + 1
		},
		spawn = {
			{
				rank = 2,
				unit = "Phalanx_vip",
				tactics = self._tactics.shield_phalanx,
				amount_min = 1,
				amount_max = 1,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "Phalanx_minion",
				tactics = self._tactics.shield_phalanx,
				amount_min = self.phalanx.minions.amount,
				amount_max = self.phalanx.minions.amount,
				freq = self._freq.baseline
			}
		}
	}

end )


Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	local diff_i = difficulty_index
	local f = math.max(0, diff_i - 2) / 6

	local function freq(num)
		return { num, num, num }
	end

	self.smoke_and_flash_grenade_timeout = { math.lerp(20, 15, f), math.lerp(25, 20, f) }
	self.smoke_grenade_lifetime = math.lerp(7.5, 12, f)
	self.flash_grenade.timer = math.lerp(2, 1, f)

	local special_weight = math.lerp(3, 5, f)
	local annoying = 1.5	--	dont want too many shields or tasers/marshals, sh frequencies are pretty much perfect
	self.besiege.assault.groups = {
		tac_swat_shotgun_rush = freq(2),
		tac_swat_shotgun_flank = freq(1),
		tac_swat_rifle = freq(14),
		tac_swat_rifle_flank = freq(10),
		tac_shield_wall_ranged = freq(special_weight / annoying),
		tac_shield_wall_charge = freq(special_weight / annoying),
		tac_shield_wall = freq(special_weight / annoying),
		tac_tazer_flanking = freq(special_weight / annoying),
		tac_tazer_charge = freq(special_weight / annoying),
		marshal_squad = freq(special_weight / annoying),
		tac_bull_rush = freq(special_weight),
		FBI_spoocs = freq(special_weight),
		hostage_rescue = freq(1),
		single_spooc = freq(0),
		Phalanx = freq(0),
	}
	self.besiege.recon.groups = {
		hostage_rescue = freq(1),
		marshal_squad = freq(0),
		single_spooc = freq(0),
		Phalanx = freq(0)
	}

	-- Assault phases settings
	if diff_i < 8 then
		self.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
		self.besiege.assault.hostage_hesitation_delay = { 20, 20, 20 }
		self.besiege.assault.force = { 12, 14, 16 }
		self.besiege.assault.force_pool = table.collect(self.besiege.assault.force, function(val) return val * 6 end)
		self.besiege.assault.force_balance_mul = { 1, 2, 3, 4 }
		self.besiege.assault.force_pool_balance_mul = { 1, 2, 3, 4 }
		self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	end
	self.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min

	--	unfortunately cant do reenforce without ai fixes, theyre constantly relocated to players
	--	also the same reason tasers and cloakers are almost nonfunctional
	--	i dont think i need to do this, but better safe than sorry
	self.besiege.reenforce.groups = {
		hostage_rescue = freq(0),
		marshal_squad = freq(0),
		single_spooc = freq(0),
		Phalanx = freq(0)
	}

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval_variation = 0

	self.besiege.regroup.duration = { 30, 25, 20 }

	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

	--	you punish players who dont bring ap for wanting to not bring ap like every other time
	--	and are a complete pushover for those with ap. at least dont be this ridiculous.
	self.phalanx.vip.damage_reduction.max = 0.35
	self.phalanx.vip.damage_reduction.increase_intervall = 10
	self.phalanx.vip.damage_reduction.increase = 0.035
	self.phalanx.vip.damage_reduction.start = 0.035

end )
