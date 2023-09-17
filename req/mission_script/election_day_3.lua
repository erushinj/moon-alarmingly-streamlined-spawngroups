local difficulty_index = ASS:get_var("real_difficulty_index")
local is_overkill_290 = difficulty_index > 6
local is_overkill_145 = difficulty_index > 4

return {
	-- recurring spawns in the spot with really annoying constant snipers
	[100119] = { enemy = ASS:random_unit("swats") },  -- normal, low diff
	[100132] = { enemy = ASS:random_unit("swats") },
	[100145] = { enemy = ASS:random_unit("swats") },
	[100150] = { enemy = ASS:random_unit("swats") },
	[100152] = { enemy = ASS:random_unit("swats") },
	[100154] = { enemy = ASS:random_unit("swats") },
	[100189] = { enemy = ASS:random_unit("swats") },  -- high diff
	[100190] = { enemy = ASS:random_unit("swats") },
	[100191] = { enemy = ASS:random_unit("swats") },
	[100192] = { enemy = ASS:random_unit("swats") },
	[100193] = { enemy = ASS:random_unit("swats") },
	[100197] = { enemy = ASS:random_unit("swats") },

	[100128] = { enemy = ASS:random_unit("swats") },  -- hard, low diff
	[100164] = { enemy = ASS:random_unit("swats") },
	[100170] = { enemy = ASS:random_unit("swats") },
	[100171] = { enemy = ASS:random_unit("swats") },
	[100174] = { enemy = ASS:random_unit("swats") },
	[100175] = { enemy = ASS:random_unit("swats") },
	[100199] = { enemy = ASS:random_unit("swats_heavys") },  -- high diff
	[100201] = { enemy = ASS:random_unit("swats_heavys") },
	[100203] = { enemy = ASS:random_unit("swats_heavys") },
	[100204] = { enemy = ASS:random_unit("swats_heavys") },
	[100206] = { enemy = ASS:random_unit("swats_heavys") },
	[100207] = { enemy = ASS:random_unit("swats_heavys") },

	[100131] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },  -- very hard+, low diff
	[100176] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },
	[100177] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },
	[100179] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },
	[100181] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },
	[100182] = { enemy = ASS:random_unit(is_overkill_290 and "heavys" or is_overkill_145 and "swats_heavys" or "swats") },
	[100208] = { enemy = ASS:random_unit("heavys") },  -- high diff
	[100209] = { enemy = ASS:random_unit("heavys") },
	[100210] = { enemy = ASS:random_unit("heavys") },
	[100211] = { enemy = ASS:random_unit("heavys") },
	[100212] = { enemy = ASS:random_unit("heavys") },
	[100213] = { enemy = ASS:random_unit("heavys") },

	-- "escape guards"
	[100141] = { enemy = ASS:random_unit("heavys") },  -- normal
	[100267] = { enemy = ASS:random_unit("heavys") },
	[100268] = { enemy = ASS:random_unit("heavys") },
	[100270] = { enemy = ASS:random_unit("heavys") },
	[100271] = { enemy = ASS:random_unit("heavys") },
	[100272] = { enemy = ASS:random_unit("heavys") },
	[100273] = { enemy = ASS:random_unit("heavys") },
	[100274] = { enemy = ASS:random_unit("heavys") },
	[103307] = { enemy = ASS:random_unit("heavys") },  -- other side
	[103310] = { enemy = ASS:random_unit("heavys") },
	[103313] = { enemy = ASS:random_unit("heavys") },
	[103316] = { enemy = ASS:random_unit("heavys") },
	[103319] = { enemy = ASS:random_unit("heavys") },
	[103322] = { enemy = ASS:random_unit("heavys") },
	[103325] = { enemy = ASS:random_unit("heavys") },
	[103328] = { enemy = ASS:random_unit("heavys") },

	[100293] = { enemy = ASS:random_unit("heavys") },  -- hard
	[100294] = { enemy = ASS:random_unit("heavys") },
	[100295] = { enemy = ASS:random_unit("heavys") },
	[100298] = { enemy = ASS:random_unit("heavys") },
	[100299] = { enemy = ASS:random_unit("heavys") },
	[100300] = { enemy = ASS:random_unit("heavys") },
	[100301] = { enemy = ASS:random_unit("heavys") },
	[100302] = { enemy = ASS:random_unit("heavys") },
	[103338] = { enemy = ASS:random_unit("heavys") },  -- other side
	[103337] = { enemy = ASS:random_unit("heavys") },
	[103336] = { enemy = ASS:random_unit("heavys") },
	[103335] = { enemy = ASS:random_unit("heavys") },
	[103334] = { enemy = ASS:random_unit("heavys") },
	[103333] = { enemy = ASS:random_unit("heavys") },
	[103332] = { enemy = ASS:random_unit("heavys") },
	[103331] = { enemy = ASS:random_unit("heavys") },

	[100304] = { enemy = ASS:random_unit("heavys") },  -- very hard+
	[100305] = { enemy = ASS:random_unit("heavys") },
	[100306] = { enemy = ASS:random_unit("heavys") },
	[100307] = { enemy = ASS:random_unit("heavys") },
	[100308] = { enemy = ASS:random_unit("heavys") },
	[100309] = { enemy = ASS:random_unit("heavys") },
	[100310] = { enemy = ASS:random_unit("heavys") },
	[100311] = { enemy = ASS:random_unit("heavys") },
	[103346] = { enemy = ASS:random_unit("heavys") },  -- other side
	[103345] = { enemy = ASS:random_unit("heavys") },
	[103344] = { enemy = ASS:random_unit("heavys") },
	[103343] = { enemy = ASS:random_unit("heavys") },
	[103342] = { enemy = ASS:random_unit("heavys") },
	[103341] = { enemy = ASS:random_unit("heavys") },
	[103340] = { enemy = ASS:random_unit("heavys") },
	[103339] = { enemy = ASS:random_unit("heavys") },

	-- elevator dozers
	[103241] = { enemy = ASS:random_unit("dozers_no_med") },
	[103266] = { enemy = ASS:random_unit("dozers_no_med") },
	[103254] = { enemy = ASS:random_unit("dozers_no_med") },
	[103222] = { enemy = ASS:random_unit("dozers_no_med") },
}
