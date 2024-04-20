local normal, hard, overkill, diff_group_name = ASS:difficulty_groups()
local scripted_swat_squads = ASS:require("scripted_swat_squads", true)
local van_spawns = scripted_swat_squads({
	hard_target = normal and 1 or hard and 2 or 3,
	hard_spawn = "dozers_no_mini",
	normal_spawn = "specials_any",
})

local thug_fex = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex")

return {
	[103275] = { enemy = van_spawns(), },
	[103276] = { enemy = van_spawns(), },
	[103277] = { enemy = van_spawns(), },
	[101884] = { enemy = thug_fex },
	[101865] = { enemy = thug_fex },
	[101864] = { enemy = thug_fex },
	[101812] = { enemy = thug_fex },
	[101809] = { enemy = thug_fex },
	[101748] = { enemy = thug_fex },
	[101853] = { enemy = thug_fex },
	[101853] = { enemy = thug_fex },
	[101861] = { enemy = thug_fex },
	[101867] = { enemy = thug_fex },
	[101902] = { enemy = thug_fex },
	[101960] = { enemy = thug_fex },
	[101957] = { enemy = thug_fex },
	[101957] = { enemy = thug_fex },
	[100672] = { enemy = thug_fex },
	[100672] = { enemy = thug_fex },
	[101137] = { enemy = thug_fex },
	[101139] = { enemy = thug_fex },
	[101135] = { enemy = thug_fex },
	[100673] = { enemy = thug_fex },
	[100674] = { enemy = thug_fex },
	[101143] = { enemy = thug_fex },
	[101149] = { enemy = thug_fex },
	[101814] = { enemy = thug_fex },
	[101817] = { enemy = thug_fex },
	[101819] = { enemy = thug_fex },
	[101828] = { enemy = thug_fex },
	[101832] = { enemy = thug_fex },
	[101750] = { enemy = thug_fex },
	[101963] = { enemy = thug_fex },
	[101966] = { enemy = thug_fex },
	[101968] = { enemy = thug_fex },
	[100675] = { enemy = thug_fex },
	[100676] = { enemy = thug_fex },
	[100677] = { enemy = thug_fex },
	[100678] = { enemy = thug_fex },
	[100679] = { enemy = thug_fex },
	[102750] = { enemy = thug_fex },  -- basement american guy
}
