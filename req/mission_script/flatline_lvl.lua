-- flatline, https://modworkshop.net/mod/43578
local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local get_table_index_func = ASS:require("get_table_index_func", true)

local cams_amount = {
	values = {
		amount = normal and 4 or hard and 8 or 12,
	},
}
local disable = {
	values = {
		enabled = false,
	},
}
local no_participate_to_group_ai = {
	values = {
		participate_to_group_ai = false,
	},
}
local securitys = {
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"),
	Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"),
}

local dozers_no_cs = tweak_data.levels:moon_units("dozers_no_cs")

local civs_female = {
	Idstring("units/pd2_dlc_nmh/characters/civ_female_doctor_01/civ_female_doctor_01"),
	Idstring("units/pd2_dlc_nmh/characters/civ_female_scrubs_01/civ_female_scrubs_01"),
	Idstring("units/pd2_dlc_nmh/characters/civ_female_scrubs_02/civ_female_scrubs_02"),
	Idstring("units/pd2_dlc_nmh/characters/civ_female_scrubs_03/civ_female_scrubs_03"),
	Idstring("units/pd2_dlc_nmh/characters/civ_female_scrubs_04/civ_female_scrubs_04"),
}
local civs_male = {
	Idstring("units/pd2_dlc_nmh/characters/civ_male_doctor_01/civ_male_doctor_01"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_doctor_02/civ_male_doctor_02"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_doctor_03/civ_male_doctor_03"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_scrubs_01/civ_male_scrubs_01"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_scrubs_02/civ_male_scrubs_02"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_scrubs_03/civ_male_scrubs_03"),
	Idstring("units/pd2_dlc_nmh/characters/civ_male_scrubs_04/civ_male_scrubs_04"),
}
local civs_any = table.list_add(civs_female, civs_male)

local function civs()
	return {
		enemy = civs_any,
		values = {
			state = false,
			rotation = Rotation(math.rand(360), 0, 0),
		},
	}
end

return {
	[100306] = {  -- mold objective - on opening correct door
		hunt = true,
	},
	[100109] = disable,  -- cams, no titan
	[100105] = cams_amount,  -- amounts
	[100222] = cams_amount,
	[100223] = cams_amount,
	[100678] = disable,  -- garbage diff elements
	[100679] = disable,
	[100680] = disable,
	[100681] = disable,
	[100026] = {  -- loud time
		on_executed = {
			-- { id = 100563, delay = 0, },  -- diff 0.5 (normally 0s)
			{ id = 100564, delay = 180, },  -- diff 0.75 (normally 25s)
			{ id = 100565, delay = 360, },  -- diff 1 (normally 80s)
			{ id = 100690, remove = true, },  -- diff 0.85 (normally 60s)
		},
	},
	[100610] = no_participate_to_group_ai,  -- snipers
	[100613] = no_participate_to_group_ai,
	[100615] = no_participate_to_group_ai,
	[100593] = {  -- unused "dozer attack", spawns 2 dozers to guard the way out of the hospital
		on_executed = {
			{ id = 100589, delay = 0, },
			{ id = 100590, delay = 0, },
		},
	},
	[100589] = { enemy = dozers_no_cs, },
	[100590] = { enemy = dozers_no_cs, },
	[100578] = { enemy = securitys, },
	[100248] = { enemy = securitys, },
	[100580] = { enemy = securitys, },
	[100582] = { enemy = securitys, },
	[100584] = { enemy = securitys, },
	[100586] = { enemy = securitys, },
	[100101] = { enemy = securitys, },
	[100224] = { enemy = securitys, },
	[100227] = { enemy = securitys, },
	[100234] = { enemy = securitys, },
	[100235] = { enemy = securitys, values = no_participate_to_group_ai.values, },
	[100238] = { enemy = securitys, },
	[100048] = { enemy = securitys, },
	[100251] = { enemy = securitys, },
	[100255] = { enemy = securitys, },
	[100258] = { enemy = securitys, },
	[100261] = { enemy = securitys, },
	[100267] = { enemy = securitys, },
	[100271] = { enemy = securitys, },
	[100284] = { enemy = securitys, },
	[100277] = { enemy = securitys, },
	[100293] = { enemy = securitys, },
	[100232] = { enemy = civs_female, },
	[100280] = { enemy = civs_female, },
	[100283] = { enemy = civs_female, },
	[100287] = { enemy = civs_female, },
	[100233] = { enemy = civs_male, },
	[100278] = { enemy = civs_male, },
	[100279] = { enemy = civs_male, },
	[100285] = { enemy = civs_male, },
	[100286] = { enemy = civs_male, },
	[100288] = { enemy = civs_male, },
	[100598] = civs(),
	[100597] = civs(),
	[100599] = civs(),
	[100601] = civs(),
	[100600] = civs(),
	[100602] = civs(),
	[100603] = civs(),
	[100604] = civs(),
	[100605] = civs(),
	[100606] = civs(),
	[100607] = civs(),
}
