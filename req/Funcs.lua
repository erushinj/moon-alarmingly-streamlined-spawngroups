-- whole wack of utilities
return {
	get_difficulty = function(self)
		if not self._difficulty then
			self._difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		end

		return self._difficulty
	end,
	get_level_id = function(self)
		if not self._level_id then
			self._level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
		end

		return self._level_id
	end,
	get_job_id = function(self)
		if not self._job_id then
			self._job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		end

		return self._job_id
	end,
	-- first used to get around tweak data because fuck tweak data
	is_difficulty_at_least = function(self, difficulty)
		if not self._difficulties then
			self._difficulties = {
				easy = table.set("easy", "normal", "hard", "overkill", "overkill_145", "easy_wish", "overkill_290", "sm_wish"),
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
	end,
	-- added because i realized i needed the difficulty index for some things. but also fuck tweak data.
	get_difficulty_index = function(self)
		if not self._difficulty_index then
			if tweak_data and tweak_data.difficulty_to_index then
				self._difficulty_index = tweak_data:difficulty_to_index(self:get_difficulty())
			else
				local difficulty_indices = {
					easy = 1,
					normal = 2,
					hard = 3,
					overkill = 4,
					overkill_145 = 5,
					easy_wish = 6,
					overkill_290 = 7,
					sm_wish = 8
				}

				self._difficulty_index = difficulty_indices[self:get_difficulty()] or 5
			end
		end

		return self._difficulty_index
	end,
	-- commonly used units
	base_units = function(self)
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
	end,
	-- used for static dozer spawns, mostly minigun dozers
	get_difficulty_dozer = function(self, max_tier)
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
	end,
	-- returns a table of units
	random_unit = function(self, units)
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
				cops_medium = { cop_2, cop_4 },
				cops_heavy = { cop_3, cop_4 },
				cops_no_bronco = { cop_1, cop_3, cop_4 },
				fbis = { fbi_1, fbi_2, fbi_3 },
				fbis_light = { fbi_1, fbi_2 },
				fbis_heavy = { fbi_2, fbi_3 },
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
				specials_no_clk = { shield, shield, taser, taser, medic_1, medic_2 },
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

		return self._random_units[units] or self._random_units.cops
	end,
	get_value = function(self, val)
		local value = self.values[val]
		local index = self.settings[val]

		return value[index]:gsub("^ass_" .. val .. "_", "")
	end,
	assault_style = function(self)
		return self:get_value("assault_style")
	end,
	marshal_squads_allowed = function(self)
		local marshal_squads_allowed = self:get_value("marshal_squads_allowed")

		return tonumber(marshal_squads_allowed)
	end,
	level_mod = function(self)
		local level_mod = self.values.level_mod[self.settings.level_mod]:gsub("^ass_level_mod_", "")

		local redirect = {
			per_level = self.level_mod_map[self:get_level_id()] or self.level_mod_map[self:get_job_id()],
			disable = false
		}

		if redirect[level_mod] ~= nil then
			return redirect[level_mod]
		end

		return level_mod
	end,
	get_skill_dependent_value = function(self, val)
		local value = self.skill_tweaks[val]
		local index = self.settings.skill

		return value and value[index]
	end,
	get_intensity_dependent_boolean = function(self, val)
		local is_valid_tweak = self.intensity_tweaks[val]
		local value = is_valid_tweak and self.settings[val]

		return value
	end,
	mission_script_patches = function(self)
		if self._mission_script_patches == nil then
			local level_id = self:get_level_id()

			if level_id then
				self._mission_script_patches = self:require("mission_script/" .. level_id:gsub("_night$", ""):gsub("_day$", ""):gsub("_skip1$", ""):gsub("_skip2$", "")) or false
			end
		end

		return self._mission_script_patches
	end,
	menu_hooks = function(self)
		Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
			loc:load_localization_file(self.mod_path .. "loc/english.json")
		end )

		Hooks:Add( "MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)

			local menu_id = "ass_menu"
			MenuHelper:NewMenu(menu_id)

			MenuCallbackHandler.ass_setting_toggle = function(_, item)
				self.settings[item:name()] = (item:value() == "on")
			end

			MenuCallbackHandler.ass_setting_value = function(_, item)
				self.settings[item:name()] = item:value()
			end

			MenuCallbackHandler.ass_save = function()
				io.save_as_json(self.settings, self.save_path)
			end

			MenuCallbackHandler.ass_reset_settings = function()
				local message = managers.localization:text("ass_menu_reset_settings_verify")
				local buttons = {
					{
						text = managers.localization:text("ass_menu_confirm"),
						callback = function()
							self.settings = deep_clone(self.original_settings)
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

			local function add_toggle(id)
				MenuHelper:AddToggle({
					id = id,
					title = "ass_menu_" .. id,
					desc = "ass_menu_" .. id .. "_desc",
					callback = "ass_setting_toggle",
					value = self.settings[id],
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
					value = self.settings[id],
					items = self.values[id],
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

		if StreamHeist and not BLT.Mods:GetModByName("Streamlined Heisting") or not StreamHeist then
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
	end,
}
