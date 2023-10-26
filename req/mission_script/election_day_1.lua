local normal, hard, overkill = ASS:difficulty_groups()
local harassers = ASS:random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")

return {
	-- diff curve tweaks
	[100156] = {  -- difficulty 0.6 (on loud)
		values = {
			difficulty = 0.33,
		},
	},
	[104076] = {  -- difficulty 0.75 (after first assault)
		values = {
			difficulty = 0.67,
		},
	},
	-- harasser spawns on warehouse rooftops
	[104583] = { enemy = harassers, },  -- swat heavies (n/h, should be swats)
	[104584] = { enemy = harassers, },
	[104585] = { enemy = harassers, },
	[104586] = { enemy = harassers, },
	[104587] = { enemy = harassers, },
	[104588] = { enemy = harassers, },
	[104589] = { enemy = harassers, },
	[104590] = { enemy = harassers, },
	[103993] = { enemy = harassers, },  -- fbi swats (vh)
	[103994] = { enemy = harassers, },
	[104112] = { enemy = harassers, },
	[104115] = { enemy = harassers, },
	[104174] = { enemy = harassers, },
	[104175] = { enemy = harassers, },
	[104176] = { enemy = harassers, },
	[104177] = { enemy = harassers, },
	[104591] = { enemy = harassers, },  -- fbi heavies (ovk+)
	[104592] = { enemy = harassers, },
	[104593] = { enemy = harassers, },
	[104594] = { enemy = harassers, },
	[104595] = { enemy = harassers, },
	[104596] = { enemy = harassers, },
	[104597] = { enemy = harassers, },
	[104598] = { enemy = harassers, },
	-- security guards
	[103735] = { enemy = ASS:random_unit("securitys_heavy"), },  -- gate
	[103734] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100478] = { enemy = ASS:random_unit("securitys_heavy"), },
	[103733] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100168] = { enemy = ASS:random_unit("securitys"), },  -- the rest (why are there so many security 1s ?)
	[100487] = { enemy = ASS:random_unit("securitys"), },
	[100172] = { enemy = ASS:random_unit("securitys"), },
	[102983] = { enemy = ASS:random_unit("securitys"), },
	[102982] = { enemy = ASS:random_unit("securitys"), },
	[100488] = { enemy = ASS:random_unit("securitys"), },
	[100490] = { enemy = ASS:random_unit("securitys"), },
}
