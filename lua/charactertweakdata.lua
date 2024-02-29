-- if you're a map maker with a level using swats as pager-less guards, add it to this table
CharacterTweakData.moon_swat_pager_disable_map = CharacterTweakData.moon_swat_pager_disable_map or {}
CharacterTweakData.moon_swat_pager_disable_map.sample_level_id = {
	swat = true,
	fbi_swat = true,
	city_swat = true,
	zeal_swat = true,
	heavy_swat = true,
	fbi_heavy_swat = true,
	zeal_heavy_swat = true,
	heavy_swat_sniper = true,
}

function CharacterTweakData:_init_region_constantine_cartel()
	self:_init_region_federales()
end

if ASS:get_var("is_client") then
	return
end

local swat_pager_tweak_names = clone(CharacterTweakData.moon_swat_pager_disable_map.sample_level_id)
local level_id = ASS:get_var("level_id")
local difficulty_index = ASS:get_var("difficulty_index")
local f = (difficulty_index - 2) / 6

if ASS:get_setting("doms_scale") then
	ASS:post_hook( CharacterTweakData, "_presets", function(self, tweak_data)
		local presets = Hooks:GetReturn()

		if not presets then
			ASS:log("warn", "CharacterTweakData:_presets unavailable, Resistive Responders not applied!")

			return
		end

		-- only change SH's tweaked surrender presets
		-- allow any factor to count as a surrender reason
		for _, preset in pairs(presets.surrender) do
			if preset.reasons and preset.factors and preset.factors.health then
				local min, max = math.min_max(preset.significant_chance or 0, 0.5)

				preset.significant_chance = math.lerp(min, max, f)
				preset.base_chance = 0
				preset.factors_original = preset.factors
				preset.reasons = table.map_append(preset.reasons, preset.factors)
				preset.factors = {}
			end
		end

		return presets
	end )
end

ASS:post_hook( CharacterTweakData, "init", function(self, tweak_data)
	if ASS:get_setting("doms_all_hard") then
		local surrender_map = {
			[self.presets.surrender.easy] = self.presets.surrender.hard,
			[self.presets.surrender.normal] = self.presets.surrender.hard,
		}

		for _, data in pairs(self) do
			if type(data) == "table" then
				data.surrender = surrender_map[data.surrender] or data.surrender
			end
		end
	end


	-- replaced secret service with the more fitting outdoor guards, but they lack pagers, so give them pagers
	if level_id == "fex" then
		self.security_mex_no_pager.has_alarm_pager = true
	end

	-- ASS makes the heavies modifier replace scripted spawns, including the Ready Team on hox revenge, so give all swats pagers by default
	local pager_disable_map = self.moon_swat_pager_disable_map[level_id]
	if pager_disable_map then
		for id in pairs(swat_pager_tweak_names) do
			local character = self[id]

			if not character then
				ASS:log("warn", "Character \"%s\" is nil!", id)
			else
				local disable_pager = pager_disable_map[id]

				if disable_pager then
					ASS:log("info", "Character \"%s\" has had alarm pagers disabled...", id)

					character.has_alarm_pager = nil
				end
			end
		end
	end
end )
