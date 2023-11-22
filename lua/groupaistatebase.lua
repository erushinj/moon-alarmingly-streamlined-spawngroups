if ASS:get_var("is_client") then
	return
end

if ASS:get_setting("max_balance_muls") then
	ASS:log("info", "Adding max balance multipliers to method \"GroupAIStateBase:_get_balancing_multiplier\"...")

	GroupAIStateBase._get_balancing_multiplier_original = GroupAIStateBase._get_balancing_multiplier
	function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers, ...)
		return balance_multipliers[#balance_multipliers]
	end
end

-- disable dominations during assault if the setting is enabled
if ASS:get_setting("doms_super_serious") then
	ASS:log("info", "Adding super serious dominations to method \"GroupAIStateBase:has_room_for_police_hostage\"...")

	GroupAIStateBase.has_room_for_police_hostage_original = GroupAIStateBase.has_room_for_police_hostage
	function GroupAIStateBase:has_room_for_police_hostage(...)
		if self:get_assault_mode() then
			return false
		end

		return self:has_room_for_police_hostage_original(...)
	end
end

function GroupAIStateBase:moon_set_escape_active(active)
	self._moon_escape_active = active

	if active then
		self:set_difficulty(1)
	end
end

-- force diff to 1 in loud if the setting is enabled or once escape is available
local max_diff = ASS:get_setting("max_diff")
ASS:log("info", "Tweaking method \"GroupAIStateBase:set_difficulty\", max difficulty setting %s...", max_diff and "enabled" or "disabled")
GroupAIStateBase.set_difficulty_original = GroupAIStateBase.set_difficulty
function GroupAIStateBase:set_difficulty(value, ...)
	value = (max_diff or self._moon_escape_active) and 1 or value

	return self:set_difficulty_original(value, ...)
end

-- cloaker task fuck off
GroupAIStateBase._process_recurring_grp_SO_original = GroupAIStateBase._process_recurring_grp_SO
GroupAIStateBase._process_recurring_grp_SO = function() end

-- sigh. u240.
-- make marshal shields not count as normal shields
GroupAIStateBase.on_enemy_registered_original = GroupAIStateBase.on_enemy_registered
function GroupAIStateBase:on_enemy_registered(unit, ...)
	local special_unit_types_shield_original = self._special_unit_types.shield

	if unit:base()._tweak_table == "marshal_shield" then
		self._special_unit_types.shield = false
	end

	local result = self:on_enemy_registered_original(unit, ...)

	self._special_unit_types.shield = special_unit_types_shield_original

	return result
end

GroupAIStateBase.on_enemy_unregistered_original = GroupAIStateBase.on_enemy_unregistered
function GroupAIStateBase:on_enemy_unregistered(unit, ...)
	local special_unit_types_shield_original = self._special_unit_types.shield

	if unit:base()._tweak_table == "marshal_shield" then
		self._special_unit_types.shield = false
	end

	local result = self:on_enemy_unregistered_original(unit, ...)

	self._special_unit_types.shield = special_unit_types_shield_original

	return result
end
