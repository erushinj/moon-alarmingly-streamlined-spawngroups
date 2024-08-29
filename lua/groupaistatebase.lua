if ASS.is_client then
	return
end

local get_prefix = {
	[0] = "FBI",  -- threshold is 0
	[1] = "CS",  -- threshold is 1
	[true] = "FBI",  -- difficulty greater than threshold
	[false] = "CS",  -- difficulty less than or equal to threshold
}
function GroupAIStateBase:moon_get_scripted_prefix()
	local last_prefixes = tweak_data.group_ai.moon_last_prefixes

	if last_prefixes then
		local threshold = tweak_data.moon.scripted_prefix_threshold
		local wanted_prefix = get_prefix[threshold] or get_prefix[self._difficulty_value > threshold]

		return last_prefixes[wanted_prefix] or last_prefixes.CS
	end
end

if ASS:setting("max_balance_muls") then
	ASS:log("info", "Adding Maxed Law Multipliers to \"GroupAIStateBase:_get_balancing_multiplier\"...")

	Hooks:OverrideFunction( GroupAIStateBase, "_get_balancing_multiplier", function(self, balance_multipliers, ...)
		return balance_multipliers[#balance_multipliers]
	end )
end

-- disable dominations during assault if the setting is enabled
if ASS:setting("doms_super_serious") then
	ASS:log("info", "Adding Super Serious Surrenders to \"GroupAIStateBase:has_room_for_police_hostage\"...")

	local has_room_for_police_hostage_original = GroupAIStateBase.has_room_for_police_hostage
	function GroupAIStateBase:has_room_for_police_hostage(...)
		return not self:get_assault_mode() and has_room_for_police_hostage_original(self, ...)
	end
end

-- force diff to 1 in loud if the setting is enabled
if ASS:setting("max_diff") then
	ASS:log("info", "Adding Maxed Assault Strength to \"GroupAIStateBase:set_difficulty\"...")

	local set_difficulty_original = GroupAIStateBase.set_difficulty
	function GroupAIStateBase:set_difficulty(value, ...)
		return set_difficulty_original(self, 1, ...)
	end
end

-- cloaker task fuck off
Hooks:OverrideFunction( GroupAIStateBase, "_process_recurring_grp_SO", function() end )

-- sigh. u240. also custom maps with incomplete custom factions.
-- make marshal shields not count as normal shields
GroupAIStateBase._moon_enemy_register_funcs = {
	marshal_shield = function(self, func, unit, ...)
		local special_unit_types_shield_original = self._special_unit_types.shield

		self._special_unit_types.shield = nil

		local result = func(self, unit, ...)

		self._special_unit_types.shield = special_unit_types_shield_original

		return result
	end,
	cartel_grenadier = function(self, func, unit, ...)
		local u_base = unit:base()
		local get_tags_original = u_base.get_tags

		u_base.get_tags = function(...)
			local tags = clone(get_tags_original(...))

			tags.tank = nil
			tags.medic = true

			return tags
		end

		local result = func(self, unit, ...)

		u_base.get_tags = get_tags_original

		return result
	end,
	cartel_commando = function(self, func, unit, ...)
		local u_base = unit:base()
		local get_tags_original = u_base.get_tags

		u_base.get_tags = function(...)
			local tags = clone(get_tags_original(...))

			tags.tank = true

			return tags
		end

		local result = func(self, unit, ...)

		u_base.get_tags = get_tags_original

		return result
	end,
}
GroupAIStateBase._moon_enemy_register_funcs.cartel_grenadier_fire = GroupAIStateBase._moon_enemy_register_funcs.cartel_grenadier

function GroupAIStateBase:_moon_enemy_register_helper(func, unit, ...)
	local char_func = self._moon_enemy_register_funcs[unit:base():char_tweak_name()]

	if char_func then
		return char_func(self, func, unit, ...)
	end

	return func(self, unit, ...)
end

local on_enemy_registered_original = GroupAIStateBase.on_enemy_registered
function GroupAIStateBase:on_enemy_registered(...)
	return self:_moon_enemy_register_helper(on_enemy_registered_original, ...)
end

local on_enemy_unregistered_original = GroupAIStateBase.on_enemy_unregistered
function GroupAIStateBase:on_enemy_unregistered(...)
	return self:_moon_enemy_register_helper(on_enemy_unregistered_original, ...)
end
