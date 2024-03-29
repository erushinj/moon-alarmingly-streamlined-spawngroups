local params = type(...) == "table" and ... or { ... }
local hard_target = params.hard_target or 1
local hard_spawn = params.hard_spawn or "dozers_any"
local normal_spawn = params.normal_spawn or "specials_any"
local hard_count = 0

return function()
	hard_count = hard_count + 1

	local wanted = hard_count <= hard_target and hard_spawn or normal_spawn

	return tweak_data.levels:moon_random_unit(wanted) or tweak_data.levels:moon_units()[wanted]
end
