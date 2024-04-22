if ASS.is_client then
	return
end

-- remove "no nearby hostages" requirement to use gas grenades if the setting is on
if ASS:setting("gas_grenade_ignore_hostages") then
	ASS:log("info", "True Patriots setting enabled, removing no hostages check from \"GroupAIStateBesiege:_chk_group_use_grenade\"...")
	ASS:override( GroupAIStateBesiege, "_chk_group_use_grenade", function(self, assault_area, ...)
		local assault_area_hostages_original = assault_area.hostages

		assault_area.hostages = nil

		local result = self:_chk_group_use_grenade_original(assault_area, ...)

		assault_area.hostages = assault_area_hostages_original

		return result
	end )
end

-- most vanilla reenforce points have the very weird force value of 1, while reenforce units spawn in groups (except chicken plate assault style)
-- ensure reenforce points are populated appropriately between all assault styles
ASS:override( GroupAIStateBesiege, "set_area_min_police_force", function(self, id, force, ...)
	return self:set_area_min_police_force_original(id, force and math.max(force, 2), ...)
end )

if not ASS:setting("captain_winters") then
	ASS:log("info", "Captain Winters setting disabled, dummying \"GroupAIStateBesiege:_check_spawn_phalanx\"...")
	ASS:override( GroupAIStateBesiege, "_check_spawn_phalanx", function() end, true )
end

