if not ASS then

	ASS = {
		mod_path = ModPath,
		save_path = SavePath .. "alarmingly_streamlined_spawngroups.json",
		required = {},
		settings = {
			is_massive = true,
			beta_assault_tweaks = true,
			level_mods = true,
			max_intensity = false
		},
		_level_mod = {
			jewelry_store = "CS_normal",
			four_stores = "CS_normal",
			nightclub = "CS_normal",
			mallcrasher = "CS_normal",
			ukrainian_job_prof = "CS_normal",
			branchbank_deposit = "CS_normal",
			branchbank_cash = "CS_normal",
			branchbank_prof = "CS_normal",
			branchbank_gold_prof = "CS_normal",
			alex = "FBI_hard",
			watchdogs = "FBI_hard",
			watchdogs_night = "FBI_hard",
			framing_frame = "FBI_hard",
			welcome_to_the_jungle_prof = "FBI_hard",
			welcome_to_the_jungle_night_prof = "FBI_hard",
			arm_fac = "CITY_overkill",
			arm_par = "CITY_overkill",
			arm_hcm = "CITY_overkill",
			arm_und = "CITY_overkill",
			arm_cro = "CITY_overkill",
			arm_for = "CITY_overkill",
			mia = "FBI_hard",
			gallery = "FBI_hard",
			hox = "FBI_hard",
			hox_3 = "FBI_mcmansion",
			shoutout_raid = "FBI_hard",
			arena = "CITY_overkill",
			red2 = "CS_normal",
			dinner = "CITY_overkill",
			pbr = "FBI_murkywater",
			pbr2 = "FBI_hard",
			pal = "CS_normal",
			man = "FBI_hard",
			chill_combat = "FBI_hard",
			flat = "FBI_hard",
			run = "CS_normal",
			glace = "FBI_hard",
			dah = "CITY_overkill",
			des = "FBI_murkywater",
			nmh = "CITY_overkill",
			roberts = "FBI_hard"
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_name()
		local beta_string = self.settings.beta_assault_tweaks and "beta_" or ""
		local sh_string = StreamHeist and "streamheist" or "vanilla"

		return beta_string .. sh_string
	end

	function ASS:level_mod()
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		local level_mod = StreamHeist and self.settings.level_mods and self._level_mod[job_id]

		return level_mod
	end

	Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
		loc:load_localization_file(ASS.mod_path .. "loc/en.txt")
	end )

	Hooks:Add( "MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)

		local menu_id = "ass_menu"
		MenuHelper:NewMenu(menu_id)

		--	get the feeling these can all use the same callback
		MenuCallbackHandler.ass_setting_toggle = function(self, item)
			ASS.settings[item:name()] = (item:value() == "on")
		end

		MenuCallbackHandler.ass_save = function()
			io.save_as_json(ASS.settings, ASS.save_path)
		end

		local clbk = "ass_setting_toggle"

		MenuHelper:AddToggle({
			id = "is_massive",
			title = "ass_menu_is_massive",
			desc = "ass_menu_is_massive_desc",
			callback = clbk,
			value = ASS.settings.is_massive,
			menu_id = menu_id,
			priority = 100
		})

		MenuHelper:AddToggle({
			id = "beta_assault_tweaks",
			title = "ass_menu_beta_assault_tweaks",
			desc = "ass_menu_beta_assault_tweaks_desc",
			callback = clbk,
			value = ASS.settings.beta_assault_tweaks,
			menu_id = menu_id,
			priority = 90
		})

		MenuHelper:AddToggle({
			id = "level_mods",
			title = "ass_menu_level_mods",
			desc = "ass_menu_level_mods_desc",
			callback = clbk,
			value = ASS.settings.level_mods,
			disabled = not StreamHeist,
			menu_id = menu_id,
			priority = 80
		})

		MenuHelper:AddToggle({
			id = "max_intensity",
			title = "ass_menu_max_intensity",
			desc = "ass_menu_max_intensity_desc",
			callback = clbk,
			value = ASS.settings.max_intensity,
			menu_id = menu_id,
			priority = 60
		})

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

	--	conflicts with GroupAILevelModModule on beneath the mountain and henrys rock
	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.fix_gensec_shotgunner_in_murkywater = true

	--	side mod, dont need
	CorpMarshalSquadIsDisabled = true

end

if not ASS.settings.is_massive then
	return
end

if RequiredScript and not ASS.required[RequiredScript] then

	local fname = ASS.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	ASS.required[RequiredScript] = true

end