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
