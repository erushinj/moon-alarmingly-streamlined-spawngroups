local callbacks = {}

function callbacks.on_init()
	-- Register hooks
	Hooks:RegisterHook("AlarminglyStreamlinedSpawngroupsOnLevelAssaultTweaksInit")
	Hooks:RegisterHook("AlarminglyStreamlinedSpawngroupsOnWeaponMappingInit")
	Hooks:RegisterHook("AlarminglyStreamlinedSpawngroupsOnEnemyReplacementsInit")

	local function ass_gsub(default, ...)
		local last = select(-1, ...)
		local value = ASS.values[last]
		local setting = ASS.settings[last] or ASS.settings
		if setting == ASS.settings then
			for _, key in ipairs({ ... }) do
				if type(setting) ~= "table" then
					break
				end
				setting = setting[key]
			end
			setting = setting ~= ASS.settings and tonumber(setting) or nil
		end

		local str = value and value[setting]
		local result = str and string.gsub(str, "^alarmingly_streamlined_spawngroups_" .. last .. "_", "") or nil
		if type(default) == "number" then
			return tonumber(result) or default
		end

		return result or default
	end

	local level_mod_to_difficulty = {
		CS_normal = "normal",
		CS_FBI_overkill = "overkill",
		FBI_overkill_145 = "overkill_145",
		FBI_CITY_easy_wish = "easy_wish",
		CITY_overkill_290 = "overkill_290",
		CITY_ZEAL_awesome_difficulty_name = "awesome_difficulty_name",
		ZEAL_sm_wish = "sm_wish",
	}
	local level_mod = ass_gsub("per_level", "level_mod")
	local redirect = {
		per_level = ASS.level_mod_map[ASS.level_id] or ASS.level_mod_map[ASS.job_id] or ASS.difficulty,
		disable = ASS.difficulty,
		random = table.random({  -- No ZEAL for random below DS, not going to randomly activate a matchmaking lock
			"CS_normal",
			"CS_FBI_overkill",
			"FBI_overkill_145",
			"FBI_CITY_easy_wish",
			"CITY_overkill_290",
			ASS.difficulty,
		}),
	}

	ASS.assault_style = ASS.is_editor and "editor" or ass_gsub("default", "assault_style")
	ASS.skill = ass_gsub(2, "skill")
	ASS.difficulty_index = ASS.settings.max_values and 8 or ASS.real_difficulty_index
	ASS.wanted_enemy_weapon_tweaks = {
		shield = ass_gsub("pistols", "unit_weapons", "shield_arms"),
		taser = ass_gsub("sko12s", "unit_weapons", "taser_dazers"),
		cloaker = ass_gsub("both", "unit_weapons", "cloaker_balance"),
		medic_rifle = ass_gsub("deagles", "unit_weapons", "medic_ordnance"),
		medic_shotgun = ass_gsub("saigas", "unit_weapons", "medical_ordinance"),
		medic_dozer = ass_gsub("both", "unit_weapons", "geneva_suggestion"),
		pistol_rifle_hrts = ass_gsub("pistols", "unit_weapons", "police_rifle_funding"),
		shotgun_revolver_hrts = ass_gsub("shotguns", "unit_weapons", "police_shotgun_funding"),
	}

	local function get_dozer_rainbow_type(typ, default)
		local val = ASS.settings.dozer_rainbow[typ]
		if tonumber(val) then
			return val + 1  -- Account for easy being missing
		end

		return default
	end
	ASS.dozer_rainbow = {
		dozer_1 = get_dozer_rainbow_type("dozer_1", 2),  -- Not actually used, always present
		dozer_2 = get_dozer_rainbow_type("dozer_2", 4),
		dozer_3 = get_dozer_rainbow_type("dozer_3", 6),
		dozer_4 = get_dozer_rainbow_type("dozer_4", 8),
		dozer_5 = get_dozer_rainbow_type("dozer_5", 8),
	}

	for name, tweaks in pairs(ASS.skill_level_tweaks) do
		ASS.skill_level_tweaks[name] = tweaks[ASS.skill] or tweaks[2]
	end

	if redirect[level_mod] ~= nil then
		ASS.level_mod = redirect[level_mod]
	else
		ASS.level_mod = level_mod
	end

	ASS.level_mod = level_mod_to_difficulty[ASS.level_mod] or difficulty

	if ASS.global.invalid_sh then
		ASS.been_there_fucked_that = false
	else
		if ASS.been_there_fucked_that == nil then
			ASS.been_there_fucked_that = ASS.settings.is_massive
		end

		if ASS.been_there_fucked_that then
			if is_client then
				ASS:log("info", "Playing as client, most tweaks disabled...")
			end

			if is_editor then
				ASS:log("info", "Editor mode active, mission tweaks disabled and using vanilla groups...")
			end

			if tostring(ASS.level_mod):match("ZEAL") then
				ASS.callbacks.zeals_enabled()
			end
		else
			ASS:log("info", "Mod not enabled, all tweaks disabled")
		end
	end

	Hooks:AddHook("LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
		loc:load_localization_file(ASS.path .. "loc/english.json")
	end)

	Hooks:AddHook("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)
		ASS.menu_builder:create_menu(nodes)
	end)
