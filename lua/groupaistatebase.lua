if ASS.is_client then
	return
end

local get_prefix = {
	[0] = "FBI",  -- threshold is 0
	[1] = "CS",  -- threshold is 1
	[true] = "FBI",  -- difficulty greater than threshold
	[false] = "CS",  -- difficulty less than or equal to threshold
}
function GroupAIStateBase:moon_get_scripted_tier()
	local last_tiers = tweak_data.group_ai.moon_last_tiers

	if last_tiers then
		local threshold = tweak_data.moon.swap_scripted_prefix_threshold
		local wanted_prefix = get_prefix[threshold] or get_prefix[self._difficulty_value > threshold]

		return last_tiers[wanted_prefix] or last_tiers.CS
	end
end

if ASS.settings.max_balance_muls then
	ASS:log("info", "Adding Maxed Law Multipliers to \"GroupAIStateBase:_get_balancing_multiplier\"...")

	Hooks:OverrideFunction( GroupAIStateBase, "_get_balancing_multiplier", function(self, balance_multipliers, ...)
		return balance_multipliers[#balance_multipliers]
	end )
end

-- disable dominations during assault if the setting is enabled
if ASS.settings.doms_super_serious then
	ASS:log("info", "Adding Super Serious Surrenders to \"GroupAIStateBase:has_room_for_police_hostage\"...")

	Hooks:PostHook( GroupAIStateBase, "has_room_for_police_hostage", "ass_has_room_for_police_hostage", function(self)
		if not self._rescue_allowed then
			return false
		end
	end )
end

-- force diff to 1 in loud if the setting is enabled
if ASS.settings.max_diff then
	ASS:log("info", "Adding Maxed Assault Strength to \"GroupAIStateBase:_calculate_difficulty_ratio\"...")

	Hooks:PostHook( GroupAIStateBase, "_calculate_difficulty_ratio", "ass__calculate_difficulty_ratio", function(self)
		self._difficulty_point_index = #tweak_data.group_ai.difficulty_curve_points + 1
		self._difficulty_value = 1
		self._difficulty_ramp = 1
	end )
end

-- cloaker task fuck off
Hooks:OverrideFunction( GroupAIStateBase, "_process_recurring_grp_SO", function(...) end )

-- sorry, the spawn noise is annoying
-- local _process_recurring_grp_SO_original = GroupAIStateBase._process_recurring_grp_SO
-- function GroupAIStateBase:_process_recurring_grp_SO(_, data, ...)
-- 	if data.groups and next(data.groups) then
-- 		data.delay_t = math.max(data.delay_t or 0, self._t + 1)

-- 		return _process_recurring_grp_SO_original(self, _, data, ...)
-- 	end

-- 	local network_session = managers.network:session()
-- 	local send_to_peers_synched_original = network_session.send_to_peers_synched
-- 	local post_event_original = managers.hud.post_event

-- 	network_session.send_to_peers_synched = function(...)
-- 		if select(3, ...) ~= self:get_sync_event_id("cloaker_spawned") then
-- 			return send_to_peers_synched_original(...)
-- 		end
-- 	end

-- 	managers.hud.post_event = function(...)
-- 		if select(2, ...) ~= "cloaker_spawn" then
-- 			return post_event_original(...)
-- 		end
-- 	end

-- 	local result = _process_recurring_grp_SO_original(self, _, data, ...)

-- 	network_session.send_to_peers_synched = send_to_peers_synched_original
-- 	managers.hud.post_event = post_event_original

-- 	return result
-- end

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
