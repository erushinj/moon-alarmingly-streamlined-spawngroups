return {
	-- allow sniper respawns
	[100368] = {
		values = {
			trigger_times = 0,
		},
	},
	[100369] = {
		values = {
			trigger_times = 0,
		},
	},
	[100370] = {
		values = {
			trigger_times = 0,
		},
	},
	[100371] = {
		values = {
			trigger_times = 0,
		},
	},
	[100372] = {
		values = {
			trigger_times = 0,
		},
	},
	[100373] = {
		values = {
			trigger_times = 0,
		},
	},
	[100374] = {
		values = {
			trigger_times = 0,
		},
	},
	[100375] = {
		values = {
			trigger_times = 0,
		},
	},
	[100376] = {
		values = {
			trigger_times = 0,
		},
	},
	[100377] = {
		values = {
			trigger_times = 0,
		},
	},
	-- some new reenforce spots
	[100115] = {
		reinforce = {
			{
				name = "train1",
				force = 1,
				position = Vector3(-3350, 4775, 500)
			},
			{
				name = "train2",
				force = 1,
				position = Vector3(-6160, 5800, 500)
			},
			{
				name = "train3",
				force = 1,
				position = Vector3(-840, 5800, 500)
			},
			{
				name = "train4",
				force = 1,
				position = Vector3(2140, 5800, 500)
			},
			{
				name = "train5",
				force = 1,
				position = Vector3(-525, 7010, 500)
			},
			{
				name = "train6",
				force = 1,
				position = Vector3(775, 8110, 500)
			},
		},
	},
	-- security guards
	[100670] = { enemy = ASS:random_unit("securitys_light"), },  -- pre-train yard
	[101610] = { enemy = ASS:random_unit("securitys_light"), },
	[101608] = { enemy = ASS:random_unit("securitys_light"), },
	[101145] = { enemy = ASS:random_unit("securitys_light"), },
	[100671] = { enemy = ASS:random_unit("securitys_light"), },
	[101533] = { enemy = ASS:random_unit("securitys_light"), },
	[101532] = { enemy = ASS:random_unit("securitys_light"), },
	[101507] = { enemy = ASS:random_unit("securitys_light"), },
	[101144] = { enemy = ASS:random_unit("securitys_light"), },
	[101151] = { enemy = ASS:random_unit("securitys_light"), },
	[101612] = { enemy = ASS:random_unit("securitys_light"), },
	[101620] = { enemy = ASS:random_unit("securitys"), },  -- offices
	[101622] = { enemy = ASS:random_unit("securitys"), },
	[101533] = { enemy = ASS:random_unit("securitys"), },
	[101668] = { enemy = ASS:random_unit("securitys"), },
	[101215] = { enemy = ASS:random_unit("securitys"), },
	[101624] = { enemy = ASS:random_unit("securitys"), },
	[101734] = { enemy = ASS:random_unit("securitys"), },
	[101665] = { enemy = ASS:random_unit("securitys"), },
	[103209] = { enemy = ASS:random_unit("securitys"), },  -- i have no clue if these guys are used
	[103207] = { enemy = ASS:random_unit("securitys"), },
	[103205] = { enemy = ASS:random_unit("securitys"), },
	[103199] = { enemy = ASS:random_unit("securitys"), },
	[103198] = { enemy = ASS:random_unit("securitys"), },
	[103196] = { enemy = ASS:random_unit("securitys"), },
	[103237] = { enemy = ASS:random_unit("securitys"), },
	[103231] = { enemy = ASS:random_unit("securitys"), },
	[103227] = { enemy = ASS:random_unit("securitys"), },
	[103221] = { enemy = ASS:random_unit("securitys"), },
	[103215] = { enemy = ASS:random_unit("securitys"), },
	[103212] = { enemy = ASS:random_unit("securitys"), },
	[103267] = { enemy = ASS:random_unit("securitys"), },
	[103261] = { enemy = ASS:random_unit("securitys"), },
	[103257] = { enemy = ASS:random_unit("securitys"), },
	[103251] = { enemy = ASS:random_unit("securitys"), },
	[103245] = { enemy = ASS:random_unit("securitys"), },
	[103242] = { enemy = ASS:random_unit("securitys"), },
	[103297] = { enemy = ASS:random_unit("securitys"), },
	[103291] = { enemy = ASS:random_unit("securitys"), },
	[103287] = { enemy = ASS:random_unit("securitys"), },
	[103281] = { enemy = ASS:random_unit("securitys"), },
	[103275] = { enemy = ASS:random_unit("securitys"), },
	[103272] = { enemy = ASS:random_unit("securitys"), },
	[103327] = { enemy = ASS:random_unit("securitys"), },
	[103321] = { enemy = ASS:random_unit("securitys"), },
	[103317] = { enemy = ASS:random_unit("securitys"), },
	[103311] = { enemy = ASS:random_unit("securitys"), },
	[103305] = { enemy = ASS:random_unit("securitys"), },
	[103302] = { enemy = ASS:random_unit("securitys"), },
	[101646] = { enemy = ASS:random_unit("securitys_heavy"), },  -- every other one
	[101648] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101213] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101637] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101638] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101207] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101676] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101678] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101295] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101706] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101708] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101728] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101727] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101698] = { enemy = ASS:random_unit("securitys_heavy"), },
	[103177] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101738] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101736] = { enemy = ASS:random_unit("securitys_heavy"), },
	[103179] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101621] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100679] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100678] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101623] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101617] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101615] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101614] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101616] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101609] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101611] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100676] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101607] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101618] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101613] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101619] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101644] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101635] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101674] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101695] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101704] = { enemy = ASS:random_unit("securitys_heavy"), },
	[101725] = { enemy = ASS:random_unit("securitys_heavy"), },
	[103166] = { enemy = ASS:random_unit("securitys_heavy"), },
	[103175] = { enemy = ASS:random_unit("securitys_heavy"), },
}
