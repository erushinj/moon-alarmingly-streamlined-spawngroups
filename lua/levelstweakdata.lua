local try_insert = ASS:require("try_insert", true)
local level_id = ASS:get_var("level_id")

-- is it obvious enough i dont like custom maps not loading the vanilla faction for the unit type they use
function LevelsTweakData:moon_custom_maps_boowomp()
	local boowomp = self._moon_custom_maps_boowomp

	if boowomp == nil then
		local level = self[level_id] or {}
		local packages = level.package or level.custom_packages
		packages = type(packages) ~= "table" and { packages, } or packages

		for _, func in ipairs({
			function()  -- check level ids where package auto-detect is known not to work
				return ({
					rusdl = { fucked = "russia", use = "constantine_fsb", },
				})[level_id]
			end,
			function()  -- then check packages if not found
				for k, v in pairs({
					["packages/levels/constantine_cartel_faction/world/world"] = { fucked = "federales", use = "constantine_cartel", },
				}) do
					if table.contains(packages, k) then
						return v
					end
				end
			end,
		}) do
			boowomp = func()

			if boowomp then
				break
			end
		end

		self._moon_custom_maps_boowomp = boowomp or false
	end

	if boowomp then
		return boowomp.fucked, boowomp.use
	end
end

-- fetches a common american unit by a shorthand name
function LevelsTweakData:moon_units()
	if not self._moon_units then
		self._moon_units = {
			security_1 = Idstring("units/payday2/characters/ene_security_1/ene_security_1"),
			security_2 = Idstring("units/payday2/characters/ene_security_2/ene_security_2"),
			security_3 = Idstring("units/payday2/characters/ene_security_3/ene_security_3"),
			cop_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			cop_2 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),
			cop_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			cop_4 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
			fbi_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			fbi_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			fbi_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
			swat_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			swat_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			swat_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
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
		}
	end

	return self._moon_units
end

