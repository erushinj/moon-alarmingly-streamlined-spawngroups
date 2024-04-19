local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()

local service = {
	Idstring("units/payday2/characters/civ_female_hostess_apron_1/civ_female_hostess_apron_1"),
	Idstring("units/payday2/characters/civ_male_business_1/civ_male_business_1"),
}
local male_party = {
	Idstring("units/payday2/characters/civ_male_business_2/civ_male_business_2"),
	Idstring("units/payday2/characters/civ_male_party_1/civ_male_party_1"),
	Idstring("units/payday2/characters/civ_male_party_2/civ_male_party_2"),
	Idstring("units/payday2/characters/civ_male_party_3/civ_male_party_3"),
}
local female_party = {
	Idstring("units/payday2/characters/civ_female_party_1/civ_female_party_1"),
	Idstring("units/payday2/characters/civ_female_party_2/civ_female_party_2"),
	Idstring("units/payday2/characters/civ_female_party_3/civ_female_party_3"),
	Idstring("units/payday2/characters/civ_female_party_4/civ_female_party_4"),
}
local any_party = table.list_add(male_party, female_party)
local safe_cocaine = {
	values = {
		chance = 100,
	},
}
local safe_cocaine_amounts = {
	values = {
		amount = normal and 2 or hard and 4 or 6,
		amount_random = 6,
	},
}
local gangster_spawns = {
	enemy = {  -- 1 and 3 (balaclavas) not available
		Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"),
		Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"),
		Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"),
	},
	values = {
		trigger_times = 1,
	},
}

