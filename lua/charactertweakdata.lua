local level_id = ASS:get_var("level_id")
local dominations = ASS:get_var("dominations")
local difficulty_index = ASS:get_var("difficulty_index")
local f = math.clamp(difficulty_index - 2, 0, 6) / 6

ASS:post_hook( CharacterTweakData, "_presets", function(self, tweak_data)
	local presets = Hooks:GetReturn()

	if dominations ~= "super_silly" then
		for _, name in ipairs({ "easy", "normal", "hard", }) do
			local preset = presets.surrender[name]

			if preset then
				preset.significant_chance = math.lerp(0, 0.65, f)

				for k, v in pairs(preset.factors) do
					preset.reasons[k] = v
					preset.factors[k] = nil
				end
			end
		end

		if dominations ~= "silly" then
			presets.surrender.easy = presets.surrender.hard
			presets.surrender.normal = presets.surrender.hard
		end
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
