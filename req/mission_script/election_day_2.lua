local normal, hard, overkill = ASS:difficulty_groups()
local harassers = ASS:random_unit(normal and "swats" or hard and "swats_heavys" or "heavys")

return {
	-- law
	[100178] = { enemy = ASS:random_unit("cops_heavy"), },  -- cops
	[100179] = { enemy = ASS:random_unit("cops_heavy"), },
	[100180] = { enemy = ASS:random_unit("cops_heavy"), },
	[100829] = { enemy = ASS:random_unit("cops_heavy"), },
	[100601] = { enemy = ASS:random_unit("cops_heavy"), },  -- outside "guards" (also cops)
	[100602] = { enemy = ASS:random_unit("cops_heavy"), },
	[102067] = { enemy = ASS:random_unit("cops_heavy"), },
	[102068] = { enemy = ASS:random_unit("cops_heavy"), },
	[102069] = { enemy = ASS:random_unit("cops_heavy"), },
	[102070] = { enemy = ASS:random_unit("cops_heavy"), },
	[100605] = { enemy = ASS:random_unit("securitys_light"), },  -- "topside" guards
	[100606] = { enemy = ASS:random_unit("securitys_light"), },
	[100607] = { enemy = ASS:random_unit("securitys_light"), },
	[100608] = { enemy = ASS:random_unit("securitys_light"), },
	[100670] = { enemy = ASS:random_unit("securitys_heavy"), },  -- patrolling guards
	[100671] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100672] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100673] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100674] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100675] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100676] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100677] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100678] = { enemy = ASS:random_unit("securitys_heavy"), },
	[100679] = { enemy = ASS:random_unit("securitys_heavy"), },
	-- harassers
	[102732] = { enemy = harassers, },  -- n (swat heavies, should be light swats)
	[102428] = { enemy = harassers, },
	[102444] = { enemy = harassers, },
	[102460] = { enemy = harassers, },
	[102762] = { enemy = harassers, },
	[102778] = { enemy = harassers, },
	[102794] = { enemy = harassers, },
	[102810] = { enemy = harassers, },
	[102826] = { enemy = harassers, },
	[102733] = { enemy = harassers, },  -- h/vh (fbi swats)
	[102429] = { enemy = harassers, },
	[102445] = { enemy = harassers, },
	[102461] = { enemy = harassers, },
	[102763] = { enemy = harassers, },
	[102779] = { enemy = harassers, },
	[102795] = { enemy = harassers, },
	[102811] = { enemy = harassers, },
	[102827] = { enemy = harassers, },
	[102742] = { enemy = harassers, },  -- ovk+ (fbi heavies)
	[102430] = { enemy = harassers, },
	[102446] = { enemy = harassers, },
	[102462] = { enemy = harassers, },
	[102764] = { enemy = harassers, },
	[102780] = { enemy = harassers, },
	[102796] = { enemy = harassers, },
	[102812] = { enemy = harassers, },
	[102828] = { enemy = harassers, },
	-- "spawn00X_enemy001" (blue swat)
	[103101] = { enemy = ASS:random_unit("swats"), },
	[103104] = { enemy = ASS:random_unit("swats"), },
	[103105] = { enemy = ASS:random_unit("swats"), },
	[103107] = { enemy = ASS:random_unit("swats"), },
	[103109] = { enemy = ASS:random_unit("swats"), },
	[103111] = { enemy = ASS:random_unit("swats"), },
	[103113] = { enemy = ASS:random_unit("swats"), },
	[103115] = { enemy = ASS:random_unit("swats"), },
	-- "spawn00X_enemy002" (fbi swat)
	[103125] = { enemy = ASS:random_unit("swats_heavys"), },
	[103126] = { enemy = ASS:random_unit("swats_heavys"), },
	[103127] = { enemy = ASS:random_unit("swats_heavys"), },
	[103128] = { enemy = ASS:random_unit("swats_heavys"), },
	[103129] = { enemy = ASS:random_unit("swats_heavys"), },
	[103130] = { enemy = ASS:random_unit("swats_heavys"), },
	[103131] = { enemy = ASS:random_unit("swats_heavys"), },
	[103132] = { enemy = ASS:random_unit("swats_heavys"), },
	-- "spawn00X_enemy003" (fbi heavies)
	[103133] = { enemy = ASS:random_unit("heavys"), },
	[103134] = { enemy = ASS:random_unit("heavys"), },
	[103135] = { enemy = ASS:random_unit("heavys"), },
	[103136] = { enemy = ASS:random_unit("heavys"), },
	[103137] = { enemy = ASS:random_unit("heavys"), },
	[103138] = { enemy = ASS:random_unit("heavys"), },
	[103139] = { enemy = ASS:random_unit("heavys"), },
	[103140] = { enemy = ASS:random_unit("heavys"), },
}
