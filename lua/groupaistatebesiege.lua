if ASS.is_client then
	return
end

-- remove "no nearby hostages" requirement to use gas grenades if the setting is on
if ASS:setting("gas_grenade_ignore_hostages") then
	ASS:log("info", "True Patriots setting enabled, removing no hostages check from \"GroupAIStateBesiege:_chk_group_use_grenade\"...")

	local _chk_group_use_grenade_original = GroupAIStateBesiege._chk_group_use_grenade
	function GroupAIStateBesiege:_chk_group_use_grenade(assault_area, ...)
		local assault_area_hostages_original = assault_area.hostages

		assault_area.hostages = nil

		local result = _chk_group_use_grenade_original(self, assault_area, ...)

		assault_area.hostages = assault_area_hostages_original

		return result
	end
end

-- most vanilla reenforce points have the very weird force value of 1, while reenforce units spawn in groups (except chicken plate assault style)
-- ensure reenforce points are populated appropriately between all assault styles
local set_area_min_police_force_original = GroupAIStateBesiege.set_area_min_police_force
function GroupAIStateBesiege:set_area_min_police_force(id, force, ...)
	return set_area_min_police_force_original(self, id, force and math.max(force, 2), ...)
end

if not ASS:setting("captain_winters") then
	ASS:log("info", "Captain Winters setting disabled, dummying \"GroupAIStateBesiege:_check_spawn_phalanx\"...")

	Hooks:OverrideFunction( GroupAIStateBesiege, "_check_spawn_phalanx", function() end )
end

