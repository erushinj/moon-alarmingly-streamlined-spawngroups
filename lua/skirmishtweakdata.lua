if ASS.is_client then
	return
end

Hooks:PostHook( SkirmishTweakData, "init", "ass_init", function(self, tweak_data)
	if not self._moon_skirmish_groups then
		local skm_special_weights = ASS.tweaks.skm_special_weights
		local w1, w2, w3 = unpack(skm_special_weights)

		local special_weights_original_a = { w1, w2 * 0.5, 0, }
		local special_weights_original_a_double = table.collect(special_weights_original_a, function(val) return val * 2 end)
		local special_weights_original_b = { 0, w2 * 0.5, w3, }
		local special_weights_original_b_double = table.collect(special_weights_original_b, function(val) return val * 2 end)
		local special_weights_original_c = table.collect(skm_special_weights, function(val) return val * 0.1 end)

		local special_weights_streamlined = clone(skm_special_weights)

		local special_weights_default = clone(skm_special_weights)

		local special_weights_chicken_plate = clone(skm_special_weights)

		local all_skm_groups = {
			original = {
				original_swats_a = { 6.75, 3.375, 0, },
				original_swats_b = { 6.75, 10.125, 13.5, },
				original_heavys_a = { 6.75, 3.375, 0, },
				original_heavys_b = { 6.75, 10.125, 13.5, },
				original_shields_a = special_weights_original_a_double,
				original_shields_b = special_weights_original_b_double,
				original_tazers_a = special_weights_original_a_double,
				original_tazers_b = special_weights_original_b_double,
				original_tanks_a = special_weights_original_a,
				original_tanks_b = special_weights_original_b,
				original_spoocs_a = special_weights_original_a,
				original_spoocs_b = special_weights_original_b,
				original_recon_d = special_weights_original_c,
			},
			streamlined = {
				streamlined_shotgun_rush_a = { 2, 1, 0, },
				streamlined_shotgun_rush_b = { 2, 3, 4, },
				streamlined_shotgun_flank_a = { 1, 0.5, 0, },
				streamlined_shotgun_flank_b = { 1, 1.5, 2, },
				streamlined_rifle_ranged_a = { 7, 3.5, 0, },
				streamlined_rifle_ranged_b = { 7, 10.5, 14, },
				streamlined_rifle_flank_a = { 3.5, 1.75, 0, },
				streamlined_rifle_flank_b = { 3.5, 5.25, 7, },
				streamlined_shield_ranged = special_weights_streamlined,
				streamlined_shield_charge = special_weights_streamlined,
				streamlined_tazer_flank = special_weights_streamlined,
				streamlined_tazer_charge = special_weights_streamlined,
				streamlined_tank = special_weights_streamlined,
				streamlined_spooc = special_weights_streamlined,
			},
			default = {
				tac_swat_shotgun_rush = { 1, 1.5, 2, },
				tac_swat_shotgun_rush_no_medic = { 1, 0.5, 0, },
				tac_swat_shotgun_flank = { 0.5, 0.75, 1, },
				tac_swat_shotgun_flank_no_medic = { 0.5, 0.25, 0, },
				tac_swat_rifle = { 8, 12, 16, },
				tac_swat_rifle_no_medic = { 8, 4, 0, },
				tac_swat_rifle_flank = { 4, 6, 8, },
				tac_swat_rifle_flank_no_medic = { 4, 2, 0, },
				tac_shield_wall_ranged = special_weights_default,
				tac_shield_wall_charge = special_weights_default,
				tac_tazer_flanking = special_weights_default,
				tac_tazer_charge = special_weights_default,
				tac_bull_rush = special_weights_default,
				FBI_spoocs = special_weights_default,
			},
			-- chicken_plate = {
			-- 	chicken_plate_hrt_a = { 0, 0, 0, },
			-- 	chicken_plate_hrt_b = { 15, 1.5, 1.5, },
			-- 	chicken_plate_swat_a = { 0, 0, 0, },
			-- 	chicken_plate_swat_b = { 6, 15, 6, },
			-- 	chicken_plate_heavy_a = { 0, 0, 0, },
			-- 	chicken_plate_heavy_b = { 1.5, 6, 15, },
			-- 	chicken_plate_shield = special_weights_chicken_plate,
			-- 	chicken_plate_taser = special_weights_chicken_plate,
			-- 	chicken_plate_tank = special_weights_chicken_plate,
			-- 	chicken_plate_spooc = special_weights_chicken_plate,
			-- 	chicken_plate_medic = special_weights_chicken_plate,
			-- },
			editor = {
				tac_swat_shotgun_rush = { 1, 1, 1, },  -- in case of a custom map that supports these
				tac_swat_shotgun_flank = { 1, 1, 1, },
				tac_swat_rifle = { 1, 1, 1, },
				tac_swat_rifle_flank = { 6, 6, 6, },
				tac_shield_wall_ranged = { 1, 1, 1, },
				tac_shield_wall_charge = { 1, 1, 1, },
				tac_tazer_flanking = { 1, 1, 1, },
				tac_tazer_charge = { 1, 1, 1, },
				tac_bull_rush = { 1, 1, 1, },
				FBI_spoocs = { 1, 1, 1, },
			},
		}
		self._moon_skirmish_groups = all_skm_groups[tweak_data.group_ai.moon_assault_style] or all_skm_groups.default
	end

	for i = 1, #self.special_unit_spawn_limits do
		local wave_limits = self.special_unit_spawn_limits[i]

		for special, limit in pairs(wave_limits) do
			wave_limits[special] = math.ceil(limit * ASS.tweaks.special_limit_mul)
		end
	end

	tweak_data.group_ai.skirmish.assault.force_pool = table.collect(tweak_data.group_ai.skirmish.assault.force_pool, function(val) return val * ASS.tweaks.force_pool_mul end)

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

		local groups = deep_clone(self._moon_skirmish_groups)
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
	function skirmish_assault_meta.__index(t, key)
		if key == "sustain_duration_min" or key == "sustain_duration_max" then
			local sustain_duration_mul = math.lerp(ASS.tweaks.sustain_duration_muls[1], ASS.tweaks.sustain_duration_muls[2], math.random())
			local sustain_duration = (60 + 7.5 * (managers.skirmish:current_wave_number() - 1)) * sustain_duration_mul

			return { sustain_duration, sustain_duration, sustain_duration, }
		end

		return __index_original(t, key)
	end
end )
