local meta = {
	__call = function(tbl, ass, func)
		local message = tbl[func]

		if message then
			message(ass)
		end
	end,
}

return setmetatable({
	on_init = function(self)
		Hooks:AddHook( "LocalizationManagerPostInit", "LocalizationManagerPostInitAlarminglyStreamlinedSpawngroups", function(loc)
			loc:load_localization_file(self.path .. "loc/english.json")
		end )

		Hooks:AddHook( "MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusAlarminglyStreamlinedSpawngroups", function(_, nodes)
			self.menu_builder:create_menu(nodes)
		end )
	end,
	zeals_enabled = function(self)
		if not self:setting("is_massive") then
			return
		end

		local global = self.global
		global.zeals_enabled = true
		local function show_zeal_dialog()
			if not global.showed_dialog then
				global.showed_dialog = true

				self:log("warn", "ZEAL Level Mod enabled...")

				local title = managers.localization:text("alarmingly_streamlined_spawngroups_menu_warning")
				local message = managers.localization:text("alarmingly_streamlined_spawngroups_menu_zeal_matchmaking_locked")
				local buttons = {
					{
						text = managers.localization:text("alarmingly_streamlined_spawngroups_menu_ignore"),
						callback = function()
							self:require("lua/networkmanager")
						end,
					},
				}
				QuickMenu:new(title, message, buttons, true)
			end
		end

		if managers.localization then
			show_zeal_dialog()
		else
			Hooks:AddHook( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsZEALsEnabled", show_zeal_dialog )
		end
	end,
	sh_not_found = function(self)
		self.been_there_fucked_that = false

		self:log("error", "Streamlined Heisting not found!")

		local global = self.global
		global.invalid_sh = "missing"
		if self:setting("is_massive") then
			Hooks:AddHook( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
				if not global.showed_dialog then
					global.showed_dialog = true

					local title = managers.localization:text("alarmingly_streamlined_spawngroups_menu_warning")
					local message = managers.localization:text("alarmingly_streamlined_spawngroups_menu_sh_not_found")
					local buttons = {
						{
							text = managers.localization:text("alarmingly_streamlined_spawngroups_menu_sh_not_found_goto"),
							callback = function()
								-- im aware linux isnt supported anymore
								if BLT:GetOS() == "linux" then
									os.execute("open https://modworkshop.net/mod/29713")
								else
									os.execute("start https://modworkshop.net/mod/29713")
								end
							end,
						},
						{
							text = managers.localization:text("alarmingly_streamlined_spawngroups_menu_ignore"),
						},
					}
					QuickMenu:new(title, message, buttons, true)
				end
			end )
		end
	end,
	sh_disabled = function(self)
		self.been_there_fucked_that = false

		self:log("error", "Streamlined Heisting is disabled!")

		local global = self.global
		global.invalid_sh = "disabled"
		if self:setting("is_massive") then
			Hooks:AddHook( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
				if not global.showed_dialog then
					global.showed_dialog = true

					local title = managers.localization:text("alarmingly_streamlined_spawngroups_menu_warning")
					local message = managers.localization:text("alarmingly_streamlined_spawngroups_menu_sh_disabled")
					local buttons = {
						{
							text = managers.localization:text("alarmingly_streamlined_spawngroups_menu_ignore"),
						},
					}
					QuickMenu:new(title, message, buttons, true)
				end
			end )
		end
	end,
	sh_outdated = function(self)
		self.been_there_fucked_that = false

		self:log("error", "Streamlined Heisting is out of date!")

		local global = self.global
		global.invalid_sh = "outdated"
		if self:setting("is_massive") then
			Hooks:AddHook( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuAlarminglyStreamlinedSpawngroupsInvalidStreamlined", function()
				if not global.showed_dialog then
					global.showed_dialog = true

					local title = managers.localization:text("alarmingly_streamlined_spawngroups_menu_warning")
					local message = managers.localization:text("alarmingly_streamlined_spawngroups_menu_sh_outdated")
					local buttons = {
						{
							text = managers.localization:text("alarmingly_streamlined_spawngroups_menu_ignore"),
						},
					}
					QuickMenu:new(title, message, buttons, true)
				end
			end )
		end
	end,
}, meta)
