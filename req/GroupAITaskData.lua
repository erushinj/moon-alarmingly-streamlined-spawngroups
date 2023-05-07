local GroupAITaskData = {}

local function set_weights(type, new_weights)
	local groups = type.groups

	for group, _ in pairs(groups) do
		groups[group] = { 0, 0, 0 }
	end

	for group, weights in pairs(new_weights) do
		groups[group] = weights
	end
end

local function shared_weights_old(group_ai, special_weight)
	set_weights(group_ai.besiege.assault, {
		tac_swats_a = { 6.75, 3.375, 0 },
		tac_swats_b = { 6.75, 10.125, 13.5 },
		tac_heavys_a = { 6.75, 3.375, 0 },
		tac_heavys_b = { 6.75, 10.125, 13.5 },
		tac_shields_a = { 0, special_weight, 0 },
		tac_shields_b = { 0, 0, special_weight * 2 },
		tac_tazers_a = { 0, special_weight, 0 },
		tac_tazers_b = { 0, 0, special_weight * 2 },
		tac_tanks_a = { 0, special_weight * 0.5, 0 },
		tac_tanks_b = { 0, 0, special_weight },
		tac_spoocs_a = { 0, special_weight * 0.5, 0 },
		tac_spoocs_b = { 0, 0, special_weight },
		recon_d = { 0, special_weight * 0.1, special_weight * 0.2 }
	})

	set_weights(group_ai.besiege.recon, {
		recon_a = { 1, 1, 0 },
		recon_b = { 0, 1, 1 },
		recon_c = { 0, 0, 1 },
		recon_d = { 0, 0, 0 }
	})

	set_weights(group_ai.besiege.reenforce, {
		reenforce_a = { 1, 1, 0 },
		reenforce_b = { 0, 1, 1 },
		reenforce_c = { 0, 0, 1 }
	})
end

local function shared_weights_van(group_ai, special_weight)
	set_weights(group_ai.besiege.assault, {
		tac_swat_shotgun_rush = { 2, 3, 4 },
		tac_swat_shotgun_rush_no_medic = { 2, 1, 0 },
		tac_swat_shotgun_flank = { 1, 1.5, 2 },
		tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0 },
		tac_swat_rifle = { 7, 10.5, 14 },
		tac_swat_rifle_no_medic = { 7, 3.5, 0 },
		tac_swat_rifle_flank = { 3.5, 5.25, 7 },
		tac_swat_rifle_flank_no_medic = { 3.5, 1.75, 0 },
		tac_shield_wall_ranged = { 0, special_weight * 0.5, special_weight },
		tac_shield_wall_charge = { 0, special_weight * 0.5, special_weight },
		tac_tazer_flanking = { 0, special_weight * 0.5, special_weight },
		tac_tazer_charge = { 0, special_weight * 0.5, special_weight },
		tac_bull_rush = { 0, special_weight * 0.5, special_weight },
		FBI_spoocs = { 0, special_weight * 0.5, special_weight }
	})

	set_weights(group_ai.besiege.recon, {
		hostage_rescue = { 1, 1, 1 }
	})

	set_weights(group_ai.besiege.reenforce, {
		reenforce_init = { 1, 0, 0 },
		reenforce_light = { 0, 1, 0 },
		reenforce_heavy = { 0, 0, 1 }
	})
end

local function collect(tbl, mul)
	return table.collect(tbl, function(val)
		return val * mul
	end)
end

local function shared_data(group_ai, f)
	local grenade_cooldown_mul = ASS:get_skill_dependent_value("grenade_cooldown_mul")
	local smokebomb_lifetime = ASS:get_skill_dependent_value("smokebomb_lifetime")
	local gas_grenade_times = ASS:get_skill_dependent_value("gas_grenade_times")
	local spawn_cooldowns = ASS:get_skill_dependent_value("spawn_cooldowns")
	local sustain_duration_mul = ASS:get_skill_dependent_value("sustain_duration_mul")
	local force_pool_mul = ASS:get_skill_dependent_value("force_pool_mul")
	local break_duration_mul = ASS:get_skill_dependent_value("break_duration_mul")

	local max_balance_muls = ASS:get_intensity_dependent_boolean("max_balance_muls")

	group_ai.smoke_grenade_timeout = collect({ 25, 35 }, grenade_cooldown_mul)
	group_ai.smoke_grenade_lifetime = math.lerp(smokebomb_lifetime[1], smokebomb_lifetime[2], f)
	group_ai.flash_grenade_timeout = collect({ 15, 20 }, grenade_cooldown_mul)
	group_ai.cs_grenade_timeout = collect({ 60, 90 }, grenade_cooldown_mul)
	group_ai.cs_grenade_lifetime = math.lerp(20, 40, f)
	group_ai.cs_grenade_chance_times = gas_grenade_times

	group_ai.spawn_cooldown_mul = math.lerp(spawn_cooldowns[1], spawn_cooldowns[2], f)

	group_ai.besiege.assault.force_pool = collect({ 60, 70, 80 }, force_pool_mul)
	group_ai.besiege.assault.sustain_duration_min = collect({ math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }, sustain_duration_mul)
	group_ai.besiege.assault.sustain_duration_max = group_ai.besiege.assault.sustain_duration_min
	group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	group_ai.besiege.assault.delay = collect({ math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }, break_duration_mul)
	group_ai.besiege.assault.hostage_hesitation_delay = collect({ 10, 7.5, 5 }, break_duration_mul)

	group_ai.besiege.recon.interval = { 0, 0, 0 }
	group_ai.besiege.recon.interval_variation = 0

	group_ai.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { 300000, 300000 }

	if max_balance_muls then
		local max_force_mul = group_ai.besiege.assault.force_balance_mul[#group_ai.besiege.assault.force_balance_mul]
		local max_force_pool_mul = group_ai.besiege.assault.force_pool_balance_mul[#group_ai.besiege.assault.force_pool_balance_mul]

		group_ai.besiege.assault.force_balance_mul = table.collect(group_ai.besiege.assault.force_balance_mul, function(val)
			return max_force_mul
		end)
		group_ai.besiege.assault.force_pool_balance_mul = table.collect(group_ai.besiege.assault.force_pool_balance_mul, function(val)
			return max_force_pool_mul
		end)
	end
end

function GroupAITaskData.old_style(group_ai, f, special_weight)
	shared_weights_old(group_ai, special_weight)
	shared_data(group_ai, f)
end

function GroupAITaskData.van_style(group_ai, f, special_weight)
	shared_weights_van(group_ai, special_weight)
	shared_data(group_ai, f)
end

return GroupAITaskData
