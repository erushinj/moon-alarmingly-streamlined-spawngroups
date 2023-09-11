local special_chance = ASS:get_var("difficulty_index") * 0.05

local function scripted_swat_squads()
	local rand = math.random()

	return ASS:random_unit(rand < special_chance and "specials_any" or "heavys")
end

return {
	-- ambush heavies
	[101347] = { enemy = scripted_swat_squads() },
	[101347] = { enemy = scripted_swat_squads() },
	[101349] = { enemy = scripted_swat_squads() },
	[101353] = { enemy = scripted_swat_squads() },
	[101354] = { enemy = scripted_swat_squads() },
	[101362] = { enemy = scripted_swat_squads() },
	[101366] = { enemy = scripted_swat_squads() },
	[101367] = { enemy = scripted_swat_squads() },
	[101368] = { enemy = scripted_swat_squads() },
	[101372] = { enemy = scripted_swat_squads() },
	[101373] = { enemy = scripted_swat_squads() },
	[101374] = { enemy = scripted_swat_squads() },
	[101350] = { enemy = scripted_swat_squads() },
	[101351] = { enemy = scripted_swat_squads() },
	[101352] = { enemy = scripted_swat_squads() },
	[101363] = { enemy = scripted_swat_squads() },
	[101364] = { enemy = scripted_swat_squads() },
	[101365] = { enemy = scripted_swat_squads() },
	[101369] = { enemy = scripted_swat_squads() },
	[101370] = { enemy = scripted_swat_squads() },
	[101371] = { enemy = scripted_swat_squads() },
	[101375] = { enemy = scripted_swat_squads() },
	[101376] = { enemy = scripted_swat_squads() },
	[101377] = { enemy = scripted_swat_squads() },

	-- ambush dozers
	[100496] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100493] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100498] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100499] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100492] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100494] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100495] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100497] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100500] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100501] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100502] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100503] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100488] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100489] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100490] = { enemy = ASS:random_unit("dozers_no_cs") },
	[100491] = { enemy = ASS:random_unit("dozers_no_cs") },

	-- hidden ambush dozers
	[100351] = { enemy = ASS:random_unit("dozers_no_med") },
	[100427] = { enemy = ASS:random_unit("dozers_no_med") },
	[100428] = { enemy = ASS:random_unit("dozers_no_med") },
	[100429] = { enemy = ASS:random_unit("dozers_no_med") },
	[100430] = { enemy = ASS:random_unit("dozers_no_med") },
	[100431] = { enemy = ASS:random_unit("dozers_no_med") },
	[100432] = { enemy = ASS:random_unit("dozers_no_med") },
	[100433] = { enemy = ASS:random_unit("dozers_no_med") },
	[100433] = { enemy = ASS:random_unit("dozers_no_med") },
}
