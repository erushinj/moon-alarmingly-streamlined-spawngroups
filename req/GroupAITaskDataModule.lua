local GroupAITaskDataModule = {}

--	BASE ARRAYS
--[[
	tac_swats = {
		20.25,
		13.5,
		6.75
	}
	tac_heavys = {
		6.75,
		13.5,
		20.25
	}
	tac_shields_tazers = {
		special_weight * 0.66,
		special_weight * 1.32,
		special_weight * 2.00,
	}
	tac_tanks_spoocs = {
		special_weight * 0.33,
		special_weight * 0.66,
		special_weight * 1.00,
	}
]]

function GroupAITaskDataModule.streamlined_heisting(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end
end

function GroupAITaskDataModule.vanilla(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	tweak_data_group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	tweak_data_group_ai.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	tweak_data_group_ai.besiege.assault.sustain_duration_max = tweak_data_group_ai.besiege.assault.sustain_duration_min
	tweak_data_group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	tweak_data_group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	tweak_data_group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	tweak_data_group_ai.besiege.assault.force = { 12, 14, 16 }
	tweak_data_group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	tweak_data_group_ai.besiege.regroup.duration = { 30, 25, 20 }

	tweak_data_group_ai.besiege.recon.force = { 2, 4, 6 }
	tweak_data_group_ai.besiege.recon.interval = { 0, 0, 0 }
	tweak_data_group_ai.besiege.recon.interval_variation = 0
end

function GroupAITaskDataModule.beta_streamlined_heisting(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	local special_weight = math.lerp(3, 5, f)
	local shields_tazers_weight = special_weight * 2
	local assault_weights = {
		tac_swats_a = { 13.5, 4.5, 0 },
		tac_swats_b = { 6.75, 2.25, 0 },
		tac_swats_c = { 0, 4.5, 4.5 },
		tac_swats_d = { 0, 2.25, 2.25 },
		tac_heavys_a = { 4.5, 4.5, 0 },
		tac_heavys_b = { 2.25, 2.25, 0 },
		tac_heavys_c = { 0, 4.5, 13.5 },
		tac_heavys_d = { 0, 2.25, 6.75 },
		tac_shields_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_shields_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tazers_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_tazers_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tanks_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_tanks_b = { 0, special_weight * 0.33, special_weight },
		tac_spoocs_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_spoocs_b = { 0, special_weight * 0.33, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	--	avoiding issues if new groups are added in vanilla
	for group, _ in pairs(tweak_data_group_ai.besiege.assault.groups) do
		tweak_data_group_ai.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(assault_weights) do
		tweak_data_group_ai.besiege.assault.groups[group] = weights
	end

	tweak_data_group_ai.besiege.reenforce.groups = {
		reenforce_a = { 1, 1, 0 },
		reenforce_b = { 3, 1, 1 },
		reenforce_c = { 0, 1, 0 },
		reenforce_d = { 0, 1, 3 }
	}
end

function GroupAITaskDataModule.beta_vanilla(tweak_data_group_ai, f)
	if not f then
		log("[ASS] Variable 'f' does not exist")
		return
	end

	local special_weight = math.lerp(3, 5, f)
	local shields_tazers_weight = special_weight * 2
	local assault_weights = {
		tac_swats_a = { 13.5, 4.5, 0 },
		tac_swats_b = { 6.75, 2.25, 0 },
		tac_swats_c = { 0, 4.5, 4.5 },
		tac_swats_d = { 0, 2.25, 2.25 },
		tac_heavys_a = { 4.5, 4.5, 0 },
		tac_heavys_b = { 2.25, 2.25, 0 },
		tac_heavys_c = { 0, 4.5, 13.5 },
		tac_heavys_d = { 0, 2.25, 6.75 },
		tac_shields_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_shields_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tazers_a = { shields_tazers_weight * 0.33, shields_tazers_weight * 0.33, 0 },
		tac_tazers_b = { 0, shields_tazers_weight * 0.33, shields_tazers_weight },
		tac_tanks_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_tanks_b = { 0, special_weight * 0.33, special_weight },
		tac_spoocs_a = { special_weight * 0.33, special_weight * 0.33, 0 },
		tac_spoocs_b = { 0, special_weight * 0.33, special_weight },
		phalanx_squad = { 0, 0, 0 }
	}
	--	avoiding issues if new groups are added in vanilla
	for group, _ in pairs(tweak_data_group_ai.besiege.assault.groups) do
		tweak_data_group_ai.besiege.assault.groups[group] = { 0, 0, 0 }
	end
	for group, weights in pairs(assault_weights) do
		tweak_data_group_ai.besiege.assault.groups[group] = weights
	end

	tweak_data_group_ai.flash_grenade.timer = math.lerp(2, 1, f)

	tweak_data_group_ai.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	tweak_data_group_ai.besiege.assault.sustain_duration_max = tweak_data_group_ai.besiege.assault.sustain_duration_min
	tweak_data_group_ai.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	tweak_data_group_ai.besiege.assault.delay = { math.lerp(60, 30, f), math.lerp(40, 20, f), math.lerp(20, 10, f) }
	tweak_data_group_ai.besiege.assault.hostage_hesitation_delay = { 40, 30, 20 }
	tweak_data_group_ai.besiege.assault.force = { 12, 14, 16 }
	tweak_data_group_ai.besiege.assault.force_pool = { 40, 50, 60 }

	tweak_data_group_ai.besiege.regroup.duration = { 30, 25, 20 }

	tweak_data_group_ai.besiege.recon.force = { 2, 4, 6 }
	tweak_data_group_ai.besiege.recon.interval = { 0, 0, 0 }
	tweak_data_group_ai.besiege.recon.interval_variation = 0
end

return GroupAITaskDataModule