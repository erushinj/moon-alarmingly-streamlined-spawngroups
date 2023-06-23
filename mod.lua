if not ASS then

	ASS = {
		mod_path = ModPath,
		save_path = SavePath .. "alarmingly_streamlined_spawngroups.json",
		required = {},
		settings = {
			is_massive = true,
			level_mod = 2,
			assault_style = 1,
			skill = 2,
			super_serious_dominations = false,
			max_values = false,
			max_diff = false,
			max_balance_muls = false,
			marshal_squads_allowed = 3,
			minigun_dozers = false,
			captain_winters = false,
			escapes = false
		},
		values = {
			level_mod = {
				"ass_level_mod_disable",
				"ass_level_mod_per_level",
				"ass_level_mod_CS_normal",
				"ass_level_mod_CS_FBI_overkill",
				"ass_level_mod_FBI_overkill_145",
				"ass_level_mod_FBI_CITY_easy_wish",
				"ass_level_mod_CITY_overkill_290"
			},
			assault_style = {
				"ass_assault_style_original",
				"ass_assault_style_streamlined"
			},
			skill = {
				"ass_skill_1",
				"ass_skill_2",
				"ass_skill_3",
				"ass_skill_4",
				"ass_skill_5",
				"ass_skill_6"
			},
			marshal_squads_allowed = {
				"ass_marshal_squads_allowed_0",
				"ass_marshal_squads_allowed_1",
				"ass_marshal_squads_allowed_2",
			},
		},
		skill_tweaks = {
			freq_base = {
				{
					baseline = 1,
					common = 0.5,
					uncommon = 0.35,
					rare = 0.2,
					elite = 0.1
				},
				{
					baseline = 1,
					common = 0.5,
					uncommon = 0.35,
					rare = 0.2,
					elite = 0.1
				},
				{
					baseline = 1,
					common = 1,
					uncommon = 0.5,
					rare = 0.35,
					elite = 0.2
				},
				{
					baseline = 1,
					common = 1,
					uncommon = 1,
					rare = 0.5,
					elite = 0.35
				},
				{
					baseline = 1,
					common = 1,
					uncommon = 1,
					rare = 0.5,
					elite = 0.35
				},
				{
					baseline = 0.1,
					common = 1,
					uncommon = 2,
					rare = 3,
					elite = 4
				}
			},
			spawn_cooldown_base = { 30, 30, 20, 10, 5, 0 },
			force_pool_mul = { 0.85, 1, 1, 1.1, 1.5, 2 },
			sustain_duration_mul = { 0.85, 1, 1, 1.25, 2, 1250 },
			break_duration_mul = { 1.25, 1, 1, 0.85, 0.85, 0 },
			special_limit_mul = { 1, 1, 1, 1.25, 2, 4 },
			grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0 },
			spawn_cooldowns = {
				{ 2.2, 1.1 },
				{ 2, 1 },
				{ 2, 1 },
				{ 1.5, 0.75 },
				{ 0.5, 0.25 },
				{ 0, 0 }
			},
			special_weight_base = {
				{ 1.5, 5 },
				{ 3, 5 },
				{ 3, 5 },
				{ 4, 6 },
				{ 8, 12 },
				{ 27, 27 }
			},
			skm_special_weights = {
				{ 2, 4, 6 },
				{ 4, 5, 6 },
				{ 4, 5, 6 },
				{ 5, 6.25, 7.5 },
				{ 9, 12, 15 },
				{ 21, 24, 27 },
			},
			smoke_grenade_lifetime = {
				{ 7.5, 12 },
				{ 9, 15 },
				{ 9, 15 },
				{ 15, 20 },
				{ 20, 30 },
				{ 60, 60 }
			},
			cs_grenade_chance_times = {
				{ 60, 240 },
				{ 60, 90 },
				{ 60, 90 },
				{ 45, 75 },
				{ 10, 20 },
				{ 0, 0 }
			},
			min_grenade_timeout = { 15, 15, 15, 12, 6, 3 },
			no_grenade_push_delay = { 10, 8, 8, 7, 3.5, 0 }
		},
		intensity_tweaks = {
			super_serious_dominations = true,
			max_values = true,
			max_diff = true,
			max_balance_muls = true
		},
		DOZER_TIERS = {
			R870 = 1,
			SAIGA = 2,
			LMG = 3,
			MINI = 4,
			MEDIC = 5
		},
		level_mod_map = {
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
			framing_frame = "FBI_overkill_145",  -- framing frame (days 2 and 3)
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
			hox_2 = "FBI_with_office",  -- hoxton breakout day 2 override
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
			pbr2 = "FBI_overkill_145",  -- birth of sky
			peta = "CS_FBI_overkill",  -- goat simulator (day 1)
			peta2 = "FBI_overkill_145",  -- goat simulator day 2 override
			pal = "CS_normal",  -- counterfeit
			man = "FBI_with_office",  -- undercover
			born = "FBI_overkill_145",  -- biker heist
			chill_combat = "FBI_overkill_145",  -- safehouse raid
			friend = "FBI_overkill_145",  -- scarface mansion
			flat = "CS_FBI_overkill",  -- panic room
			help = "FBI_overkill_145",  -- prison nightmare
			spa = "FBI_overkill_145",  -- brooklyn 10-10
			moon = "CS_normal",  -- stealing xmas
			run = "CS_normal",  -- heat street
			glace = "CS_FBI_overkill",  -- green bridge
			dah = "CITY_overkill_290",  -- diamond heist
			rvd = "FBI_overkill_145",  -- reservoir dogs
			wwh = "FBI_overkill_145",  -- alaskan deal
			brb = "FBI_overkill_145",  -- brooklyn bank
			nmh = "CITY_overkill_290",  -- no mercy
			sah = "FBI_overkill_145",  -- shacklethorne auction
			chas = "CS_normal",  -- dragon heist
			sand = "CS_FBI_overkill",  -- ukrainian prisoner
			chca = "FBI_overkill_145",  -- black cat
			pent = "FBI_CITY_easy_wish",  -- mountain master
			ranc = "FBI_overkill_145",  -- midland ranch
			trai = "FBI_CITY_easy_wish",  -- lost in transit
			corp = "CITY_overkill_290",  -- hostile takeover
			roberts = "FBI_overkill_145",  -- go bank
		},
	}

	ASS.original_settings = deep_clone(ASS.settings)

	function ASS:get_difficulty()
		if not self._difficulty then
			self._difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		end

		return self._difficulty
	end

	function ASS:get_level_id()
		if not self._level_id then
			self._level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
		end

		return self._level_id
	end

	function ASS:get_job_id()
		if not self._job_id then
			self._job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		end

		return self._job_id
	end

	function ASS:is_difficulty_at_least(difficulty)
		if not self._difficulties then
			self._difficulties = {
				normal = table.set("normal", "hard", "overkill", "overkill_145", "easy_wish", "overkill_290", "sm_wish"),
				hard = table.set("hard", "overkill", "overkill_145", "easy_wish", "overkill_290", "sm_wish"),
				overkill = table.set("overkill", "overkill_145", "easy_wish", "overkill_290", "sm_wish"),
				overkill_145 = table.set("overkill_145", "easy_wish", "overkill_290", "sm_wish"),
				easy_wish = table.set("easy_wish", "overkill_290", "sm_wish"),
				overkill_290 = table.set("overkill_290", "sm_wish"),
				sm_wish = table.set("sm_wish")
			}
		end

		local desired = self._difficulties[difficulty]

		return desired and desired[self:get_difficulty()] or false
	end

	function ASS:base_units()
		if not self._base_units then
			self._base_units = {
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

		return self._base_units
	end

	function ASS:get_difficulty_dozer(max_tier)
		max_tier = max_tier or 5

		local tier_i = 1
		local tier_list = {
			[1] = "normal",
			[2] = "overkill",
			[3] = "easy_wish",
			[4] = "overkill_290",
			[5] = "sm_wish"
		}

		for i = #tier_list, 1, -1 do
			local difficulty = tier_list[i]

			if self:is_difficulty_at_least(difficulty) then
				tier_i = i

				break
			end
		end

		tier_i = math.min(tier_i, max_tier)

		local units = self:base_units()

		return units["dozer_" .. tier_i] or units.dozer_1
	end

	function ASS:get_random_units()
		if not self._random_units then
			local units = self:base_units()
			local security_1, security_2, security_3 = units.security_1, units.security_2, units.security_3
			local cop_1, cop_2, cop_3, cop_4 = units.cop_1, units.cop_2, units.cop_3, units.cop_4
			local fbi_1, fbi_2, fbi_3 = units.fbi_1, units.fbi_2, units.fbi_3
			local swat_1, swat_2, swat_3 = units.swat_1, units.swat_2, units.swat_3
			local heavy_1, heavy_2 = units.heavy_1, units.heavy_2
			local shield, taser, cloaker = units.shield, units.taser, units.cloaker
			local medic_1, medic_2 = units.medic_1, units.medic_2
			local dozer_1, dozer_4, dozer_5 = units.dozer_1, units.dozer_4, units.dozer_5

			self._random_units = {
				securitys = { security_1, security_2, security_3 },
				securitys_light = { security_1, security_2 },
				securitys_heavy = { security_2, security_3 },
				cops = { cop_1, cop_2, cop_3, cop_4 },
				cops_light = { cop_1, cop_2 },
				cops_heavy = { cop_3, cop_4 },
				cops_no_bronco = { cop_1, cop_3, cop_4 },
				fbis = { fbi_1, fbi_2, fbi_3 },
				fbis_suits = { fbi_1, fbi_2 },
				fbis_field = { fbi_2, fbi_3 },
				swats = { swat_1, swat_2, swat_3 },
				swats_close = { swat_2, swat_3 },
				swats_far = { swat_1, swat_3  },
				heavys = { heavy_1, heavy_2 },
				swats_heavys = { swat_1, swat_2, swat_3, heavy_1, heavy_1, heavy_2 },
				swats_heavys_close = { swat_2, swat_3, heavy_2, heavy_2 },
				swats_heavys_far = { swat_1, swat_3, heavy_1, heavy_1 },
				specials_agg = { taser, cloaker },
				specials_def = { taser, shield },
				specials_sup = { shield, shield, medic_1, medic_2 },
				specials_any = { shield, shield, taser, taser, cloaker, cloaker, medic_1, medic_2 },
				specials_no_med = { shield, taser, cloaker },
				specials_taser_medic = { taser, taser, medic_1, medic_2 },
				specials_med = { medic_1, medic_2 },
				dozers_any = { dozer_1 }
			}

			for _, max_tier in pairs(self.DOZER_TIERS) do
				local dozer = self:get_difficulty_dozer(max_tier)

				if dozer and not table.contains(self._random_units.dozers_any, dozer) then
					table.insert(self._random_units.dozers_any, dozer)
				end
			end

			self._random_units.dozers_no_mini = clone(self._random_units.dozers_any)
			table.delete(self._random_units.dozers_no_mini, dozer_4)

			self._random_units.dozers_no_med = clone(self._random_units.dozers_any)
			table.delete(self._random_units.dozers_no_med, dozer_5)

			self._random_units.dozers_no_cs = clone(self._random_units.dozers_any)
			table.delete(self._random_units.dozers_no_cs, dozer_4)
			table.delete(self._random_units.dozers_no_cs, dozer_5)
		end

		return self._random_units
	end

	function ASS:random_unit(units)
		local base_units = self:base_units()
		local get_random_units = self:get_random_units()
		local fallback = get_random_units.cops

		if type(units) == "string" then
			return get_random_units[units] or fallback
		else
			return base_units[table.random(units)] or fallback
		end
	end

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:get_value(val)
		local value = self.values[val]
		local index = self.settings[val]

		return value[index]:gsub("^ass_" .. val .. "_", "")
	end

	function ASS:assault_style()
		return self:get_value("assault_style")
	end

	function ASS:marshal_squads_allowed()
		local marshal_squads_allowed = self:get_value("marshal_squads_allowed")

		return tonumber(marshal_squads_allowed)
	end

	function ASS:level_mod()
		local level_mod = self.values.level_mod[self.settings.level_mod]:gsub("^ass_level_mod_", "")

		local redirect = {
			per_level = self.level_mod_map[self:get_level_id()] or self.level_mod_map[self:get_job_id()],
			disable = false
		}

		if redirect[level_mod] ~= nil then
			return redirect[level_mod]
		end

		return level_mod
	end

	function ASS:get_skill_dependent_value(val)
		local value = self.skill_tweaks[val]
		local index = self.settings.skill

		return value and value[index]
	end

	function ASS:get_intensity_dependent_boolean(val)
		local is_valid_tweak = self.intensity_tweaks[val]
		local value = is_valid_tweak and self.settings[val]

		return value
	end

	function ASS:mission_script_patches()
		if self._mission_script_patches == nil then
			local level_id = self:get_level_id()

			if level_id then
				self._mission_script_patches = self:require("mission_script/" .. level_id:gsub("_night$", ""):gsub("_day$", ""):gsub("_skip1$", ""):gsub("_skip2$", "")) or false
			end
		end

		return self._mission_script_patches
	end

	Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
		loc:load_localization_file(ASS.mod_path .. "loc/english.json")
	end )

	Hooks:Add( "MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)

		local menu_id = "ass_menu"
		MenuHelper:NewMenu(menu_id)

		MenuCallbackHandler.ass_setting_toggle = function(self, item)
			ASS.settings[item:name()] = (item:value() == "on")
		end

		MenuCallbackHandler.ass_setting_value = function(self, item)
			ASS.settings[item:name()] = item:value()
		end

		MenuCallbackHandler.ass_save = function()
			io.save_as_json(ASS.settings, ASS.save_path)
		end

		MenuCallbackHandler.ass_reset_settings = function()
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

			QuickMenu:new(managers.localization:text("ass_menu_warning"), message, buttons, true)
		end

		local priority = 0
		local divider_id = 1

		local function add_toggle(value)
			MenuHelper:AddToggle({
				id = value,
				title = "ass_menu_" .. value,
				desc = "ass_menu_" .. value .. "_desc",
				callback = "ass_setting_toggle",
				value = ASS.settings[value],
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

		local function add_multiple_choice(value)
			MenuHelper:AddMultipleChoice({
				id = value,
				title = "ass_menu_" .. value,
				desc = "ass_menu_" .. value .. "_desc",
				callback = "ass_setting_value",
				value = ASS.settings[value],
				items = ASS.values[value],
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
		add_multiple_choice("marshal_squads_allowed")
		add_divider()
		add_toggle("super_serious_dominations")
		add_toggle("max_values")
		add_toggle("max_diff")
		add_toggle("max_balance_muls")
		add_divider()
		add_toggle("minigun_dozers")
		add_toggle("captain_winters")
		add_toggle("escapes")
		add_divider()
		add_button("reset_settings")

		nodes[menu_id] = MenuHelper:BuildMenu(menu_id, { back_callback = "ass_save" })

		MenuHelper:AddMenuItem(nodes["blt_options"], menu_id, "ass_menu_main")

	end )

	-- Load settings
	if io.file_is_readable(ASS.save_path) then
		local data = io.load_as_json(ASS.save_path)
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
	end

	if not StreamHeist then
		Hooks:Add( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroups", function()
			if Global.ass_did_not_find_sh then
				return
			end

			Global.ass_did_not_find_sh = true

			local message = managers.localization:text("ass_menu_did_not_find_sh")
			local buttons = {
				{
					text = managers.localization:text("ass_menu_did_not_find_sh_goto"),
					callback = function()
						-- TODO: differentiate between windows and linux
						os.execute("start https://modworkshop.net/mod/29713")
						os.execute("open https://modworkshop.net/mod/29713")
					end
				},
				{
					text = managers.localization:text("ass_menu_ignore")
				}
			}
			QuickMenu:new(managers.localization:text("ass_menu_warning"), message, buttons, true)
		end )
	end

end

if not ASS.settings.is_massive then
	return
end

if Global.ass_did_not_find_sh then
	return
end

if RequiredScript and not ASS.required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)

		if SuperSeriousShooter then
			log(fname)
		end
	end

	ASS.required[RequiredScript] = true

end
