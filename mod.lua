if not ASS then

	-- create persistent table used for save adjustment checks, SH checks, and ZEAL Level Mod checks
	Global.alarmingly_streamlined_spawngroups = Global.alarmingly_streamlined_spawngroups or {}
	Global.alarmingly_streamlined_spawngroups.picked_bob = nil

	local is_editor = Global.editor_mode or false
	local is_client = Network and Network:is_client() or false
	local is_host = not is_editor and not is_client
	local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id or "no_level"
	local job_id = Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id or "no_job"
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local real_difficulty_index = ({
		normal = 2,
		hard = 3,
		overkill = 4,
		overkill_145 = 5,
		easy_wish = 6,
		overkill_290 = 7,
		sm_wish = 8,
	})[difficulty] or 2

	-- extends the BLTMod instance, check PAYDAY 2\mods\base\req\BLTMod for base variables and methods
	ASS = ModInstance
	ASS._global = Global.alarmingly_streamlined_spawngroups
	ASS._mod_path = ASS:GetPath()
	ASS._req_path = ASS._mod_path .. "req/"
	ASS._lua_path = ASS._mod_path .. "lua/"
	ASS._loc_path = ASS._mod_path .. "loc/"
	ASS._hook_prefix = "ass_"
	ASS._hook_suffix = "AlarminglyStreamlinedSpawngroups"
	ASS._is_host = is_host
	ASS._is_editor = is_editor
	ASS._is_client = is_client
	ASS._is_editor_or_client = not is_host
	ASS._is_spawner = not is_host or ({
		modders_devmap = true,
		Enemy_Spawner = true,
	})[level_id]
	ASS._difficulty = difficulty
	ASS._real_difficulty_index = real_difficulty_index
	ASS._level_id = level_id
	ASS._clean_level_id = level_id
	ASS._job_id = job_id
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
		shield_arms = 1,  -- pick shield weapon type
		smg_units = true,  -- allow smg swats to spawn if applicable
		minigun_dozers = false,  -- allow assault-spawned minigun dozers on DW difficulty
		captain_winters = false,  -- allow captain winters to spawn on maps that have him
		gas_grenade_ignore_hostages = false,  -- whether hostages should be ignored for gas grenade eligiblity
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
		shield_arms = {
			"ass_shield_arms_default",  -- these are also pretty self-explanatory
			"ass_shield_arms_pistols",
			"ass_shield_arms_smgs",
			"ass_shield_arms_both",
		},
	}
	ASS._tweaks = {  -- skill-level dependent tweaks, appropriate value is fetched base on the number at the end of the current skill value (eg, hurt me plenty retrieves the 3rd value)
		force_pool_mul = { 1, 1, 1, 1.1, 1.5, 2, },  -- multiplier on the amount of cops that can spawn in a single assault
		sustain_duration_mul = { 0.9, 1, 1, 1.25, 2, 1250, },  -- multiplier on the duration of the "sustain" assault phase in holdout
		break_duration_mul = { 1.1, 1, 1, 0.85, 0.85, 0, },  -- multiplier on the length of assault delays and hostage hesitation delays
		special_limit_mul = { 1, 1, 1, 1.25, 2, 4, },  -- multiplier on special limits, final limits are rounded up
		grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0, },  -- multiplier on delays between uses of the same grenade type
		min_grenade_timeout = { 15, 13.5, 13.5, 12, 6, 3, },  -- delay between uses of any grenade
		no_grenade_push_delay = { 10, 8, 8, 6, 3, 0, },  -- delay before most groups will push when no grenade is available
		recon_force_mul = { 0.6, 0.8, 0.8, 1, 1, 1, },  -- recon force is expanded to assault force * recon_force_mul
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
		sustain_duration_muls = {  -- multipliers on the minimum and maximum durations of the "sustain" assault phase
			{ 1, 1, },
			{ 1, 1.15, },
			{ 1, 1.15, },
			{ 1.1, 1.4, },
			{ 1.7, 2.3, },
			{ 1250, 1250, },
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
			{ 2, 5, },
			{ 3, 5, },
			{ 3, 5, },
			{ 4, 6, },
			{ 8, 12, },
			{ 27, 27, },
		},
		skm_special_weights = {  -- special group weights in holdout, format { X, Y, Z, }, interpolates from X to Y to Z based on wave number
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
			{ 9, 12, },
			{ 9, 15, },
			{ 9, 15, },
			{ 15, 20, },
			{ 20, 30, },
			{ 60, 60, },
		},
		cs_grenade_chance_times = {  -- times for gas grenades to be allowed to replace smoke bombs under certain conditions, format { X, Y, }, interpolates from X (allowed) to Y (guaranteed) based on time spent in the same area
			{ 45, 90, },
			{ 30, 60, },
			{ 30, 60, },
			{ 20, 40, },
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

		-- custom heists
		["rusw"] = "FBI_overkill_145",  -- scorched earth, this and below are at https://modworkshop.net/mod/43578
		["rusd"] = "CS_FBI_overkill",  -- cold stones
		["ahop"] = "CS_FBI_overkill",  -- a house of pleasure
		["crimepunish"] = "FBI_overkill_145",  -- crime and punishment
		["flatline_nar"] = "CS_FBI_overkill",  -- flatline
		["Hunter_narrative"] = "FBI_overkill_145",  -- hunter and hunted
		["constantine_penthouse_nar"] = "CITY_overkill_290",  -- penthouse crasher
		["constantine_resort_nar"] = "CITY_overkill_290",  -- scarlett resort
		["Avalon's Shadow"] = "CITY_overkill_290",  -- avalon's shadow, https://modworkshop.net/mod/34760
		["physics"] = "CITY_overkill_290",  -- boworks, https://modworkshop.net/mod/31560
		["physics_citystreets"] = "CS_normal",  -- boworks day 1
		["physics_tower"] = "FBI_overkill_145",  -- boworks day 2
		["physics_core"] = "CITY_overkill_290",  -- boworks day 3
	}

	function ASS:get_var(var)
		return self["_" .. var]
	end

	function ASS:log(prefix, str, ...)
		local base_str = ("[ASS:%s|%s:%s] "):format(tostring(prefix):upper(), level_id, difficulty)

		log(base_str .. tostring(str):format(...))
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

	-- deprecated functions, still define them
	ASS:require("deprecated")

	-- ASS's path\req\try_insert.lua
	local try_insert = ASS:require("try_insert", true)
	local check_clone = ASS:require("check_clone", true)

	function ASS:global()
		return self._global
	end

	function ASS:get_setting(setting, default)
		if default then
			return self.default_settings[setting]
		end

		return self.settings[setting]
	end

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

		shield_arms = {
			priority = priority(),
			items = items("shield_arms"),
		},
		smg_units = { priority = priority(), },
		minigun_dozers = { priority = priority(), },
		captain_winters = {
			priority = priority(),
			divider = divider,
		},

		gas_grenade_ignore_hostages = { priority = priority(), },
		escapes = {
			priority = priority(),
			divider = divider,
		},
	})

	function ASS:add_hook(key, func)
		local id = key .. self._hook_suffix

		Hooks:AddHook( key, id, func )
	end

	function ASS:post_hook(object, func, post_call)
		local id = self._hook_prefix .. func

		Hooks:PostHook( object, func, id, post_call )
	end

	function ASS:pre_hook(object, func, pre_call)
		local id = self._hook_prefix .. func

		Hooks:PreHook( object, func, id, pre_call )
	end

	function ASS:override(object, func, override, use_hooks)
		object[func .. "_original"] = object[func]

		if use_hooks ~= false then
			Hooks:OverrideFunction( object, func, override )
		else
			object[func] = override
		end
	end

	local messages = {
		zeals_enabled = function(self)
			local global = self:global()

			local function show_zeal_dialog()
				if global.showed_dialog then
					return
				end

				self:log("warn", "ZEAL Level Mod enabled...")

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
		end,
		sh_not_found = function(self)
			self.been_there_fucked_that = false

			local global = self:global()
			self:add_hook( "MenuManagerOnOpenMenu", function()
				if global.showed_dialog then
					return
				end

				self:log("error", "Streamlined Heisting not found!")

				global.showed_dialog = true
				global.invalid_sh = "missing"

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
		end,
		sh_outdated = function(self)
			self.been_there_fucked_that = false

			local global = self:global()
			self:add_hook( "MenuManagerOnOpenMenu", function()
				if global.showed_dialog then
					return
				end

				self:log("error", "Streamlined Heisting is out of date!")

				global.showed_dialog = true
				global.invalid_sh = "outdated"

				local title = managers.localization:text("ass_menu_warning")
				local message = managers.localization:text("ass_menu_outdated_sh")
				local buttons = {
					{
						text = managers.localization:text("ass_menu_ignore"),
					},
				}
				QuickMenu:new(title, message, buttons, true)
			end )
		end,
	}
	function ASS:message(msg)
		msg = tostring(msg)

		if messages and messages[msg] then
			messages[msg](self)
		else
			self:log("error", "Invalid msg %s in ASS:message", msg)
		end
	end

	function ASS:_gsub(setting)
		setting = tostring(setting)

		local value = self._values[setting]
		local str = value and value[self.settings[setting]]
		if str then
			return str:gsub("^ass_" .. setting .. "_", "")
		end

		self:log("error", "Setting %s has invalid data in ASS:_gsub", setting)
	end

	function ASS:init_vars()
		local level_mod = self:_gsub("level_mod") or "per_level"
		local redirect = {
			per_level = self.level_mod_map[level_id] or self.level_mod_map[job_id] or false,
			disable = false,
			random = { false, },
		}

		self._assault_style = not is_editor and self:_gsub("assault_style") or "default"
		self._skill = tonumber((self:_gsub("skill"))) or 2
		self._dmg_interval = tonumber((self:_gsub("dmg_interval"))) or 0.25
		self._difficulty_index = self:get_setting("max_values") and 8 or real_difficulty_index
		self._shield_arms = self:_gsub("shield_arms") or "default"

		for _, end_pattern in pairs({ "_night$", "_day$", "_skip1$", "_skip2$", "_new$", "_combat$", }) do
			self._clean_level_id = self._clean_level_id:gsub(end_pattern, "")
		end

		-- no zeal for random, not going to randomly activate a matchmaking lock
		for _, valid_id in pairs({ "CS", "FBI", "CITY", }) do
			for i = 1, #self._values.level_mod do
				local lvl_mod = self._values.level_mod[i]
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

		if self:global().invalid_sh then
			self.been_there_fucked_that = false
		else
			if self.been_there_fucked_that == nil then
				self.been_there_fucked_that = self:get_setting("is_massive")
			end

			if is_client then
				self:log("info", "Playing as client, most tweaks disabled...")
			end

			if is_editor then
				self:log("info", "Editor mode active, mission tweaks disabled and using Default Streamlined groups...")
			end

			if tostring(self._level_mod):match("ZEAL") then
				self:message("zeals_enabled")
			end
		end
	end

	function ASS:get_tweak(tweak)
		return check_clone(self._tweaks[tweak][self:get_var("skill")])
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
		local normal = real_difficulty_index < 5 and "normal" or nil
		local hard = not normal and real_difficulty_index < 7 and "hard" or nil
		local overkill = not normal and not hard and "overkill" or nil

		return normal and true, hard and true, overkill and true, normal or hard or overkill
	end

	ASS:add_hook( "LocalizationManagerPostInit", function(loc)
		loc:load_localization_file(ASS._loc_path .. "english.json")
	end )

	ASS:add_hook( "MenuManagerBuildCustomMenus", function(_, nodes)
		ASS.menu_builder:create_menu(nodes)
	end )

	-- blocks scripts from running if no streamlined heisting - must be installed, enabled, and from game start
	local sh = BLT.Mods:GetModByName("Streamlined Heisting")
	local no_sh = (not sh or not sh:IsEnabled() or not sh:WasEnabledAtStart()) and "sh_not_found"
	local outdated_sh = ((sh and (tonumber((sh:GetVersion():gsub("%.", "")))) or 0) < 484) and "sh_outdated"
	local shutdown_msg = no_sh or outdated_sh or false

	if shutdown_msg then
		ASS:message(shutdown_msg)
	end

	ASS:init_vars()

end


if not ASS.been_there_fucked_that then
	return
end


-- ASS's path\lua\RequiredScript name, the only time ASS:require checks in the lua folder
if RequiredScript and not ASS._require[RequiredScript] then
	ASS:require((RequiredScript:gsub(".+/(.+)", "%1")))
end
