local dozer_chance = ASS:get_var("real_difficulty_index") * 0.025
local function scripted_swat_squads()
	return tweak_data.levels:moon_random_unit(math.random() < dozer_chance and "dozers_any" or "specials_any")
end

local thug_fex = Idstring("units/pd2_dlc_fex/characters/ene_thug_outdoor_fex/ene_thug_outdoor_fex")

return {
	[103275] = { enemy = scripted_swat_squads(), },
	[103276] = { enemy = scripted_swat_squads(), },
	[103277] = { enemy = scripted_swat_squads(), },
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
