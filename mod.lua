if not ASS then

	ASS = {
		mod_path = ModPath,
		save_path = SavePath .. "alarmingly_streamlined_spawngroups.json",
		required = {},
		settings = {
			is_massive = true,
			level_mods = true,
			remove_death_wish_minidozers = true,
			vanilla_styled_assaults = false,
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
			firestarter = "FBI_hard",
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
			pines = "FBI_hard",
			shoutout_raid = "FBI_hard",
			arena = "CITY_overkill",
			red2 = "CS_normal",
			dinner = "CITY_overkill",
			nail = "FBI_hard",
			cane = "FBI_hard",
			pbr2 = "FBI_hard",
			pal = "CS_normal",
			man = "FBI_hard",
			born = "FBI_hard",
			chill_combat = "FBI_hard",
			flat = "FBI_hard",
			help = "FBI_hard",
			moon = "CS_normal",
			run = "CS_normal",
			glace = "FBI_hard",
			dah = "CITY_overkill",
			nmh = "CITY_overkill",
			roberts = "FBI_hard"
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_name()
		local assault_str = self.settings.vanilla_styled_assaults and "van_style_" or "moon_style_"
		local sh_str = StreamHeist and "streamlined" or "vanilla"

		return assault_str .. sh_str
	end

	function ASS:level_mod()
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		local level_mod = self.settings.level_mods and self._level_mod[job_id]

		return level_mod
	end

	Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
		loc:load_localization_file(ASS.mod_path .. "loc/english.txt")
	end )

	Hooks:Add( "MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)

		local menu_id = "ass_menu"
		MenuHelper:NewMenu(menu_id)

		MenuCallbackHandler.ass_setting_toggle = function(self, item)
			ASS.settings[item:name()] = (item:value() == "on")
		end

		MenuCallbackHandler.ass_save = function()
			io.save_as_json(ASS.settings, ASS.save_path)
		end

		local callback = "ass_setting_toggle"

		local function add_toggle(value, priority)
			MenuHelper:AddToggle({
				id = value,
				title = "ass_menu_" .. value,
				desc = "ass_menu_" .. value .. "_desc",
				callback = "ass_setting_toggle",
				value = ASS.settings[value],
				menu_id = menu_id,
				priority = priority
			})
		end

		add_toggle("is_massive", 4)
		add_toggle("level_mods", 3)
		add_toggle("remove_death_wish_minidozers", 2)
		add_toggle("vanilla_styled_assaults", 1)
		add_toggle("max_intensity", 0)

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

	-- just in case
	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.fix_gensec_shotgunner_in_murkywater = true

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