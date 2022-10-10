if not ASS then

	ASS = {}

	ASS.massive = true

	ASS.settings = {}
	ASS.settings.remove_bad_dw_preset_enemies = false
	ASS.settings.american_enemies_everywhere = false
	ASS.settings.blue_swat_hrt = true
	ASS.settings.map_force_overrides = true
	ASS.settings.intense_assault = true

end


--	i love if-else if-else
--	im doing this to fix incorrect units (eg, city heavy shotgunners for murkywater, or city-tier akan mercs on ds) while allowing
--	me to keep track of which units i use more easily than having to constantly crosscheck with vanilla groupaitweakdata
Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "ass__init_unit_categories", function(self, difficulty_index)

	local diff_i = difficulty_index
	local faction_ref = clone(self.unit_categories.CS_swat_MP5.unit_types) 	--	you will be used later.

	if StreamHeist then
		if StreamHeist.settings and StreamHeist.settings.faction_tweaks then
			if not StreamHeist.settings.faction_tweaks.russia then	--	basic-tier heavies look too similar to akan taser and city mercs are fugly.
				self.unit_categories.FBI_swat_M4.unit_types.russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
				}
				self.unit_categories.FBI_swat_R870.unit_types.russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
				}
				self.unit_categories.FBI_heavy_G36.unit_types.russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
				}
				self.unit_categories.FBI_heavy_R870.unit_types.russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
				}
			end
			if not StreamHeist.settings.faction_tweaks.murkywater then	--	gensec moment
				self.unit_categories.FBI_heavy_R870.unit_types.murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
				}
			end
			if not StreamHeist.settings.faction_tweaks.federales then
				--	no real issues, do nothing unless something crops up
			end
		end
		self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
		}
		self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
		}
		self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
	else
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

		if ASS.settings.blue_swat_hrt then
			if diff_i < 4 then
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
					Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
				}
			else
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
					Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
				}
			end
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

		if ASS.settings.remove_bad_dw_preset_enemies and diff_i == 7 then
			self.unit_categories.CS_tazer.unit_types.russia = {
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
			}
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			}
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
			}
			self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
			}
			if ASS.settings.blue_swat_hrt then
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
				}
			end
		end
		if ASS.settings.intense_assault then
			self.unit_categories.FBI_swat_M4 = self.unit_categories.FBI_heavy_G36
			self.unit_categories.FBI_swat_R870 = self.unit_categories.FBI_heavy_R870
			self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy")
			}
			self.unit_categories.FBI_suit_C45_M4.unit_types.federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
			}
			if ASS.settings.remove_bad_dw_preset_enemies and diff_i == 7 then
				self.unit_categories.FBI_suit_C45_M4.unit_types.russia = {
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
				}
				self.unit_categories.FBI_suit_stealth_MP5 = self.unit_categories.FBI_suit_C45_M4
			else
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.murkywater = {
					Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
				}
				self.unit_categories.FBI_suit_stealth_MP5.unit_types.federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
				}
			end
		end

		--	add m249 dozers to mayhem
		if diff_i == 6 then
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
			table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
			table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
			table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
			table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))
		end

		--	mayhem really should be closer to death wish than ovk
		local limits_shield = { 0, 2, 2, 4, 4, 6, 6, 8 }
		local limits_medic = { 0, 0, 0, 0, 1, 2, 3, 4 }
		local limits_taser = { 0, 0, 1, 1, 2, 3, 3, 4 }
		local limits_tank = { 0, 0, 0, 1, 1, 2, 2, 3 }
		local limits_spooc = { 0, 0, 0, 1, 2, 3, 3, 4 }
		self.special_unit_spawn_limits = {
			shield = limits_shield[diff_i],
			medic = limits_medic[diff_i],
			taser = limits_taser[diff_i],
			tank = limits_tank[diff_i],
			spooc = limits_spooc[diff_i]
		}
	end

	--	dozer fixes that happen with or without sh
	--	correct vh federales dozer, all dozer types for ds zombies
	if diff_i < 5 then
		self.unit_categories.FBI_tank.unit_types.federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
		}
	elseif diff_i == 8 then
		self.unit_categories.FBI_tank.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
	end

	--	merc marshal makes no sense for basically-america enemies, including vanilla using regular medicdozers and minidozers, use us marshal instead
	self.unit_categories.marshal_marksman.unit_types.zombie = {
		Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1")
	}

	--	sets new factions to america if any are added, or all to america if american enemies everywhere is enabled
	for category_k, category_v in pairs(self.unit_categories) do
		for faction, _ in pairs(faction_ref) do
			if category_v.unit_types and category_v.unit_types.america then
				local current_factions = { "america", "russia", "zombie", "murkywater", "federales" }
				if ASS.settings.american_enemies_everywhere or not table.contains(current_factions, faction) then
					self.unit_categories[category_k].unit_types[faction] = deep_clone(category_v.unit_types.america)
				end
			end
		end
	end

