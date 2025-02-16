local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local filters_normal_above = {
	values = ASS.utils.set_difficulty_groups("normal_above"),
}
local snipers = {  -- doesnt look like toggles are set up to allow sniper respawns
	values = {
		enabled = true,
		trigger_times = 0,
	},
}
local securitys = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"),
}
local triads = {
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"),
	Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"),
}
local casual_male_ids = ASS.utils.gen_remove_random_value({
	102325,
	102230,
	101233,
	101235,
	101027,
	101628,
	101508,
	102250,
	102656,
	102469,
})
local casual_male = {
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_1/civ_male_asian_casual_1"),
	Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_2/civ_male_asian_casual_2"),
	Idstring("units/pd2_dlc_chas/characters/civ_male_asian_casual_3/civ_male_asian_casual_3"),
}
local guests_male_ids = ASS.utils.gen_remove_random_value({ 102068, 102483, 102484, })
local guests_male = {
	Idstring("units/pd2_dlc_pent/characters/civ_male_guest_penthouse_1/civ_male_guest_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/civ_male_guest_penthouse_2/civ_male_guest_penthouse_2"),
}
local meeting = {
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3"),
	Idstring("units/pd2_dlc_casino/characters/civ_male_casino_4/civ_male_casino_4"),
}
local casual_female = {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"),
	Idstring("units/pd2_dlc_chas/characters/civ_female_asian_casual_1/civ_female_asian_casual_1"),
}
local guests_female = {
	Idstring("units/pd2_dlc_pent/characters/civ_female_guest_penthouse_1/civ_female_guest_penthouse_1"),
	Idstring("units/pd2_dlc_pent/characters/civ_female_guest_penthouse_2/civ_female_guest_penthouse_2"),
}
local all_casual = table.list_add(casual_male, casual_female)
local try_pick_bob_guests = ASS.utils.try_pick_bobblehead_bob(nil, guests_male)
local try_pick_bob_casual = ASS.utils.try_pick_bobblehead_bob(nil, casual_male)

return {
	[100368] = snipers,
	[100369] = snipers,
	[100370] = snipers,
	[100371] = snipers,
	[100372] = snipers,
	[100670] = { enemy = securitys, },  -- all security are now penthouse security
	[100671] = { enemy = securitys, },
	[100672] = { enemy = securitys, },
	[100673] = { enemy = securitys, },
	[100674] = { enemy = securitys, },
	[100675] = { enemy = securitys, },
	[100676] = { enemy = securitys, },
	[100677] = { enemy = securitys, },
	[100678] = { enemy = securitys, },
	[100679] = { enemy = securitys, },
	[100760] = { enemy = securitys, },
	[100772] = { enemy = securitys, },
	[100783] = { enemy = securitys, },
	[100813] = { enemy = securitys, },
	[100840] = { enemy = securitys, },
	[100882] = { enemy = securitys, },
	[101946] = { enemy = securitys, },
	[101947] = { enemy = securitys, },
	[101948] = { enemy = securitys, },
	[101949] = { enemy = securitys, },
	[102464] = { enemy = securitys, },
	[101750] = { enemy = securitys, },
	[102729] = { enemy = triads, },  -- suit triads
	[103582] = { enemy = triads, },
	[103593] = { enemy = triads, },
	[103592] = { enemy = triads, },
	[103596] = { enemy = triads, },
	[102284] = { enemy = triads, },
	[102285] = { enemy = triads, },
	[102286] = { enemy = triads, },
	[102287] = { enemy = triads, },
	[102288] = { enemy = triads, },
	[102289] = { enemy = triads, },
	[102337] = { enemy = triads, },
	[102338] = { enemy = triads, },
	[102339] = { enemy = triads, },
	[102340] = { enemy = triads, },
	[102341] = { enemy = triads, },
	[102343] = { enemy = triads, },
	[102344] = { enemy = triads, },
	[103591] = { enemy = triads, },
	[103590] = { enemy = triads, },
	[guests_male_ids()] = { enemy = try_pick_bob_guests(), },  -- civs
	[guests_male_ids()] = { enemy = try_pick_bob_guests(), },
	[guests_male_ids()] = { enemy = try_pick_bob_guests(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[casual_male_ids()] = { enemy = try_pick_bob_casual(), },
	[102864] = { enemy = meeting, },
	[102868] = { enemy = meeting, },
	[102869] = { enemy = meeting, },
	[102870] = { enemy = meeting, },
	[101548] = { enemy = meeting, },
	[102735] = { enemy = meeting, },
	[102733] = { enemy = meeting, },
	[102734] = { enemy = meeting, },
	[101749] = { enemy = casual_female, },
	[102327] = { enemy = casual_female, },
	[101231] = { enemy = casual_female, },
	[101232] = { enemy = casual_female, },
	[101234] = { enemy = casual_female, },
	[103041] = { enemy = casual_female, },
	[101282] = { enemy = casual_female, },
	[101283] = { enemy = casual_female, },
	[102661] = { enemy = casual_female, },
	[101929] = { enemy = casual_female, },
	[102249] = { enemy = casual_female, },
	[101899] = { enemy = guests_female, },
	[101938] = { enemy = guests_female, },
	[102140] = { enemy = all_casual, },  -- walkers
	[102141] = { enemy = all_casual, },
	[102142] = { enemy = all_casual, },
	[102143] = { enemy = all_casual, },
}
