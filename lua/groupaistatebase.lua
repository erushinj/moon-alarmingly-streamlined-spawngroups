local super_serious_dominations = ASS:get_setting("doms_super_serious")
local max_diff = ASS:get_setting("max_diff")

-- disable dominations during assault if the setting is enabled
local has_room_for_police_hostage_original = GroupAIStateBase.has_room_for_police_hostage
function GroupAIStateBase:has_room_for_police_hostage(...)
	if super_serious_dominations and self:get_assault_mode() then
		return false
	end

	return has_room_for_police_hostage_original(self, ...)
end


-- force diff to 1 in loud if the setting is enabled
local set_difficulty_original = GroupAIStateBase.set_difficulty
function GroupAIStateBase:set_difficulty(value, ...)
	value = max_diff and 1 or value

	return set_difficulty_original(self, value, ...)
end


if ASS:get_var("assault_style") == "default" then
	return
end

-- make marshals register as their own special type
local function register_special_types(state)
	state._special_unit_types.marshal = true
end

ASS:post_hook( GroupAIStateBase, "_init_misc_data", register_special_types)
ASS:post_hook( GroupAIStateBase, "on_simulation_started", register_special_types)

-- sigh. u240.
local on_enemy_registered_original = GroupAIStateBase.on_enemy_registered
function GroupAIStateBase:on_enemy_registered(unit, ...)
	local special_unit_types_shield_original = self._special_unit_types.shield

	if unit:base()._tweak_table == "marshal_shield" then
		self._special_unit_types.shield = false
	end

	local result = on_enemy_registered_original(self, unit, ...)

	self._special_unit_types.shield = special_unit_types_shield_original

	return result
end

local on_enemy_unregistered_original = GroupAIStateBase.on_enemy_unregistered
function GroupAIStateBase:on_enemy_unregistered(unit, ...)
	local special_unit_types_shield_original = self._special_unit_types.shield

	if unit:base()._tweak_table == "marshal_shield" then
		self._special_unit_types.shield = false
	end

	local result = on_enemy_unregistered_original(self, unit, ...)

	self._special_unit_types.shield = special_unit_types_shield_original

	return result
end
