local try_insert = ASS:require("try_insert", true)
local level_id = ASS:get_var("level_id")
local real_difficulty_index = ASS:get_var("real_difficulty_index")

function LevelsTweakData:moon_regular_custom_group()
	 if self._moon_regular_custom_group == nil then
		local regular_custom_group_ids = {
			man = true,  -- dozer spawn loop + all swats
			dah = true,  -- you get to see all the pretty suited men trying to kill you even if you dont want to :3
			hox_3 = true,  -- you get to see all the pretty suited men trying to kill you even if you dont want to :3
			flat = true,  -- all swats
			chca = true,  -- triads onboard
			dinner = true,  -- all murkies/swats
			pbr = true,  -- all murkies
			wwh = true,  -- all swats
			born = true,  -- all swats
			chew = true,  -- all swats
		}

		self._moon_regular_custom_group = regular_custom_group_ids[level_id] or false
	 end

	 return self._moon_regular_custom_group
end

-- is it obvious enough i dont like custom maps not loading the vanilla faction for the unit type they use
function LevelsTweakData:moon_custom_maps_boowomp()
	local boowomp = self._moon_custom_maps_boowomp

	if boowomp == nil then
		local constantine_fsb = { fucked = "russia", use = "constantine_fsb", }

		for _, func in ipairs({
			function()  -- check level ids where package auto-detect is known not to work
				return ({
					ruswl = constantine_fsb,
					rusdl = constantine_fsb,
					ahopl = constantine_fsb,
					crimepunishlvl = constantine_fsb,
					flatline_lvl = constantine_fsb,
					hunter_party = constantine_fsb,
					hunter_departure = constantine_fsb,
					hunter_fall = constantine_fsb,
				})[level_id]
			end,
			function()  -- then check packages if not found
				local level = self[level_id] or {}
				local packages = {}

				for _, data in pairs({
					level.package or nil,
					level.custom_packages or nil,
				}) do
					if type(data) == "table" then
						table.list_append(packages, data)
					else
						table.insert(packages, data)
					end
				end

				packages = table.list_to_set(packages)

				if next(packages) then
					for pkg, data in pairs({
						["packages/levels/constantine_cartel_faction/world/world"] = { fucked = "federales", use = "constantine_cartel", },
					}) do
						if packages[pkg] then
							return data
						end
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

-- fetches common units by a shorthand name
function LevelsTweakData:moon_units(typ)
	local units = self._moon_units

	if not units then
		local security_1 = Idstring("units/payday2/characters/ene_security_1/ene_security_1")
		local security_2 = Idstring("units/payday2/characters/ene_security_2/ene_security_2")
		local security_3 = Idstring("units/payday2/characters/ene_security_3/ene_security_3")
		local cop_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
		local cop_2 = Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
		local cop_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
		local cop_4 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		local fbi_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
		local fbi_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		local fbi_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		local swat_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		local swat_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
		local swat_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
		local heavy_1 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
		local heavy_2 = Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
		local shield = Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
		local sniper = Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1")
		local dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
		local dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
		local dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
		local dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		local dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		local medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
		local medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
		local taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
		local cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
		local marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1")
		local marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1")

		units = {
			security_1 = security_1,
			security_2 = security_2,
			security_3 = security_3,
			securitys = { security_1, security_2, security_3, },
			securitys_light = { security_1, security_2, },
			securitys_heavy = { security_2, security_3, },
			securitys_no_mp5 = { security_1, security_3, },

			cop_1 = cop_1,
			cop_2 = cop_2,
			cop_3 = cop_3,
			cop_4 = cop_4,
			cops = { cop_1, cop_2, cop_3, cop_4, },
			cops_light = { cop_1, cop_2, },
			cops_medium = { cop_2, cop_4, },
			cops_heavy = { cop_3, cop_4, },
			cops_no_c45 = { cop_2, cop_3, cop_4, },
			cops_no_bronco = { cop_1, cop_3, cop_4, },
			cops_no_r870 = { cop_1, cop_2, cop_4, },
			cops_no_mp5 = { cop_1, cop_2, cop_3, },

			fbi_1 = fbi_1,
			fbi_2 = fbi_2,
			fbi_3 = fbi_3,
			fbis = { fbi_1, fbi_2, fbi_3, },
			fbis_light = { fbi_1, fbi_2, },
			fbis_heavy = { fbi_2, fbi_3, },

			swat_1 = swat_1,
			swat_2 = swat_2,
			swat_3 = swat_3,
			swats = { swat_1, swat_2, swat_3, },
			swats_close = { swat_2, swat_3, },
			swats_far = { swat_1, swat_3, },

			heavy_1 = heavy_1,
			heavy_2 = heavy_2,
			heavys = { heavy_1, heavy_2, },
			swats_heavys = { swat_1, swat_2, swat_3, heavy_1, heavy_1, heavy_2, },
			swats_heavys_close = { swat_2, swat_3, heavy_2, heavy_2, },
			swats_heavys_far = { swat_1, swat_3, heavy_1, heavy_1, },

			shield = shield,
			sniper = sniper,
			taser = taser,
			cloaker = cloaker,
			medic_1 = medic_1,
			medic_2 = medic_2,
			specials_agg = { taser, cloaker, },
			specials_def = { taser, shield, },
			specials_sup = { shield, shield, medic_1, medic_2, },
			specials_any = { shield, shield, taser, taser, cloaker, cloaker, medic_1, medic_2, },
			specials_no_med = { shield, taser, cloaker, },
			specials_no_clk = { shield, shield, taser, taser, medic_1, medic_2, },
			specials_no_shield = { taser, taser, cloaker, cloaker, medic_1, medic_2, },
			specials_taser_medic = { taser, taser, medic_1, medic_2, },
			specials_shield_clk = { shield, cloaker, },
			specials_med = { medic_1, medic_2, },

			dozer_1 = dozer_1,
			dozer_2 = dozer_2,
			dozer_3 = dozer_3,
			dozer_4 = dozer_4,
			dozer_5 = dozer_5,
			dozers_any = { dozer_1, },

			marshal_1 = marshal_1,
			marshal_2 = marshal_2,
			marshals = { marshal_1, marshal_2, heavy_1, heavy_2, },
			marshals_far = { marshal_1, heavy_1, },
			marshals_close = { marshal_2, heavy_2, },
			marshals_no_shield = { marshal_1, marshal_1, heavy_1, heavy_2, },
			marshals_no_marksman = { marshal_2, marshal_2, heavy_1, heavy_2, },
		}

		for _, v in pairs({
			{ 2, dozer_1, },
			{ 4, dozer_2, },
			{ 6, dozer_3, },
			{ 7, dozer_4, },
			{ 8, dozer_5, },
		}) do
			local diff_i, dozer = unpack(v)

			if real_difficulty_index >= diff_i then
				try_insert(units.dozers_any, dozer)
			end
		end

		units.dozers_no_mini = clone(units.dozers_any)
		table.delete(units.dozers_no_mini, dozer_4)

		units.dozers_no_med = clone(units.dozers_any)
		table.delete(units.dozers_no_med, dozer_5)

		units.dozers_no_cs = clone(units.dozers_any)
		table.delete(units.dozers_no_cs, dozer_4)
		table.delete(units.dozers_no_cs, dozer_5)

		self._moon_units = units
	end

	if typ then
		return units[typ]
	end

	return units
end

function LevelsTweakData:moon_random_unit(typ)
	ASS:log("warn", "LevelsTweakData:moon_random_unit is deprecated!")

	return self:moon_units(typ)
end

function LevelsTweakData:moon_forbidden_scripted_replacements(mapped_name)
	if not self._moon_forbidden_scripted_replacements then
		local all_forbidden = {
			default = table.set("hrt_1", "hrt_2", "hrt_3"),
		}

		self._moon_forbidden_scripted_replacements = all_forbidden[level_id] or all_forbidden.default
	end

	return self._moon_forbidden_scripted_replacements[mapped_name]
end

-- replacements based on mapped enemy key
LevelsTweakData.moon_all_replacements = {}
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
					medic_2 = Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
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
					dozer_hw = Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
					swat_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1"),
					swat_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3"),
					swat_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"),
					heavy_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					heavy_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun"),
					shield = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
					sniper = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					dozer_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer"),
					dozer_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2"),
					dozer_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
				},
				sm_wish = {
					hrt_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"),
					hrt_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"),
					hrt_3 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"),
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
					dozer_4 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_5 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"),
					medic_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"),
					taser = Idstring("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"),
					cloaker = Idstring("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"),
					marshal_1 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_zeal/ene_cartel_soldier_heavy_zeal"),
					marshal_2 = Idstring("units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield"),
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
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
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
					swat_3 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"),
					heavy_1 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"),
					heavy_2 = Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"),
					shield = Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"),
					sniper = Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"),
					dozer_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					dozer_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					dozer_3 = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
					medic_2 = Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
					taser = Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"),
					cloaker = Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
			bo = {
				normal = {
					hrt_1 = Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
					hrt_3 = Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_r870/ene_sbz_r870"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"),
					shield = Idstring("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_145 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_r870/ene_ovk_r870"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"),
					shield = Idstring("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
				overkill_290 = {
					hrt_1 = Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
					hrt_2 = Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					hrt_3 = Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					swat_1 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_g36/ene_bofa_g36"),
					swat_2 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_benelli/ene_bofa_benelli"),
					swat_3 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_ump/ene_bofa_ump"),
					heavy_1 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"),
					heavy_2 = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"),
					shield = Idstring("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"),
					sniper = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"),
					dozer_1 = Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					dozer_2 = Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					dozer_3 = Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
					dozer_4 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
					dozer_5 = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
					dozer_hw = Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"),
					medic_1 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"),
					medic_2 = Idstring("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"),
					taser = Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					cloaker = Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
					marshal_1 = Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
					marshal_2 = Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
				},
			},
		}

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

	if continent == self.moon_all_replacements then
		return replacements
	end

	return replacements[continent] or replacements[self:get_ai_group_type()] or replacements.america
end

-- fetches mapped enemy keys
function LevelsTweakData:moon_enemy_mapping(name_key)
	local enemy_mapping = self._moon_enemy_mapping

	if not enemy_mapping then
		enemy_mapping = {
			[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "hrt_1",
			[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "hrt_1",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = "hrt_1",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = "hrt_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2"):key()] = "hrt_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2"):key()] = "hrt_1",

			[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "hrt_2",
			[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "hrt_2",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "hrt_2",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = "hrt_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "hrt_2",
			[("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"):key()] = "hrt_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier"):key()] = "hrt_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1"):key()] = "hrt_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = "hrt_2",

			[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "hrt_3",
			[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "hrt_3",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "hrt_3",
			[("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"):key()] = "hrt_3",
			[("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "hrt_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3"):key()] = "hrt_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3"):key()] = "hrt_3",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = "hrt_3",

			[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "hrt_4",  -- for mutators
			[("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = "hrt_4",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4"):key()] = "hrt_4",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4"):key()] = "hrt_4",

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
			[("units/pd2_mod_ttr/characters/ene_swat_gensec_1/ene_swat_gensec_1"):key()] = "swat_1",  -- gensecs
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
			[("units/pd2_mod_ttr/characters/ene_zeal_gensec_1/ene_zeal_gensec_1"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5"):key()] = "swat_1",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "swat_1",
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_mp5/ene_sbz_mp5"):key()] = "swat_1",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_m4/ene_ovk_m4"):key()] = "swat_1",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_g36/ene_bofa_g36"):key()] = "swat_1",
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal/ene_bofa_zeal"):key()] = "swat_1",

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
			[("units/pd2_mod_ttr/characters/ene_swat_gensec_2/ene_swat_gensec_2"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2"):key()] = "swat_2",
			[("units/pd2_mod_ttr/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "swat_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "swat_2",
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_r870/ene_sbz_r870"):key()] = "swat_2",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_r870/ene_ovk_r870"):key()] = "swat_2",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_benelli/ene_bofa_benelli"):key()] = "swat_2",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_r870/ene_bofa_r870"):key()] = "swat_2",

			[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_zeal_4/ene_cartel_soldier_zeal_4"):key()] = "swat_3",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2"):key()] = "swat_3",  -- only tagged as swat 3 for mutator hydra
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2"):key()] = "swat_3",
			[("units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2"):key()] = "swat_3",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_ump/ene_bofa_ump"):key()] = "swat_3",

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
			[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_1/ene_swat_gensec_heavy_1"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
			[("units/pd2_mod_ttr/characters/ene_zeal_gensec_heavy_1/ene_zeal_gensec_heavy_1"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "heavy_1",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = "heavy_1",
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_m4/ene_sbz_heavy_m4"):key()] = "heavy_1",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_m4/ene_ovk_heavy_m4"):key()] = "heavy_1",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_g36/ene_bofa_heavy_g36"):key()] = "heavy_1",
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_heavy/ene_bofa_zeal_heavy"):key()] = "heavy_1",

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
			[("units/pd2_mod_ttr/characters/ene_swat_gensec_heavy_2/ene_swat_gensec_heavy_2"):key()] = "heavy_2",
			[("units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_mod_ttr/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "heavy_2",
			[("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = "heavy_2",
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_heavy_r870/ene_sbz_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_heavy_r870/ene_ovk_heavy_r870"):key()] = "heavy_2",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_heavy_r870/ene_bofa_heavy_r870"):key()] = "heavy_2",

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
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_c45/ene_sbz_shield_c45"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/sbz_units/ene_sbz_shield_mp9/ene_sbz_shield_mp9"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_c45/ene_ovk_shield_c45"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/ovk_units/ene_ovk_shield_mp9/ene_ovk_shield_mp9"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_c45/ene_bofa_shield_c45"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/bofa_units/ene_bofa_shield_mp9/ene_bofa_shield_mp9"):key()] = "shield",
			[("units/pd2_mod_bofa/characters/bofa_zeal_units/ene_bofa_zeal_shield/ene_bofa_zeal_shield"):key()] = "shield",

			[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
			[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"):key()] = "sniper",
			[("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"):key()] = "sniper",
			[("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"):key()] = "sniper",
			[("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"):key()] = "sniper",
			[("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"):key()] = "sniper",
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_sniper/ene_bofa_sniper"):key()] = "sniper",

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

			[("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"):key()] = "dozer_hw",
			[("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween"):key()] = "dozer_hw",

			[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "medic_1",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "medic_1",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "medic_1",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "medic_1",
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier"):key()] = "medic_1",
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_m4/ene_bofa_medic_m4"):key()] = "medic_1",

			[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = "medic_2",
			[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "medic_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2"):key()] = "medic_2",
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_medic_r870/ene_bofa_medic_r870"):key()] = "medic_2",

			[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
			[("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "taser",
			[("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "taser",
			[("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "taser",
			[("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "taser",
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal"):key()] = "taser",
			[("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "taser",
			[("units/pd2_mod_bofa/characters/special_units/ene_bofa_taser/ene_bofa_taser"):key()] = "taser",  -- does not appear to be used but eh

			[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
			[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = "cloaker",
			[("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = "cloaker",
			[("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = "cloaker",
			[("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = "cloaker",
			[("units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout"):key()] = "cloaker",

			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "marshal_1",
			[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "marshal_1",
			[("units/pd2_mod_ttr/characters/ene_marshal_gensec/ene_marshal_gensec"):key()] = "marshal_1",

			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "marshal_2",
			[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "marshal_2",
			[("units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer"):key()] = "marshal_2",
			[("units/pd2_mod_ttr/characters/ene_marshal_gensec_shield/ene_marshal_gensec_shield"):key()] = "marshal_2",
		}
	end

	if name_key then
		return enemy_mapping[name_key]
	end

	return enemy_mapping
end

-- hardcoded replacements for certain levels, primarily replacing dc beat cops with regional variants where available
function LevelsTweakData:moon_level_enemy_replacements()
	if not self._moon_level_enemy_replacements then
		local all_lvl_replacements = {
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
		all_lvl_replacements.rvd2 = all_lvl_replacements.rvd1
		all_lvl_replacements.sand = all_lvl_replacements.chas
		all_lvl_replacements.pent = all_lvl_replacements.chas
		all_lvl_replacements.corp = all_lvl_replacements.ranc

		self._moon_level_enemy_replacements = all_lvl_replacements[level_id] or {}
	end

	return self._moon_level_enemy_replacements
end

ASS:post_hook( LevelsTweakData, "init", function(self)
	self:moon_enemy_mapping()
	self:moon_level_enemy_replacements()
	self:moon_forbidden_scripted_replacements()
end )
