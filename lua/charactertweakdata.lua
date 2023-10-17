local level_id = ASS:get_var("level_id")
local doms_scale, doms_all_hard = ASS:get_setting("doms_scale"), ASS:get_setting("doms_all_hard")
local difficulty_index = ASS:get_var("difficulty_index")
local f = math.clamp(difficulty_index - 2, 0, 6) / 6

ASS:post_hook( CharacterTweakData, "_presets", function(self, tweak_data)
	local presets = Hooks:GetReturn()

	if doms_scale then
		-- for _, name in ipairs({ "easy", "normal", "hard", }) do
		for _, preset in pairs(presets.surrender) do
			if preset.reasons and preset.factors and preset.factors.health then
				local min, max = math.min_max(preset.significant_chance or 0, 0.5)

				preset.significant_chance = math.lerp(min, max, f)
				preset.base_chance = 0

				for k, v in pairs(preset.factors) do
					preset.reasons[k] = v
					preset.factors[k] = nil
				end
			end
		end
	end

	if doms_all_hard then
		presets.surrender.easy = presets.surrender.hard
		presets.surrender.normal = presets.surrender.hard
	end

	return presets
end )

ASS:post_hook( CharacterTweakData, "init", function(self, tweak_data)
	table.insert(self.marshal_marksman.tags, "marshal")
	table.insert(self.marshal_shield.tags, "marshal")
	table.insert(self.marshal_shield_break.tags, "marshal")

	if level_id == "fex" then
		self.security_mex_no_pager.has_alarm_pager = true
	end
end )
