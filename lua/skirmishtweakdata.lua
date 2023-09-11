local sustain_duration_mul = ASS:get_tweak("sustain_duration_mul")
local special_limit_mul = ASS:get_tweak("special_limit_mul")
local force_pool_mul = ASS:get_tweak("force_pool_mul")

local skm_special_weights = ASS:get_tweak("skm_special_weights")
local w1, w2, w3 = unpack(skm_special_weights)

local special_weights_original_a = { w1, w2 * 0.5, 0 }
local special_weights_original_a_double = table.collect(special_weights_original_a, function(val) return val * 2 end)
local special_weights_original_b = { 0, w2 * 0.5, w3 }
local special_weights_original_b_double = table.collect(special_weights_original_b, function(val) return val * 2 end)
local special_weights_original_c = table.collect(skm_special_weights, function(val) return val * 0.1 end)

local special_weights_streamlined = clone(skm_special_weights)

local special_weights_default = clone(skm_special_weights)

local marshal_weights = table.collect(skm_special_weights, function(val) return val * 0.4 end)

local skirmish_groups = {
	original = {
		original_swats_a = { 6.75, 3.375, 0 },
		original_swats_b = { 6.75, 10.125, 13.5 },
		original_heavys_a = { 6.75, 3.375, 0 },
		original_heavys_b = { 6.75, 10.125, 13.5 },
		original_shields_a = special_weights_original_a_double,
		original_shields_b = special_weights_original_b_double,
		original_tazers_a = special_weights_original_a_double,
		original_tazers_b = special_weights_original_b_double,
		original_tanks_a = special_weights_original_a,
		original_tanks_b = special_weights_original_b,
		original_spoocs_a = special_weights_original_a,
		original_spoocs_b = special_weights_original_b,
		original_recon_d = special_weights_original_c,
		marshal_squad = marshal_weights,
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
		FBI_spoocs = special_weights_streamlined,
		marshal_squad = marshal_weights,
	},
	default = {
		tac_swat_shotgun_rush = { 1, 1.5, 2 },
		tac_swat_shotgun_rush_no_medic = { 1, 0.5, 0 },
		tac_swat_shotgun_flank = { 0.5, 0.75, 1 },
		tac_swat_shotgun_flank_no_medic = { 0.5, 0.25, 0 },
		tac_swat_rifle = { 8, 12, 16 },
		tac_swat_rifle_no_medic = { 8, 4, 0 },
		tac_swat_rifle_flank = { 4, 6, 8 },
		tac_swat_rifle_flank_no_medic = { 4, 2, 0 },
		tac_shield_wall_ranged = special_weights_default,
		tac_shield_wall_charge = special_weights_default,
		tac_tazer_flanking = special_weights_default,
		tac_tazer_charge = special_weights_default,
		tac_bull_rush = special_weights_default,
		FBI_spoocs = special_weights_default,
	},
}

ASS:post_hook( SkirmishTweakData, "init", function(self, tweak_data)

	for _, wave_limits in ipairs(self.special_unit_spawn_limits) do
		for special, limit in pairs(wave_limits) do
			wave_limits[special] = math.round(limit * special_limit_mul)
		end
	end

	tweak_data.group_ai.skirmish.assault.force_pool = table.collect(tweak_data.group_ai.skirmish.assault.force_pool, function(val) return val * force_pool_mul end)

	local base_groups = skirmish_groups[ASS:get_var("assault_style")] or skirmish_groups.default

	for i = 1, #self.assault.groups do
		local f = math.min((i - 1) / 8, 1)
		local w1, w2

		if f <= 0.5 then
			f = f * 2
			w1 = 1
			w2 = 2
		else
			f = (f - 0.5) * 2
			w1 = 2
			w2 = 3
		end

		local groups = deep_clone(base_groups)
		for _, weights in pairs(groups) do
			local w = math.lerp(weights[w1], weights[w2], f)

			for k in pairs(weights) do
				weights[k] = w
			end
		end

		self.assault.groups[i] = groups
	end

	local skirmish_assault_meta = getmetatable(tweak_data.group_ai.skirmish.assault)
	local __index_original = skirmish_assault_meta.__index
	skirmish_assault_meta.__index = function(t, key)
		if key == "sustain_duration_min" or key == "sustain_duration_max" then
			local sustain_duration = (60 + 7.5 * (managers.skirmish:current_wave_number() - 1)) * sustain_duration_mul

			return { sustain_duration, sustain_duration, sustain_duration }
		else
			return __index_original(t, key)
		end
	end

end )
