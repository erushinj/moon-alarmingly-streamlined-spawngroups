if not StreamHeist then

	Hooks:PreHook( CopBase, "post_init", "ass_post_init", function(self)

		local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
		local choice_chance = math.random()
		local city = difficulty_index > 5
		local city_rifle = city and "g36" or "m4"
		local city_shot = difficulty_index > 7 and "r870" or city and "benelli" or "r870"	--	r870 does more base damage on ds
		local city_smg = city and "ump" or "mp5"
		local city_shot_smg = choice_chance < 0.5 and city_smg or city_shot
		local shot_smg = choice_chance < 0.5 and "mp5" or "r870"
		local pis_rifle = difficulty_index > 3 and choice_chance < 0.5 and "c45" or "m4"

		local weapon_mapping = {
			[Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "m4",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = choice_chance < 0.5 and "c45" or "m4",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = pis_rifle,
			[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"):key()] = "m4",
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = pis_rifle,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = pis_rifle,

			[Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "r870",
			[Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "mp5",
			[Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "r870",
			[Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "mp5",
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = shot_smg,

			[Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "m4",
			[Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = city_rifle,
			[Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "m4",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "m4",
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = city_rifle,

			[Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = shot_smg,
			[Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = city_shot_smg,
			[Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = city_shot,
			[Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = city_smg,
			[Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = city_shot,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = city_shot_smg,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = city_shot_smg,

			[Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "m4",
			[Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = city_rifle,
			[Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "m4",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "m4",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = "m4",
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "m4",
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = "m4",
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "m4",
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = city_rifle,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = city_rifle,

			[Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "r870",
			[Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = city_shot,
			[Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = city_shot,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = "r870",
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = city_shot,
			[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = "r870",
			[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = city_shot,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = city_shot,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = "r870",
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = city_shot,

			[Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = shot_smg,
			[Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = shot_smg,

			[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "m4_yellow",
			[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "m4_yellow"
		}

		self._default_weapon_id = weapon_mapping[self._unit:name():key()] or self._default_weapon_id

	end )

end