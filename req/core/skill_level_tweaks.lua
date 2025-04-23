-- Skill Level-dependent tweaks, appropriate value is fetched based on the number at the end of the current skill value (eg, Hurt Me Plenty retrieves the 3rd value)
local skill_level_tweaks = {
	-- Multiplier on the amount of cops that can spawn in a single assault
	force_pool_mul = {
		1,
		1,
		1,
		1.1,
		1.5,
		2,
	},
	-- Multiplier on the length of assault delays and hostage hesitation delays
	break_duration_mul = {
		1.1,
		1,
		1,
		0.85,
		0.85,
		0,
	},
	-- Multiplier on special limits, final limits are rounded up
	special_limit_mul = {
		1,
		1,
		1,
		1.25,
		2,
		4,
	},
	-- Multiplier on delays between uses of the same grenade type
	grenade_cooldown_mul = {
		1.15,
		1,
		1,
		0.75,
		0.25,
		0,
	},
	-- Delay between uses of any grenade
	min_grenade_timeout = {
		15,
		13.5,
		13.5,
		12,
		6,
		3,
	},
	-- Delay before most groups will push when no grenade is available
	no_grenade_push_delay = {
		10,
		8,
		8,
		6,
		3,
		0,
	},
	-- Recon force is expanded to assault force * recon_force_mul
	recon_force_mul = {
		0.6,
		0.8,
		0.8,
		1,
		1,
		1,
	},
	-- 
	recon_interval_variation_mul = {
		1,
		1,
		1,
		0.75,
		0.25,
		0,
	},
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

return skill_level_tweaks
