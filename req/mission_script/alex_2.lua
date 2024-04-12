local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local gangsters = {
	Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"),
	Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"),
	Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"),
	Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"),
}
local gangsters_amounts_2_3 = {
	values = {
		amount = overkill and 3 or 2,
	},
}
local gangsters_amounts_2_4 = {
	values = {
		amount = normal and 2 or hard and 3 or 4,
	},
}
local gangsters_amounts_2_5 = {
	values = {
		amount = normal and 2 or hard and 3 or 5,
	},
}
local gangsters_amounts_3_5 = {
	values = {
		amount = normal and 3 or hard and 4 or 5,
	},
}
local gangsters_amounts_4_5 = {
	values = {
		amount = overkill and 5 or 4,
	},
}

return {
	[104255] = gangsters_amounts_2_4,  -- waiter !  waiter !  more gangsters please !
	[104254] = gangsters_amounts_2_5,
	[104262] = gangsters_amounts_2_5,
	[104266] = gangsters_amounts_2_3,
	[104274] = gangsters_amounts_3_5,
	[104278] = gangsters_amounts_2_4,
	[104286] = gangsters_amounts_4_5,
	[104291] = gangsters_amounts_2_3,
	[104290] = { enemy = gangsters, },  -- gangsters
	[104289] = { enemy = gangsters, },
	[104288] = { enemy = gangsters, },
	[104287] = { enemy = gangsters, },
	[104285] = { enemy = gangsters, },
	[104284] = { enemy = gangsters, },
	[104283] = { enemy = gangsters, },
	[104282] = { enemy = gangsters, },
	[104281] = { enemy = gangsters, },
	[104280] = { enemy = gangsters, },
	[104279] = { enemy = gangsters, },
	[104277] = { enemy = gangsters, },
	[104276] = { enemy = gangsters, },
	[104275] = { enemy = gangsters, },
	[104247] = { enemy = gangsters, },
	[104273] = { enemy = gangsters, },
	[104272] = { enemy = gangsters, },
	[104271] = { enemy = gangsters, },
	[104270] = { enemy = gangsters, },
	[104269] = { enemy = gangsters, },
	[104268] = { enemy = gangsters, },
	[104451] = { enemy = gangsters, },
	[104450] = { enemy = gangsters, },
	[104449] = { enemy = gangsters, },
	[104267] = { enemy = gangsters, },
	[104265] = { enemy = gangsters, },
	[104264] = { enemy = gangsters, },
	[104263] = { enemy = gangsters, },
	[104261] = { enemy = gangsters, },
	[104260] = { enemy = gangsters, },
	[104259] = { enemy = gangsters, },
	[104257] = { enemy = gangsters, },
	[104256] = { enemy = gangsters, },
	[104255] = { enemy = gangsters, },
	[104253] = { enemy = gangsters, },
	[104367] = { enemy = gangsters, },
	[101217] = { enemy = gangsters, },
	[101208] = { enemy = gangsters, },
	[104252] = { enemy = gangsters, },
	[104251] = { enemy = gangsters, },
	[104227] = { enemy = gangsters, },
	[101206] = { enemy = gangsters, },
	[104224] = { enemy = gangsters, },
	[104223] = { enemy = gangsters, },
	[104222] = { enemy = gangsters, },
	[104250] = { enemy = gangsters, },
	[101205] = { enemy = gangsters, },
	[101094] = { enemy = gangsters, },
	[101093] = { enemy = gangsters, },
	[100579] = { enemy = gangsters, },
	[100576] = { enemy = gangsters, },
	[104235] = { enemy = gangsters, },
	[104065] = { enemy = gangsters, },
	[100109] = { enemy = gangsters, },
	[100094] = { enemy = gangsters, },
	[104162] = { enemy = gangsters, },
	[100303] = { enemy = gangsters, },  -- rooftop gangsters
	[101910] = { enemy = gangsters, },
	[101911] = { enemy = gangsters, },
	[101912] = { enemy = gangsters, },
	[101913] = { enemy = gangsters, },
	[101914] = { enemy = gangsters, },
	[101915] = { enemy = gangsters, },
	[101916] = { enemy = gangsters, },
}
