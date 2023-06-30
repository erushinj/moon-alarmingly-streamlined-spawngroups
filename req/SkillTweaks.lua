return {
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
		},
	},
	spawn_cooldown_base = { 30, 30, 20, 10, 5, 0, },
	force_pool_mul = { 0.85, 1, 1, 1.1, 1.5, 2, },
	sustain_duration_mul = { 0.85, 1, 1, 1.25, 2, 1250, },
	break_duration_mul = { 1.25, 1, 1, 0.85, 0.85, 0, },
	special_limit_mul = { 1, 1, 1, 1.25, 2, 4, },
	grenade_cooldown_mul = { 1.15, 1, 1, 0.75, 0.25, 0, },
	spawn_cooldowns = {
		{ 2.2, 1.1 },
		{ 2, 1 },
		{ 2, 1 },
		{ 1.5, 0.75 },
		{ 0.5, 0.25 },
		{ 0, 0 },
	},
	special_weight_base = {
		{ 1.5, 5 },
		{ 3, 5 },
		{ 3, 5 },
		{ 4, 6 },
		{ 8, 12 },
		{ 27, 27 },
	},
	skm_special_weights = {
		{ 2, 4, 6 },
		{ 4, 5, 6 },
		{ 4, 5, 6 },
		{ 5, 6.25, 7.5 },
		{ 9, 12, 15 },
		{ 21, 24, 27 },
	},
	smoke_grenade_lifetime = {
		{ 7.5, 12 },
		{ 9, 15 },
		{ 9, 15 },
		{ 15, 20 },
		{ 20, 30 },
		{ 60, 60 },
	},
	cs_grenade_chance_times = {
		{ 60, 240 },
		{ 60, 90 },
		{ 60, 90 },
		{ 45, 75 },
		{ 10, 20 },
		{ 0, 0 },
	},
	min_grenade_timeout = { 15, 15, 15, 12, 6, 3, },
	no_grenade_push_delay = { 10, 8, 8, 7, 3.5, 0, },
}
