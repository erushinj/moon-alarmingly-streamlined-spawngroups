if ASS:get_var("is_client") then
	return
end

if ASS:get_setting("max_balance_muls") then
	ASS:log("info", "Adding Maxed Law Multipliers to \"GroupAIStateBase:_get_balancing_multiplier\"...")
	ASS:override( GroupAIStateBase, "_get_balancing_multiplier", function(self, balance_multipliers, ...)
		return balance_multipliers[#balance_multipliers]
	end )
end

-- disable dominations during assault if the setting is enabled
if ASS:get_setting("doms_super_serious") then
	ASS:log("info", "Adding Super Serious Surrenders to \"GroupAIStateBase:has_room_for_police_hostage\"...")
	ASS:override( GroupAIStateBase, "has_room_for_police_hostage", function(self, ...)
		return not self:get_assault_mode() and self:has_room_for_police_hostage_original(...)
	end )
end

function GroupAIStateBase:moon_set_escape_active(active)
	self._moon_escape_active = active

	if active then
		self:set_difficulty(1)
	end
end

-- force diff to 1 in loud if the setting is enabled or once escape is available
local max_diff = ASS:get_setting("max_diff")
ASS:log("info", "Tweaking \"GroupAIStateBase:set_difficulty\", Maxed Assault Strength setting %s...", max_diff and "enabled" or "disabled")
ASS:override( GroupAIStateBase, "set_difficulty", function(self, value, ...)
	return self:set_difficulty_original((max_diff or self._moon_escape_active) and 1 or value, ...)
end )

-- cloaker task fuck off
ASS:override( GroupAIStateBase, "_process_recurring_grp_SO", function() end )

-- sigh. u240. also custom maps with incomplete custom factions.
-- make marshal shields not count as normal shields
GroupAIStateBase._moon_enemy_register_funcs = {
	marshal_shield = function(self, func, unit, ...)
		local special_unit_types_shield_original = self._special_unit_types.shield

		self._special_unit_types.shield = nil

		local result = self[func](self, unit, ...)

		self._special_unit_types.shield = special_unit_types_shield_original

		return result
	end,
	cartel_grenadier = function(self, func, unit, ...)
		local u_base = unit:base()
		local get_tags_original = u_base.get_tags

		u_base.get_tags = function(u)
			local tags = clone(get_tags_original(u))

			tags.tank = nil
			tags.medic = true

			return tags
		end

		local result = self[func](self, unit, ...)

		u_base.get_tags = get_tags_original

		return result
	end,
	cartel_commando = function(self, func, unit, ...)
		local u_base = unit:base()
		local get_tags_original = u_base.get_tags

		u_base.get_tags = function(u)
			local tags = clone(get_tags_original(u))

			tags.tank = true
			tags.taser = nil

			return tags
		end

		local result = self[func](self, unit, ...)

		u_base.get_tags = get_tags_original

		return result
	end,
}
GroupAIStateBase._moon_enemy_register_funcs.cartel_grenadier_fire = GroupAIStateBase._moon_enemy_register_funcs.cartel_grenadier
GroupAIStateBase._moon_enemy_register_funcs.cartel_tazer = GroupAIStateBase._moon_enemy_register_funcs.cartel_commando

function GroupAIStateBase:_moon_enemy_register_helper(func, unit, ...)
	local char_func = self._moon_enemy_register_funcs[unit:base():char_tweak_name()]

	if char_func then
		return char_func(self, func, unit, ...)
	end

	return self[func](self, unit, ...)
end

ASS:override( GroupAIStateBase, "on_enemy_registered", function(self, ...)
	return self:_moon_enemy_register_helper("on_enemy_registered_original", ...)
end, false )

ASS:override( GroupAIStateBase, "on_enemy_unregistered", function(self, ...)
	return self:_moon_enemy_register_helper("on_enemy_unregistered_original", ...)
end, false )
