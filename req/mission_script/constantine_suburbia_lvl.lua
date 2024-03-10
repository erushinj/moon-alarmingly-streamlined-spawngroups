local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)
local cartel_suits = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_1/ene_cartel_suit_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_2/ene_cartel_suit_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_suit_3/ene_cartel_suit_3"),
}
local cartel_bathrobes = {
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_1/ene_cartel_bathrobe_1"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_2/ene_cartel_bathrobe_2"),
	Idstring("units/pd2_mod_ttr/characters/ene_cartel_bathrobe_3/ene_cartel_bathrobe_3"),
}
local specials_ids = get_table_index_func({ 100071, 100079, 100078, 100189, 100070, 100072, })
local dozer_target = overkill and 4 or 2
local dozer_count = 0
local function dozers()
	dozer_count = dozer_count + 1

	return tweak_data.levels:moon_random_unit(dozer_count <= dozer_target and "dozers_no_mini" or "specials_any")
end

return {
	[100016] = {  -- unit type is set to federales after spawning cartel units normally, not good
		on_executed_reorder = { 100183, },
		reinforce = {
			{
				name = "street_1",
				force = 2,
				position = Vector3(-100, 750, 0),
			},
			{
				name = "street_2",
				force = 2,
				position = Vector3(1600, 750, 0),
			},
			{
				name = "garden_stairs",
				force = 2,
				position = Vector3(-1300, 4500, 0),
			},
			{
				name = "living",
				force = 2,
				position = Vector3(1600, 2500, 50),
			},
			{
				name = "dining",
				force = 2,
				position = Vector3(150, 3850, 50),
			},
		},
	},
	[100066] = { enemy = cartel_suits, },
	[100067] = { enemy = cartel_suits, },
	[100081] = { enemy = cartel_suits, },
	[100082] = { enemy = cartel_suits, },
	[100074] = { enemy = cartel_suits, },
	[100075] = { enemy = cartel_suits, },
	[100077] = { enemy = cartel_suits, },
	[100100] = { enemy = cartel_suits, },
	[100080] = { enemy = cartel_suits, },
	[100188] = { enemy = cartel_suits, },
	[100068] = { enemy = cartel_suits, },
	[100069] = { enemy = cartel_suits, },
	[100083] = { enemy = cartel_suits, },
	[100184] = { enemy = cartel_bathrobes, },
	[100185] = { enemy = cartel_bathrobes, },
	[100186] = { enemy = cartel_bathrobes, },
	[100073] = { enemy = cartel_bathrobes, },
	[100065] = { enemy = cartel_bathrobes, },
	[100076] = { enemy = cartel_bathrobes, },
	[specials_ids()] = { enemy = dozers(), },
	[specials_ids()] = { enemy = dozers(), },
	[specials_ids()] = { enemy = dozers(), },
	[specials_ids()] = { enemy = dozers(), },
	[specials_ids()] = { enemy = dozers(), },
	[specials_ids()] = { enemy = dozers(), },
}
