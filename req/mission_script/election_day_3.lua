local normal, hard, overkill, diff_group_name = ASS.utils.difficulty_groups()
local low_diff_harassers = tweak_data.moon.units[normal and "swats" or hard and "swats_heavys" or "heavys"]
local high_diff_harassers = tweak_data.moon.units[normal and "swats_heavys" or hard and "heavys" or "marshals"]
local cops = tweak_data.moon.units.cops
local securitys = tweak_data.moon.units.securitys
local heavys = tweak_data.moon.units.heavys
local dozers_no_med = tweak_data.moon.units.dozers_no_med

return {
	[100082] = {  -- prevent sniper respawn delays becoming ridiculously small as more assaults pass
		on_executed = {
			{ id = 100321, remove = true, },
		},
	},
	[100446] = {
		on_executed = {
			{ id = 100321, delay = 0, },
		},
	},
	[102953] = { enemy = cops, },  -- cops
	[102954] = { enemy = cops, },
	[103947] = { enemy = cops, },
	[103952] = { enemy = cops, },
	[103953] = { enemy = cops, },
	[102662] = { enemy = cops, },
	[102663] = { enemy = cops, },
	[102666] = { enemy = cops, },
	[102667] = { enemy = cops, },
	[102669] = { enemy = cops, },
	[102670] = { enemy = cops, },
	[103947] = { enemy = cops, },
	[103517] = { enemy = securitys, },  -- security
	[103956] = { enemy = securitys, },
	[103957] = { enemy = securitys, },
	[103959] = { enemy = securitys, },
	[102643] = { enemy = securitys, },
	[102668] = { enemy = securitys, },
	[102694] = { enemy = securitys, },
	[102695] = { enemy = securitys, },
	[103621] = { enemy = securitys, },
	[103630] = { enemy = securitys, },
	[103640] = { enemy = securitys, },
	[103626] = { enemy = securitys, },
	[103553] = { enemy = securitys, },
	[100386] = { enemy = securitys, },
	[104279] = { enemy = tweak_data.moon.units.securitys_heavy, },  -- camera man
	[102627] = { enemy = tweak_data.moon.units.cop_1, },  -- cop cars with baked-in cop models
	[102629] = { enemy = tweak_data.moon.units.cop_2, },
	[102630] = { enemy = tweak_data.moon.units.cop_1, },
	[102626] = { enemy = tweak_data.moon.units.cop_2, },
	[100119] = { enemy = low_diff_harassers, },  -- balcony harassers, normal, low diff
	[100132] = { enemy = low_diff_harassers, },
	[100145] = { enemy = low_diff_harassers, },
	[100150] = { enemy = low_diff_harassers, },
	[100152] = { enemy = low_diff_harassers, },
	[100154] = { enemy = low_diff_harassers, },
	[100189] = { enemy = high_diff_harassers, },  -- high diff
	[100190] = { enemy = high_diff_harassers, },
	[100191] = { enemy = high_diff_harassers, },
	[100192] = { enemy = high_diff_harassers, },
	[100193] = { enemy = high_diff_harassers, },
	[100197] = { enemy = high_diff_harassers, },
	[100128] = { enemy = low_diff_harassers, },  -- hard, low diff
	[100164] = { enemy = low_diff_harassers, },
	[100170] = { enemy = low_diff_harassers, },
	[100171] = { enemy = low_diff_harassers, },
	[100174] = { enemy = low_diff_harassers, },
	[100175] = { enemy = low_diff_harassers, },
	[100199] = { enemy = high_diff_harassers, },  -- high diff
	[100201] = { enemy = high_diff_harassers, },
	[100203] = { enemy = high_diff_harassers, },
	[100204] = { enemy = high_diff_harassers, },
	[100206] = { enemy = high_diff_harassers, },
	[100207] = { enemy = high_diff_harassers, },
	[100131] = { enemy = low_diff_harassers, },  -- very hard+, low diff
	[100176] = { enemy = low_diff_harassers, },
	[100177] = { enemy = low_diff_harassers, },
	[100179] = { enemy = low_diff_harassers, },
	[100181] = { enemy = low_diff_harassers, },
	[100182] = { enemy = low_diff_harassers, },
	[100208] = { enemy = high_diff_harassers, },  -- high diff
	[100209] = { enemy = high_diff_harassers, },
	[100210] = { enemy = high_diff_harassers, },
	[100211] = { enemy = high_diff_harassers, },
	[100212] = { enemy = high_diff_harassers, },
	[100213] = { enemy = high_diff_harassers, },
	[100141] = { enemy = heavys, },  -- "escape guards", normal
	[100267] = { enemy = heavys, },
	[100268] = { enemy = heavys, },
	[100270] = { enemy = heavys, },
	[100271] = { enemy = heavys, },
	[100272] = { enemy = heavys, },
	[100273] = { enemy = heavys, },
	[100274] = { enemy = heavys, },
	[103307] = { enemy = heavys, },  -- other side
	[103310] = { enemy = heavys, },
	[103313] = { enemy = heavys, },
	[103316] = { enemy = heavys, },
	[103319] = { enemy = heavys, },
	[103322] = { enemy = heavys, },
	[103325] = { enemy = heavys, },
	[103328] = { enemy = heavys, },
	[100293] = { enemy = heavys, },  -- hard
	[100294] = { enemy = heavys, },
	[100295] = { enemy = heavys, },
	[100298] = { enemy = heavys, },
	[100299] = { enemy = heavys, },
	[100300] = { enemy = heavys, },
	[100301] = { enemy = heavys, },
	[100302] = { enemy = heavys, },
	[103338] = { enemy = heavys, },  -- other side
	[103337] = { enemy = heavys, },
	[103336] = { enemy = heavys, },
	[103335] = { enemy = heavys, },
	[103334] = { enemy = heavys, },
	[103333] = { enemy = heavys, },
	[103332] = { enemy = heavys, },
	[103331] = { enemy = heavys, },
	[100304] = { enemy = heavys, },  -- very hard+
	[100305] = { enemy = heavys, },
	[100306] = { enemy = heavys, },
	[100307] = { enemy = heavys, },
	[100308] = { enemy = heavys, },
	[100309] = { enemy = heavys, },
	[100310] = { enemy = heavys, },
	[100311] = { enemy = heavys, },
	[103346] = { enemy = heavys, },  -- other side
	[103345] = { enemy = heavys, },
	[103344] = { enemy = heavys, },
	[103343] = { enemy = heavys, },
	[103342] = { enemy = heavys, },
	[103341] = { enemy = heavys, },
	[103340] = { enemy = heavys, },
	[103339] = { enemy = heavys, },
	[103241] = { enemy = dozers_no_med, },  -- elevator dozers
	[103266] = { enemy = dozers_no_med, },
	[103254] = { enemy = dozers_no_med, },
	[103222] = { enemy = dozers_no_med, },
}
