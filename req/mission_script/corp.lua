local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local van_swat_ids = ASS.utils.gen_remove_random_value({
	103058,
	103552,
	103559,
	103572,
	103576,
	103580,
	103589,
	103593,
	103597,
})
local van_spawns = ASS.utils.scripted_swat_squads({
	hard_target = normal and 1 or hard and 2 or 3,
	hard_spawn = "dozers_no_mini",
	normal_spawn = "specials_any",
})
local filters_disable = {
	values = ASS.utils.set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}

local securitys = tweak_data.moon.units.securitys
local dozers_no_mini = tweak_data.moon.units.dozers_no_mini

local civs_inspector = {
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
	Idstring("units/payday2/characters/civ_male_casual_13/civ_male_casual_13"),
	Idstring("units/payday2/characters/civ_male_casual_14/civ_male_casual_14"),
}
local civs_inspector_1 = ASS.utils.gen_remove_random_value(clone(civs_inspector))
local civs_inspector_2 = ASS.utils.gen_remove_random_value(civs_inspector)
local function inspector_group(func)
	return { enemy = func(), }
end

local civs_male = table.list_add(civs_inspector, {
	Idstring("units/payday2/characters/civ_male_casual_12/civ_male_casual_12"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
})
local civs_lab = {
	Idstring("units/pd2_dlc_des/characters/civ_male_des_scientist_01/civ_male_des_scientist_01"),
	Idstring("units/pd2_dlc_des/characters/civ_male_des_scientist_02/civ_male_des_scientist_02"),
}
local civs_female = {
	Idstring("units/pd2_dlc_pent/characters/civ_female_guest_penthouse_1/civ_female_guest_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/civ_female_guest_penthouse_2/civ_female_guest_penthouse_2"),
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"),
	Idstring("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"),
}

return {
	[103566] = filters_normal_above,  -- van bullshit
	[103567] = filters_disable,
	[103568] = filters_disable,
	[103569] = filters_disable,
	[103604] = filters_normal_above,
	[103605] = filters_disable,
	[103606] = filters_disable,
	[103607] = filters_disable,
	[103585] = filters_normal_above,
	[103586] = filters_disable,
	[103587] = filters_disable,
	[103588] = filters_disable,
	[van_swat_ids()] = { enemy = van_spawns(), },  -- swat van spawns
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[van_swat_ids()] = { enemy = van_spawns(), },
	[100670] = { enemy = securitys, },  -- security guards
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
	[100678] = { enemy = securitys, },
	[100679] = { enemy = securitys, },
	[101490] = { enemy = securitys, },
	[101491] = { enemy = securitys, },
	[101493] = { enemy = securitys, },
	[101498] = { enemy = securitys, },
	[101503] = { enemy = securitys, },
	[101519] = { enemy = securitys, },
	[101520] = { enemy = securitys, },
	[101522] = { enemy = securitys, },
	[101527] = { enemy = securitys, },
	[101532] = { enemy = securitys, },
	[101548] = { enemy = securitys, },
	[101549] = { enemy = securitys, },
	[101551] = { enemy = securitys, },
	[101556] = { enemy = securitys, },
	[101561] = { enemy = securitys, },
	[101577] = { enemy = securitys, },
	[101578] = { enemy = securitys, },
	[101580] = { enemy = securitys, },
	[101585] = { enemy = securitys, },
	[101590] = { enemy = securitys, },
	[101644] = { enemy = securitys, },
	[101645] = { enemy = securitys, },
	[101646] = { enemy = securitys, },
	[101648] = { enemy = securitys, },
	[101649] = { enemy = securitys, },
	[101677] = { enemy = securitys, },
	[101678] = { enemy = securitys, },
	[101679] = { enemy = securitys, },
	[101681] = { enemy = securitys, },
	[101682] = { enemy = securitys, },
	[101710] = { enemy = securitys, },
	[101711] = { enemy = securitys, },
	[101712] = { enemy = securitys, },
	[101714] = { enemy = securitys, },
	[101715] = { enemy = securitys, },
	[102384] = { enemy = dozers_no_mini, },  -- elevator dozers
	[103016] = { enemy = dozers_no_mini, },
	[103017] = { enemy = dozers_no_mini, },
	[102385] = { enemy = dozers_no_mini, },
	[103025] = { enemy = dozers_no_mini, },
	[103026] = { enemy = dozers_no_mini, },
	[100175] = { enemy = civs_female, },
	[100176] = { enemy = civs_female, },
	[100177] = { enemy = civs_female, },
	[100178] = { enemy = civs_female, },
	[100179] = { enemy = civs_female, },
	[100180] = { enemy = civs_male, },
	[100181] = { enemy = civs_male, },
	[100182] = { enemy = civs_male, },
	[100184] = { enemy = civs_male, },
	[100108] = { enemy = civs_male, },
	[100169] = { enemy = civs_male, },
	[100171] = { enemy = civs_male, },
	[100172] = { enemy = civs_male, },
	[100173] = { enemy = civs_female, },
	[100174] = { enemy = civs_male, },
	[101240] = { enemy = civs_male, },
	[101239] = { enemy = civs_female, },
	[101402] = { enemy = civs_male, },
	[101241] = { enemy = civs_male, },
	[101242] = { enemy = civs_male, },
	[101243] = { enemy = civs_female, },
	[101246] = { enemy = civs_male, },
	[101247] = { enemy = civs_female, },
	[101424] = { enemy = civs_male, },  -- normally female, however, male animations funny
	[101425] = { enemy = civs_lab, },
	[101426] = { enemy = civs_male, },
	[101427] = { enemy = civs_lab, },
	[101428] = { enemy = civs_female, },
	[101429] = { enemy = civs_male, },
	[101430] = { enemy = civs_female, },
	[101431] = { enemy = civs_male, },
	[101432] = { enemy = civs_female, },
	[101433] = { enemy = civs_male, },
	[101434] = { enemy = civs_female, },
	[101435] = { enemy = civs_male, },
	[101437] = { enemy = civs_lab, },
	[101438] = { enemy = civs_lab, },
	[101440] = { enemy = civs_male, },
	[101442] = { enemy = civs_male, },
	[101444] = { enemy = civs_male, },
	[101420] = { enemy = civs_male, },
	[101447] = { enemy = civs_lab, },
	[101448] = { enemy = civs_lab, },
	[101449] = { enemy = civs_lab, },
	[101450] = { enemy = civs_lab, },
	[101451] = { enemy = civs_lab, },
	[101452] = { enemy = civs_lab, },
	[101455] = { enemy = civs_male, },
	[101456] = { enemy = civs_female, },
	[101457] = { enemy = civs_male, },
	[101458] = { enemy = civs_female, },
	[101459] = { enemy = civs_male, },
	[101461] = { enemy = civs_male, },
	[101462] = { enemy = civs_female, },
	[101466] = { enemy = civs_male, },
	[101474] = { enemy = civs_male, },
	[102438] = inspector_group(civs_inspector_1),
	[102439] = inspector_group(civs_inspector_1),
	[102440] = inspector_group(civs_inspector_1),
	[102441] = inspector_group(civs_inspector_1),
	[102434] = inspector_group(civs_inspector_2),
	[102435] = inspector_group(civs_inspector_2),
	[102436] = inspector_group(civs_inspector_2),
	[102437] = inspector_group(civs_inspector_2),
}
