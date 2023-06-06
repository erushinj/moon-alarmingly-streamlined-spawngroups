local Utils = ASS:utils()

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

function GroupAITaskData.original(group_ai, special_weight)
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

function GroupAITaskData.streamlined(group_ai, special_weight)
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

function GroupAITaskData.get_skirmish_groups()
	local skm_special_weights = ASS:get_skill_dependent_value("skm_special_weights")
	local w1, w2, w3 = skm_special_weights[1], skm_special_weights[2] * 0.5, skm_special_weights[3]

	local special_weights_original_a = { w1, w2, 0 }
	local special_weights_original_a_double = Utils.collect(special_weights_original_a, 2)

	local special_weights_original_b = { 0, w2, w3 }
	local special_weights_original_b_double = Utils.collect(special_weights_original_b, 2)

	local special_weights_original_c = Utils.collect(skm_special_weights, 0.1)

	local special_weights_streamlined = skm_special_weights

	return {
		original = {
			tac_swats_a = { 6.75, 3.375, 0 },
			tac_swats_b = { 6.75, 10.125, 13.5 },
			tac_heavys_a = { 6.75, 3.375, 0 },
			tac_heavys_b = { 6.75, 10.125, 13.5 },
			tac_shields_a = special_weights_original_a_double,
			tac_shields_b =special_weights_original_b_double,
			tac_tazers_a = special_weights_original_a_double,
			tac_tazers_b = special_weights_original_b_double,
			tac_tanks_a = special_weights_original_a,
			tac_tanks_b = special_weights_original_b,
			tac_spoocs_a = special_weights_original_a,
			tac_spoocs_b = special_weights_original_b,
			recon_d = special_weights_original_c
		},
		streamlined = {
			tac_swat_shotgun_rush = { 2, 3, 4 },
			tac_swat_shotgun_rush_no_medic = { 2, 1, 0 },
			tac_swat_shotgun_flank = { 1, 1.5, 2 },
			tac_swat_shotgun_flank_no_medic = { 1, 0.5, 0 },
			tac_swat_rifle = { 7, 10.5, 14 },
			tac_swat_rifle_no_medic = { 7, 3.5, 0 },
			tac_swat_rifle_flank = { 3.5, 5.25, 7 },
			tac_swat_rifle_flank_no_medic = { 3.5, 1.75, 0 },
			tac_shield_wall_ranged = special_weights_streamlined,
			tac_shield_wall_charge = special_weights_streamlined,
			tac_tazer_flanking = special_weights_streamlined,
			tac_tazer_charge = special_weights_streamlined,
			tac_bull_rush = special_weights_streamlined,
			FBI_spoocs = special_weights_streamlined
		}
	}
end

return GroupAITaskData
