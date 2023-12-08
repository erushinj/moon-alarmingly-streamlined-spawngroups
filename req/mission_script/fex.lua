local dozer_chance = ASS:get_var("real_difficulty_index") * 0.025
local function scripted_swat_squads()
	return tweak_data.levels:moon_random_unit(math.random() < dozer_chance and "dozers_any" or "specials_any")
end

return {
	[103275] = { enemy = scripted_swat_squads(), },
	[103276] = { enemy = scripted_swat_squads(), },
	[103277] = { enemy = scripted_swat_squads(), },
}
