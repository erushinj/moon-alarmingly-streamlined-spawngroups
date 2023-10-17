if not ASS then

	ASS = ModInstance
	ASS.mod_path = ASS.path
	ASS.save_path = SavePath .. "alarmingly_streamlined_spawngroups.json"
	ASS.developer = io.file_is_readable("mods/developer.txt")
	ASS.required = {}
	ASS.settings = {
		is_massive = true,
		level_mod = 2,
		assault_style = 1,
		skill = 2,
		dmg_interval = 1,
		doms_scale = false,
		doms_all_hard = false,
		doms_super_serious = false,
		max_values = false,
		max_diff = false,
		max_balance_muls = false,
		minigun_dozers = false,
		captain_winters = false,
		escapes = false,
	}
	ASS.original_settings = deep_clone(ASS.settings)
	ASS.values = {
		level_mod = {
			"ass_level_mod_disable",
			"ass_level_mod_per_level",
			"ass_level_mod_CS_normal",
			"ass_level_mod_CS_FBI_overkill",
			"ass_level_mod_FBI_overkill_145",
			"ass_level_mod_FBI_CITY_easy_wish",
			"ass_level_mod_CITY_overkill_290",
			"ass_level_mod_random",
		},
		assault_style = {
			"ass_assault_style_original",
			"ass_assault_style_streamlined",
			"ass_assault_style_default",
			"ass_assault_style_chicken_plate",
		},
		skill = {
			"ass_skill_1",
			"ass_skill_2",
			"ass_skill_3",
			"ass_skill_4",
			"ass_skill_5",
			"ass_skill_6",
		},
		dmg_interval = {
			"ass_dmg_interval_default",
			"ass_dmg_interval_0.225",
			"ass_dmg_interval_0.2",
			"ass_dmg_interval_0.175",
			"ass_dmg_interval_0.15",
			"ass_dmg_interval_0.05",
			"ass_dmg_interval_0",
		},
	}
	ASS.tweaks = {
		force_pool_mul = { 0.85, 1, 1, 1.1, 1.5, 2, },
		sustain_duration_mul = { 0.85, 1, 1, 1.25, 2, 1250, },
		break_duration_mul = { 1.25, 1, 1, 0.85, 0.85, 0, },
		special_limit_mul = { 1, 1, 1, 1.25, 2, 4, },
		grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0, },
		min_grenade_timeout = { 15, 15, 15, 12, 6, 3, },
		no_grenade_push_delay = { 10, 8, 8, 7, 3.5, 0, },
		freq_base = {
			{
				baseline = { 1, 1 },
				common = { 0.2, 0.5 },
				uncommon = { 0.1, 0.35 },
				rare = { 0.1, 0.2 },
				elite = { 0.1, 0.1 },
			},
			{
				baseline = { 1, 1 },
				common = { 0.35, 0.5 },
				uncommon = { 0.2, 0.35 },
				rare = { 0.1, 0.2 },
				elite = { 0.1, 0.1 },
			},
			{
				baseline = { 1, 1 },
				common = { 0.35, 1 },
				uncommon = { 0.2, 0.5 },
				rare = { 0.1, 0.35 },
				elite = { 0.1, 0.2 },
			},
			{
				baseline = { 1, 1 },
				common = { 0.5, 1 },
				uncommon = { 0.35, 1 },
				rare = { 0.2, 0.5 },
				elite = { 0.1, 0.35 },
			},
			{
				baseline = { 1, 1 },
				common = { 1, 1 },
				uncommon = { 0.5, 1 },
				rare = { 0.35, 0.5 },
				elite = { 0.2, 0.35 },
			},
			{
				baseline = { 0.1, 0.1 },
				common = { 1, 1 },
				uncommon = { 2, 2 },
				rare = { 3, 3 },
				elite = { 4, 4 },
			},
		},
		spawn_cooldowns = {
			{ 2.2, 1.1 },
			{ 2, 1 },
			{ 2, 1 },
			{ 1.5, 0.75 },
			{ 0.5, 0.25 },
			{ 0, 0 },
		},
		special_weight_base = {
			{ 1.5, 5 },
			{ 3, 5 },
			{ 3, 5 },
			{ 4, 6 },
			{ 8, 12 },
			{ 27, 27 },
		},
		skm_special_weights = {
			{ 2, 4, 6 },
			{ 4, 5, 6 },
			{ 4, 5, 6 },
			{ 5, 6.25, 7.5 },
			{ 9, 12, 15 },
			{ 21, 24, 27 },
		},
		reenforce_interval = {
			{ 30, 30, 30 },
			{ 20, 20, 20 },
			{ 20, 20, 20 },
			{ 15, 15, 15 },
			{ 5, 5, 5 },
			{ 0, 0, 0 },
		},
		smoke_grenade_lifetime = {
			{ 7.5, 12 },
			{ 9, 15 },
			{ 9, 15 },
			{ 15, 20 },
			{ 20, 30 },
			{ 60, 60 },
		},
		cs_grenade_chance_times = {
			{ 60, 240 },
			{ 60, 90 },
			{ 60, 90 },
			{ 45, 75 },
			{ 10, 20 },
			{ 0, 0 },
		},
	}
	ASS.level_mod_map = {
		jewelry_store = "CS_normal",  -- jewelry store
		four_stores = "CS_normal",  -- four stores
		nightclub = "CS_normal",  -- nightclub
		mallcrasher = "CS_normal",  -- mallcrasher
		ukrainian_job_prof = "CS_normal",  -- ukrainian job
		branchbank_deposit = "CS_normal",  -- bank heist deposit
		branchbank_cash = "CS_normal",  -- bank heist cash
		branchbank_prof = "CS_normal",  -- bank heist random
		branchbank_gold_prof = "CS_normal",  -- bank heist gold
		firestarter = "FBI_overkill_145",  -- firestarter
		alex = "FBI_overkill_145",  -- rats
		watchdogs = "FBI_overkill_145",  -- watchdogs
		watchdogs_night = "FBI_overkill_145",  -- watchdogs
		framing_frame = "FBI_overkill_145",  -- framing frame
		welcome_to_the_jungle_prof = "FBI_overkill_145",  -- big oil
		welcome_to_the_jungle_night_prof = "FBI_overkill_145",  -- big oil
		family = "CS_normal",  -- diamond store
		election_day = "FBI_overkill_145",  -- election day (day 2 and plan c)
		election_day_1 = "CS_FBI_overkill",  -- election day day 1 override
		arm_fac = "CITY_overkill_290",  -- transport harbor
		arm_par = "CITY_overkill_290",  -- transport park
		arm_hcm = "CITY_overkill_290",  -- transport downtown
		arm_und = "CITY_overkill_290",  -- transport underpass
		arm_cro = "CITY_overkill_290",  -- transport crossroads
		arm_for = "CITY_overkill_290",  -- transport train
		big = "CS_FBI_overkill",  -- big bank
		mia = "CS_normal",  -- hotline miami
		gallery = "CS_normal",  -- art gallery
		hox = "FBI_overkill_145",  -- hoxton breakout (day 1)
		hox_2 = "FBI_office",  -- hoxton breakout day 2 override
		hox_3 = "FBI_mcmansion",  -- hoxton revenge
		pines = "FBI_overkill_145",  -- white xmas
		mus = "CS_FBI_overkill",  -- the diamond
		crojob1 = "FBI_overkill_145",  -- bomb dockyard
		crojob2 = "FBI_overkill_145",  -- bomb forest
		crojob2_night = "FBI_overkill_145",  -- bomb forest
		rat = "FBI_overkill_145",  -- cook off
		shoutout_raid = "FBI_overkill_145",  -- meltdown
		arena = "CITY_overkill_290",  -- alesso heist
		kenaz = "FBI_overkill_145",  -- golden grin casino
		jolly = "FBI_overkill_145",  -- aftershock
		red2 = "CS_normal",  -- first world bank
		dinner = "FBI_CITY_easy_wish",  -- slaughterhouse
		nail = "FBI_overkill_145",  -- lab rats
		cane = "FBI_overkill_145",  -- santas workshop
		pbr = "CS_normal",  -- beneath the mountain
		pbr2 = "FBI_overkill_145",  -- birth of sky
		peta = "CS_FBI_overkill",  -- goat simulator (day 1)
		peta2 = "FBI_overkill_145",  -- goat simulator day 2 override
		pal = "CS_normal",  -- counterfeit
		man = "FBI_office",  -- undercover
		mad = "FBI_overkill_145",  -- boiling point
		born = "FBI_overkill_145",  -- biker heist
		chill_combat = "FBI_overkill_145",  -- safehouse raid
		friend = "FBI_overkill_145",  -- scarface mansion
		flat = "CS_FBI_overkill",  -- panic room
		help = "FBI_overkill_145",  -- prison nightmare
		spa = "CS_normal",  -- brooklyn 10-10
		moon = "CS_normal",  -- stealing xmas
		run = "CS_normal",  -- heat street
		glace = "CS_FBI_overkill",  -- green bridge
		dah = "CITY_overkill_290",  -- diamond heist
		rvd = "CS_normal",  -- reservoir dogs
		hvh = "CS_FBI_overkill",  -- cursed kill room
		wwh = "CS_normal",  -- alaskan deal
		brb = "CS_normal",  -- brooklyn bank
		des = "FBI_overkill_145",  -- henry's rock
		nmh = "CITY_overkill_290",  -- no mercy
		sah = "FBI_overkill_145",  -- shacklethorne auction
		vit = "CITY_overkill_290",  -- the white house
		bph = "CITY_overkill_290",  -- hell's island
		mex = "CITY_overkill_290",  -- border crossing
		mex_cooking = "CITY_overkill_290",  -- border crystals
		bex = "CS_normal",  -- san martin bank
		pex = "FBI_overkill_145",  -- breakfast in tijuana
		fex = "CITY_overkill_290",  -- buluc's mansion
		chas = "CS_normal",  -- dragon heist
		sand = "CS_FBI_overkill",  -- ukrainian prisoner
		chca = "FBI_overkill_145",  -- black cat
		pent = "FBI_CITY_easy_wish",  -- mountain master
		ranc = "CS_FBI_overkill",  -- midland ranch
		trai = "FBI_overkill_145",  -- lost in transit
		corp = "FBI_CITY_easy_wish",  -- hostile takeover
		deep = "CITY_overkill_290",  -- crude awakening
		roberts = "FBI_overkill_145",  -- go bank
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:_gsub(str)
		return self.values[str][self.settings[str]]:gsub("^ass_" .. str .. "_", "")
	end

	function ASS:_init_vars()
		local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local level_mod = self:_gsub("level_mod")
		local redirect = {
			per_level = self.level_mod_map[level_id] or self.level_mod_map[job_id] or false,
			disable = false,
			random = { false, },
		}

		self._assault_style = self:_gsub("assault_style")
		self._skill = tonumber((self:_gsub("skill")))
		self._dmg_interval = self:_gsub("dmg_interval")
		self._difficulty = difficulty
		self._real_difficulty_index = ({
			easy = 1,
			normal = 2,
			hard = 3,
			overkill = 4,
			overkill_145 = 5,
			easy_wish = 6,
			overkill_290 = 7,
			sm_wish = 8,
		})[difficulty] or 2
		self._difficulty_index = self:get_setting("max_values") and 8 or self._real_difficulty_index
		self._level_id = level_id
		self._job_id = job_id
		self._clean_level_id = level_id

		for _, end_pattern in ipairs({ "_night$", "_day$", "_skip1$", "_skip2$", "_new$", "_combat$", }) do
			self._clean_level_id = self._clean_level_id:gsub(end_pattern, "")
		end

		for _, valid_id in ipairs({ "CS", "FBI", "CITY", }) do
			for _, lvl_mod in ipairs(self.values.level_mod) do
				local id = lvl_mod:gsub("^ass_level_mod_", "")

				if id:match(valid_id) and not table.contains(redirect.random, id) then
					table.insert(redirect.random, id)
				end
			end
		end
		redirect.random = table.random(redirect.random)

		if redirect[level_mod] ~= nil then
			self._level_mod = redirect[level_mod]
		else
			self._level_mod = level_mod
		end

		if self.been_there_fucked_that == nil then
			self.been_there_fucked_that = not Global.ass_did_not_find_sh and self:get_setting("is_massive")
		end
	end

	function ASS:get_var(var)
		return self["_" .. var]
	end

	function ASS:get_setting(setting)
		return self.settings[setting]
	end

	function ASS:get_tweak(tweak)
		return self.tweaks[tweak][self:get_var("skill")]
	end

	function ASS:mission_script_patches()
		if self._mission_script_patches == nil then
			local level_id = self:get_var("clean_level_id")

			if level_id then
				self._mission_script_patches = self:require("mission_script/" .. level_id) or false
			end
		end

		return self._mission_script_patches
	end

	function ASS:instance_script_patches()
		if self._instance_script_patches == nil then
			local level_id = self:get_var("clean_level_id")

			if level_id then
				self._instance_script_patches = self:require("instance_script/" .. level_id) or false
			end
		end

		return self._instance_script_patches
	end

	-- fetches a common american unit by a shorthand name
	function ASS:units()
		if not self._units then
			self._units = {
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
			}
		end

		return self._units
	end

	-- fetches a table of common american units by a shorthand name
	function ASS:random_unit(type)
		if not self._random_unit then
			local units = self:units()
			local security_1, security_2, security_3 = units.security_1, units.security_2, units.security_3
			local cop_1, cop_2, cop_3, cop_4 = units.cop_1, units.cop_2, units.cop_3, units.cop_4
			local fbi_1, fbi_2, fbi_3 = units.fbi_1, units.fbi_2, units.fbi_3
			local swat_1, swat_2, swat_3 = units.swat_1, units.swat_2, units.swat_3
			local heavy_1, heavy_2 = units.heavy_1, units.heavy_2
			local shield, taser, cloaker, medic_1, medic_2 = units.shield, units.taser, units.cloaker, units.medic_1, units.medic_2
			local dozer_1, dozer_2, dozer_3, dozer_4, dozer_5 = units.dozer_1, units.dozer_2, units.dozer_3, units.dozer_4, units.dozer_5

			self._random_unit = {
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
				specials_agg = { taser, cloaker, },
				specials_def = { taser, shield, },
				specials_sup = { shield, shield, medic_1, medic_2, },
				specials_any = { shield, shield, taser, taser, cloaker, cloaker, medic_1, medic_2, },
				specials_no_med = { shield, taser, cloaker, },
				specials_no_clk = { shield, shield, taser, taser, medic_1, medic_2, },
				specials_taser_medic = { taser, taser, medic_1, medic_2, },
				specials_med = { medic_1, medic_2, },
				dozers_any = { dozer_1, },
			}

			local difficulty_index = self:get_var("real_difficulty_index")
			local dozer_tier_list = {
				{ 2, dozer_1, },
				{ 4, dozer_2, },
				{ 6, dozer_3, },
				{ 7, dozer_4, },
				{ 8, dozer_5, },
			}
			for i = 1, #dozer_tier_list do
				local diff_i, dozer = unpack(dozer_tier_list[i])

				if difficulty_index >= diff_i then
					if not table.contains(self._random_unit.dozers_any, dozer) then
						table.insert(self._random_unit.dozers_any, dozer)
					end
				end
			end

			if managers and managers.modifiers then
				for modifier_class, dozer in pairs({
					ModifierSkulldozers = dozer_3,
					ModifierDozerMinigun = dozer_4,
					ModifierDozerMedic = dozer_5,
				}) do
					for _, category in pairs(managers.modifiers._modifiers) do
						for _, modifier in ipairs(category) do
							if getmetatable(modifier) == _G[modifier_class] then
								if not table.contains(self._random_unit.dozers_any, dozer) then
									table.insert(self._random_unit.dozers_any, dozer)
								end
							end
						end
					end
				end
			end

			self._random_unit.dozers_no_mini = clone(self._random_unit.dozers_any)
			table.delete(self._random_unit.dozers_no_mini, dozer_4)

			self._random_unit.dozers_no_med = clone(self._random_unit.dozers_any)
			table.delete(self._random_unit.dozers_no_med, dozer_5)

			self._random_unit.dozers_no_cs = clone(self._random_unit.dozers_any)
			table.delete(self._random_unit.dozers_no_cs, dozer_4)
			table.delete(self._random_unit.dozers_no_cs, dozer_5)
		end

		return self._random_unit[type] or self._random_unit.cops
	end

	-- replacements based on mapped enemy key
	function ASS:enemy_replacements()
		if not self._enemy_replacements then
			self._enemy_replacements = {
				normal = {
					hrt_1 = "units/payday2/characters/ene_cop_1/ene_cop_1",
					hrt_2 = "units/payday2/characters/ene_cop_4/ene_cop_4",
					hrt_3 = "units/payday2/characters/ene_cop_3/ene_cop_3",
					swat_1 = "units/payday2/characters/ene_swat_1/ene_swat_1",
					swat_2 = "units/payday2/characters/ene_swat_2/ene_swat_2",
					swat_3 = "units/payday2/characters/ene_swat_1/ene_swat_1",
					heavy_1 = "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
					heavy_2 = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
					shield = "units/payday2/characters/ene_shield_2/ene_shield_2",
					sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1",
					dozer_1 = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
					dozer_2 = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
					dozer_3 = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
					dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic",
					medic_1 = "units/payday2/characters/ene_medic_m4/ene_medic_m4",
					medic_2 = "units/payday2/characters/ene_medic_r870/ene_medic_r870",
					taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1",
					cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1",

					swat_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass",
					swat_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870",
					heavy_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass",
					heavy_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870",
					shield_mad = "units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45",

					hrt_hvh_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
					hrt_hvh_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
					hrt_hvh_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
					swat_hvh_1 = "units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1",
					swat_hvh_2 = "units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2",
					heavy_hvh_1 = "units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1",
					heavy_hvh_2 = "units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870",
					shield_hvh = "units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2",

					swat_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi",
					swat_bph_2 = "units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870",
					heavy_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy",

					swat_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale",
					swat_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870",
					heavy_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale",
					heavy_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870",
					shield_bex = "units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45",
				},
				overkill_145 = {
					hrt_1 = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
					hrt_2 = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
					hrt_3 = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
					swat_1 = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
					swat_2 = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
					swat_3 = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
					heavy_1 = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
					heavy_2 = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
					shield = "units/payday2/characters/ene_shield_1/ene_shield_1",
					sniper = "units/payday2/characters/ene_sniper_2/ene_sniper_2",
					dozer_1 = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
					dozer_2 = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
					dozer_3 = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
					dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic",
					medic_1 = "units/payday2/characters/ene_medic_m4/ene_medic_m4",
					medic_2 = "units/payday2/characters/ene_medic_r870/ene_medic_r870",
					taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1",
					cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1",

					swat_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass",
					swat_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870",
					heavy_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
					heavy_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870",
					shield_mad = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg",

					hrt_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
					hrt_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
					hrt_hvh_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
					swat_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1",
					swat_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2",
					heavy_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
					heavy_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
					shield_hvh = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",

					swat_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi",
					swat_bph_2 = "units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870",
					heavy_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36",

					swat_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi",
					swat_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870",
					heavy_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
					heavy_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870",
					shield_bex = "units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9",
				},
				overkill_290 = {
					hrt_1 = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
					hrt_2 = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
					hrt_3 = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
					swat_1 = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
					swat_2 = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
					swat_3 = "units/payday2/characters/ene_city_swat_3/ene_city_swat_3",
					heavy_1 = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36",
					heavy_2 = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870",
					shield = "units/payday2/characters/ene_city_shield/ene_city_shield",
					sniper = "units/payday2/characters/ene_sniper_3/ene_sniper_3",
					dozer_1 = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
					dozer_2 = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
					dozer_3 = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
					dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic",
					medic_1 = "units/payday2/characters/ene_medic_m4/ene_medic_m4",
					medic_2 = "units/payday2/characters/ene_medic_r870/ene_medic_r870",
					taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1",
					cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1",

					swat_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass",
					swat_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870",
					heavy_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
					heavy_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870",
					shield_mad = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg",

					hrt_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
					hrt_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
					hrt_hvh_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
					swat_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1",
					swat_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2",
					heavy_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
					heavy_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
					shield_hvh = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",

					swat_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city",
					swat_bph_2 = "units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870",
					heavy_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36",

					swat_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city",
					swat_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870",
					heavy_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
					heavy_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870",
					shield_bex = "units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9",
				},
				sm_wish = {
					hrt_1 = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
					hrt_2 = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
					hrt_3 = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
					swat_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat",
					swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2",
					swat_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat",
					heavy_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
					heavy_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2",
					shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
					sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",
					dozer_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2",
					dozer_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
					dozer_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
					dozer_4 = "units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
					medic_1 = "units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4",
					medic_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870",
					taser = "units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer",
					cloaker = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",

					swat_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass",
					swat_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870",
					heavy_mad_1 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
					heavy_mad_2 = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870",
					shield_mad = "units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg",

					hrt_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
					hrt_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
					hrt_hvh_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
					swat_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1",
					swat_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2",
					heavy_hvh_1 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1",
					heavy_hvh_2 = "units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870",
					shield_hvh = "units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1",

					swat_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city",
					swat_bph_2 = "units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870",
					heavy_bph_1 = "units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36",

					swat_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city",
					swat_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870",
					heavy_bex_1 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
					heavy_bex_2 = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870",
					shield_bex = "units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9",
				},
			}

			-- very hard has swat scripted spawns, mayhem has fbi scripted spawns
			self._enemy_replacements.hard = self._enemy_replacements.normal
			self._enemy_replacements.overkill = self._enemy_replacements.normal
			self._enemy_replacements.easy_wish = self._enemy_replacements.overkill_145

			-- level mod replacements
			self._enemy_replacements.CS_normal = self._enemy_replacements.normal
			self._enemy_replacements.CS_FBI_overkill = self._enemy_replacements.overkill
			self._enemy_replacements.FBI_overkill_145 = self._enemy_replacements.overkill_145
			self._enemy_replacements.FBI_office = self._enemy_replacements.overkill_145
			self._enemy_replacements.FBI_mcmansion = clone(self._enemy_replacements.overkill_145)
			self._enemy_replacements.FBI_mcmansion.swat_1 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"
			self._enemy_replacements.FBI_mcmansion.swat_2 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
			self._enemy_replacements.FBI_mcmansion.swat_3 = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"
			self._enemy_replacements.FBI_CITY_easy_wish = self._enemy_replacements.easy_wish
			self._enemy_replacements.CITY_overkill_290 = self._enemy_replacements.overkill_290
		end

		return self._enemy_replacements
	end

	-- fetches mapped enemy keys
	function ASS:enemy_mapping()
		if not self._enemy_mapping then
			self._enemy_mapping = {
				[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "hrt_1",
				[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "hrt_1",
				[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "hrt_2",
				[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "hrt_2",
				[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "hrt_3",
				[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "hrt_3",
				[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",
				[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "swat_1",
				[("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "swat_1",
				[("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",
				[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "swat_2",
				[("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
				[("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = "swat_2",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"):key()] = "swat_2",
				[("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_3",
				[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "heavy_1",
				[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "heavy_1",
				[("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "heavy_1",
				[("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "heavy_2",
				[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "heavy_2",
				[("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2"):key()] = "heavy_2",
				[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield",
				[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield",
				[("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = "shield",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = "shield",
				[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
				[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
				[("units/payday2/characters/ene_sniper_3/ene_sniper_3"):key()] = "sniper",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"):key()] = "sniper",
				[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
				[("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer_1",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer_1",
				[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer_2",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer_2",
				[("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer_3",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer_3",
				[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer_4",
				[("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer_4",
				[("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
				[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic_1",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4"):key()] = "medic_1",
				[("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic_2",
				[("units/pd2_dlc_gitgud/characters/ene_zeal_medic_r870/ene_zeal_medic_r870"):key()] = "medic_2",

				[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "swat_mad_1",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = "swat_mad_1",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = "swat_mad_1",
				[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = "swat_mad_2",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = "swat_mad_2",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = "swat_mad_2",
				[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "heavy_mad_1",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = "heavy_mad_1",
				[("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = "heavy_mad_2",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = "heavy_mad_2",
				[("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = "shield_mad",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = "shield_mad",
				[("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = "shield_mad",

				[("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"):key()] = "hrt_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"):key()] = "hrt_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"):key()] = "hrt_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"):key()] = "hrt_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"):key()] = "hrt_hvh_3",
				[("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"):key()] = "hrt_hvh_3",
				[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "swat_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = "swat_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = "swat_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = "swat_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = "heavy_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = "heavy_hvh_1",
				[("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = "heavy_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = "heavy_hvh_2",
				[("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = "shield_hvh",
				[("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = "shield_hvh",

				-- [("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "swat_bph_1",
				[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = "swat_bph_1",
				[("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = "swat_bph_1",
				-- [("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "swat_bph_2",
				[("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = "swat_bph_2",
				[("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = "swat_bph_2",
				[("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "heavy_bph_1",
				[("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = "heavy_bph_1",

				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "swat_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = "swat_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "swat_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = "swat_bex_2",
				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = "swat_bex_2",
				[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = "swat_bex_2",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = "heavy_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "heavy_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = "heavy_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = "heavy_bex_1",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = "heavy_bex_2",
				[("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = "heavy_bex_2",
				[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = "shield_bex",
				[("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = "shield_bex",
			}
		end

		return self._enemy_mapping
	end

	-- hardcoded replacements for certain levels, primarily replacing dc beat cops with regional variants where available
	-- also used in some cases to work around instances (hvh swat, fex security room), though it doesnt seem to be working for hvh swat
	function ASS:level_enemy_replacements()
		if not self._level_enemy_replacements then
			local units = self:units()
			local security_1, security_2, security_3 = units.security_1:key(), units.security_2:key(), units.security_3:key()
			local cop_1, cop_2, cop_3, cop_4 = units.cop_1:key(), units.cop_2:key(), units.cop_3:key(), units.cop_4:key()
			local swat_1, swat_2, swat_3 = units.swat_1:key(), units.swat_2:key(), units.swat_3:key()
			local shield, sniper, taser, cloaker, medic_1, medic_2 = units.shield:key(), units.sniper:key(), units.taser:key(), units.cloaker:key(), units.medic_1:key(), units.medic_2:key()
			local dozer_1, dozer_2, dozer_3, dozer_4, dozer_5 = units.dozer_1:key(), units.dozer_2:key(), units.dozer_3:key(), units.dozer_4:key(), units.dozer_5:key()

			self._level_enemy_replacements = {
				pbr = {
					[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					[shield] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
					[sniper] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"),
					[dozer_1] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					[dozer_2] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					[dozer_3] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"),
					[dozer_4] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"),
					[dozer_5] = Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"),
				},
				moon = {
					[security_1] = Idstring("units/payday2/characters/ene_security_4/ene_security_4"),
				},
				hvh = {
					[swat_1] = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					[swat_2] = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
					[swat_3] = Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				},
				rvd1 = {
					[cop_1] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
					[cop_2] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"),
					[cop_3] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
					[cop_4] = Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"),
				},
				fex = {
					[("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
					[("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
					[("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
					[security_3] = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex"),
					[swat_1] = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
					[cloaker] = Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"),
					[sniper] = Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"),
				},
				chas = {
					[cop_1] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
					[cop_2] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
					[cop_3] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
					[cop_4] = Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
				},
				ranc = {
					[cop_1] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
					[cop_2] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
					[cop_3] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
					[cop_4] = Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
				},
			}
			self._level_enemy_replacements.rvd2 = self._level_enemy_replacements.rvd1
			self._level_enemy_replacements.des = self._level_enemy_replacements.pbr  -- they also missed some snipers here, though unsure if theyre used
			self._level_enemy_replacements.sand = self._level_enemy_replacements.chas
			self._level_enemy_replacements.pent = self._level_enemy_replacements.chas
			self._level_enemy_replacements.corp = self._level_enemy_replacements.ranc
		end

		return self._level_enemy_replacements
	end

	function ASS:wave_unit_categories()
		if not self._wave_unit_categories then
			self._wave_unit_categories = {
				{ CS = "normal", FBI = "normal", },
				{ CS = "normal", FBI = "normal", },
				{ CS = "normal", FBI = "overkill_145", },
				{ CS = "overkill_145", FBI = "overkill_145", },
				{ CS = "overkill_145", FBI = "overkill_290", },
				{ CS = "overkill_290", FBI = "overkill_290", },
				{ CS = "overkill_290", FBI = "sm_wish", },
				{ CS = "sm_wish", FBI = "sm_wish", },
				{ CS = "sm_wish", FBI = "sm_wish", },
			}
		end

		return self._wave_unit_categories
	end

	function ASS:difficulty_groups()
		local difficulty_index = self:get_var("real_difficulty_index")
		local normal = difficulty_index < 5
		local hard = difficulty_index < 7
		local overkill = not hard

		return normal, hard, overkill
	end

	-- Load settings
	local data = io.file_is_readable(ASS.save_path) and io.load_as_json(ASS.save_path)
	if data then
		local function merge(tbl1, tbl2)
			for k, v in pairs(tbl2) do
				if type(tbl1[k]) == type(v) then
					if type(v) == "table" then
						merge(tbl1[k], v)
					else
						tbl1[k] = v
					end
				end
			end
		end

		merge(ASS.settings, data)
	end

	function ASS:add_hook(key, func)
		local id = key .. "AlarminglyStreamlinedSpawngroups"

		Hooks:AddHook( key, id, func )
	end

	function ASS:post_hook(object, func, post_call)
		local id = "ass_" .. func

		Hooks:PostHook( object, func, id, post_call )
	end

	function ASS:mission_post_hook(element, func, id, post_call)
		local id = "ass_" .. func .. "_" .. id

		Hooks:PostHook( element, func, id, post_call )
	end

	function ASS:pre_hook(object, func, pre_call)
		local id = "ass_" .. func

		Hooks:PreHook( object, func, id, pre_call )
	end

	function ASS:mission_pre_hook(element, func, id, pre_call)
		local id = "ass_" .. func .. "_" .. id

		Hooks:PreHook( element, func, id, pre_call )
	end

	function ASS:override(object, func, override)
		Hooks:OverrideFunction( object, func, override )
	end

	ASS:add_hook( "LocalizationManagerPostInit", function(loc)
		loc:load_localization_file(ASS.mod_path .. "loc/english.json")
	end )

	ASS:add_hook( "MenuManagerBuildCustomMenus", function(_, nodes)

		local menu_id = "ass_menu"
		MenuHelper:NewMenu(menu_id)

		MenuCallbackHandler.ass_setting_toggle = function(_, item)
			ASS.settings[item:name()] = item:value() == "on"
		end

		MenuCallbackHandler.ass_setting_value = function(_, item)
			ASS.settings[item:name()] = item:value()
		end

		MenuCallbackHandler.ass_save = function()
			io.save_as_json(ASS.settings, ASS.save_path)
		end

		MenuCallbackHandler.ass_reset_settings = function()
			local title = managers.localization:text("ass_menu_warning")
			local message = managers.localization:text("ass_menu_reset_settings_verify")
			local buttons = {
				{
					text = managers.localization:text("ass_menu_confirm"),
					callback = function()
						ASS.settings = deep_clone(ASS.original_settings)
					end
				},
				{
					text = managers.localization:text("ass_menu_ignore")
				}
			}

			QuickMenu:new(title, message, buttons, true)
		end

		local priority = 0
		local divider_id = 1

		local function add_toggle(id)
			MenuHelper:AddToggle({
				id = id,
				title = "ass_menu_" .. id,
				desc = "ass_menu_" .. id .. "_desc",
				callback = "ass_setting_toggle",
				value = ASS.settings[id],
				menu_id = menu_id,
				priority = priority
			})

			priority = priority - 1
		end

		local function add_divider()
			MenuHelper:AddDivider({
				id = "ass_divider_" .. divider_id,
				size = 16,
				menu_id = menu_id,
				priority = priority,
			})

			priority = priority - 1
			divider_id = divider_id + 1
		end

		local function add_multiple_choice(id)
			MenuHelper:AddMultipleChoice({
				id = id,
				title = "ass_menu_" .. id,
				desc = "ass_menu_" .. id .. "_desc",
				callback = "ass_setting_value",
				value = ASS.settings[id],
				items = ASS.values[id],
				menu_id = menu_id,
				priority = priority
			})

			priority = priority - 1
		end

		local function add_button(id)
			MenuHelper:AddButton({
				id = id,
				title = "ass_menu_" .. id,
				desc = "ass_menu_" .. id .. "_desc",
				callback = "ass_" .. id,
				menu_id = menu_id,
				priority = priority
			})

			priority = priority - 1
		end

		add_toggle("is_massive")
		add_divider()
		add_multiple_choice("level_mod")
		add_multiple_choice("assault_style")
		add_multiple_choice("skill")
		add_divider()
		add_toggle("doms_scale")
		add_toggle("doms_all_hard")
		add_toggle("doms_super_serious")
		add_divider()
		add_toggle("max_values")
		add_toggle("max_diff")
		add_toggle("max_balance_muls")
		add_divider()
		add_multiple_choice("dmg_interval")
		add_divider()
		add_toggle("minigun_dozers")
		add_toggle("captain_winters")
		add_toggle("escapes")
		add_divider()
		add_button("reset_settings")

		nodes[menu_id] = MenuHelper:BuildMenu(menu_id, { back_callback = "ass_save" })

		MenuHelper:AddMenuItem(nodes["blt_options"], menu_id, "ass_menu_main")

	end )

	-- blocks scripts from running if no streamlined heisting - must be installed, enabled, and from game start
	local sh = BLT.Mods:GetModByName("Streamlined Heisting")
	if not (sh and sh:IsEnabled() and sh:WasEnabledAtStart()) then
		ASS.been_there_fucked_that = false

		ASS:add_hook( "MenuManagerOnOpenMenu", function()
			if Global.ass_did_not_find_sh then
				return
			end

			Global.ass_did_not_find_sh = true

			local title = managers.localization:text("ass_menu_warning")
			local message = managers.localization:text("ass_menu_did_not_find_sh")
			local buttons = {
				{
					text = managers.localization:text("ass_menu_did_not_find_sh_goto"),
					callback = function()
						-- im aware linux isnt supported anymore
						if BLT:GetOS() == "linux" then
							os.execute("open https://modworkshop.net/mod/29713")
						else
							os.execute("start https://modworkshop.net/mod/29713")
						end
					end
				},
				{
					text = managers.localization:text("ass_menu_ignore")
				}
			}
			QuickMenu:new(title, message, buttons, true)
		end )
	end

	ASS:_init_vars()

end


if not ASS.been_there_fucked_that then
	return
end


if RequiredScript and not ASS.required[RequiredScript] then
	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")

	if io.file_is_readable(fname) then
		dofile(fname)
	end

	ASS.required[RequiredScript] = true
end
