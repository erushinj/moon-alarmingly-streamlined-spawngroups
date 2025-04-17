if ASS.is_client then
	return
end

-- Remove "no nearby hostages" requirement to use gas grenades if the setting is on
if ASS.settings.gas_grenade_ignore_hostages then
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

-- Most vanilla reenforce points have the very weird force value of 1
-- A force value of 1 causes a reenforce point to never repopulate until all cops on that point are wiped out
-- This may have made sense in 2013, but it doesn't in the environment of ASS
local set_area_min_police_force_original = GroupAIStateBesiege.set_area_min_police_force
function GroupAIStateBesiege:set_area_min_police_force(id, force, ...)
	return set_area_min_police_force_original(self, id, force and math.max(force, 2), ...)
end

if not ASS.settings.captain_winters then
	ASS:log("info", "Captain Winters setting disabled, dummying \"GroupAIStateBesiege:_check_spawn_phalanx\"...")

	Hooks:OverrideFunction(GroupAIStateBesiege, "_check_spawn_phalanx", function(...) end)
end

-- Support random tactics/units in spawn_entry
-- If a special that can't be spawned is chosen for a random unit, try to pick the first valid random unit instead
Hooks:PreHook(GroupAIStateBesiege, "_spawn_in_group", "ass__spawn_in_group", function(self, spawn_group, spawn_group_type)
	local function check_special_limit_reached(unit)
		local category = tweak_data.group_ai.unit_categories[unit]
		local special_type = category and category.special_type

		return special_type and managers.job:current_spawn_limit(special_type) <= self:_get_special_unit_type_count(special_type)
	end

	local tactic_str, unit
	for _, enemy in pairs(tweak_data.group_ai.enemy_spawn_groups[spawn_group_type].spawn) do
		if enemy.random_tactics then
			tactic_str = ASS.utils.gen_weighted_selector(enemy.random_tactics):select()
			enemy.tactics = tweak_data.group_ai._tactics[tactic_str] or enemy.tactics
		end

		if enemy.random_unit then
			unit = ASS.utils.gen_weighted_selector(enemy.random_unit):select()
			if check_special_limit_reached(unit) then
				local u
				for k, v in pairs(enemy.random_unit) do
					u = type(k) == "number" and v or k
					if u ~= unit and not check_special_limit_reached(u) then
						unit = u
						break
					end
				end
			end
			enemy.unit = unit or enemy.unit
		end
	end
end)
