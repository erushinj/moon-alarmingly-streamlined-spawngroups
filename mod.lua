if not ASS then

	-- create table used for save adjustment checks, SH checks, and ZEAL Level Mod checks
	Global.alarmingly_streamlined_spawngroups = Global.alarmingly_streamlined_spawngroups or {}

	-- extends the BLTMod instance, check PAYDAY 2\mods\base\req\BLTMod for base variables and methods
	ASS = ModInstance
	ASS._global = Global.alarmingly_streamlined_spawngroups
	ASS._mod_path = ASS:GetPath()
	ASS._req_path = ASS._mod_path .. "req/"
	ASS._lua_path = ASS._mod_path .. "lua/"
	ASS._loc_path = ASS._mod_path .. "loc/"
	ASS._hook_prefix = "ass_"
	ASS._hook_suffix = "AlarminglyStreamlinedSpawngroups"
	ASS._require = {}
	ASS._script_patches = {}
	ASS.settings = {
		save_version = tonumber(ASS:GetVersion()),  -- hidden, used for adjusting saved values if necessary
		is_massive = true,  -- whether the mod is enabled or not
		level_mod = 3,  -- index into ASS._values.level_mod
		assault_style = 1,  -- index into ASS._values.assault_style
		skill = 2,  -- index into ASS._values.skill
		dmg_interval = 1,  -- index into ASS._values.dmg_interval
		doms_scale = false,  -- whether to make dominations harder on higher difficulties
		doms_all_hard = false,  -- whether to make all dominatable enemies use hardest preset
		doms_super_serious = false,  -- whether to allow dominations during assault
		max_values = false,  -- whether to use death sentence values for scaling
		max_diff = false,  -- whether to force hardest assaults
		max_balance_muls = false,  -- whether to force full crew spawns
		minigun_dozers = false,  -- allow assault-spawned minigun dozers on DW difficulty
		captain_winters = false,  -- allow captain winters to spawn on maps that have him
		escapes = false,  -- allow escapes to occur on maps that have them
	}
	ASS.default_settings = deep_clone(ASS.settings)
	ASS._values = {
		level_mod = {
			"ass_level_mod_disable",  -- dont change units
			"ass_level_mod_random",  -- pick any available level mod value (besides zeal)
			"ass_level_mod_per_level",  -- depends on level/full job id
			"ass_level_mod_CS_normal",  -- swat
			"ass_level_mod_CS_FBI_overkill",  -- swat-fbi
			"ass_level_mod_FBI_overkill_145",  -- fbi
			"ass_level_mod_FBI_CITY_easy_wish",  -- fbi-gensec
			"ass_level_mod_CITY_overkill_290",  -- gensec
			"ass_level_mod_CITY_ZEAL_awesome_difficulty_name",  -- gensec-zeal
			"ass_level_mod_ZEAL_sm_wish",  -- zeal
		},
		assault_style = {
			"ass_assault_style_original",  -- pre-housewarming-styled
			"ass_assault_style_streamlined",  -- spicier streamlined groups
			"ass_assault_style_default",  -- default streamlined groups
			"ass_assault_style_chicken_plate",  -- PDTH-styled spawns
		},
		skill = {
			"ass_skill_1",  -- im too young to die
			"ass_skill_2",  -- hey, not too rough
			"ass_skill_3",  -- hurt me plenty
			"ass_skill_4",  -- ultra-violence
			"ass_skill_5",  -- nightmare
			"ass_skill_6",  -- ultra-nightmare
		},
		dmg_interval = {
			"ass_dmg_interval_0.250",  -- these are pretty self-explanatory, duration in s
			"ass_dmg_interval_0.225",
			"ass_dmg_interval_0.200",
			"ass_dmg_interval_0.175",
			"ass_dmg_interval_0.150",
			"ass_dmg_interval_0.125",
			"ass_dmg_interval_0.100",
			"ass_dmg_interval_0.075",
			"ass_dmg_interval_0.050",
			"ass_dmg_interval_0.025",
			"ass_dmg_interval_0.000",
		},
	}
	ASS._tweaks = {  -- skill-level dependent tweaks, appropriate value is fetched base on the number at the end of the current skill value (eg, hurt me plenty retrieves the 3rd value)
		force_pool_mul = { 0.85, 1, 1, 1.1, 1.5, 2, },  -- multiplier on the amount of cops that can spawn in a single assault
		sustain_duration_mul = { 0.85, 1, 1, 1.25, 2, 1250, },  -- multiplier on the duration of the "sustain" assault phase
		break_duration_mul = { 1.25, 1, 1, 0.85, 0.85, 0, },  -- multiplier on the length of assault delays and hostage hesitation delays
		special_limit_mul = { 1, 1, 1, 1.25, 2, 4, },  -- multiplier on special limits, final limits are rounded up
		grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0, },  -- multiplier on delays between uses of the same grenade type
		min_grenade_timeout = { 15, 15, 15, 12, 6, 3, },  -- delay between uses of any grenade
		no_grenade_push_delay = { 10, 8, 8, 7, 3.5, 0, },  -- delay before most groups will push when no grenade is available
		freq_base = {  -- enemy frequencies in spawn groups, format { X, Y, }, interpolates from X on Normal to Y on DS/with max values
			{
				baseline = { 1, 1, },
				common = { 0.2, 0.5, },
				uncommon = { 0.1, 0.35, },
				rare = { 0.1, 0.2, },
				elite = { 0.1, 0.1, },
			},
			{
				baseline = { 1, 1, },
				common = { 0.35, 0.5, },
				uncommon = { 0.2, 0.35, },
				rare = { 0.1, 0.2, },
				elite = { 0.1, 0.1, },
			},
			{
				baseline = { 1, 1, },
				common = { 0.35, 1, },
				uncommon = { 0.2, 0.5, },
				rare = { 0.1, 0.35, },
				elite = { 0.1, 0.2, },
			},
			{
				baseline = { 1, 1, },
				common = { 0.5, 1, },
				uncommon = { 0.35, 1, },
				rare = { 0.2, 0.5, },
				elite = { 0.1, 0.35, },
			},
			{
				baseline = { 1, 1, },
				common = { 1, 1, },
				uncommon = { 0.5, 1, },
				rare = { 0.35, 0.5, },
				elite = { 0.2, 0.35, },
			},
			{
				baseline = { 0.1, 0.1, },
				common = { 1, 1, },
				uncommon = { 2, 2, },
				rare = { 3, 3, },
				elite = { 4, 4, },
			},
		},
		spawn_cooldowns = {  -- multipliers on cooldowns between spawns, format { X, Y, }, interpolates from X on Normal to Y on DS/with max values
			{ 2.2, 1.1, },
			{ 2, 1, },
			{ 2, 1, },
			{ 1.5, 0.75, },
			{ 0.5, 0.25, },
			{ 0, 0, },
		},
		special_weight_base = {  -- used to calculate special group weights in normal play, format { X, Y, }, interpolates from X on Normal to Y on DS/with max values
			{ 1.5, 5, },
			{ 3, 5, },
			{ 3, 5, },
			{ 4, 6, },
			{ 8, 12, },
			{ 27, 27, },
		},
		skm_special_weights = {  -- special group weights in holdout, format { X, Y, }, interpolates from X to Y based on wave number
			{ 2, 4, 6, },
			{ 4, 5, 6, },
			{ 4, 5, 6, },
			{ 5, 6.25, 7.5, },
			{ 9, 12, 15, },
			{ 21, 24, 27, },
		},
		reenforce_interval = {  -- delay between enemy groups being dispatched specifically to hold selected locations on the map, this delay is shortened the more groups are needed
			{ 30, 30, 30, },
			{ 20, 20, 20, },
			{ 20, 20, 20, },
			{ 15, 15, 15, },
			{ 5, 5, 5, },
			{ 0, 0, 0, },
		},
		smoke_grenade_lifetime = {  -- self-explanatory, format { X, Y, }, interpolates from X on Normal to Y on DS/with max values
			{ 7.5, 12, },
			{ 9, 15, },
			{ 9, 15, },
			{ 15, 20, },
			{ 20, 30, },
			{ 60, 60, },
		},
		cs_grenade_chance_times = {  -- times for gas grenades to be allowed to replace smoke bombs under certain conditions, format { X, Y, }, interpolates from X (allowed) to Y (guaranteed) based on time spent in the same area
			{ 60, 240, },
			{ 60, 90, },
			{ 60, 90, },
			{ 45, 75, },
			{ 10, 20, },
			{ 0, 0, },
		},
	}
	ASS.level_mod_map = {  -- which Level Mods are assigned to which levels/jobs, level ids are checked first, then the job id (used for multi-day heists)
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

	function ASS:log(prefix, str, ...)
		if not self._log then
			self._log = {}

			local level_id, difficulty = self:get_var("level_id"), self:get_var("difficulty")
			for _, pre in pairs({ "error", "warn", "info", }) do
				self._log[pre] = ("[ASS:%s|%s:%s] "):format(pre:upper(), level_id, difficulty)
			end
		end

		log((self._log[prefix] or self._log.info) .. str:format(...))
	end

	-- versatile script loader
	-- loads + caches specified file as a function, auto-detecting if it's in lua/ or req/
	-- result can be executed on the spot if needed, and/or can be assigned to a variable
	function ASS:require(file, load, ...)
		if not self._require[file] then
			local path = self._lua_path .. file .. ".lua"
			path = io.file_is_readable(path) and path or self._req_path .. file .. ".lua"

			self._require[file] = blt.vm.loadfile(path) or function() end
		end

		if load then
			return self._require[file]
		end

		return self._require[file](...)
	end

	-- call as ASS:global() to fetch the mod's Global entry
	-- otherwise, supply a string var to fetch the current value of said var in the Global entry
	function ASS:global(var)
		if var ~= nil then
			if type(self._global[var]) == "table" then
				return deep_clone(self._global[var])
			end

			return self._global[var]
		end

		return self._global
	end

	function ASS:get_setting(setting, default)
		if default then
			return self.default_settings[setting]
		end

		return self.settings[setting]
	end

	-- deprecated functions, still define them
	ASS:require("deprecated")

	local last_priority = 0
	local function priority()
		last_priority = last_priority - 1

		return last_priority
	end

	local function items(value)
		return ASS._values[value]
	end

	local divider = 16

	-- ASS's path\req\hoplib_menu_builder.lua
	ASS.menu_builder = ASS:require("hoplib_menu_builder", nil, "alarmingly_streamlined_spawngroups", "ass", ASS.settings, {
		save_version = { hidden = true, },
		is_massive = {
			priority = priority(),
			divider = divider,
		},
		level_mod = {
			priority = priority(),
			items = items("level_mod"),
		},
		assault_style = {
			priority = priority(),
			items = items("assault_style"),
		},
		skill = {
			priority = priority(),
			items = items("skill"),
			divider = divider,
		},
		doms_scale = { priority = priority(), },
		doms_all_hard = { priority = priority(), },
		doms_super_serious = {
			priority = priority(),
			divider = divider,
		},
		max_values = { priority = priority(), },
		max_diff = { priority = priority(), },
		max_balance_muls = {
			priority = priority(),
			divider = divider,
		},
		dmg_interval = {
			priority = priority(),
			items = items("dmg_interval"),
			divider = divider,
		},
		minigun_dozers = { priority = priority(), },
		captain_winters = { priority = priority(), },
		escapes = {
			priority = priority(),
			divider = divider,
		},
	})

	-- ASS's path\req\try_insert.lua
	local try_insert = ASS:require("try_insert", true)

	function ASS:add_hook(key, func)
		local id = key .. self._hook_suffix

		Hooks:AddHook( key, id, func )
	end

	function ASS:post_hook(object, func, post_call)
		local id = self._hook_prefix .. func

		Hooks:PostHook( object, func, id, post_call )
	end

	function ASS:mission_post_hook(element, func, id, post_call)
		local id = self._hook_prefix .. func .. "_" .. id

		Hooks:PostHook( element, func, id, post_call )
	end

	function ASS:pre_hook(object, func, pre_call)
		local id = self._hook_prefix .. func

		Hooks:PreHook( object, func, id, pre_call )
	end

	function ASS:mission_pre_hook(element, func, id, pre_call)
		local id = self._hook_prefix .. func .. "_" .. id

		Hooks:PreHook( element, func, id, pre_call )
	end

	function ASS:override(object, func, override)
		Hooks:OverrideFunction( object, func, override )
	end

	function ASS:_sh_not_found()
		self:log("error", "Streamlined Heisting not found!")

		self:add_hook( "MenuManagerOnOpenMenu", function()
			if self:global("showed_dialog") then
				return
			end

			local global = self:global()
			global.showed_dialog = true
			global.invalid_sh = true

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
					end,
				},
				{
					text = managers.localization:text("ass_menu_ignore"),
				},
			}
			QuickMenu:new(title, message, buttons, true)
		end )
	end

	function ASS:_sh_outdated()
		self:log("error", "Streamlined Heisting is out of date!")

		self:add_hook( "MenuManagerOnOpenMenu", function()
			if self:global("showed_dialog") then
				return
			end

			local global = self:global()
			global.showed_dialog = true
			global.invalid_sh = true

			local title = managers.localization:text("ass_menu_warning")
			local message = managers.localization:text("ass_menu_outdated_sh")
			local buttons = {
				{
					text = managers.localization:text("ass_menu_ignore"),
				},
			}
			QuickMenu:new(title, message, buttons, true)
		end )
	end

	local logged_zeal = false  -- fine to log on reload
	function ASS:_zeals_enabled()
		if not logged_zeal then
			logged_zeal = true

			self:log("warn", "ZEAL Level Mod enabled...")
		end

		local function show_zeal_dialog()
			if self:global("showed_dialog") then
				return
			end

			local global = self:global()
			global.showed_dialog = true
			global.zeals_enabled = true

			local title = managers.localization:text("ass_menu_warning")
			local message = managers.localization:text("ass_menu_zeal_matchmaking_locked")
			local buttons = {
				{
					text = managers.localization:text("ass_menu_ignore"),
					callback = function()
						self:require("networkmanager")
					end,
				},
			}
			QuickMenu:new(title, message, buttons, true)
		end

		if managers.localization then
			show_zeal_dialog()
		else
			self:add_hook( "MenuManagerOnOpenMenu", show_zeal_dialog )
		end
	end

	function ASS:_gsub(str)
		return self._values[str][self.settings[str]]:gsub("^ass_" .. str .. "_", "")
	end

	function ASS:_init_vars()
		local is_editor = Global.editor_mode or false
		local is_client = Network and Network:is_client() or false
		local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id or "no_level"
		local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id or "no_job"
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local level_mod = self:_gsub("level_mod") or "per_level"
		local redirect = {
			per_level = self.level_mod_map[level_id] or self.level_mod_map[job_id] or false,
			disable = false,
			random = { false, },
		}

		self._is_host = not is_editor and not is_client
		self._is_editor = is_editor
		self._is_client = is_client
		self._is_editor_or_client = not self._is_host
		self._assault_style = self:_gsub("assault_style") or "default"
		self._skill = tonumber((self:_gsub("skill"))) or 2
		self._dmg_interval = tonumber((self:_gsub("dmg_interval"))) or 0.25
		self._difficulty = difficulty
		self._real_difficulty_index = ({
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

		-- no zeal for random, not going to randomly activate a matchmaking lock
		for _, valid_id in ipairs({ "CS", "FBI", "CITY", }) do
			for _, lvl_mod in ipairs(self._values.level_mod) do
				local id = lvl_mod:gsub("^ass_level_mod_", "")

				if not id:match("ZEAL") and id:match(valid_id) then
					try_insert(redirect.random, id)
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
			self.been_there_fucked_that = not self:global("invalid_sh") and self:get_setting("is_massive")
		end

		if self._is_client then
			self:log("info", "Playing as client, most tweaks disabled...")
		end

		if self._is_editor then
			self:log("info", "Editor mode active, mission tweaks disabled...")
		end

		if self._level_mod and self._level_mod:match("ZEAL") then
			self:_zeals_enabled()
		end
	end

	function ASS:get_var(var)
		return self["_" .. var]
	end

	function ASS:get_tweak(tweak)
		local tweak_value = self._tweaks[tweak][self:get_var("skill")]

		if type(tweak_value) == "table" then
			return deep_clone(tweak_value)
		end

		return tweak_value
	end

	-- fetches scripting tweaks for the current level and instances (reusable miniature levels) within it if applicable
	function ASS:script_patches(typ)
		if self._script_patches[typ] == nil then
			self._script_patches[typ] = self:require(typ .. "_script/" .. self:get_var("clean_level_id")) or false
		end

		return self._script_patches[typ]
	end

	-- difficulty groupings to use when interpolation wont do the job
	-- Normal through VH are "normal", OVK+MH are "hard", DW+DS are "overkill"
	function ASS:difficulty_groups()
		local real_difficulty_index = self:get_var("real_difficulty_index")
		local normal = real_difficulty_index < 5
		local hard = real_difficulty_index < 7
		local overkill = not hard

		return normal, hard, overkill
	end

	ASS:add_hook( "LocalizationManagerPostInit", function(loc)
		loc:load_localization_file(ASS._loc_path .. "english.json")
	end )

	ASS:add_hook( "MenuManagerBuildCustomMenus", function(_, nodes)
		ASS.menu_builder:create_menu(nodes)
	end )

	-- blocks scripts from running if no streamlined heisting - must be installed, enabled, and from game start
	local sh = BLT.Mods:GetModByName("Streamlined Heisting")
	local no_sh = not sh or not sh:IsEnabled() or not sh:WasEnabledAtStart()
	local outdated_sh = sh and tonumber((sh:GetVersion():gsub("%.", ""))) < 480
	if no_sh or outdated_sh then
		ASS.been_there_fucked_that = false

		if outdated_sh then
			ASS:_sh_outdated()
		else
			ASS:_sh_not_found()
		end
	end

	ASS:_init_vars()

end


if not ASS.been_there_fucked_that then
	return
end


-- ASS's path\lua\RequiredScript name, the only time ASS:require checks in the lua folder
if RequiredScript and not ASS._require[RequiredScript] then
	ASS:require((RequiredScript:gsub(".+/(.+)", "%1")))
end
