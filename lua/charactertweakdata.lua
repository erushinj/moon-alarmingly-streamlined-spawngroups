if ASS.is_client then
	return
end

function CharacterTweakData:moon_oops_all_bo(is_first_world_problem)
	local flee_type = self.civilian.flee_type
	local run_away_delay = self.civilian.run_away_delay

	-- prevent bob from running away on fwb, since he replaces the normal bo spawn
	if is_first_world_problem ~= false then
		self.civilian.flee_type = self.bank_manager.flee_type
		self.civilian.run_away_delay = self.bank_manager.run_away_delay  -- nil
	end

	self.bank_manager.flee_type = flee_type
	self.bank_manager.run_away_delay = run_away_delay
end

if ASS.settings.doms_scale then
	ASS:log("info", "Resistive Responders setting enabled, tweaking \"CharacterTweakData:_presets\"...")

	-- only change SH's tweaked surrender presets
	-- allow any factor to count as a surrender reason
	local f = (ASS.difficulty_index - 2) / 6
	Hooks:PostHook( CharacterTweakData, "_presets", "ass__presets", function()
		for _, preset in pairs(Hooks:GetReturn().surrender) do
			if preset.reasons and preset.factors and preset.factors.health then
				local min, max = math.min_max(preset.significant_chance or 0, 0.5)

				preset.significant_chance = math.lerp(min, max, f)
				preset.base_chance = 0
				preset.factors_original = preset.factors
				preset.reasons = table.map_append(preset.reasons, preset.factors)
				preset.factors = {}
			end
		end
	end )
end

if ASS.settings.doms_all_hard then
	ASS:log("info", "Difficult Dominations setting enabled, changing assigned surrender presets...")

	-- swap easy and normal preset for hard preset
	-- could replace their data in _presets but i dont really like that
	Hooks:PostHook( CharacterTweakData, "init", "ass_init", function(self)
		local surrender_map = {
			[self.presets.surrender.easy] = self.presets.surrender.hard,
			[self.presets.surrender.normal] = self.presets.surrender.hard,
		}

		for _, data in pairs(self) do
			if type(data) == "table" then
				data.surrender = surrender_map[data.surrender] or data.surrender
			end
		end
	end )
end
