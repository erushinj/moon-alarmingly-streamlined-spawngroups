local normal, hard, overkill = ASS:difficulty_groups()
local low_diff_harassers = tweak_data.levels:moon_random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")
local high_diff_harassers = tweak_data.levels:moon_random_unit(normal and "swats_heavys" or "heavys")
local units = tweak_data.levels:moon_units()

return {
	-- increase spawn delays on snipers (taken from eclipse)
	[100319] = {
		values = {
			delay = 5
		}
	},
	[100320] = {
		values = {
			delay = 5
		}
	},
	-- starting scripted spawns
	[102953] = { enemy = tweak_data.levels:moon_random_unit("cops"), },  -- cops
	[102954] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103947] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103952] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103953] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102662] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102663] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102666] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102667] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102669] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[102670] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103947] = { enemy = tweak_data.levels:moon_random_unit("cops"), },
	[103517] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },  -- security
	[103956] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103957] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103959] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102643] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102668] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102694] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[102695] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103621] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103630] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103640] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103626] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[103553] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[100386] = { enemy = tweak_data.levels:moon_random_unit("securitys"), },
	[104279] = { enemy = tweak_data.levels:moon_random_unit("securitys_heavy"), },  -- camera man
	-- normal cop cars with dumb baked-in cop 1 and cop 2 models shows up, then both of them turn into cop 4
	[102627] = { enemy = units.cop_1, },
	[102629] = { enemy = units.cop_2, },
	[102630] = { enemy = units.cop_1, },
	[102626] = { enemy = units.cop_2, },
	-- recurring spawns in the spot with really annoying constant snipers
	[100119] = { enemy = low_diff_harassers, },  -- normal, low diff
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
	-- "escape guards"
	[100141] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- normal
	[100267] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100268] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100270] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100271] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100272] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100273] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100274] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103307] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- other side
	[103310] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103313] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103316] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103319] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103322] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103325] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103328] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100293] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- hard
	[100294] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100295] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100298] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100299] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100300] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100301] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100302] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103338] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- other side
	[103337] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103336] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103335] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103334] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103333] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103332] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103331] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100304] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- very hard+
	[100305] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100306] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100307] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100308] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100309] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100310] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[100311] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103346] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },  -- other side
	[103345] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103344] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103343] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103342] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103341] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103340] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	[103339] = { enemy = tweak_data.levels:moon_random_unit("heavys"), },
	-- elevator dozers
	[103241] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103266] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103254] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
	[103222] = { enemy = tweak_data.levels:moon_random_unit("dozers_no_med"), },
}
