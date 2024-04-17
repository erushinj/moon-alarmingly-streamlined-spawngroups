local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local set_difficulty_groups = ASS:require("set_difficulty_groups", true)
local filters_disable = {
	values = set_difficulty_groups("disable"),
}
local filters_normal_above = {
	values = set_difficulty_groups("normal_above"),
}
local harassers = tweak_data.levels:moon_units("marshals_far")
local dozers = tweak_data.levels:moon_units("dozers_no_mini")
local secret_service = overkill and Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1") or Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2")
local breakout_guards = {
	Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"),
	Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"),
}
local front_patrol_guards = {
	values = {
		amount = overkill and 2 or 1,
	},
}
local estate_patrol_guards = front_patrol_guards
local extension_patrol_guards = front_patrol_guards
local main_patrol_guards = front_patrol_guards
local exterior_patrol_guards = {
	values = {
		amount = overkill and 4 or 2,
	},
}
local patroling_guards = {
	values = {
		amount = normal and 2 or hard and 4 or 6,
	},
}

return {
	[103504] = {  -- cams, no titan
		values = {
			enabled = false,
		},
	},
	[101828] = {  -- amounts
		values = {
			amount = normal and 4 or hard and 9 or 14,
		},
	},
	[101858] = filters_disable,  -- filters
	[101831] = filters_disable,
	[101830] = filters_disable,
	[101829] = filters_disable,
	[101828] = filters_normal_above,
	[101544] = {  -- guard stuff, amounts
		values = {
			amount = normal and 1 or hard and 2 or 3,
		},
		on_executed = {
			{ id = 102144, remove = true, },
			{ id = 102317, remove = true, },
		},
	},
	[101306] = front_patrol_guards,
	[102228] = front_patrol_guards,
	[102172] = exterior_patrol_guards,
	[101376] = exterior_patrol_guards,
	[101300] = extension_patrol_guards,  -- interior guard amounts
	[101298] = main_patrol_guards,
	[100030] = patroling_guards,
	[102163] = patroling_guards,
	[101360] = estate_patrol_guards,
	[102171] = estate_patrol_guards,
	[101364] = { enemy = breakout_guards, },  -- ready team guards
	[101368] = { enemy = breakout_guards, },
	[101381] = { enemy = breakout_guards, },
	[101383] = { enemy = breakout_guards, },
	[101494] = { enemy = breakout_guards, },
	[101495] = { enemy = breakout_guards, },
	[101309] = { enemy = breakout_guards, },
	[101313] = { enemy = breakout_guards, },
	[102288] = { enemy = breakout_guards, },
	[102289] = { enemy = breakout_guards, },
	[102290] = { enemy = breakout_guards, },
	[102291] = { enemy = breakout_guards, },
	[102318] = { enemy = breakout_guards, },
	[102319] = { enemy = breakout_guards, },
	[102320] = { enemy = breakout_guards, },
	[102321] = { enemy = breakout_guards, },
	[102322] = { enemy = breakout_guards, },
	[102323] = { enemy = breakout_guards, },
	[102324] = { enemy = breakout_guards, },
	[102325] = { enemy = breakout_guards, },
	[102326] = { enemy = breakout_guards, },
	[102327] = { enemy = breakout_guards, },
	[102328] = { enemy = breakout_guards, },
	[102329] = { enemy = breakout_guards, },
	[102330] = { enemy = breakout_guards, },
	[102331] = { enemy = breakout_guards, },
	[102332] = { enemy = breakout_guards, },
	[102333] = { enemy = breakout_guards, },
	[102334] = { enemy = breakout_guards, },
	[102335] = { enemy = breakout_guards, },
	[102336] = { enemy = breakout_guards, },
	[102337] = { enemy = breakout_guards, },
	[101541] = { enemy = breakout_guards, },
	[101543] = { enemy = breakout_guards, },
	[101303] = { enemy = secret_service, },  -- secret service
	[101305] = { enemy = secret_service, },
	[101302] = { enemy = secret_service, },
	[101304] = { enemy = secret_service, },
	[100670] = { enemy = secret_service, },
	[100671] = { enemy = secret_service, },
	[100672] = { enemy = secret_service, },
	[100673] = { enemy = secret_service, },
	[100674] = { enemy = secret_service, },
	[100675] = { enemy = secret_service, },
	[102342] = { enemy = dozers, },  -- "ready team" dozers
	[102343] = { enemy = dozers, },
	[102344] = { enemy = dozers, },
	[102345] = { enemy = dozers, },
	[102338] = { enemy = dozers, },
	[102339] = { enemy = dozers, },
	[102340] = { enemy = dozers, },
	[102341] = { enemy = dozers, },
	[102346] = { enemy = dozers, },
	[102347] = { enemy = dozers, },
	[102348] = { enemy = dozers, },
	[102349] = { enemy = dozers, },
	[100884] = { enemy = harassers, },  -- rooftop/cliff harassers
	[100334] = { enemy = harassers, },
	[100907] = { enemy = harassers, },
	[100923] = { enemy = harassers, },
	[100939] = { enemy = harassers, },
	[100955] = { enemy = harassers, },
	[100970] = { enemy = harassers, },
	[100986] = { enemy = harassers, },
	[101002] = { enemy = harassers, },
	[101018] = { enemy = harassers, },
	[101034] = { enemy = harassers, },
	[101050] = { enemy = harassers, },
	[101066] = { enemy = harassers, },
	[101082] = { enemy = harassers, },
	[101098] = { enemy = harassers, },
	[101114] = { enemy = harassers, },
	[101130] = { enemy = harassers, },
	[101146] = { enemy = harassers, },
	[101162] = { enemy = harassers, },
	[101178] = { enemy = harassers, },
	[100883] = { enemy = harassers, },
	[100332] = { enemy = harassers, },
	[100906] = { enemy = harassers, },
	[100922] = { enemy = harassers, },
	[100938] = { enemy = harassers, },
	[100954] = { enemy = harassers, },
	[100969] = { enemy = harassers, },
	[100985] = { enemy = harassers, },
	[101001] = { enemy = harassers, },
	[101017] = { enemy = harassers, },
	[101033] = { enemy = harassers, },
	[101049] = { enemy = harassers, },
	[101065] = { enemy = harassers, },
	[101081] = { enemy = harassers, },
	[101097] = { enemy = harassers, },
	[101113] = { enemy = harassers, },
	[101129] = { enemy = harassers, },
	[101145] = { enemy = harassers, },
	[101161] = { enemy = harassers, },
	[101177] = { enemy = harassers, },
	[100885] = { enemy = harassers, },
	[100336] = { enemy = harassers, },
	[100908] = { enemy = harassers, },
	[100924] = { enemy = harassers, },
	[100940] = { enemy = harassers, },
	[100956] = { enemy = harassers, },
	[100971] = { enemy = harassers, },
	[100987] = { enemy = harassers, },
	[101003] = { enemy = harassers, },
	[101019] = { enemy = harassers, },
	[101035] = { enemy = harassers, },
	[101051] = { enemy = harassers, },
	[101067] = { enemy = harassers, },
	[101083] = { enemy = harassers, },
	[101099] = { enemy = harassers, },
	[101115] = { enemy = harassers, },
	[101131] = { enemy = harassers, },
	[101147] = { enemy = harassers, },
	[101163] = { enemy = harassers, },
	[101179] = { enemy = harassers, },
}
