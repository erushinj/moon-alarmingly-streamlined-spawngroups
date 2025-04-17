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

	-- Create persistent table used for SH checks and ZEAL Level Mod checks
	Global.alarmingly_streamlined_spawngroups = Global.alarmingly_streamlined_spawngroups or {}

	-- Extends the BLTMod instance, check PAYDAY 2\mods\base\req\BLTMod for base variables and methods
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
		is_massive = true,  -- Whether the mod is enabled or not
		level_mod = 3,  -- Index into ASS.values.level_mod
		assault_style = 1,  -- Index into ASS.values.assault_style
		skill = 2,  -- Index into ASS.values.skill
		pro_job = false,
		doms_scale = false,  -- Whether to make dominations harder on higher difficulties
		doms_all_hard = false,  -- Whether to make all dominatable enemies use hardest preset
		doms_super_serious = false,  -- Whether to allow dominations during assault
		max_values = false,  -- Whether to use death sentence values for scaling
		max_diff = false,  -- Whether to force hardest assaults
		max_balance_muls = false,  -- Whether to force full crew spawns
		unit_weapons = {  -- Pick weapon type used by certain units
			shield_arms = 2,  -- Pick Shield weapon type
			taser_dazers = 3,  -- Pick Taser weapon type
			cloaker_balance = 4,  -- Pick Cloaker weapon type
			medic_ordnance = 3,  -- Pick rifle Medic weapon type
			medical_ordinance = 3,  -- Pick shotgun Medic weapon type
			geneva_suggestion = 4,  -- Pick Medicdozer weapon type
			police_rifle_funding = 2,  -- Pick rifle HRT weapon type
			police_shotgun_funding = 2,  -- Pick shotgun HRT weapon type
		},
		dozer_rainbow = {  -- Allow given Dozer varieties to spawn on lower difficulties than normal
			dozer_1 = 1,  -- For each of these, add 1 to find the default difficulty index (Easy is missing)
			dozer_2 = 3,
			dozer_3 = 5,
			dozer_4 = 7,
			dozer_5 = 7,
		},
		captain_winters = false,  -- Allow Captain Winters to spawn on maps that have him
		gas_grenade_ignore_hostages = false,  -- Whether hostages should be ignored for gas grenade eligiblity
		escapes = false,  -- Allow escapes to occur on maps that have them
	}
	ASS.values = {
		level_mod = {
			"alarmingly_streamlined_spawngroups_level_mod_disable",  -- Use difficulty scaling like vanilla
			"alarmingly_streamlined_spawngroups_level_mod_random",  -- Pick any available Level Mod value (besides zeal)
			"alarmingly_streamlined_spawngroups_level_mod_per_level",  -- Depends on level/full job ID
			"alarmingly_streamlined_spawngroups_level_mod_CS_normal",  -- SWAT
			"alarmingly_streamlined_spawngroups_level_mod_CS_FBI_overkill",  -- SWAT-FBI
			"alarmingly_streamlined_spawngroups_level_mod_FBI_overkill_145",  -- FBI
			"alarmingly_streamlined_spawngroups_level_mod_FBI_CITY_easy_wish",  -- FBI-GenSec
			"alarmingly_streamlined_spawngroups_level_mod_CITY_overkill_290",  -- GenSec
			"alarmingly_streamlined_spawngroups_level_mod_CITY_ZEAL_awesome_difficulty_name",  -- GenSec-ZEAL
			"alarmingly_streamlined_spawngroups_level_mod_ZEAL_sm_wish",  -- ZEAL
		},
		assault_style = {
			"alarmingly_streamlined_spawngroups_assault_style_original",  -- Pre-Housewarming style
			"alarmingly_streamlined_spawngroups_assault_style_streamlined",  -- Spicier SH groups
			"alarmingly_streamlined_spawngroups_assault_style_default",  -- Default SH groups
			"alarmingly_streamlined_spawngroups_assault_style_chicken_plate",  -- PD3 style, somewhat
		},
		skill = {
			"alarmingly_streamlined_spawngroups_skill_1",  -- I'm Too Young To Die
			"alarmingly_streamlined_spawngroups_skill_2",  -- Hey, Not Too Rough
			"alarmingly_streamlined_spawngroups_skill_3",  -- Hurt Me Plenty
			"alarmingly_streamlined_spawngroups_skill_4",  -- Ultra-Violence
			"alarmingly_streamlined_spawngroups_skill_5",  -- Nightmare!
			"alarmingly_streamlined_spawngroups_skill_6",  -- Ultra-Nightmare!!
		},
		shield_arms = {
			"alarmingly_streamlined_spawngroups_shield_arms_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_shield_arms_pistols",  -- Always pistols
			"alarmingly_streamlined_spawngroups_shield_arms_smgs",  -- Always SMGs
			"alarmingly_streamlined_spawngroups_shield_arms_both",  -- Randomize between both pistols and SMGs
		},
		taser_dazers = {
			"alarmingly_streamlined_spawngroups_taser_dazers_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_taser_dazers_rifles",  -- Always rifles
			"alarmingly_streamlined_spawngroups_taser_dazers_sko12s",  -- Always concussive VD-12s
			"alarmingly_streamlined_spawngroups_taser_dazers_both",  -- Randomize between both rifles and concussive VD-12s
		},
		cloaker_balance = {
			"alarmingly_streamlined_spawngroups_cloaker_balance_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_cloaker_balance_smgs",  -- Always SMGs
			"alarmingly_streamlined_spawngroups_cloaker_balance_pistols",  -- Always pistols
			"alarmingly_streamlined_spawngroups_cloaker_balance_both",  -- Randomize between both SMGs and pistols
		},
		medic_ordnance = {  -- Rifle Medics
			"alarmingly_streamlined_spawngroups_medic_ordnance_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_medic_ordnance_rifles",  -- Always rifles
			"alarmingly_streamlined_spawngroups_medic_ordnance_deagles",  -- Always Deagles
			"alarmingly_streamlined_spawngroups_medic_ordnance_both",  -- Randomize between both rifles and Deagles
		},
		medical_ordinance = {  -- Shotgun Medics
			"alarmingly_streamlined_spawngroups_medical_ordinance_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_medical_ordinance_shotguns",  -- Always pump shotguns
			"alarmingly_streamlined_spawngroups_medical_ordinance_saigas",  -- Always IZHMAs
			"alarmingly_streamlined_spawngroups_medical_ordinance_both",  -- Randomize between both pump shotguns and IZHMAs
		},
		geneva_suggestion = {  -- Medicdozers
			"alarmingly_streamlined_spawngroups_geneva_suggestion_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_geneva_suggestion_rifles",  -- Always rifles
			"alarmingly_streamlined_spawngroups_geneva_suggestion_sawed_offs",  -- Always sawed-off shotguns
			"alarmingly_streamlined_spawngroups_geneva_suggestion_both",  -- Randomize between both rifles and sawed-off shotguns
		},
		police_rifle_funding = {  -- Rifle HRTs
			"alarmingly_streamlined_spawngroups_police_rifle_funding_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_police_rifle_funding_pistols",  -- Always pistols
			"alarmingly_streamlined_spawngroups_police_rifle_funding_rifles",  -- Always rifles
			"alarmingly_streamlined_spawngroups_police_rifle_funding_both",  -- Randomize between both pistols and rifles
		},
		police_shotgun_funding = {  -- Shotgun HRTs
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_default",  -- Similar to vanilla/default SH
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_shotguns",  -- Always shotguns
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_revolvers",  -- Always revolvers
			"alarmingly_streamlined_spawngroups_police_shotgun_funding_both",  -- Randomize between both shotguns and revolvers
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
		},
		pro_job = {
			priority = priority(),
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
	ASS.tweaks = {  -- Skill Level-dependent tweaks, appropriate value is fetched based on the number at the end of the current skill value (eg, Hurt Me Plenty retrieves the 3rd value)
		force_pool_mul = { 1, 1, 1, 1.1, 1.5, 2, },  -- Multiplier on the amount of cops that can spawn in a single assault
		break_duration_mul = { 1.1, 1, 1, 0.85, 0.85, 0, },  -- Multiplier on the length of assault delays and hostage hesitation delays
		special_limit_mul = { 1, 1, 1, 1.25, 2, 4, },  -- Multiplier on special limits, final limits are rounded up
		grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0, },  -- Multiplier on delays between uses of the same grenade type
		min_grenade_timeout = { 15, 13.5, 13.5, 12, 6, 3, },  -- Delay between uses of any grenade
		no_grenade_push_delay = { 10, 8, 8, 6, 3, 0, },  -- Delay before most groups will push when no grenade is available
		recon_force_mul = { 0.6, 0.8, 0.8, 1, 1, 1, },  -- Recon force is expanded to assault force * recon_force_mul
		recon_interval_variation_mul = { 1, 1, 1, 0.75, 0.25, 0, },
		freq_base = {  -- Enemy frequencies in spawn groups, format { X, Y, }, interpolates from X on Normal to Y on DS
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
		sustain_duration_muls = {  -- Multipliers on the minimum and maximum durations of the "sustain" assault phase
			{ 1, 1, },
			{ 1, 1.15, },
			{ 1, 1.15, },
			{ 1.1, 1.4, },
			{ 1.7, 2.3, },
			{ 1250, 1250, },
		},
		spawn_cooldowns = {  -- Multipliers on cooldowns between spawns, format { X, Y, }, interpolates from X on Normal to Y on DS
			{ 2.2, 1.1, },
			{ 2, 1, },
			{ 2, 1, },
			{ 1.5, 0.75, },
			{ 0.5, 0.25, },
			{ 0, 0, },
		},
		special_weight_base = {  -- Used to calculate special group weights in normal play, format { X, Y, }, interpolates from X on Normal to Y on DS
			{ 2, 5, },
			{ 3, 5, },
			{ 3, 5, },
			{ 4, 6, },
			{ 8, 12, },
			{ 27, 27, },
		},
		skm_special_weights = {  -- Special group weights in Holdout, format { X, Y, Z, }, interpolates from X to Y to Z based on wave number
			{ 2, 4, 6, },
			{ 4, 5, 6, },
			{ 4, 5, 6, },
			{ 5, 6.25, 7.5, },
			{ 9, 12, 15, },
			{ 21, 24, 27, },
		},
		reenforce_interval = {  -- Delay between enemy groups being dispatched specifically to hold selected locations on the map, this delay is shortened the more groups are needed
			{ 10, 20, 30, },
			{ 10, 15, 20, },
			{ 10, 15, 20, },
			{ 10, 12.5, 15, },
			{ 1, 3, 5, },
			{ 0, 0, 0, },
		},
		smoke_grenade_lifetime = {  -- Self-explanatory, format { X, Y, }, interpolates from X on Normal to Y on DS
			{ 9, 12, },
			{ 9, 15, },
			{ 9, 15, },
			{ 15, 20, },
			{ 20, 30, },
			{ 60, 60, },
		},
		cs_grenade_chance_times = {  -- Times for gas grenades to be allowed to replace smoke bombs under certain conditions, format { X, Y, }, interpolates from X (allowed) to Y (guaranteed) based on time spent in the same area
			{ 45, 90, },
			{ 30, 60, },
			{ 30, 60, },
			{ 20, 40, },
			{ 10, 20, },
			{ 0, 0, },
		},
	}
	ASS.level_mod_map = {  -- Which Level Mods are assigned to which levels/jobs, level IDs are checked first, then the job ID (used for multi-day heists)
		jewelry_store = "CS_normal",  -- Jewelry Store
		four_stores = "CS_normal",  -- Four Stores
		nightclub = "CS_normal",  -- Nightclub
		mallcrasher = "CS_normal",  -- Mallcrasher
		ukrainian_job_prof = "CS_normal",  -- Ukrainian Job
		branchbank_deposit = "CS_normal",  -- Bank Heist: Deposit
		branchbank_cash = "CS_normal",  -- Bank Heist: Cash
		branchbank_prof = "CS_normal",  -- Bank Heist: Random
		branchbank_gold_prof = "CS_normal",  -- Bank Heist: Gold
		firestarter = "FBI_overkill_145",  -- Firestarter
		alex = "FBI_overkill_145",  -- Rats
		watchdogs = "FBI_overkill_145",  -- Watchdogs
		watchdogs_night = "FBI_overkill_145",  -- Watchdogs (night)
		framing_frame = "FBI_overkill_145",  -- Framing Frame
		welcome_to_the_jungle_prof = "FBI_overkill_145",  -- Big Oil
		welcome_to_the_jungle_night_prof = "FBI_overkill_145",  -- Big Oil (night)
		family = "CS_normal",  -- Diamond Store
		election_day = "FBI_overkill_145",  -- Election Day
		election_day_1 = "CS_FBI_overkill",  -- Election Day (day 1 override)
		arm_fac = "CITY_overkill_290",  -- Transport: Harbor
		arm_par = "CITY_overkill_290",  -- Transport: Park
		arm_hcm = "CITY_overkill_290",  -- Transport: Downtown
		arm_und = "CITY_overkill_290",  -- Transport: Underpass
		arm_cro = "CITY_overkill_290",  -- Transport: Crossroads
		arm_for = "CITY_overkill_290",  -- Transport: Train
		big = "CS_FBI_overkill",  -- Big Bank
		mia = "CS_normal",  -- Hotline Miami
		gallery = "CS_normal",  -- Art Gallery
		hox = "FBI_overkill_145",  -- Hoxton Breakout
		hox_3 = "FBI_overkill_145",  -- Hoxton Revenge
		pines = "FBI_overkill_145",  -- White Xmas
		mus = "CS_FBI_overkill",  -- The Diamond
		crojob1 = "FBI_overkill_145",  -- The Bomb: Dockyard
		crojob2 = "FBI_overkill_145",  -- The Bomb: Forest
		crojob2_night = "FBI_overkill_145",  -- The Bomb: Forest (night)
		rat = "FBI_overkill_145",  -- Cook Off
		shoutout_raid = "FBI_overkill_145",  -- Meltdown
		arena = "CITY_overkill_290",  -- The Alesso Heist
		kenaz = "FBI_overkill_145",  -- Golden Grin Casino
		jolly = "FBI_overkill_145",  -- Aftershock
		red2 = "CS_normal",  -- First World Bank
		dinner = "FBI_CITY_easy_wish",  -- Slaughterhouse
		nail = "FBI_overkill_145",  -- Lab Rats
		cane = "CS_normal",  -- Santa's Workshop
		pbr = "CS_normal",  -- Beneath the Mountain
		pbr2 = "FBI_overkill_145",  -- Birth of Sky
		peta = "FBI_overkill_145",  -- Goat Simulator
		peta1 = "CS_FBI_overkill",  -- Goat Simulator (day 1 override)
		pal = "CS_normal",  -- Counterfeit
		man = "FBI_overkill_145",  -- Undercover
		mad = "FBI_overkill_145",  -- Boiling Point
		born = "FBI_overkill_145",  -- Biker Heist
		chill_combat = "FBI_overkill_145",  -- Safehouse Raid
		friend = "FBI_overkill_145",  -- Scarface Mansion
		flat = "CS_FBI_overkill",  -- Panic Room
		help = "FBI_overkill_145",  -- Prison Nightmare
		spa = "CS_normal",  -- Brooklyn 10-10
		moon = "CS_normal",  -- Stealing Xmas
		run = "CS_normal",  -- Heat Street
		glace = "CS_FBI_overkill",  -- Green Bridge
		dah = "CITY_overkill_290",  -- Diamond Heist
		rvd = "CS_normal",  -- Reservoir Dogs
		hvh = "CS_FBI_overkill",  -- Cursed Kill Room
		wwh = "CS_normal",  -- Alaskan Deal
		brb = "CS_normal",  -- Brooklyn Bank
		des = "FBI_overkill_145",  -- Henry's Rock
		nmh = "CITY_overkill_290",  -- No Mercy
		sah = "FBI_overkill_145",  -- Shacklethorne Auction
		vit = "CITY_overkill_290",  -- The White House
		bph = "CITY_overkill_290",  -- Hell's Island
		mex = "CITY_overkill_290",  -- Border Crossing
		mex_cooking = "CITY_overkill_290",  -- Border Crystals
		bex = "CS_normal",  -- San Martin Bank
		pex = "FBI_overkill_145",  -- Breakfast in Tijuana
		fex = "CITY_overkill_290",  -- Buluc's Mansion
		chas = "CS_normal",  -- Dragon Heist
		sand = "CS_FBI_overkill",  -- The Ukrainian Prisoner
		chca = "FBI_overkill_145",  -- Black Cat
		pent = "FBI_CITY_easy_wish",  -- Mountain Master
		ranc = "CS_FBI_overkill",  -- Midland Ranch
		trai = "FBI_overkill_145",  -- Lost in Transit
		corp = "FBI_CITY_easy_wish",  -- Hostile Takeover
		deep = "CITY_overkill_290",  -- Crude Awakening
		roberts = "CS_normal",  -- GO Bank

		-- Custom heists
		["branchbank_russia"] = "CS_FBI_overkill",  -- Bank Heist: Russia, https://modworkshop.net/mod/30389
		["rusw"] = "FBI_overkill_145",  -- Scorched Earth, https://modworkshop.net/mod/43578
		["rusd"] = "CS_FBI_overkill",  -- Cold Stones, https://modworkshop.net/mod/43578
		["ahop"] = "CS_FBI_overkill",  -- A House of Pleasure, https://modworkshop.net/mod/43578
		["crimepunish"] = "FBI_overkill_145",  -- Crime and Punishment, https://modworkshop.net/mod/43578
		["flatline_nar"] = "CS_FBI_overkill",  -- Flatline, https://modworkshop.net/mod/43578
		["Hunter_narrative"] = "FBI_overkill_145",  -- Hunter and Hunted, https://modworkshop.net/mod/43578
		["constantine_penthouse_nar"] = "CITY_overkill_290",  -- Penthouse Crasher, https://modworkshop.net/mod/43578
		["constantine_resort_nar"] = "CITY_overkill_290",  -- Scarlett Resort, https://modworkshop.net/mod/43578
		["Avalon's Shadow"] = "CITY_overkill_290",  -- Avalon's Shadow, https://modworkshop.net/mod/34760
		["thechase"] = "CS_FBI_overkill",  -- Stalk Fraud, https://modworkshop.net/mod/24638
		["physics"] = "CITY_overkill_290",  -- BOWORKS, https://modworkshop.net/mod/31560
		["physics_citystreets"] = "CS_normal",  -- BOWORKS (day 1)
		["physics_tower"] = "FBI_overkill_145",  -- BOWORKS (day 2)
		["physics_core"] = "CITY_overkill_290",  -- BOWORKS (day 3)
		["narr_friday"] = "FBI_CITY_easy_wish",  -- Crashing Capitol, https://modworkshop.net/mod/44630
		["bnktower"] = "CITY_overkill_290",  -- GenSec H.I.V.E, https://modworkshop.net/mod/36368
	}

	-- Script loader
	-- Loads and caches file at specified path as a function, and executes it
	function ASS:require(path, ...)
		if self.required[path] == nil then
			self.required[path] = blt.vm.loadfile(self.path .. path .. ".lua") or false
		end

		return self.required[path] and self.required[path](...)
	end

	ASS.utils = ASS:require("req/utils")
	ASS.menu_builder = ASS:require("req/hoplib_menu_builder", "alarmingly_streamlined_spawngroups", ASS.settings, ASS.menu_builder_params)
	ASS.message = ASS:require("req/message")

	-- ASS uses 3 prefixes
	-- "info" -> everything is fine, this is just an informative log
	-- "warn" -> something funky happened, but it can be reasonably handled
	-- "error" -> something funky happened, cannot be reasonably handled, may crash
	function ASS:log(prefix, str, ...)
		local base_str = ("[ASS:%s|%s:%s] "):format(tostring(prefix):upper(), level_id, difficulty)

		log(base_str .. tostring(str):format(...))
	end

	-- Fetches scripting tweaks for the current level and instances (reusable miniature levels) within it, if applicable
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

	-- Blocks scripts from running if no Streamlined Heisting - must be installed, enabled, and from game start
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
		random = table.random({  -- No ZEAL for random below DS, not going to randomly activate a matchmaking lock
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
