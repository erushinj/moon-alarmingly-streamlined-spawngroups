return {
	[100156] = { difficulty = 0.33, },  -- difficulty 0.6 (on loud)
	[104076] = { difficulty = 0.67, },  -- difficulty 0.75 (after first assault)

	-- harasser spawns on warehouse rooftops
	-- swat heavies (n/h, should be swats)
	[104583] = { enemy = ASS:random_unit("swats") },
	[104584] = { enemy = ASS:random_unit("swats") },
	[104585] = { enemy = ASS:random_unit("swats") },
	[104586] = { enemy = ASS:random_unit("swats") },
	[104587] = { enemy = ASS:random_unit("swats") },
	[104588] = { enemy = ASS:random_unit("swats") },
	[104589] = { enemy = ASS:random_unit("swats") },
	[104590] = { enemy = ASS:random_unit("swats") },

	-- fbi swats (vh)
	[103993] = { enemy = ASS:random_unit("swats_heavys") },
	[103994] = { enemy = ASS:random_unit("swats_heavys") },
	[104112] = { enemy = ASS:random_unit("swats_heavys") },
	[104115] = { enemy = ASS:random_unit("swats_heavys") },
	[104174] = { enemy = ASS:random_unit("swats_heavys") },
	[104175] = { enemy = ASS:random_unit("swats_heavys") },
	[104176] = { enemy = ASS:random_unit("swats_heavys") },
	[104177] = { enemy = ASS:random_unit("swats_heavys") },

	-- fbi heavies (ovk+)
	[104591] = { enemy = ASS:random_unit("heavys") },
	[104592] = { enemy = ASS:random_unit("heavys") },
	[104593] = { enemy = ASS:random_unit("heavys") },
	[104594] = { enemy = ASS:random_unit("heavys") },
	[104595] = { enemy = ASS:random_unit("heavys") },
	[104596] = { enemy = ASS:random_unit("heavys") },
	[104597] = { enemy = ASS:random_unit("heavys") },
	[104598] = { enemy = ASS:random_unit("heavys") },

	-- gate security guards
	[103735] = { enemy = ASS:random_unit("securitys_heavy") },
	[103734] = { enemy = ASS:random_unit("securitys_heavy") },
	[100478] = { enemy = ASS:random_unit("securitys_heavy") },
	[103733] = { enemy = ASS:random_unit("securitys_heavy") },

	-- other security guards (why are there so many security 1s ?)
	[100168] = { enemy = ASS:random_unit("securitys") },
	[100487] = { enemy = ASS:random_unit("securitys") },
	[100172] = { enemy = ASS:random_unit("securitys") },
	[102983] = { enemy = ASS:random_unit("securitys") },
	[102982] = { enemy = ASS:random_unit("securitys") },
	[100488] = { enemy = ASS:random_unit("securitys") },
	[100490] = { enemy = ASS:random_unit("securitys") },
}
