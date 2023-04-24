if not ASS then

	ASS = {
		mod_path = ModPath,
		save_path = SavePath .. "alarmingly_streamlined_spawngroups.json",
		required = {},
		settings = {
			is_massive = true,
			level_mods = true,
			minigun_dozers_on_death_wish = false,
			vanilla_styled_assaults = false,
			max_intensity = false
		},
		level_mod_map = {
			jewelry_store = "CS_normal",
			four_stores = "CS_normal",
			nightclub = "CS_normal",
			mallcrasher = "CS_normal",
			ukrainian_job_prof = "CS_normal",
			branchbank_deposit = "CS_normal",
			branchbank_cash = "CS_normal",
			branchbank_prof = "CS_normal",
			branchbank_gold_prof = "CS_normal",
			firestarter = "FBI_overkill_145",
			alex = "FBI_overkill_145", -- rats
			watchdogs = "FBI_overkill_145",
			watchdogs_night = "FBI_overkill_145",
			framing_frame = "FBI_overkill_145",
			welcome_to_the_jungle_prof = "FBI_overkill_145", -- big oil
			welcome_to_the_jungle_night_prof = "FBI_overkill_145",
			arm_fac = "CITY_overkill_290", -- transport 
			arm_par = "CITY_overkill_290", -- transport 
			arm_hcm = "CITY_overkill_290", -- transport 
			arm_und = "CITY_overkill_290", -- transport 
			arm_cro = "CITY_overkill_290", -- transport 
			arm_for = "CITY_overkill_290", -- transport train
			mia = "FBI_overkill_145", -- hotline miami
			gallery = "FBI_overkill_145", -- art gallery
			hox = "FBI_overkill_145", -- hoxton breakout
			hox_3 = "FBI_mcmansion", -- hoxton revenge
			pines = "FBI_overkill_145", -- white xmas
			shoutout_raid = "FBI_overkill_145",  -- meltdown
			arena = "CITY_overkill_290", -- alesso heist
			red2 = "CS_normal", -- first world bank
			dinner = "FBI_CITY_easy_wish", -- slaughterhouse
			nail = "FBI_overkill_145", -- lab rats
			cane = "FBI_overkill_145", -- santas workshop
			pbr2 = "CS_FBI_pbr2", -- birth of sky
			pal = "CS_normal", -- counterfeit
			man = "CS_FBI_man", -- undercover
			born = "FBI_overkill_145", -- biker heist
			chill_combat = "FBI_overkill_145", -- safehouse raid
			flat = "CS_FBI_overkill", -- panic room
			help = "FBI_overkill_145", -- prison nightmare
			moon = "CS_normal", -- stealing xmas
			run = "CS_normal", -- heat street
			glace = "CS_FBI_overkill", -- green bridge
			dah = "CITY_overkill_290", -- diamond heist
			nmh = "CS_FBI_CITY_nmh", -- no mercy
			roberts = "FBI_overkill_145" -- go bank
		},
		bad_raging_bull_levels = {
			pbr2 = true, -- birth of sky
			hvh = true -- cursed kill room
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_name()
		local assault_str = self.settings.vanilla_styled_assaults and "van_style_" or "old_style_"
		local sh_str = StreamHeist and "streamlined" or "vanilla"

		return assault_str .. sh_str
	end

	function ASS:level_mod()
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id

		return self.settings.level_mods and self.level_mod_map[job_id]
	end

	function ASS:is_bad_raging_bull_level()
		local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id

		return self.bad_raging_bull_levels[level_id]
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
		add_toggle("minigun_dozers_on_death_wish", 2)
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