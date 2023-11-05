-- most vanilla reenforce points have the very weird force value of 1, while reenforce units spawn in groups (except chicken plate assault style)
-- ensure reenforce points are populated appropriately between all assault styles
GroupAIStateBesiege.set_area_min_police_force_original = GroupAIStateBesiege.set_area_min_police_force
function GroupAIStateBesiege:set_area_min_police_force(id, force, ...)
	force = force and math.max(force, 2)

	return self:set_area_min_police_force_original(id, force, ...)
end

if not ASS:get_setting("captain_winters") then
	ASS:log("info", "Dummying out method \"GroupAIStateBesiege:_check_spawn_phalanx\"...")

	GroupAIStateBesiege._check_spawn_phalanx_original = GroupAIStateBesiege._check_spawn_phalanx
	GroupAIStateBesiege._check_spawn_phalanx = function() end
end