function LevelsTweakData:moon_random_units()
	if not self._moon_random_units then
		local units = self:moon_units()
		local security_1, security_2, security_3 = units.security_1, units.security_2, units.security_3
		local cop_1, cop_2, cop_3, cop_4 = units.cop_1, units.cop_2, units.cop_3, units.cop_4
		local fbi_1, fbi_2, fbi_3 = units.fbi_1, units.fbi_2, units.fbi_3
		local swat_1, swat_2, swat_3 = units.swat_1, units.swat_2, units.swat_3
		local heavy_1, heavy_2 = units.heavy_1, units.heavy_2
		local shield, taser, cloaker, medic_1, medic_2 = units.shield, units.taser, units.cloaker, units.medic_1, units.medic_2
		local dozer_1, dozer_2, dozer_3, dozer_4, dozer_5 = units.dozer_1, units.dozer_2, units.dozer_3, units.dozer_4, units.dozer_5
		local marshal_1, marshal_2 = units.marshal_1, units.marshal_2

		self._moon_random_units = {
			securitys = { security_1, security_2, security_3, },
			securitys_light = { security_1, security_2, },
			securitys_heavy = { security_2, security_3, },
			cops = { cop_1, cop_2, cop_3, cop_4, },
			cops_light = { cop_1, cop_2, },
			cops_medium = { cop_2, cop_4, },
			cops_heavy = { cop_3, cop_4, },
			cops_no_c45 = { cop_2, cop_3, cop_4, },
			cops_no_bronco = { cop_1, cop_3, cop_4, },
			cops_no_r870 = { cop_1, cop_2, cop_4, },
			cops_no_mp5 = { cop_1, cop_2, cop_3, },
			fbis = { fbi_1, fbi_2, fbi_3, },
			fbis_light = { fbi_1, fbi_2, },
			fbis_heavy = { fbi_2, fbi_3, },
			swats = { swat_1, swat_2, swat_3, },
			swats_close = { swat_2, swat_3, },
			swats_far = { swat_1, swat_3, },
			heavys = { heavy_1, heavy_2, },
			swats_heavys = { swat_1, swat_2, swat_3, heavy_1, heavy_1, heavy_2, },
			swats_heavys_close = { swat_2, swat_3, heavy_2, heavy_2, },
			swats_heavys_far = { swat_1, swat_3, heavy_1, heavy_1, },
			marshals_far = { marshal_1, heavy_1, },
			marshals_close = { marshal_2, heavy_2, },
			specials_agg = { taser, cloaker, },
			specials_def = { taser, shield, },
			specials_sup = { shield, shield, medic_1, medic_2, },
			specials_any = { shield, shield, taser, taser, cloaker, cloaker, medic_1, medic_2, },
			specials_no_med = { shield, taser, cloaker, },
			specials_no_clk = { shield, shield, taser, taser, medic_1, medic_2, },
			specials_no_shield = { taser, taser, cloaker, cloaker, medic_1, medic_2, },
			specials_taser_medic = { taser, taser, medic_1, medic_2, },
			specials_med = { medic_1, medic_2, },
			dozers_any = { dozer_1, },
		}

		local real_difficulty_index = ASS:get_var("real_difficulty_index")
		for _, v in pairs({
			{ 2, dozer_1, },
			{ 4, dozer_2, },
			{ 6, dozer_3, },
			{ 7, dozer_4, },
			{ 8, dozer_5, },
		}) do
			local diff_i, dozer = unpack(v)

			if real_difficulty_index >= diff_i then
				try_insert(self._moon_random_units.dozers_any, dozer)
			end
		end

		self._moon_random_units.dozers_no_mini = clone(self._moon_random_units.dozers_any)
		table.delete(self._moon_random_units.dozers_no_mini, dozer_4)

		self._moon_random_units.dozers_no_med = clone(self._moon_random_units.dozers_any)
		table.delete(self._moon_random_units.dozers_no_med, dozer_5)

		self._moon_random_units.dozers_no_cs = clone(self._moon_random_units.dozers_any)
		table.delete(self._moon_random_units.dozers_no_cs, dozer_4)
		table.delete(self._moon_random_units.dozers_no_cs, dozer_5)
	end

	return self._moon_random_units
end

-- fetches a table of common american units by a shorthand name
function LevelsTweakData:moon_random_unit(typ)
	local random_units = self:moon_random_units()

	return random_units[typ] or random_units.cops
end

function LevelsTweakData:moon_forbidden_scripted_replacements()
	local forbidden_replacements = self._moon_forbidden_scripted_replacements

	if not forbidden_replacements then
		forbidden_replacements = {
			default = {
				hrt_1 = true,
				hrt_2 = true,
				hrt_3 = true,
			},
		}

		self._moon_forbidden_scripted_replacements = forbidden_replacements
	end

	return forbidden_replacements[level_id] or forbidden_replacements.default
end

-- replacements based on mapped enemy key
function LevelsTweakData:moon_enemy_replacements(continent)
	local replacements = self._moon_enemy_replacements

	if not replacements then
		replacements = {
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
			constantine_cartel = {
				normal = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
				},
				sm_wish = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_1/ene_cartel_soldier_zeal_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_3/ene_cartel_soldier_zeal_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"),
				},
			},
			constantine_fsb = {
				normal = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"),  -- apparently this is a light swat.
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"),  -- and apparently this is a heavy swat.
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"),
					hrt_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"),
					swat_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"),
					swat_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"),
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
		}

		replacements.america.FBI_mcmansion = clone(replacements.america.overkill_145)
		replacements.america.FBI_mcmansion.swat_1 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1")
		replacements.america.FBI_mcmansion.swat_2 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2")
		replacements.america.FBI_mcmansion.swat_3 = Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1")

		for _, tbl in ipairs({
			{
				easy = "normal",
				hard = "normal",
				overkill = "normal",
				overkill_145 = "normal",
				CS_normal = "normal",
			},
			{
				CS_FBI_overkill = "overkill",
			},
			{
				easy_wish = "overkill_145",
				overkill_290 = "overkill_145",
				FBI_overkill_145 = "overkill_145",
				FBI_office = "overkill_145",
				FBI_mcmansion = "overkill_145",
			},
			{
				FBI_CITY_easy_wish = "easy_wish",
			},
			{
				sm_wish = "overkill_290",
				CITY_overkill_290 = "overkill_290",
				CITY_ZEAL_awesome_difficulty_name = "overkill_290",
			},
			{
				ZEAL_sm_wish = "sm_wish",
			},
		}) do
			for diff, based_on in pairs(tbl) do
				for _, v in pairs(replacements) do
					v[diff] = v[diff] or v[based_on]
				end
			end
		end

		local fucked, use = self:moon_custom_maps_boowomp()
		if replacements[fucked] and replacements[use] then
			replacements["actual_" .. fucked] = replacements[fucked]
			replacements[fucked] = replacements[use]
		end

		self._moon_enemy_replacements = replacements
	end

	if continent == "all" then
		return replacements
	end

	return replacements[continent or self:get_ai_group_type()] or replacements.america
