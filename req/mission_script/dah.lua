local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local get_table_index_func = ASS:require("get_table_index_func", true)
local secret_service = overkill and Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1") or Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2")
local guard_patrol_amounts = {
	values = {
		amount = overkill and 2 or 1,
	},
}
local oops_all_bo = math.random() < 0.01 and Idstring("units/payday2/characters/civ_male_bank_manager_5/civ_male_bank_manager_5") or nil
local civs_male_ids = get_table_index_func({
	100115,
	100117,
	100119,
	100121,
	100123,
	100125,
	100127,
	100129,
	100131,
	100136,
	100137,
	100138,
	100139,
	100140,
	100142,
	100144,
	100146,
	100188,
	100191,
	100192,
	100193,
	100194,
	100196,
	104139,
	104163,
	104160,
})
local try_pick_bobblehead_bob = ASS:require("try_pick_bobblehead_bob", nil, oops_all_bo, oops_all_bo or {
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
	Idstring("units/payday2/characters/civ_male_casual_2/civ_male_casual_2"),
	Idstring("units/payday2/characters/civ_male_casual_3/civ_male_casual_3"),
	Idstring("units/payday2/characters/civ_male_casual_4/civ_male_casual_4"),
	Idstring("units/payday2/characters/civ_male_casual_5/civ_male_casual_5"),
	Idstring("units/payday2/characters/civ_male_casual_6/civ_male_casual_6"),
	Idstring("units/payday2/characters/civ_male_casual_7/civ_male_casual_7"),
	Idstring("units/payday2/characters/civ_male_casual_8/civ_male_casual_8"),
	Idstring("units/payday2/characters/civ_male_casual_9/civ_male_casual_9"),
	Idstring("units/payday2/characters/civ_male_casual_12/civ_male_casual_12"),
	Idstring("units/payday2/characters/civ_male_casual_13/civ_male_casual_13"),
	Idstring("units/payday2/characters/civ_male_casual_14/civ_male_casual_14"),
	Idstring("units/pd2_dlc1/characters/civ_male_casual_10/civ_male_casual_10"),
	Idstring("units/pd2_dlc1/characters/civ_male_casual_11/civ_male_casual_11"),
})
local civs_female = oops_all_bo or {
	Idstring("units/payday2/characters/civ_female_casual_1/civ_female_casual_1"),
	Idstring("units/payday2/characters/civ_female_casual_2/civ_female_casual_2"),
	Idstring("units/payday2/characters/civ_female_casual_3/civ_female_casual_3"),
	Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4"),
	Idstring("units/payday2/characters/civ_female_casual_5/civ_female_casual_5"),
	Idstring("units/payday2/characters/civ_female_casual_6/civ_female_casual_6"),
	Idstring("units/payday2/characters/civ_female_casual_7/civ_female_casual_7"),
	Idstring("units/payday2/characters/civ_female_casual_8/civ_female_casual_8"),
	Idstring("units/payday2/characters/civ_female_casual_9/civ_female_casual_9"),
	Idstring("units/payday2/characters/civ_female_casual_10/civ_female_casual_10"),
	Idstring("units/payday2/characters/civ_female_party_3/civ_female_party_3"),
	Idstring("units/pd2_dlc_arena/characters/civ_female_party_alesso_1/civ_female_party_alesso_1"),
}

if oops_all_bo then
	local civilian_flee = tweak_data.character.civilian.flee_type
	local civilian_run_away_delay = tweak_data.character.civilian.run_away_delay

	tweak_data.character.bank_manager.flee_type = civilian_flee
	tweak_data.character.bank_manager.run_away_delay = civilian_run_away_delay
end

