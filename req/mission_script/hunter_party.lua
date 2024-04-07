local get_table_index_func = ASS:require("get_table_index_func", true)

local bartender_ids = get_table_index_func({ 100017, 100019, })
local civs_male = {
	Idstring("units/pd2_dlc_sah/characters/civ_male_gala_guest_03/civ_male_gala_guest_03"),
	Idstring("units/pd2_dlc_sah/characters/civ_male_gala_guest_04/civ_male_gala_guest_04"),
	Idstring("units/pd2_dlc_sah/characters/civ_male_gala_guest_05/civ_male_gala_guest_05"),
	Idstring("units/pd2_dlc_sah/characters/civ_male_gala_guest_06/civ_male_gala_guest_06"),
	Idstring("units/pd2_dlc_lxy/characters/civ_male_guest_gala_1/civ_male_guest_gala_1"),
	Idstring("units/pd2_dlc_lxy/characters/civ_male_guest_gala_2/civ_male_guest_gala_2"),
}
local civs_female = {
	Idstring("units/pd2_dlc_sah/characters/civ_female_gala_guest_04/civ_female_gala_guest_04"),
	Idstring("units/pd2_dlc_sah/characters/civ_female_gala_guest_05/civ_female_gala_guest_05"),
	Idstring("units/pd2_dlc_sah/characters/civ_female_gala_guest_06/civ_female_gala_guest_06"),
	Idstring("units/pd2_dlc_lxy/characters/civ_female_guest_gala_1/civ_female_guest_gala_1"),
	Idstring("units/pd2_dlc_lxy/characters/civ_female_guest_gala_2/civ_female_guest_gala_2"),
}

return {
	[100102] = {  -- difficulty 0.75 element, on ambush start
		values = {
			difficulty = 0.5,
		},
		on_executed = {
			{ id = 100105, remove = true, },  -- diff 1, normally 60s
		},
	},
	[100109] = {  -- unlock house, when backup arrives
		on_executed = {
			{ id = 100105, delay = 0, },
		},
	},
	[100105] = {  -- difficulty 1 element, after ambush
		values = {
			difficulty = 0.75,
		},
	},
	[100345] = {  -- difficulty 0.5 element, when roof is accessible
		values = {
			difficulty = 1,
		},
		on_executed = {
			{ id = 100351, remove = true, },  -- diff 0.85, normally 20s
		},
	},
	[100416] = {  -- lit flare
		hunt = true,
	},
	[bartender_ids()] = { enemy = Idstring("units/payday2/characters/civ_male_bartender_1/civ_male_bartender_1"), },
	[bartender_ids()] = { enemy = Idstring("units/payday2/characters/civ_male_bartender_2/civ_male_bartender_2"), },
	[100002] = { enemy = civs_female, },
	[100003] = { enemy = civs_female, },
	[100008] = { enemy = civs_female, },
	[100009] = { enemy = civs_female, },
	[100014] = { enemy = civs_female, },
	[100015] = { enemy = civs_female, },
	[100660] = { enemy = civs_female, },
	[100661] = { enemy = civs_female, },
	[100664] = { enemy = civs_female, },
	[100665] = { enemy = civs_female, },
	[100006] = { enemy = civs_male, },
	[100007] = { enemy = civs_male, },
	[100010] = { enemy = civs_male, },
	[100013] = { enemy = civs_male, },
	[100016] = { enemy = civs_male, },
	[100659] = { enemy = civs_male, },
	[100662] = { enemy = civs_male, },
	[100663] = { enemy = civs_male, },
	[100666] = { enemy = civs_male, },
}
