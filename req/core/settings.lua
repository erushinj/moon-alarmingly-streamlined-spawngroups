local settings = {
	-- Whether the mod is enabled or not
	is_massive = true,

	-- Index into ASS.values.level_mod
	level_mod = 3,
	-- Index into ASS.values.assault_style
	assault_style = 1,
	-- Index into ASS.values.skill
	skill = 2,

	-- Whether to enable additional mean tweaks
	pro_job = false,

	-- Whether to make dominations harder on higher difficulties
	doms_scale = false,
	-- Whether to make all dominatable enemies use hardest preset
	doms_all_hard = false,
	-- Whether to allow dominations during assault
	doms_super_serious = false,

	-- Whether to force Death Sentence values for scaling
	max_values = false,
	-- Whether to force hardest assaults
	max_diff = false,
	-- Whether to force full crew spawns
	max_balance_muls = false,

	-- Pick weapon type used by certain units
	unit_weapons = {
		shield_arms = 2,  -- Shields
		taser_dazers = 3,  -- Tasers
		cloaker_balance = 4,  -- Cloakers
		medic_ordnance = 3,  -- Rifle Medics
		medical_ordinance = 3,  -- Shotgun Medics
		geneva_suggestion = 4,  -- Medicdozers
		police_rifle_funding = 2,  -- Rifle HRTs
		police_shotgun_funding = 2,  -- Shotgun HRTs
	},

	-- Allow given Dozer varieties to spawn on lower difficulties than normal
	-- For each, add 1 to find the default difficulty index (Easy is missing)
	dozer_rainbow = {
		dozer_1 = 1,
		dozer_2 = 3,
		dozer_3 = 5,
		dozer_4 = 7,
		dozer_5 = 7,
	},

	-- Allow Captain Winters to spawn on maps that have him
	captain_winters = false,

	-- Whether hostages should be ignored for gas grenade eligiblity
	gas_grenade_ignore_hostages = false,

	-- Allow escapes to occur on maps that have them
	escapes = false,
}

return settings
