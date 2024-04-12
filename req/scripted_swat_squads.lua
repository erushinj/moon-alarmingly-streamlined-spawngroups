local params = type(...) == "table" and ... or { ... }
local hard_target = params.hard_target or 1
local hard_spawn = params.hard_spawn or "dozers_any"
local normal_spawn = params.normal_spawn or "specials_any"
local hard_count = 0

return function()
	if hard_count < hard_target then
		hard_count = hard_count + 1

		return tweak_data.levels:moon_units(hard_spawn)
	end

	return tweak_data.levels:moon_units(normal_spawn)
end
