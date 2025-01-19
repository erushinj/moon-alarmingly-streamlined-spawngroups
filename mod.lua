if not ASS then
	local load_level = Global.load_level
	local game_settings = Global.game_settings or {}
	local level_data = Global.level_data or {}
	local job_manager = Global.job_manager or {}
	local is_editor = Global.editor_mode or false
	local is_client = Network and Network:is_client() or false
	local is_host = not is_editor and not is_client
	local level_id = load_level and (level_data.level_id or game_settings.level_id) or "no_level"
	local job_id = load_level and (job_manager.current_job and job_manager.current_job.job_id) or "no_job"
	local one_down = game_settings.one_down or false
	local difficulty = game_settings.difficulty or "normal"
	local real_difficulty_index = ({
		normal = 2,
		hard = 3,
		overkill = 4,
		overkill_145 = 5,
		easy_wish = 6,
		overkill_290 = 7,
		sm_wish = 8,
	})[difficulty] or 2

	local clean_level_id = level_id
	for _, end_pattern in pairs({ "_night$", "_day$", "_skip1$", "_skip2$", "_new$", }) do
		clean_level_id = clean_level_id:gsub(end_pattern, "")
	end

	-- create persistent table used for SH checks and ZEAL Level Mod checks
	Global.alarmingly_streamlined_spawngroups = Global.alarmingly_streamlined_spawngroups or {}

	-- extends the BLTMod instance, check PAYDAY 2\mods\base\req\BLTMod for base variables and methods
	ASS = ModInstance
	ASS.global = Global.alarmingly_streamlined_spawngroups
	ASS.is_host = is_host
	ASS.is_editor = is_editor
	ASS.is_client = is_client
	ASS.is_editor_or_client = not is_host
	ASS.is_spawner = not is_host or ({
		modders_devmap = true,
		Enemy_Spawner = true,
	})[level_id]
	ASS.one_down = one_down
	ASS.difficulty = difficulty
	ASS.real_difficulty_index = real_difficulty_index
	ASS.level_id = level_id
	ASS.clean_level_id = clean_level_id
	ASS.job_id = job_id
	ASS.required = {}
	ASS.settings = {
		is_massive = true,  -- whether the mod is enabled or not
		level_mod = 3,  -- index into ASS.values.level_mod
		assault_style = 1,  -- index into ASS.values.assault_style
		skill = 2,  -- index into ASS.values.skill
		doms_scale = false,  -- whether to make dominations harder on higher difficulties
		doms_all_hard = false,  -- whether to make all dominatable enemies use hardest preset
		doms_super_serious = false,  -- whether to allow dominations during assault
		max_values = false,  -- whether to use death sentence values for scaling
		max_diff = false,  -- whether to force hardest assaults
		max_balance_muls = false,  -- whether to force full crew spawns
		unit_weapons = {  -- pick weapon type used by certain units
			shield_arms = 2,  -- pick shield weapon type
			taser_dazers = 3,  -- pick taser weapon type
			cloaker_balance = 4,  -- pick cloaker weapon type
			medic_ordnance = 4,  -- pick rifle medic weapon type
			medical_ordinance = 4,  -- pick shotgun medic weapon type
			geneva_suggestion = 4,  -- pick medic dozer weapon type
			police_rifle_funding = 2,  -- pick whether a pistol and/or rifle hrt should exist
			police_shotgun_funding = 2,  -- pick whether a shotgun and/or revolver hrt should exist
		},
		dozer_rainbow = {  -- allow given dozer varieties to spawn on lower difficulties than normal
			dozer_1 = 1,  -- for each of these, add 1 to find the default difficulty index (easy is missing)
			dozer_2 = 3,
			dozer_3 = 5,
			dozer_4 = 7,
			dozer_5 = 7,
		},
		captain_winters = false,  -- allow captain winters to spawn on maps that have him
		gas_grenade_ignore_hostages = false,  -- whether hostages should be ignored for gas grenade eligiblity
		escapes = false,  -- allow escapes to occur on maps that have them
	}
	ASS.values = {
		level_mod = {
			"alarmingly_streamlined_spawngroups_level_mod_disable",  -- dont change units
			"alarmingly_streamlined_spawngroups_level_mod_random",  -- pick any available level mod value (besides zeal)
			"alarmingly_streamlined_spawngroups_level_mod_per_level",  -- depends on level/full job id
			"alarmingly_streamlined_spawngroups_level_mod_CS_normal",  -- swat
			"alarmingly_streamlined_spawngroups_level_mod_CS_FBI_overkill",  -- swat-fbi
			"alarmingly_streamlined_spawngroups_level_mod_FBI_overkill_145",  -- fbi
			"alarmingly_streamlined_spawngroups_level_mod_FBI_CITY_easy_wish",  -- fbi-gensec
			"alarmingly_streamlined_spawngroups_level_mod_CITY_overkill_290",  -- gensec
			"alarmingly_streamlined_spawngroups_level_mod_CITY_ZEAL_awesome_difficulty_name",  -- gensec-zeal
			"alarmingly_streamlined_spawngroups_level_mod_ZEAL_sm_wish",  -- zeal
		},
		assault_style = {
			"alarmingly_streamlined_spawngroups_assault_style_original",  -- pre-housewarming-styled
			"alarmingly_streamlined_spawngroups_assault_style_streamlined",  -- spicier streamlined groups
			"alarmingly_streamlined_spawngroups_assault_style_default",  -- default streamlined groups
			"alarmingly_streamlined_spawngroups_assault_style_chicken_plate",  -- PDTH-styled spawns
		},
		skill = {
			"alarmingly_streamlined_spawngroups_skill_1",  -- im too young to die
			"alarmingly_streamlined_spawngroups_skill_2",  -- hey, not too rough
			"alarmingly_streamlined_spawngroups_skill_3",  -- hurt me plenty
			"alarmingly_streamlined_spawngroups_skill_4",  -- ultra-violence
			"alarmingly_streamlined_spawngroups_skill_5",  -- nightmare
			"alarmingly_streamlined_spawngroups_skill_6",  -- ultra-nightmare
		},
		shield_arms = {
			"alarmingly_streamlined_spawngroups_shield_arms_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_shield_arms_pistols",  -- always pistols
			"alarmingly_streamlined_spawngroups_shield_arms_smgs",  -- always smgs
			"alarmingly_streamlined_spawngroups_shield_arms_both",  -- randomize between both
		},
		taser_dazers = {
			"alarmingly_streamlined_spawngroups_taser_dazers_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_taser_dazers_rifles",  -- always rifles
			"alarmingly_streamlined_spawngroups_taser_dazers_sko12s",  -- always sko12s
			"alarmingly_streamlined_spawngroups_taser_dazers_both",  -- randomize between both
		},
		cloaker_balance = {
			"alarmingly_streamlined_spawngroups_cloaker_balance_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_cloaker_balance_smgs",  -- always smgs
			"alarmingly_streamlined_spawngroups_cloaker_balance_pistols",  -- always pistols
			"alarmingly_streamlined_spawngroups_cloaker_balance_both",  -- randomize between both
		},
		medic_ordnance = {  -- rifle medics
			"alarmingly_streamlined_spawngroups_medic_ordnance_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_medic_ordnance_rifles",  -- always rifles
			"alarmingly_streamlined_spawngroups_medic_ordnance_revolvers",  -- always revolvers
			"alarmingly_streamlined_spawngroups_medic_ordnance_both",  -- randomize between both
		},
		medical_ordinance = {  -- shotgun medics
			"alarmingly_streamlined_spawngroups_medical_ordinance_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_medical_ordinance_shotguns",  -- always pump shotguns
			"alarmingly_streamlined_spawngroups_medical_ordinance_saigas",  -- always saigas
			"alarmingly_streamlined_spawngroups_medical_ordinance_both",  -- randomize between both
		},
		geneva_suggestion = {  -- medic dozers
			"alarmingly_streamlined_spawngroups_geneva_suggestion_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_geneva_suggestion_rifles",  -- always rifles
			"alarmingly_streamlined_spawngroups_geneva_suggestion_sawed_offs",  -- always sawed-off shotguns
			"alarmingly_streamlined_spawngroups_geneva_suggestion_both",  -- randomize between both
		},
		police_rifle_funding = {  -- rifle hrts
			"alarmingly_streamlined_spawngroups_police_rifle_funding_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_police_rifle_funding_pistols",  -- always pistols
			"alarmingly_streamlined_spawngroups_police_rifle_funding_rifles",  -- always rifles
			"alarmingly_streamlined_spawngroups_police_rifle_funding_both",  -- randomize between both
		},
		police_shotgun_funding = {  -- shotgun hrts
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_default",  -- what the mod normally uses
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_shotguns",  -- always shotguns
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_revolvers",  -- always revolvers
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_both",  -- randomize between both
		},
	}

	local divider = 16
	local last_priority = 696970
	local function priority()
		last_priority = last_priority - 1

		return last_priority
	end

	ASS.menu_builder_params = {
		is_massive = {
			priority = priority(),
			divider = divider,
		},

		level_mod = {
			priority = priority(),
			items = ASS.values.level_mod,
		},
		assault_style = {
			priority = priority(),
			items = ASS.values.assault_style,
		},
		skill = {
			priority = priority(),
			items = ASS.values.skill,
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

		gas_grenade_ignore_hostages = { priority = priority(), },
		escapes = { priority = priority(), },
		captain_winters = {
			priority = priority(),
			divider = divider,
		},

		unit_weapons = { priority = priority(), },
		shield_arms = {
			priority = priority(),
			items = ASS.values.shield_arms,
		},
		taser_dazers = {
			priority = priority(),
			items = ASS.values.taser_dazers,
		},
		cloaker_balance = {
			priority = priority(),
			items = ASS.values.cloaker_balance,
		},
		medic_ordnance = {
			priority = priority(),
			items = ASS.values.medic_ordnance,
		},
		medical_ordinance = {
			priority = priority(),
			items = ASS.values.medical_ordinance,
		},
		geneva_suggestion = {
			priority = priority(),
			items = ASS.values.geneva_suggestion,
		},
		police_rifle_funding = {
			priority = priority(),
			items = ASS.values.police_rifle_funding,
		},
		police_shotgun_funding = {
			priority = priority(),
			items = ASS.values.police_shotgun_funding,
			divider = divider,
		},

		dozer_rainbow = {
			priority = priority(),
			divider = divider,
		},
		dozer_1 = {
			priority = priority(),
			disabled = true,
			items = {
				"menu_difficulty_normal",
			},
		},
		dozer_2 = {
			priority = priority(),
			items = {
				"menu_difficulty_normal",
				"menu_difficulty_hard",
				"menu_difficulty_very_hard",
			},
		},
		dozer_3 = {
			priority = priority(),
			items = {
				"menu_difficulty_normal",
				"menu_difficulty_hard",
				"menu_difficulty_very_hard",
				"menu_difficulty_overkill",
				"menu_difficulty_easy_wish",
			},
		},
		dozer_4 = {
			priority = priority(),
			items = {
				"menu_difficulty_normal",
				"menu_difficulty_hard",
				"menu_difficulty_very_hard",
				"menu_difficulty_overkill",
				"menu_difficulty_easy_wish",
				"menu_difficulty_apocalypse",
				"menu_difficulty_sm_wish",
			},
		},
		dozer_5 = {
			priority = priority(),
			items = {
				"menu_difficulty_normal",
				"menu_difficulty_hard",
				"menu_difficulty_very_hard",
				"menu_difficulty_overkill",
				"menu_difficulty_easy_wish",
				"menu_difficulty_apocalypse",
				"menu_difficulty_sm_wish",
			},
		},
	}
	ASS.tweaks = {  -- skill-level dependent tweaks, appropriate value is fetched based on the number at the end of the current skill value (eg, hurt me plenty retrieves the 3rd value)
		force_pool_mul = { 1, 1, 1, 1.1, 1.5, 2, },  -- multiplier on the amount of cops that can spawn in a single assault
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
			{ 10, 20, 30, },
			{ 10, 15, 20, },
			{ 10, 15, 20, },
			{ 10, 12.5, 15, },
			{ 1, 3, 5, },
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
		hox = "FBI_overkill_145",  -- hoxton breakout
		hox_3 = "FBI_overkill_145",  -- hoxton revenge
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
		cane = "CS_normal",  -- santas workshop
		pbr = "CS_normal",  -- beneath the mountain
		pbr2 = "FBI_overkill_145",  -- birth of sky
		peta = "CS_FBI_overkill",  -- goat simulator (day 1)
		peta2 = "FBI_overkill_145",  -- goat simulator day 2 override
		pal = "CS_normal",  -- counterfeit
		man = "FBI_overkill_145",  -- undercover
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
		roberts = "CS_normal",  -- go bank

		-- custom heists
		["branchbank_russia"] = "CS_FBI_overkill",  -- bank heist russia, https://modworkshop.net/mod/30389
		["rusw"] = "FBI_overkill_145",  -- scorched earth, this and below are at https://modworkshop.net/mod/43578
		["rusd"] = "CS_FBI_overkill",  -- cold stones
		["ahop"] = "CS_FBI_overkill",  -- a house of pleasure
		["crimepunish"] = "FBI_overkill_145",  -- crime and punishment
		["flatline_nar"] = "CS_FBI_overkill",  -- flatline
		["Hunter_narrative"] = "FBI_overkill_145",  -- hunter and hunted
		["constantine_penthouse_nar"] = "CITY_overkill_290",  -- penthouse crasher
		["constantine_resort_nar"] = "CITY_overkill_290",  -- scarlett resort
		["Avalon's Shadow"] = "CITY_overkill_290",  -- avalon's shadow, https://modworkshop.net/mod/34760
		["thechase"] = "CS_FBI_overkill",  -- stalk fraud, https://modworkshop.net/mod/24638
		["physics"] = "CITY_overkill_290",  -- boworks, https://modworkshop.net/mod/31560
		["physics_citystreets"] = "CS_normal",  -- boworks day 1
		["physics_tower"] = "FBI_overkill_145",  -- boworks day 2
		["physics_core"] = "CITY_overkill_290",  -- boworks day 3
		["narr_friday"] = "FBI_CITY_easy_wish",  -- crashing capitol, https://modworkshop.net/mod/44630
		["bnktower"] = "CITY_overkill_290",  -- gensec hive, https://modworkshop.net/mod/36368
	}

	-- versatile script loader
	-- loads + caches file at specified path as a function and executes it
	function ASS:require(path, ...)
		if self.required[path] == nil then
			self.required[path] = blt.vm.loadfile(self.path .. path .. ".lua") or false
		end

		return self.required[path] and self.required[path](...)
	end

	ASS.utils = ASS:require("req/utils")
	ASS.menu_builder = ASS:require("req/hoplib_menu_builder", "alarmingly_streamlined_spawngroups", ASS.settings, ASS.menu_builder_params)
	ASS.message = ASS:require("req/message")

	function ASS:log(prefix, str, ...)
		local base_str = ("[ASS:%s|%s:%s] "):format(tostring(prefix):upper(), level_id, difficulty)

		log(base_str .. tostring(str):format(...))
	end

	-- fetches scripting tweaks for the current level and instances (reusable miniature levels) within it if applicable
	local patch_redirect = {
		mission = {
			branchbank = "firestarter_3",
			branchbank_russia = "firestarter_3",
			jewelry_store = "ukrainian_job",
		},
		instance = {
			constantine_fiesta_lvl = "constantine_jungle_lvl",
			constantine_yacht_lvl = "constantine_jungle_lvl",
			constantine_cart_con_lvl = "constantine_cart_dwn_lvl",
			hunter_departure = "hunter_party",
		},
	}
	function ASS:script_patches(typ)
		local file_name = patch_redirect[typ] and patch_redirect[typ][clean_level_id] or clean_level_id

		return self:require("req/" .. typ .. "_script/" .. file_name)
	end

	-- blocks scripts from running if no streamlined heisting - must be installed, enabled, and from game start
	local sh = BLT.Mods:GetModByName("Streamlined Heisting")
	if not sh then
		ASS:message("sh_not_found")
	else
		local sh_enabled = sh:WasEnabledAtStart() and sh:IsEnabled()

		if not sh_enabled then
			ASS:message("sh_disabled")
		else
			local sh_version = tostring(sh:GetVersion())
			sh_version = sh_version:gsub("%.", "")
			sh_version = tonumber(sh_version) or 0

			if sh_version < 488 then
				ASS:message("sh_outdated")
			end
		end
	end

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
		local result = str and str:gsub("^alarmingly_streamlined_spawngroups_" .. last .. "_", "") or nil
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
		per_level = ASS.level_mod_map[level_id] or ASS.level_mod_map[job_id] or difficulty,
		disable = difficulty,
		random = table.random({  -- no zeal for random below ds, not going to randomly activate a matchmaking lock
			"CS_normal",
			"CS_FBI_overkill",
			"FBI_overkill_145",
			"FBI_CITY_easy_wish",
			"CITY_overkill_290",
			difficulty,
		}),
	}

	ASS.assault_style = is_editor and "editor" or ass_gsub("default", "assault_style")
	ASS.skill = ass_gsub(2, "skill")
	ASS.difficulty_index = ASS.settings.max_values and 8 or real_difficulty_index
	ASS.smg_units = ass_gsub("both", "smg_units")
	ASS.wanted_enemy_weapon_tweaks = {
		shield = ass_gsub("both", "unit_weapons", "shield_arms"),
		taser = ass_gsub("default", "unit_weapons", "taser_dazers"),
		cloaker = ass_gsub("default", "unit_weapons", "cloaker_balance"),
		medic_rifle = ass_gsub("default", "unit_weapons", "medic_ordnance"),
		medic_shotgun = ass_gsub("default", "unit_weapons", "medical_ordinance"),
		medic_dozer = ass_gsub("default", "unit_weapons", "geneva_suggestion"),
		pistol_rifle_hrts = ass_gsub("default", "unit_weapons", "police_rifle_funding"),
		shotgun_revolver_hrts = ass_gsub("default", "unit_weapons", "police_shotgun_funding"),
	}

	local function get_dozer_rainbow_type(typ, default)
		local val = ASS.settings.dozer_rainbow[typ]

		if tonumber(val) then
			return val + 1  -- account for easy being missing
		end

		return default
	end
	ASS.dozer_rainbow = {
		dozer_1 = get_dozer_rainbow_type("dozer_1", 2),  -- not actually used, always present
		dozer_2 = get_dozer_rainbow_type("dozer_2", 4),
		dozer_3 = get_dozer_rainbow_type("dozer_3", 6),
		dozer_4 = get_dozer_rainbow_type("dozer_4", 8),
		dozer_5 = get_dozer_rainbow_type("dozer_5", 8),
	}

	for name, tweaks in pairs(ASS.tweaks) do
		ASS.tweaks[name] = tweaks[ASS.skill] or tweaks[2]
	end

	if redirect[level_mod] ~= nil then
		ASS.level_mod = redirect[level_mod]
	else
		ASS.level_mod = level_mod
	end

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
				ASS:message("zeals_enabled")
			end
		end
	end

	ASS.level_mod = level_mod_to_difficulty[ASS.level_mod] or difficulty

	ASS:message("on_init")
end

if ASS.been_there_fucked_that and RequiredScript and not ASS.required[RequiredScript] then
	ASS:require("lua/" .. (RequiredScript:gsub(".+/(.+)", "%1")))
end