return {
	[104731] = {  -- roof
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
	},
	[103174] = {  -- rappel
		groups = tweak_data.group_ai:moon_preferred_groups("no_shields_dozers"),
		values = {
			interval = 15,
		},
	},
	[100703] = safe_cocaine,  -- safe cocaine, chance for a selected pack to spawn (they are already chosen randomly)
	[100726] = safe_cocaine,
	[100727] = safe_cocaine,
	[100732] = safe_cocaine,
	[100737] = safe_cocaine,
	[100738] = safe_cocaine,
	[100742] = safe_cocaine,
	[100743] = safe_cocaine,
	[100744] = safe_cocaine,
	[100745] = safe_cocaine,
	[100747] = safe_cocaine,
	[100750] = safe_cocaine,
	[100681] = safe_cocaine_amounts,  -- amount selected to try spawning
	[100687] = safe_cocaine_amounts,
	[100687] = safe_cocaine_amounts,
	[100796] = safe_cocaine_amounts,
	[102619] = gangster_spawns,  -- dmitri's mob
	[101865] = gangster_spawns,
	[100513] = gangster_spawns,
	[103452] = gangster_spawns,
	[100532] = gangster_spawns,
	[100518] = gangster_spawns,
	[101934] = gangster_spawns,
	[102709] = gangster_spawns,
	[100520] = gangster_spawns,
	[100530] = gangster_spawns,
	[103451] = gangster_spawns,
	[101252] = gangster_spawns,
	[100523] = gangster_spawns,
	[102200] = gangster_spawns,
	[102617] = gangster_spawns,
	[100534] = gangster_spawns,
	[101927] = gangster_spawns,
	[100517] = gangster_spawns,
	[102708] = gangster_spawns,
	[100528] = gangster_spawns,
	[102202] = gangster_spawns,
	[103450] = gangster_spawns,
	[100522] = gangster_spawns,
	[102206] = gangster_spawns,
	[101858] = gangster_spawns,
	[102087] = { enemy = female_party, },  -- civs, dmitri's office
	[103648] = { enemy = any_party, },  -- outside ?
	[103649] = { enemy = any_party, },
	[103650] = { enemy = any_party, },
	[103652] = { enemy = any_party, },
	[104043] = { enemy = female_party, },  -- in front of bouncer
	[104053] = { enemy = female_party, },
	[104924] = { enemy = service, },  -- female workers
	[104926] = { enemy = service, },
	[104927] = { enemy = service, },
	[104928] = { enemy = service, },
	[101283] = { enemy = female_party, },  -- female dancers
	[101284] = { enemy = female_party, },
	[101285] = { enemy = female_party, },
	[101287] = { enemy = female_party, },
	[101288] = { enemy = female_party, },
	[101289] = { enemy = female_party, },
	[101297] = { enemy = female_party, },
	[101311] = { enemy = female_party, },
	[101313] = { enemy = female_party, },
	[101326] = { enemy = female_party, },
	[101326] = { enemy = female_party, },
	[104848] = { enemy = service, },  -- male workers
	[101373] = { enemy = service, },
	[101270] = { enemy = male_party, },  -- male dancers
	[101271] = { enemy = male_party, },
	[101272] = { enemy = male_party, },
	[101273] = { enemy = male_party, },
	[101286] = { enemy = male_party, },
	[101290] = { enemy = male_party, },
	[101291] = { enemy = male_party, },
	[101292] = { enemy = male_party, },
	[101312] = { enemy = male_party, },
	[101320] = { enemy = male_party, },
	[101397] = { enemy = male_party, },  -- gamblers
	[103203] = { enemy = male_party, },
	[103196] = { enemy = male_party, },
	[100838] = { enemy = female_party, },  -- "random girl"
	[100076] = { enemy = female_party, },  -- female, "poser"
	[102177] = { enemy = female_party, },
	[102178] = { enemy = female_party, },
	[102179] = { enemy = female_party, },
	[102180] = { enemy = female_party, },
	[102186] = { enemy = female_party, },
	[102187] = { enemy = female_party, },
	[102188] = { enemy = female_party, },
	[102215] = { enemy = female_party, },
	[102216] = { enemy = female_party, },
	[102225] = { enemy = female_party, },
	[102275] = { enemy = female_party, },
	[102411] = { enemy = female_party, },
	[102425] = { enemy = female_party, },
	[102427] = { enemy = female_party, },
	[102458] = { enemy = female_party, },
	[102459] = { enemy = female_party, },
	[102460] = { enemy = female_party, },
	[102461] = { enemy = female_party, },
	[102464] = { enemy = female_party, },
	[102470] = { enemy = female_party, },
	[102502] = { enemy = female_party, },
	[102515] = { enemy = female_party, },
	[102562] = { enemy = female_party, },
	[102572] = { enemy = female_party, },
	[102577] = { enemy = female_party, },
	[102586] = { enemy = female_party, },
	[102700] = { enemy = female_party, },
	[102714] = { enemy = female_party, },
	[102717] = { enemy = female_party, },
	[102720] = { enemy = female_party, },
	[102733] = { enemy = female_party, },
	[102737] = { enemy = female_party, },
	[102738] = { enemy = female_party, },
	[102742] = { enemy = female_party, },
	[102744] = { enemy = female_party, },
	[102745] = { enemy = female_party, },
	[102748] = { enemy = female_party, },
	[102752] = { enemy = female_party, },
	[102754] = { enemy = female_party, },
	[102757] = { enemy = female_party, },
	[102758] = { enemy = female_party, },
	[102761] = { enemy = female_party, },
	[102763] = { enemy = female_party, },
	[102765] = { enemy = female_party, },
	[102766] = { enemy = female_party, },
	[102782] = { enemy = female_party, },
	[102787] = { enemy = female_party, },
	[102812] = { enemy = female_party, },
	[102930] = { enemy = female_party, },
	[102933] = { enemy = female_party, },
	[102940] = { enemy = female_party, },
	[102947] = { enemy = female_party, },
	[102954] = { enemy = female_party, },
	[102958] = { enemy = female_party, },
	[101324] = { enemy = female_party, },  -- "single"
	[102120] = { enemy = female_party, },
	[104009] = { enemy = female_party, },  -- "wanderer"
	[104096] = { enemy = female_party, },
	[104104] = { enemy = female_party, },
	[104119] = { enemy = female_party, },
	[104123] = { enemy = female_party, },
	[102010] = { enemy = male_party, },  -- male, "poser"
	[102061] = { enemy = male_party, },
	[102090] = { enemy = male_party, },
	[102089] = { enemy = male_party, },
	[102091] = { enemy = male_party, },
	[102235] = { enemy = male_party, },
	[102255] = { enemy = male_party, },
	[102264] = { enemy = male_party, },
	[102269] = { enemy = male_party, },
	[102272] = { enemy = male_party, },
	[102274] = { enemy = male_party, },
	[102398] = { enemy = male_party, },
	[102418] = { enemy = male_party, },
	[102454] = { enemy = male_party, },
	[101062] = { enemy = male_party, },
	[102462] = { enemy = male_party, },
	[102468] = { enemy = male_party, },
	[102471] = { enemy = male_party, },
	[102505] = { enemy = male_party, },
	[102561] = { enemy = male_party, },
	[102570] = { enemy = male_party, },
	[102573] = { enemy = male_party, },
	[102579] = { enemy = male_party, },
	[102595] = { enemy = male_party, },
	[102704] = { enemy = male_party, },
	[102712] = { enemy = male_party, },
	[102713] = { enemy = male_party, },
	[102716] = { enemy = male_party, },
	[102718] = { enemy = male_party, },
	[102719] = { enemy = male_party, },
	[102736] = { enemy = male_party, },
	[102739] = { enemy = male_party, },
	[102740] = { enemy = male_party, },
	[102746] = { enemy = male_party, },
	[102747] = { enemy = male_party, },
	[102755] = { enemy = male_party, },
	[102756] = { enemy = male_party, },
	[102759] = { enemy = male_party, },
	[102760] = { enemy = male_party, },
	[102764] = { enemy = male_party, },
	[102767] = { enemy = male_party, },
	[102768] = { enemy = male_party, },
	[102809] = { enemy = male_party, },
	[102810] = { enemy = male_party, },
	[102912] = { enemy = male_party, },
	[102942] = { enemy = male_party, },
	[102944] = { enemy = male_party, },
	[102948] = { enemy = male_party, },
	[103010] = { enemy = male_party, },
	[102710] = { enemy = male_party, },  -- "single"
	[102711] = { enemy = male_party, },
	[102522] = { enemy = male_party, },
	[104008] = { enemy = male_party, },  -- "wanderer"
	[104097] = { enemy = male_party, },
	[104105] = { enemy = male_party, },
	[104120] = { enemy = male_party, },
	[104124] = { enemy = male_party, },
}
