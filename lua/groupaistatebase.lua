-- disable dominations during assault if the setting is enabled
local super_serious_dominations = ASS:get_intensity_dependent_boolean("super_serious_dominations")
local has_room_for_police_hostage_original = GroupAIStateBase.has_room_for_police_hostage
function GroupAIStateBase:has_room_for_police_hostage(...)
	if super_serious_dominations and self:get_assault_mode() then
		return false
	end

	return has_room_for_police_hostage_original(self, ...)
end


-- force diff to 1 in loud if the setting is enabled
local max_diff = ASS:get_intensity_dependent_boolean("max_diff")
local set_difficulty_original = GroupAIStateBase.set_difficulty
function GroupAIStateBase:set_difficulty(value, ...)
	if max_diff then
		self._difficulty_value = 1

		self:_calculate_difficulty_ratio()
	else
		return set_difficulty_original(self, value, ...)
	end
end