end

function callbacks.zeals_enabled()
	if not ASS.settings.is_massive then
		return
	end

	ASS:log("warn", "ZEAL Level Mod enabled in this session!")
	ASS.global.zeals_enabled = true

	local function show_zeal_dialog()
		if ASS.global.showed_dialog then
			return
		end

		ASS.global.showed_dialog = true
		local loc = managers.localization
		local title = loc:text("alarmingly_streamlined_spawngroups_menu_warning")
		local message = loc:text("alarmingly_streamlined_spawngroups_menu_zeal_matchmaking_locked")
		local buttons = {
			{
				text = loc:text("alarmingly_streamlined_spawngroups_menu_ignore"),
				callback = function()
					ASS:require("lua/networkmanager")
				end,
			},
		}
		QuickMenu:new(title, message, buttons, true)
	end

	if managers.localization then
		show_zeal_dialog()
	else
		Hooks:AddHook("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsZEALsEnabled", show_zeal_dialog)
	end
end

function callbacks.sh_not_found()
	ASS:log("warn", "Streamlined Heisting not found!")
	ASS.been_there_fucked_that = false
	ASS.global.invalid_sh = "missing"
	if not ASS.settings.is_massive then
		return
	end

	Hooks:AddHook("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
		if ASS.global.showed_dialog then
			return
		end

		ASS.global.showed_dialog = true
		local loc = managers.localization
		local title = loc:text("alarmingly_streamlined_spawngroups_menu_warning")
		local message = loc:text("alarmingly_streamlined_spawngroups_menu_sh_not_found")
		local buttons = {
			{
				text = loc:text("alarmingly_streamlined_spawngroups_menu_sh_not_found_goto"),
				callback = function()
					if BLT:GetOS() == "linux" then
						os.execute("open https://modworkshop.net/mod/29713")
					else
						os.execute("start https://modworkshop.net/mod/29713")
					end
				end,
			},
			{
				text = loc:text("alarmingly_streamlined_spawngroups_menu_ignore"),
			},
		}
		QuickMenu:new(title, message, buttons, true)
	end)
end

function callbacks.sh_disabled()
	ASS:log("warn", "Streamlined Heisting is disabled!")
	ASS.been_there_fucked_that = false
	ASS.global.invalid_sh = "disabled"
	if not ASS.settings.is_massive then
		return
	end

	Hooks:AddHook("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
		if ASS.global.showed_dialog then
			return
		end

		ASS.global.showed_dialog = true
		local loc = managers.localization
		local title = loc:text("alarmingly_streamlined_spawngroups_menu_warning")
		local message = loc:text("alarmingly_streamlined_spawngroups_menu_sh_disabled")
		local buttons = {
			{
				text = loc:text("alarmingly_streamlined_spawngroups_menu_ignore"),
			},
		}
		QuickMenu:new(title, message, buttons, true)
	end)
end

function callbacks.sh_outdated()
	ASS:log("warn", "Streamlined Heisting is out of date!")
	ASS.been_there_fucked_that = false
	ASS.global.invalid_sh = "outdated"
	if not ASS.settings.is_massive then
		return
	end

	Hooks:AddHook("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
		if ASS.global.showed_dialog then
			return
		end

		ASS.global.showed_dialog = true
		local loc = managers.localization
		local title = loc:text("alarmingly_streamlined_spawngroups_menu_warning")
		local message = loc:text("alarmingly_streamlined_spawngroups_menu_sh_outdated")
		local buttons = {
			{
				text = loc:text("alarmingly_streamlined_spawngroups_menu_ignore"),
			},
		}
		QuickMenu:new(title, message, buttons, true)
	end)
end

return callbacks
