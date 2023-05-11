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
			intensity = 1,
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
			intensity = {
				"ass_intensity_1",
				"ass_intensity_2",
				"ass_intensity_3",
				"ass_intensity_4"
			}
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
			base_cooldown_base = { 30, 30, 20, 10, 5, 0 },
			force_pool_mul = { 0.85, 1, 1, 1.5, 2, 4 },
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
			smokebomb_lifetime = {
				{ 7.5, 12 },
				{ 9, 15 },
				{ 9, 15 },
				{ 15, 20 },
				{ 20, 30 },
				{ 60, 60 }
			},
			gas_grenade_times = {
				{ 60, 240 },
				{ 60, 90 },
				{ 60, 90 },
				{ 45, 75 },
				{ 10, 20 },
				{ 0, 0 }
			}
		},
		intensity_tweaks = {
			max_values = { false, true, true, true },
			max_diff = { false, false, true, true },
			max_balance_muls = { false, false, false, true }
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
			alex = "FBI_overkill_145",  -- rats
			watchdogs = "FBI_overkill_145",
			watchdogs_night = "FBI_overkill_145",
			framing_frame = "FBI_overkill_145",
			welcome_to_the_jungle_prof = "FBI_overkill_145",  -- big oil
			welcome_to_the_jungle_night_prof = "FBI_overkill_145",  -- big oil
			family = "CS_normal",  -- diamond store
			election_day = "CS_FBI_overkill",
			arm_fac = "CITY_overkill_290",  -- transport harbor
			arm_par = "CITY_overkill_290",  -- transport park
			arm_hcm = "CITY_overkill_290",  -- transport downtown
			arm_und = "CITY_overkill_290",  -- transport underpass
			arm_cro = "CITY_overkill_290",  -- transport crossroads
			arm_for = "CITY_overkill_290",  -- transport train
			big = "CS_FBI_overkill",  -- big bank
			mia = "FBI_overkill_145",  -- hotline miami
			gallery = "FBI_overkill_145",  -- art gallery
			hox = "FBI_overkill_145",  -- hoxton breakout
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
			pbr2 = "CS_FBI_pbr2",  -- birth of sky
			peta = "CS_FBI_overkill",  -- goat simulator
			pal = "CS_normal",  -- counterfeit
			man = "CS_FBI_man",  -- undercover
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
			nmh = "CS_FBI_CITY_nmh",  -- no mercy
			sah = "FBI_overkill_145",  -- shacklethorne auction
			chas = "CS_normal",  -- dragon heist
			sand = "CS_FBI_overkill",  -- ukrainian prisoner
			chca = "FBI_overkill_145",  -- black cat
			pent = "FBI_CITY_easy_wish",  -- mountain master
			ranc = "FBI_overkill_145",  -- midland ranch
			trai = "FBI_CITY_easy_wish",  -- lost in transit
			corp = "CITY_overkill_290",  -- hostile takeover
			roberts = "FBI_overkill_145",  -- go bank
		}
	}

	function ASS:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function ASS:req_func_name()
		return self.values.assault_style[self.settings.assault_style]:gsub("^ass_assault_style_", "")
	end

	function ASS:level_mod()
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id
		local level_mod = self.values.level_mod[self.settings.level_mod]:gsub("^ass_level_mod_", "")
		local redirect = {
			per_level = self.level_mod_map[job_id]
		}

		return redirect[level_mod] or level_mod
	end

	function ASS:get_skill_dependent_value(val)
		local value = self.skill_tweaks[val]
		local index = self.settings.skill

		return value and value[index]
	end

	function ASS:get_intensity_dependent_boolean(val)
		local value = self.intensity_tweaks[val]
		local index = self.settings.intensity

		return value and value[index]
	end

	Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)

		loc:add_localized_strings({
			ass_menu_main = "Alarmingly Streamlined Spawngroups",

			ass_menu_is_massive = "Enable the ASS",
			ass_menu_is_massive_desc = "Make the mod do the thing.",

			ass_menu_level_mod = "Level Mod",
			ass_menu_level_mod_desc = "Make levels use a fixed response faction on any difficulty.",
			ass_level_mod_disable = "Disable",
			ass_level_mod_per_level = "Per-Level",
			ass_level_mod_CS_normal = "SWAT",
			ass_level_mod_CS_FBI_overkill = "SWAT-FBI",
			ass_level_mod_FBI_overkill_145 = "FBI",
			ass_level_mod_FBI_CITY_easy_wish = "FBI-GenSec",
			ass_level_mod_CITY_overkill_290 = "GenSec",

			ass_menu_assault_style = "Assault Style",
			ass_menu_assault_style_desc = "Choose between original styled and Streamlined Heisting styled spawn groups.",
			ass_assault_style_original = "Original",
			ass_assault_style_streamlined = "Streamlined",

			ass_menu_skill = "Skill Level",
			ass_menu_skill_desc = "Tweaks base values used for scaling.",
			ass_skill_1 = "I'm Too Young to Die",
			ass_skill_2 = "Hey, Not Too Rough",
			ass_skill_3 = "Hurt Me Plenty",
			ass_skill_4 = "Ultra-Violence",
			ass_skill_5 = "Nightmare!",
			ass_skill_6 = "Ultra-Nightmare!!",

			ass_menu_intensity = "Intensity",
			ass_menu_intensity_desc = "Forces certain scaling values to the maximum.",
			ass_intensity_1 = "No Soap Dropping",
			ass_intensity_2 = "Drop the Soap",
			ass_intensity_3 = "Pick Up the Soap",
			ass_intensity_4 = "Fuck Me Sideways",

			ass_menu_minigun_dozers = "Minigun Dozers",
			ass_menu_minigun_dozers_desc = "Reenable Minigun Dozers on Death Wish difficulty.",

			ass_menu_captain_winters = "Captain Winters",
			ass_menu_captain_winters_desc = "Reenable Captain Winters.",

			ass_menu_escapes = "Escapes",
			ass_menu_escapes_desc = "Reenable escapes.",

			ass_menu_warning = "Warning",
			ass_menu_ignore = "Get out of my face",
			ass_menu_did_not_find_sh = "Alarmingly Streamlined Spawngroups requires Streamlined Heisting.\n\nAlarmingly Streamlined Spawngroups will deactivate itself until Streamlined Heisting is installed and the game is fully restarted.",
			ass_menu_did_not_find_sh_goto = "Streamline my heisting",
		})

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

		local priority = table.size(ASS.settings) * 2
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

			priority = priority - 2
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

			priority = priority - 2
		end

		add_toggle("is_massive")
		add_divider()
		add_multiple_choice("level_mod")
		add_multiple_choice("assault_style")
		add_multiple_choice("skill")
		add_multiple_choice("intensity")
		add_divider()
		add_toggle("minigun_dozers")
		add_toggle("captain_winters")
		add_toggle("escapes")

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
	end

	ASS.required[RequiredScript] = true

end
