local GroupAITaskDataModule = {}

function GroupAITaskDataModule.streamheist(group_ai, f)
	local special_weight = math.lerp(3, 5, f)
	local assault_weights = {
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
		FBI_spoocs = { 0, special_weight * 0.5, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(assault_weights) do
		group_ai.besiege.assault.groups[group] = weights
	end

	local recon_weights = {
		hostage_rescue = { 1, 1, 1 },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(recon_weights) do
		group_ai.besiege.recon.groups[group] = weights
	end

	group_ai.smoke_grenade_lifetime = math.lerp(9, 15, f)
	group_ai.flash_grenade.timer = math.lerp(2, 1, f)
	group_ai.cs_grenade_lifetime = math.lerp(20, 40, f)

	group_ai.spawn_cooldown_mul = math.lerp(2, 1, f)

	group_ai.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }

	group_ai.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }
end

function GroupAITaskDataModule.vanilla(group_ai, f)
	local special_weight = math.lerp(3, 5, f)
	local assault_weights = {
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
		FBI_spoocs = { 0, special_weight * 0.5, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(assault_weights) do
		group_ai.besiege.assault.groups[group] = weights
	end

	local recon_weights = {
		hostage_rescue = { 1, 1, 1 },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(recon_weights) do
		group_ai.besiege.recon.groups[group] = weights
	end

	group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	group_ai.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	group_ai.besiege.assault.sustain_duration_max = group_ai.besiege.assault.sustain_duration_min
	group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	group_ai.besiege.assault.force = { 12, 14, 16 }
	group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	group_ai.besiege.recon.force = { 2, 4, 6 }
	group_ai.besiege.recon.interval = { 0, 0, 0 }
	group_ai.besiege.recon.interval_variation = 0

	group_ai.besiege.regroup.duration = { 30, 25, 20 }

	group_ai.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }
end

function GroupAITaskDataModule.beta_streamheist(group_ai, f)
	local special_weight = math.lerp(3, 5, f)
	local assault_weights = {
		tac_swats_e = { 12, 9, 6 },
		tac_swats_f = { 6, 4.5, 3 },
		tac_heavys_e = { 6, 9, 12 },
		tac_heavys_f = { 3, 4.5, 6 },
		tac_shields_a = { 0, special_weight, 0 },
		tac_shields_b = { 0, 0, special_weight * 2 },
		tac_tazers_a = { 0, special_weight, 0 },
		tac_tazers_b = { 0, 0, special_weight * 2 },
		tac_tanks_a = { 0, special_weight * 0.5, 0 },
		tac_tanks_b = { 0, 0, special_weight },
		tac_spoocs_a = { 0, special_weight * 0.5, 0 },
		tac_spoocs_b = { 0, 0, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(assault_weights) do
		group_ai.besiege.assault.groups[group] = weights
	end

	local recon_weights = {
		recon_a = { 1, 2, 0 },
		recon_b = { 0, 1, 2 },
		recon_c = { 0, 0, 1 },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(recon_weights) do
		group_ai.besiege.recon.groups[group] = weights
	end

	group_ai.besiege.reenforce.groups = {
		reenforce_a = { 1, 1, 0 },
		reenforce_b = { 3, 1, 1 },
		reenforce_c = { 0, 1, 0 },
		reenforce_d = { 0, 1, 3 }
	}

	group_ai.smoke_grenade_lifetime = math.lerp(9, 15, f)
	group_ai.flash_grenade.timer = math.lerp(2, 1, f)
	group_ai.cs_grenade_lifetime = math.lerp(20, 40, f)

	group_ai.spawn_cooldown_mul = math.lerp(2, 1, f)

	group_ai.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }

	group_ai.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }
end

function GroupAITaskDataModule.beta_vanilla(group_ai, f)
	local special_weight = math.lerp(3, 5, f)
	local assault_weights = {
		tac_swats_e = { 12, 9, 6 },
		tac_swats_f = { 6, 4.5, 3 },
		tac_heavys_e = { 6, 9, 12 },
		tac_heavys_f = { 3, 4.5, 6 },
		tac_shields_a = { 0, special_weight, 0 },
		tac_shields_b = { 0, 0, special_weight * 2 },
		tac_tazers_a = { 0, special_weight, 0 },
		tac_tazers_b = { 0, 0, special_weight * 2 },
		tac_tanks_a = { 0, special_weight * 0.5, 0 },
		tac_tanks_b = { 0, 0, special_weight },
		tac_spoocs_a = { 0, special_weight * 0.5, 0 },
		tac_spoocs_b = { 0, 0, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(assault_weights) do
		group_ai.besiege.assault.groups[group] = weights
	end

	local recon_weights = {
		recon_a = { 1, 2, 0 },
		recon_b = { 0, 1, 2 },
		recon_c = { 0, 1, 1 },
		phalanx_squad = { 0, 0, 0 }
	}
	for group, weights in pairs(recon_weights) do
		group_ai.besiege.recon.groups[group] = weights
	end

	group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	group_ai.besiege.assault.sustain_duration_min = { math.lerp(60, 120, f), math.lerp(120, 180, f), math.lerp(180, 240, f) }
	group_ai.besiege.assault.sustain_duration_max = group_ai.besiege.assault.sustain_duration_min
	group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	group_ai.besiege.assault.force = { 12, 14, 16 }
	group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	group_ai.besiege.recon.force = { 2, 4, 6 }
	group_ai.besiege.recon.interval = { 0, 0, 0 }
	group_ai.besiege.recon.interval_variation = 0

	group_ai.besiege.regroup.duration = { 30, 25, 20 }

	group_ai.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { math.lerp(120, 15, f), math.lerp(240, 30, f) }
end

return GroupAITaskDataModule