end

-- fetches mapped enemy keys
function LevelsTweakData:moon_enemy_mapping()
	if not self._moon_enemy_mapping then
		self._moon_enemy_mapping = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "hrt_1",
			[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "hrt_1",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = "hrt_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"):key()] = "hrt_1",
			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "hrt_2",
			[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "hrt_2",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = "hrt_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "hrt_2",
			[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "hrt_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"):key()] = "hrt_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = "hrt_2",
			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "hrt_3",
			[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "hrt_3",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "hrt_3",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "hrt_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"):key()] = "hrt_3",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "hrt_3",

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

			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_1/ene_cartel_soldier_zeal_1"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "swat_1",

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

			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_3/ene_cartel_soldier_zeal_3"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "swat_2",

			[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",

			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"):key()] = "swat_3",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "swat_3",

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
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = "heavy_1",
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
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"):key()] = "heavy_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = "heavy_2",

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
			[("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = "shield",
			[("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = "shield",

			[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"):key()] = "sniper",
			[("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"):key()] = "sniper",
			[("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"):key()] = "sniper",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"):key()] = "sniper",
			[("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"):key()] = "sniper",

			[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer_1",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"):key()] = "dozer_1",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"):key()] = "dozer_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "dozer_1",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"):key()] = "dozer_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"):key()] = "dozer_1",
			[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer_2",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"):key()] = "dozer_2",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = "dozer_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"):key()] = "dozer_2",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "dozer_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"):key()] = "dozer_2",
			[("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer_3",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer_3",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"):key()] = "dozer_3",
			[("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"):key()] = "dozer_3",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"):key()] = "dozer_3",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "dozer_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"):key()] = "dozer_3",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer_4",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer_4",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"):key()] = "dozer_4",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"):key()] = "dozer_4",
			[("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "dozer_5",
			[("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "dozer_5",
			[("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = "dozer_5",
			[("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"):key()] = "dozer_5",

			[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "medic_1",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "medic_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "medic_1",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "medic_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"):key()] = "medic_1",
			[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "medic_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"):key()] = "medic_1",

			[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "taser",
			[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "taser",
			[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "taser",
			[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "taser",
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = "taser",
			[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "taser",

			[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = "cloaker",
			[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = "cloaker",
			[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = "cloaker",
			[("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"):key()] = "cloaker",

			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "marshal_1",
			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "marshal_1",
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "marshal_2",
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "marshal_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"):key()] = "marshal_2",
		}
	end

	return self._moon_enemy_mapping
end

-- hardcoded replacements for certain levels, primarily replacing dc beat cops with regional variants where available
function LevelsTweakData:moon_level_enemy_replacements()
	if not self._moon_level_enemy_replacements then
		self._moon_level_enemy_replacements = {
			rvd1 = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"),
				[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
				[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"),
			},
			chas = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
				[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
				[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
			},
			ranc = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
				[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
				[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
				[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
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

	return self._moon_level_enemy_replacements[level_id] or {}
end