end )


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups", "ass__init_enemy_spawn_groups", function(self, difficulty_index)

	local diff_i = difficulty_index

	--	shame most of these tactics might as well or literally do nothing in vanilla
	self._tactics.swat_shotgun_rush = {
		"charge",
		"smoke_grenade",
		"deathguard"
	}
	self._tactics.swat_shotgun_flank = {
		"charge",
		"flank",
		"flash_grenade",
		"deathguard",
		"rescue_hostages"	--	used for sh, but doesnt need a particular sh check
	}
	self._tactics.swat_rifle = {
		"ranged_fire",
		"smoke_grenade"
	}
	self._tactics.swat_rifle_flank = {
		"flank",
		"flash_grenade",
		"rescue_hostages"
	}

	self._tactics.shield_phalanx = {
		"smoke_grenade",
		"charge",
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
		"shield_cover",
		"deathguard"
	}

	self._tactics.tazer_flanking = {	--	also used for marshals
		"shield_cover",
		"flank",
		"murder"
	}
	self._tactics.tazer_charge = {
		"shield_cover",
		"charge",
		"murder"
	}
	self._tactics.tazer_shield = {	--	taser backup is suicidal (in sh, since this tactic doesnt do anything in vanilla)
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
		"murder"
	}

	self._tactics.spooc = {
		"flank",
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

	self._amount = {
		swat = {
			[1] = { 2, 2 },
			[2] = { 2, 2 },
			[3] = { 2, 3 },
			[4] = { 2, 3 },
			[5] = { 3, 3 },
			[6] = { 3, 3 },
			[7] = { 3, 3 },
			[8] = { 3, 3 },
			["intense"] = { 3, 3 }
		},
		shield = {
			[1] = { 2, 3 },
			[2] = { 2, 3 },
			[3] = { 3, 3 },
			[4] = { 3, 4 },
			[5] = { 4, 4 },
			[6] = { 4, 5 },
			[7] = { 4, 5 },
			[8] = { 4, 5 },
			["intense"] = { 6, 6 }
		},
		tazer = {
			[1] = { 1, 1 },
			[2] = { 1, 1 },
			[3] = { 1, 2 },
			[4] = { 2, 2 },
			[5] = { 2, 3 },
			[6] = { 3, 3 },
			[7] = { 3, 3 },
			[8] = { 3, 3 },
			["intense"] = { 6, 6 }
		},
		tank = {
			[1] = { 1, 1 },
			[2] = { 1, 1 },
			[3] = { 1, 2 },
			[4] = { 2, 2 },
			[5] = { 2, 3 },
			[6] = { 3, 3 },
			[7] = { 3, 3 },
			[8] = { 3, 3 },
			["intense"] = { 6, 6 }
		},
		spooc = {
			[1] = { 1, 1 },
			[2] = { 1, 1 },
			[3] = { 1, 1 },
			[4] = { 1, 1 },
			[5] = { 1, 1 },
			[6] = { 1, 2 },
			[7] = { 1, 2 },
			[8] = { 1, 2 },
			["intense"] = { 3, 3 }
		},
		marshal = {
			[1] = { 1, 1 },
			[2] = { 1, 1 },
			[3] = { 1, 1 },
			[4] = { 1, 1 },
			[5] = { 1, 1 },
			[6] = { 1, 2 },
			[7] = { 1, 2 },
			[8] = { 1, 2 },
			["intense"] = { 3, 3 }
		}
	}

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = self._amount.swat[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 2,
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
		amount = self._amount.swat[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	self.enemy_spawn_groups.tac_swat_rifle = {
		amount = self._amount.swat[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle,
				amount_min = 0,
				amount_max = 2,
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
		amount = self._amount.swat[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 2,
				unit = "FBI_swat_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 2,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.elite
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.uncommon
			}
		}
	}

	self.enemy_spawn_groups.tac_shield_wall_ranged = {
		amount = self._amount.shield[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.shield_ranged,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "FBI_heavy_G36",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 4,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			},
			{
				rank = 1,
				unit = "medic_M4",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.elite
			}
		}
	}
	--	this is a terrible group that has no good reason to exist
	self.enemy_spawn_groups.tac_shield_wall = self.enemy_spawn_groups.tac_shield_wall_ranged

	self.enemy_spawn_groups.tac_shield_wall_charge = {
		amount = self._amount.shield[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_shield",
				tactics = self._tactics.shield_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "FBI_heavy_R870",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 4,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.rare
			},
			{
				rank = 1,
				unit = "medic_R870",
				tactics = self._tactics.shield_cover,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.elite
			}
		}
	}

	self.enemy_spawn_groups.tac_tazer_flanking = {
		amount = self._amount.tazer[diff_i],
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tazer_flanking,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "spooc",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 1,
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
		amount = self._amount.tazer[diff_i],
		spawn = {
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tazer_charge,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_shield",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 1,
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
		amount = self._amount.tank[diff_i],
		spawn = {
			{
				rank = 3,
				unit = "FBI_tank",
				tactics = self._tactics.tank_rush,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 2,
				unit = "CS_tazer",
				tactics = self._tactics.tank_cover,
				amount_min = 0,
				amount_max = 1,
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

	self.enemy_spawn_groups.FBI_spoocs = {
		amount = self._amount.spooc[diff_i],
		spawn = {
			{
				rank = 2,
				unit = "spooc",
				tactics = self._tactics.spooc,
				amount_min = 1,
				amount_max = 2,
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

	local marshal_limits = { 0, 1, 1, 1, 2, 2, 2, 3 }
	local marshal_cooldown = { 65, 60, 55, 50, 45, 40, 35, 30 }
	self.enemy_spawn_groups.marshal_squad = {
		max_nr_simultaneous_groups = marshal_limits[diff_i],
		spawn_cooldown = marshal_cooldown[diff_i],
		initial_spawn_delay = marshal_cooldown[diff_i],
		amount = self._amount.marshal[diff_i],
		spawn = {
			{
				rank = 2,
				unit = "marshal_marksman",
				tactics = self._tactics.tazer_flanking,
				amount_min = 1,
				amount_max = 2,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.tazer_shield,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.baseline
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	self.enemy_spawn_groups.hostage_rescue = {
		amount = self._amount.swat[diff_i],
		spawn = {
			{
				rank = 1,
				unit = "FBI_suit_stealth_MP5",
				tactics = self._tactics.swat_shotgun_flank,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.uncommon
			},
			{
				rank = 1,
				unit = "FBI_suit_C45_M4",
				tactics = self._tactics.swat_rifle_flank,
				amount_min = 0,
				amount_max = 3,
				freq = self._freq.baseline
			},
			{
				rank = 1,
				unit = "CS_tazer",
				tactics = self._tactics.swat_shotgun_rush,
				amount_min = 0,
				amount_max = 1,
				freq = self._freq.elite
			}
		},
		spawn_point_chk_ref = {
			tac_swat_rifle_flank = true
		}
	}

	--	winters is a mistake
	--	i dont need to do this but whatever
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

	if StreamHeist then
		self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_rush)
		table.remove(self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic.spawn)
		table.remove(self.enemy_spawn_groups.tac_swat_shotgun_rush_no_medic.spawn)

		self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_flank)
		table.remove(self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic.spawn)
		table.remove(self.enemy_spawn_groups.tac_swat_shotgun_flank_no_medic.spawn)

		self.enemy_spawn_groups.tac_swat_rifle_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_rifle)
		table.remove(self.enemy_spawn_groups.tac_swat_rifle_no_medic.spawn)
		table.remove(self.enemy_spawn_groups.tac_swat_rifle_no_medic.spawn)

		self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic = deep_clone(self.enemy_spawn_groups.tac_swat_rifle_flank)
		table.remove(self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic.spawn)
		table.remove(self.enemy_spawn_groups.tac_swat_rifle_flank_no_medic.spawn)
	end

	if ASS.settings.intense_assault and not StreamHeist then
		self.enemy_spawn_groups.tac_swat_shotgun_rush.amount = self._amount.swat["intense"]
		self.enemy_spawn_groups.tac_swat_shotgun_rush.spawn[1].amount_max = 3
		self.enemy_spawn_groups.tac_swat_shotgun_rush.spawn[5] = deep_clone(self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[3])
		self.enemy_spawn_groups.tac_swat_shotgun_rush.spawn[5].tactics = self._tactics.swat_shotgun_rush
		self.enemy_spawn_groups.tac_swat_shotgun_rush.spawn[2].amount_max = 0

		self.enemy_spawn_groups.tac_swat_shotgun_flank.amount = self._amount.swat["intense"]
		self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[1].amount_max = 3
		self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[1].freq = self._freq.baseline
		self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[5] = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_rush.spawn[3])
		self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[5].tactics = self._tactics.swat_shotgun_flank
		self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[2].amount_max = 0

		self.enemy_spawn_groups.tac_swat_rifle.amount = self._amount.swat["intense"]
		self.enemy_spawn_groups.tac_swat_rifle.spawn[1].amount_max = 3
		self.enemy_spawn_groups.tac_swat_rifle.spawn[5] = deep_clone(self.enemy_spawn_groups.tac_swat_shotgun_flank.spawn[3])
		self.enemy_spawn_groups.tac_swat_rifle.spawn[5].tactics = self._tactics.swat_rifle
		self.enemy_spawn_groups.tac_swat_rifle.spawn[2].amount_max = 0

		self.enemy_spawn_groups.tac_swat_rifle_flank.amount = self._amount.swat["intense"]
		self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[1].amount_max = 3
		self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[1].freq = self._freq.baseline
		self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[5] = deep_clone(self.enemy_spawn_groups.tac_swat_rifle.spawn[3])
		self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[5].tactics = self._tactics.swat_rifle_flank
		self.enemy_spawn_groups.tac_swat_rifle_flank.spawn[2].amount_max = 0

		self.enemy_spawn_groups.tac_shield_wall_ranged.amount = self._amount.shield["intense"]
		self.enemy_spawn_groups.tac_shield_wall_ranged.spawn[1].amount_min = 2
		self.enemy_spawn_groups.tac_shield_wall_ranged.spawn[1].amount_max = 3

		self.enemy_spawn_groups.tac_shield_wall_charge.amount = self._amount.shield["intense"]
		self.enemy_spawn_groups.tac_shield_wall_charge.spawn[1].amount_min = 2
		self.enemy_spawn_groups.tac_shield_wall_charge.spawn[1].amount_max = 3

		self.enemy_spawn_groups.tac_tazer_flanking.amount = self._amount.tazer["intense"]
		self.enemy_spawn_groups.tac_tazer_flanking.spawn[1].amount_min = 2
		self.enemy_spawn_groups.tac_tazer_flanking.spawn[1].amount_max = 3

		self.enemy_spawn_groups.tac_tazer_charge.amount = self._amount.tazer["intense"]
		self.enemy_spawn_groups.tac_tazer_charge.spawn[1].amount_min = 2
		self.enemy_spawn_groups.tac_tazer_charge.spawn[1].amount_max = 3

		self.enemy_spawn_groups.tac_bull_rush.amount = self._amount.tank["intense"]
		self.enemy_spawn_groups.tac_bull_rush.spawn[1].amount_min = 2
		self.enemy_spawn_groups.tac_bull_rush.spawn[1].amount_max = 3

		self.enemy_spawn_groups.FBI_spoocs.amount = self._amount.spooc["intense"]
		self.enemy_spawn_groups.FBI_spoocs.spawn[1].amount_min = 2
		self.enemy_spawn_groups.FBI_spoocs.spawn[1].amount_max = 3

		self.enemy_spawn_groups.marshal_squad.amount = self._amount.marshal["intense"]
		self.enemy_spawn_groups.marshal_squad.max_nr_simultaneous_groups = 3
		self.enemy_spawn_groups.marshal_squad.spawn_cooldown = 30
		self.enemy_spawn_groups.marshal_squad.initial_spawn_delay = 30
		self.enemy_spawn_groups.marshal_squad.spawn[1].amount_min = 2
		self.enemy_spawn_groups.marshal_squad.spawn[1].amount_max = 3

		self.enemy_spawn_groups.hostage_rescue.amount = self._amount.swat["intense"]
		self.enemy_spawn_groups.hostage_rescue.max_nr_simultaneous_groups = 2
		self.enemy_spawn_groups.hostage_rescue.spawn_cooldown = 30
		self.enemy_spawn_groups.hostage_rescue.initial_spawn_delay = 30
	end

end )


local job_force_override = {
	big = {
		"crojob2",
		"friend",
		"chca",
		"peta",
		"mad"
	},
	small = {
		"welcome_to_the_jungle_2",
		"cane",
		"brb",
		"mus",
		"run",
		"glace",
		"pbr",
		"dinner",
		"flat",
		"gallery",
		"framing_frame_1",
		"framing_frame_3",
		"spa",
		"man",
		"jolly",
		"firestarter_3",
		"roberts",
		"family",
		"jewelry_store",
		"rat",
		"chas",
		"pent",
		"rvd1",
		"crojob3",
		"crojob3_night"
	},
	smaller = {
		"pbr2",
		"rvd2",
		"vit",
		"nmh",
		"hox_1",
		"xmn_hox_1",
		"bph",
		"born",
		"fex",
		"ranc"
	},
	smallest = {
		"hvh",
		"peta2",
		"mia_2",
		"sah",
		"des",
		"help",
		"nail",
		"chill_combat",
		"mex",
		"mex_cooking",
		"sand",
		"chew"
	}
}
Hooks:PostHook( GroupAITweakData, "_init_task_data", "ass__init_task_data", function(self, difficulty_index)

	if not StreamHeist then
		local diff_i = difficulty_index
		local f = math.max(0, diff_i - 2) / 6

		--	grenade settings
		self.flash_grenade.timer = math.lerp(2, 1, f)

		--	assault length, force, etc settings (most apply only below ds)
		self.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
		self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
		if diff_i < 8 then
			self.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
			self.besiege.assault.hostage_hesitation_delay = { 20, 20, 20 }
			self.besiege.assault.force = { 12, 14, 16 }
			self.besiege.assault.force_pool = { 50, 65, 80 }
			self.besiege.assault.force_balance_mul = { 1, 2, 3, 4 }
			self.besiege.assault.force_pool_balance_mul = { 1, 2, 3, 4 }
			self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }

			if ASS.settings.map_force_overrides then
				local job = Global.level_data and Global.level_data.level_id
				local force_add = 0
				local pool_mul = 1
				for _, level_id in pairs(job_force_override.big) do
					if job == level_id then
						force_add = 2
						pool_mul = 1.1
					end
				end		
				for _, level_id in pairs(job_force_override.small) do
					if job == level_id then
						force_add = -2
						pool_mul = 0.9
					end
				end	
				for _, level_id in pairs(job_force_override.smaller) do
					if job == level_id then
						force_add = -4
						pool_mul = 0.8
					end
				end
				for _, level_id in pairs(job_force_override.smallest) do
					if job == level_id then
						force_add = -6
						pool_mul = 0.7
					end
				end
				local force_ref = clone(self.besiege.assault.force)
				local pool_ref = clone(self.besiege.assault.force_pool)
				self.besiege.assault.force = table.collect(force_ref, function(val) return math.max(val + force_add, 1) end)
				self.besiege.assault.force_pool = table.collect(pool_ref, function(val) return val * pool_mul end)
			end
			if ASS.settings.intense_assault then
				local mul = 0.75
				local force_ref = clone(self.besiege.assault.force)
				local pool_ref = clone(self.besiege.assault.force_pool)
				self.besiege.assault.force = table.collect(force_ref, function(val) return val * mul end)
				self.besiege.assault.force_pool = table.collect(pool_ref, function(val) return val * mul end)
				log("self.besiege.assault.force is ", self.besiege.assault.force[1], self.besiege.assault.force[2], self.besiege.assault.force[3])
				log("self.besiege.assault.force_pool is ", self.besiege.assault.force_pool[1], self.besiege.assault.force_pool[2], self.besiege.assault.force_pool[3])
			end
		end
		--	other assault stuff
		self.besiege.recon.force = { 2, 4, 6 }
		self.besiege.recon.interval_variation = 0

		self.besiege.regroup.duration = { 30, 25, 20 }

		self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }

		--	you punish players who dont bring ap for wanting to not bring ap like every other time
		--	and are a complete pushover for those with ap. at least dont be this ridiculous.
		self.phalanx.vip.damage_reduction.max = 0.35
		self.phalanx.vip.damage_reduction.increase_intervall = 10
		self.phalanx.vip.damage_reduction.increase = 0.035
		self.phalanx.vip.damage_reduction.start = 0.035

		--	spawngroup weights (based on sh, but no difficulty scaling since vanilla doesnt do that well)
		local function freq(num)
			return { num, num, num }
		end
		local special_weight = math.lerp(3, 5, f)
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = freq(2),
			tac_swat_shotgun_flank = freq(1),
			tac_swat_rifle = freq(16),
			tac_swat_rifle_flank = freq(8),
			tac_shield_wall_ranged = freq(special_weight),
			tac_shield_wall_charge = freq(special_weight),
			tac_tazer_flanking = freq(special_weight),
			tac_tazer_charge = freq(special_weight),
			tac_bull_rush = freq(special_weight),
			FBI_spoocs = freq(special_weight),
			marshal_squad = freq(0),
			hostage_rescue = freq(0),
			single_spooc = freq(0),
			Phalanx = freq(0)
		}
		self.besiege.recon.groups = {
			hostage_rescue = freq(1),
			marshal_squad = freq(0),
			single_spooc = freq(0),
			Phalanx = freq(0)
		}

		self.street = deep_clone(self.besiege)
		self.safehouse = deep_clone(self.besiege)
	end

end )