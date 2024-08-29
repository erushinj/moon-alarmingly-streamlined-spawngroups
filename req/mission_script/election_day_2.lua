local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local harassers = tweak_data.moon.units[normal and "swats" or hard and "swats_heavys" or "heavys"]
local cops_heavy = tweak_data.moon.units.cops_heavy
local securitys_light = tweak_data.moon.units.securitys_light
local securitys_heavy = tweak_data.moon.units.securitys_heavy

return {
	[100178] = { enemy = cops_heavy, },  -- cops
	[100179] = { enemy = cops_heavy, },
	[100180] = { enemy = cops_heavy, },
	[100829] = { enemy = cops_heavy, },
	[100601] = { enemy = cops_heavy, },  -- outside "guards" (also cops)
	[100602] = { enemy = cops_heavy, },
	[102067] = { enemy = cops_heavy, },
	[102068] = { enemy = cops_heavy, },
	[102069] = { enemy = cops_heavy, },
	[102070] = { enemy = cops_heavy, },
	[100605] = { enemy = securitys_light, },  -- "topside" guards
	[100606] = { enemy = securitys_light, },
	[100607] = { enemy = securitys_light, },
	[100608] = { enemy = securitys_light, },
	[100670] = { enemy = securitys_heavy, },  -- patrolling guards
	[100671] = { enemy = securitys_heavy, },
	[100672] = { enemy = securitys_heavy, },
	[100673] = { enemy = securitys_heavy, },
	[100674] = { enemy = securitys_heavy, },
	[100675] = { enemy = securitys_heavy, },
	[100676] = { enemy = securitys_heavy, },
	[100677] = { enemy = securitys_heavy, },
	[100678] = { enemy = securitys_heavy, },
	[100679] = { enemy = securitys_heavy, },
	[102732] = { enemy = harassers, },  -- harassers, n (swat heavies, should be light swats)
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
	[103101] = { enemy = harassers, },  -- "spawn00X_enemy001" (blue swat)
	[103104] = { enemy = harassers, },
	[103105] = { enemy = harassers, },
	[103107] = { enemy = harassers, },
	[103109] = { enemy = harassers, },
	[103111] = { enemy = harassers, },
	[103113] = { enemy = harassers, },
	[103115] = { enemy = harassers, },
	[103125] = { enemy = harassers, },  -- "spawn00X_enemy002" (fbi swat)
	[103126] = { enemy = harassers, },
	[103127] = { enemy = harassers, },
	[103128] = { enemy = harassers, },
	[103129] = { enemy = harassers, },
	[103130] = { enemy = harassers, },
	[103131] = { enemy = harassers, },
	[103132] = { enemy = harassers, },
	[103133] = { enemy = harassers, },  -- "spawn00X_enemy003" (fbi heavies)
	[103134] = { enemy = harassers, },
	[103135] = { enemy = harassers, },
	[103136] = { enemy = harassers, },
	[103137] = { enemy = harassers, },
	[103138] = { enemy = harassers, },
	[103139] = { enemy = harassers, },
	[103140] = { enemy = harassers, },
}
