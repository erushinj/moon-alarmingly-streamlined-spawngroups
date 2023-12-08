local special_chance = ASS:get_var("real_difficulty_index") * 0.05
local function scripted_swat_squads()
	return tweak_data.levels:moon_random_unit(math.random() < special_chance and "specials_any" or "heavys")
end

return {
	-- ambush
	[101347] = { enemy = scripted_swat_squads(), },  -- heavies
	[101347] = { enemy = scripted_swat_squads(), },
	[101349] = { enemy = scripted_swat_squads(), },
	[101353] = { enemy = scripted_swat_squads(), },
	[101354] = { enemy = scripted_swat_squads(), },
	[101362] = { enemy = scripted_swat_squads(), },
	[101366] = { enemy = scripted_swat_squads(), },
	[101367] = { enemy = scripted_swat_squads(), },
	[101368] = { enemy = scripted_swat_squads(), },
	[101372] = { enemy = scripted_swat_squads(), },
	[101373] = { enemy = scripted_swat_squads(), },
	[101374] = { enemy = scripted_swat_squads(), },
	[101350] = { enemy = scripted_swat_squads(), },
	[101351] = { enemy = scripted_swat_squads(), },
	[101352] = { enemy = scripted_swat_squads(), },
	[101363] = { enemy = scripted_swat_squads(), },
	[101364] = { enemy = scripted_swat_squads(), },
	[101365] = { enemy = scripted_swat_squads(), },
	[101369] = { enemy = scripted_swat_squads(), },
	[101370] = { enemy = scripted_swat_squads(), },
	[101371] = { enemy = scripted_swat_squads(), },
	[101375] = { enemy = scripted_swat_squads(), },
	[101376] = { enemy = scripted_swat_squads(), },
	[101377] = { enemy = scripted_swat_squads(), },
	[100496] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },  -- dozers
	[100493] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100498] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100499] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100492] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100494] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100495] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100497] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100500] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100501] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100502] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100503] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100488] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100489] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100490] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100491] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_cs"), },
	[100351] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },  -- hidden dozers
	[100427] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100428] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100429] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100430] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100431] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100432] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100433] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[100433] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
}
