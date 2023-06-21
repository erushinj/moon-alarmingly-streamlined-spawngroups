local GroupAITaskData = ASS:require("GroupAITaskData")

local assault_style = ASS:assault_style()

-- Scale assault duration based on wave number and shorten time in between assaults
Hooks:PostHook( SkirmishTweakData, "init", "ass_init", function(self, tweak_data)
	local sustain_duration_mul = ASS:get_skill_dependent_value("sustain_duration_mul")

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


-- Set custom scaling special limits
Hooks:PostHook( SkirmishTweakData, "_init_special_unit_spawn_limits", "ass__init_special_unit_spawn_limits", function(self)
	local special_limit_mul = ASS:get_skill_dependent_value("special_limit_mul")

	for _, wave_limits in ipairs(self.special_unit_spawn_limits) do
		for special, limit in pairs(wave_limits) do
			wave_limits[special] = math.round(limit * special_limit_mul)
		end
	end
end )


Hooks:PostHook( SkirmishTweakData, "_init_group_ai_data", "ass__init_group_ai_data", function(self, tweak_data)
	local force_pool_mul = ASS:get_skill_dependent_value("force_pool_mul")

	tweak_data.group_ai.skirmish.assault.force_pool = table.collect(tweak_data.group_ai.skirmish.assault.force_pool, function(val) return val * force_pool_mul end)
end )


Hooks:PostHook( SkirmishTweakData, "_init_wave_modifiers", "ass__init_wave_modifiers", function(self)
	self.wave_modifiers[5] = {
		{
			class = "ModifierDozerMinigun"
		}
	}
	self.wave_modifiers[7] = {
		{
			class = "ModifierHeavySniper",
			data = {
				spawn_chance = 5
			}
		}
	}
	self.wave_modifiers[9] = {
		{
			class = "ModifierDozerMedic"
		}
	}
end )


-- Create custom wave group weights
Hooks:PostHook( SkirmishTweakData, "_init_spawn_group_weights", "ass__init_spawn_group_weights", function(self, tweak_data)

	local get_skirmish_groups = GroupAITaskData.get_skirmish_groups()
	local base_groups = get_skirmish_groups[assault_style]

	for i, _ in ipairs(self.assault.groups) do
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

			for k, _ in pairs(weights) do
				weights[k] = w
			end
		end

		self.assault.groups[i] = groups
	end

end )