return {
	[104391] = {  -- no titan cams
		values = {
			enabled = false,
		},
	},
	[103969] = {
		reinforce = {
			{
				name = "atrium1",
				force = 2,
				position = Vector3(-4000, -2200, 750),
			},
			{
				name = "atrium2",
				force = 2,
				position = Vector3(-2750, -2200, 750),
			},
			{
				name = "atrium3",
				force = 2,
				position = Vector3(-2750, -1000, 750),
			},
			{
				name = "atrium4",
				force = 2,
				position = Vector3(-4000, -1000, 750),
			},
		},
	},
	[101342] = {
		reinforce = {
			{
				name = "vault_entrance",
				force = 3,
				position = Vector3(-3250, -2850, 0),
			},
			{
				name = "atrium_lower1",
				force = 3,
				position = Vector3(-3800, -800, 400),
			},
			{
				name = "atrium_lower2",
				force = 3,
				position = Vector3(-2700, -800, 400),
			},
		},
	},
	-- [101616] = guard_patrol_amounts,
	[103573] = guard_patrol_amounts,
	[103828] = guard_patrol_amounts,
	[103830] = guard_patrol_amounts,
	[103575] = guard_patrol_amounts,
	[102313] = guard_patrol_amounts,
	[102029] = guard_patrol_amounts,
	[102040] = guard_patrol_amounts,
	[101260] = guard_patrol_amounts,
	[103578] = guard_patrol_amounts,
	[101066] = guard_patrol_amounts,
	[102455] = guard_patrol_amounts,
	[102459] = guard_patrol_amounts,
	-- guard spawns
	[102026] = { enemy = secret_service, },
	[102028] = { enemy = secret_service, },
	[102042] = { enemy = secret_service, },
	[102043] = { enemy = secret_service, },
	[101720] = { enemy = secret_service, },
	[103561] = { enemy = secret_service, },
	[102322] = { enemy = secret_service, },
	[102326] = { enemy = secret_service, },
	[102327] = { enemy = secret_service, },
	[102328] = { enemy = secret_service, },
	[100041] = { enemy = secret_service, },
	[101261] = { enemy = secret_service, },
	[101682] = { enemy = secret_service, },
	[102323] = { enemy = secret_service, },
	[101209] = { enemy = secret_service, },
	[101718] = { enemy = secret_service, },
	[100034] = { enemy = secret_service, },
	[102325] = { enemy = secret_service, },
	[102458] = { enemy = secret_service, },
	[102462] = { enemy = secret_service, },
	[103574] = { enemy = secret_service, },
	[103576] = { enemy = secret_service, },
	[103826] = { enemy = secret_service, },
	[103827] = { enemy = secret_service, },
	[103832] = { enemy = secret_service, },
	[103834] = { enemy = secret_service, },
	[102450] = { enemy = secret_service, },
	[102456] = { enemy = secret_service, },
	[100104] = { enemy = secret_service, },  -- elevator spawns, triggered on alarm
	[102812] = { enemy = secret_service, },
	[102813] = { enemy = secret_service, },
	[102814] = { enemy = secret_service, },
	[101787] = { enemy = secret_service, },
	-- civilians
	[100114] = { enemy = civs_female, },  -- female
	[100116] = { enemy = civs_female, },
	[100118] = { enemy = civs_female, },
	[100120] = { enemy = civs_female, },
	[100122] = { enemy = civs_female, },
	[100124] = { enemy = civs_female, },
	[100126] = { enemy = civs_female, },
	[100128] = { enemy = civs_female, },
	[100130] = { enemy = civs_female, },
	[100135] = { enemy = civs_female, },
	[100141] = { enemy = civs_female, },
	[100143] = { enemy = civs_female, },
	[100145] = { enemy = civs_female, },
	[100147] = { enemy = civs_female, },
	[104138] = { enemy = civs_female, },
	[100187] = { enemy = civs_female, },
	[104106] = { enemy = civs_female, },
	[104107] = { enemy = civs_female, },
	[101135] = { enemy = civs_female, },
	[102106] = { enemy = civs_female, },
	[104109] = { enemy = civs_female, },
	[104155] = { enemy = civs_female, },
	[104164] = { enemy = civs_female, },
	[102849] = { enemy = civs_female, },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },  -- male
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
	[civs_male_ids()] = { enemy = try_pick_bobblehead_bob(), },
}
