function LevelsTweakData:moon_enemy_replacements()
	if not self._moon_enemy_replacements then
		self._moon_enemy_replacements = {
			america = {
				normal = {
					hrt_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
					hrt_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					swat_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					heavy_1 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					heavy_2 = Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
					shield = Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
					sniper = Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					heavy_1 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
					heavy_2 = Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					shield = Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					sniper = Idstring("units/payday2/characters/ene_sniper_2/ene_sniper_2"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
					swat_2 = Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					swat_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					heavy_1 = Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
					heavy_2 = Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
					shield = Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
					sniper = Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				sm_wish = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
					swat_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
					swat_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
					heavy_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
					heavy_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"),
					shield = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					sniper = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"),
					medic_2 = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"),
					taser = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					cloaker = Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			russia = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			zombie = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					hrt_2 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"),
					hrt_3 = Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					swat_1 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					swat_2 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
					swat_3 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					heavy_1 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
					heavy_2 = Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"),
					shield = Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"),
					sniper = Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"),
					dozer_1 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					dozer_2 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
					dozer_3 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
					medic_2 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
					taser = Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					cloaker = Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
					hrt_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					hrt_3 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					swat_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					swat_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					swat_3 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					heavy_1 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
					heavy_2 = Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					shield = Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					sniper = Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"),
					dozer_1 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					dozer_2 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
					dozer_3 = Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
					medic_2 = Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
					taser = Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					cloaker = Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
				},
			},
			murkywater = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
					hrt_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
					swat_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
					swat_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"),
					swat_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
					heavy_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
					heavy_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
					shield = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					sniper = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					dozer_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					dozer_3 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					dozer_4 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					dozer_5 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
					medic_2 = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
					taser = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"),
					cloaker = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			federales = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_2 = Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
					hrt_3 = Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"),
					swat_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					swat_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					swat_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					heavy_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
					heavy_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					shield = Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
					sniper = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					dozer_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"),
					dozer_4 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"),
					dozer_5 = Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"),
					medic_1 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					medic_2 = Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
					taser = Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					cloaker = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
		}

		self._moon_enemy_replacements.america.hard = self._moon_enemy_replacements.america.normal
		self._moon_enemy_replacements.america.overkill = self._moon_enemy_replacements.america.normal
		self._moon_enemy_replacements.america.easy_wish = self._moon_enemy_replacements.america.overkill_145

		self._moon_enemy_replacements.russia.hard = self._moon_enemy_replacements.russia.normal
		self._moon_enemy_replacements.russia.overkill = self._moon_enemy_replacements.russia.normal
		self._moon_enemy_replacements.russia.easy_wish = self._moon_enemy_replacements.russia.overkill_145
		self._moon_enemy_replacements.russia.sm_wish = self._moon_enemy_replacements.russia.overkill_290

		self._moon_enemy_replacements.zombie.hard = self._moon_enemy_replacements.zombie.normal
		self._moon_enemy_replacements.zombie.overkill = self._moon_enemy_replacements.zombie.normal
		self._moon_enemy_replacements.zombie.easy_wish = self._moon_enemy_replacements.zombie.overkill_145
		self._moon_enemy_replacements.zombie.overkill_290 = self._moon_enemy_replacements.zombie.overkill_145
		self._moon_enemy_replacements.zombie.sm_wish = self._moon_enemy_replacements.zombie.overkill_145

		self._moon_enemy_replacements.murkywater.hard = self._moon_enemy_replacements.murkywater.normal
		self._moon_enemy_replacements.murkywater.overkill = self._moon_enemy_replacements.murkywater.normal
		self._moon_enemy_replacements.murkywater.easy_wish = self._moon_enemy_replacements.murkywater.overkill_145
		self._moon_enemy_replacements.murkywater.sm_wish = self._moon_enemy_replacements.murkywater.overkill_290

		self._moon_enemy_replacements.federales.hard = self._moon_enemy_replacements.federales.normal
		self._moon_enemy_replacements.federales.overkill = self._moon_enemy_replacements.federales.normal
		self._moon_enemy_replacements.federales.easy_wish = self._moon_enemy_replacements.federales.overkill_145
		self._moon_enemy_replacements.federales.sm_wish = self._moon_enemy_replacements.federales.overkill_290

		self._moon_enemy_replacements.america.CS_normal = self._moon_enemy_replacements.america.normal
		self._moon_enemy_replacements.america.CS_FBI_overkill = self._moon_enemy_replacements.america.overkill
		self._moon_enemy_replacements.america.FBI_overkill_145 = self._moon_enemy_replacements.america.overkill_145
		self._moon_enemy_replacements.america.FBI_office = self._moon_enemy_replacements.america.overkill_145
		self._moon_enemy_replacements.america.FBI_mcmansion = clone(self._moon_enemy_replacements.america.overkill_145)
		self._moon_enemy_replacements.america.FBI_mcmansion.swat_1 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1")
		self._moon_enemy_replacements.america.FBI_mcmansion.swat_2 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2")
		self._moon_enemy_replacements.america.FBI_mcmansion.swat_3 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1")
		self._moon_enemy_replacements.america.FBI_CITY_easy_wish = self._moon_enemy_replacements.america.easy_wish
		self._moon_enemy_replacements.america.CITY_overkill_290 = self._moon_enemy_replacements.america.overkill_290

		self._moon_enemy_replacements.russia.CS_normal = self._moon_enemy_replacements.russia.normal
		self._moon_enemy_replacements.russia.CS_FBI_overkill = self._moon_enemy_replacements.russia.overkill
		self._moon_enemy_replacements.russia.FBI_overkill_145 = self._moon_enemy_replacements.russia.overkill_145
		self._moon_enemy_replacements.russia.FBI_CITY_easy_wish = self._moon_enemy_replacements.russia.easy_wish
		self._moon_enemy_replacements.russia.CITY_overkill_290 = self._moon_enemy_replacements.russia.overkill_290

		self._moon_enemy_replacements.zombie.CS_normal = self._moon_enemy_replacements.zombie.normal
		self._moon_enemy_replacements.zombie.CS_FBI_overkill = self._moon_enemy_replacements.zombie.overkill
		self._moon_enemy_replacements.zombie.FBI_overkill_145 = self._moon_enemy_replacements.zombie.overkill_145
		self._moon_enemy_replacements.zombie.FBI_CITY_easy_wish = self._moon_enemy_replacements.zombie.easy_wish
		self._moon_enemy_replacements.zombie.CITY_overkill_290 = self._moon_enemy_replacements.zombie.overkill_290

		self._moon_enemy_replacements.murkywater.CS_normal = self._moon_enemy_replacements.murkywater.normal
		self._moon_enemy_replacements.murkywater.CS_FBI_overkill = self._moon_enemy_replacements.murkywater.overkill
		self._moon_enemy_replacements.murkywater.FBI_overkill_145 = self._moon_enemy_replacements.murkywater.overkill_145
		self._moon_enemy_replacements.murkywater.FBI_CITY_easy_wish = self._moon_enemy_replacements.murkywater.easy_wish
		self._moon_enemy_replacements.murkywater.CITY_overkill_290 = self._moon_enemy_replacements.murkywater.overkill_290

		self._moon_enemy_replacements.federales.CS_normal = self._moon_enemy_replacements.federales.normal
		self._moon_enemy_replacements.federales.CS_FBI_overkill = self._moon_enemy_replacements.federales.overkill
		self._moon_enemy_replacements.federales.FBI_overkill_145 = self._moon_enemy_replacements.federales.overkill_145
		self._moon_enemy_replacements.federales.FBI_CITY_easy_wish = self._moon_enemy_replacements.federales.easy_wish
		self._moon_enemy_replacements.federales.CITY_overkill_290 = self._moon_enemy_replacements.federales.overkill_290
	end

	return self._moon_enemy_replacements[self:get_ai_group_type()] or self._moon_enemy_replacements.america
end

function LevelsTweakData:moon_enemy_mapping()
	if not self._moon_enemy_mapping then
		self._moon_enemy_mapping = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "hrt_1",
			[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "hrt_1",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = "hrt_1",
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "hrt_2",
			[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "hrt_2",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = "hrt_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "hrt_2",
			[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "hrt_2",
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "hrt_3",
			[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "hrt_3",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "hrt_3",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "hrt_3",

			[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",
			[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "swat_1",
			[("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = "swat_1",
			[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "swat_1",
			[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = "swat_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = "swat_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = "swat_1",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "swat_1",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = "swat_1",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "swat_1",
			[("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",
			[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "swat_2",
			[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
			[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = "swat_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = "swat_2",
			[("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = "swat_2",
			[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = "swat_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = "swat_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = "swat_2",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = "swat_2",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = "swat_2",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = "swat_2",
			[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",

			[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "heavy_1",
			[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "heavy_1",
			[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = "heavy_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "heavy_1",
			[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = "heavy_1",
			[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = "heavy_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "heavy_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = "heavy_1",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = "heavy_1",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "heavy_1",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = "heavy_1",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = "heavy_1",
			[("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "heavy_2",
			[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "heavy_2",
			[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = "heavy_2",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = "heavy_2",

			[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield",
			[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield",
			[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = "shield",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = "shield",
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = "shield",
			[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = "shield",
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = "shield",
			[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = "shield",

			[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"):key()] = "sniper",
			[("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"):key()] = "sniper",
			[("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"):key()] = "sniper",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"):key()] = "sniper",

			[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer_1",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"):key()] = "dozer_1",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"):key()] = "dozer_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "dozer_1",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"):key()] = "dozer_1",
			[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer_2",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"):key()] = "dozer_2",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = "dozer_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"):key()] = "dozer_2",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "dozer_2",
			[("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer_3",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer_3",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"):key()] = "dozer_3",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"):key()] = "dozer_3",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"):key()] = "dozer_3",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "dozer_3",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer_4",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer_4",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"):key()] = "dozer_4",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"):key()] = "dozer_4",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "dozer_5",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "dozer_5",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = "dozer_5",

			[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "medic_1",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "medic_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "medic_1",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "medic_1",
			[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "medic_2",

			[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "taser",
			[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "taser",
			[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "taser",
			[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "taser",

			[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = "cloaker",
			[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = "cloaker",
			[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = "cloaker",

			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "marshal_1",
			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "marshal_1",
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "marshal_2",
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "marshal_2",
		}
	end

	return self._moon_enemy_mapping
end

function LevelsTweakData:moon_level_enemy_replacements()
	if not self._moon_level_enemy_replacements then
		self._moon_level_enemy_replacements = {
			moon = {
				[("units/payday2/characters/ene_security_1/ene_security_1"):key()] = Idstring("units/payday2/characters/ene_security_4/ene_security_4"),
			},
			rvd1 = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"),
				[("units/payday2/characters/ene_cop_4/ene_cop_3"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
				[("units/payday2/characters/ene_cop_3/ene_cop_4"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"),
			},
			fex = {
				[("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
				[("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
				[("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
				[("units/payday2/characters/ene_security_3/ene_security_3"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
			},
			chas = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
				[("units/payday2/characters/ene_cop_4/ene_cop_3"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
				[("units/payday2/characters/ene_cop_3/ene_cop_4"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
			},
			ranc = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
				[("units/payday2/characters/ene_cop_4/ene_cop_3"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
				[("units/payday2/characters/ene_cop_3/ene_cop_4"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
			},
			deep = {
				[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
				[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
			},
		}

		self._moon_level_enemy_replacements.rvd2 = self._moon_level_enemy_replacements.rvd1
		self._moon_level_enemy_replacements.sand = self._moon_level_enemy_replacements.chas
		self._moon_level_enemy_replacements.pent = self._moon_level_enemy_replacements.chas
		self._moon_level_enemy_replacements.corp = self._moon_level_enemy_replacements.ranc
	end

	return self._moon_level_enemy_replacements[ASS:get_var("level_id")] or {}
end

